/*
sopc2dts - Devicetree generation for Altera systems

Copyright (C) 2011 - 2012 Walter Goossens <waltergoossens@home.nl>

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/
package sopc2dts.lib.components.altera;

import java.util.Vector;

import sopc2dts.Logger;
import sopc2dts.Logger.LogLevel;
import sopc2dts.lib.AvalonSystem;
import sopc2dts.lib.BoardInfo;
import sopc2dts.lib.Connection;
import sopc2dts.lib.AvalonSystem.SystemDataType;
import sopc2dts.lib.boardinfo.BICEthernet;
import sopc2dts.lib.components.BasicComponent;
import sopc2dts.lib.components.Interface;
import sopc2dts.lib.components.SopcComponentDescription;
import sopc2dts.lib.devicetree.DTNode;
import sopc2dts.lib.devicetree.DTPropNumber;
import sopc2dts.lib.devicetree.DTPropString;

public class TSEMonolithic extends SICTrippleSpeedEthernet {
	SICSgdma rx_dma, tx_dma;
	BasicComponent desc_mem;
	
	public TSEMonolithic(String cName, String iName, String ver, SopcComponentDescription scd) {
		super(cName, iName, ver, scd);
	}
	@Override 
	public DTNode toDTNode(BoardInfo bi, Connection conn)
	{
		DTNode node = super.toDTNode(bi, conn);
		BICEthernet be = bi.getEthernetForChip(getInstanceName());
		node.addProperty(new DTPropString("phy-mode", getPhyModeString()));
		if(be.getMiiID()==null)
		{
			//Always needed for this driver! (atm)
			node.addProperty(new DTPropNumber("ALTR,mii-id", 0L));
		} else {
			node.addProperty(new DTPropNumber("ALTR,mii-id", Long.valueOf(be.getMiiID())));
		}
		if(be.getPhyID()!=null)
		{
			node.addProperty(new DTPropNumber("ALTR,mii-id", Long.valueOf(be.getPhyID())));
		}
		return node;
	}
	protected void encapsulateSGDMA(SICSgdma dma, String name)
	{
		//CSR MM interface
		Interface intf = dma.getInterfaceByName("csr");
		dma.removeInterface(intf);
		intf.setName(name + "_csr");
		vInterfaces.add(intf);
		intf.setOwner(this);
		//IRQ
		intf = dma.getInterfaceByName("csr_irq");
		dma.removeInterface(intf);
		intf.setName(name + "_irq");
		vInterfaces.add(intf);
		intf.setOwner(this);
	}
	protected SICSgdma findSGDMA(boolean receiver)
	{
		SICSgdma dma = null;
		String sRxTx = (receiver ? "RX" : "TX");
		Interface intf = getInterfaceByName((receiver ? "receive" : "transmit"));
		if(intf==null)
		{
			intf = getInterfaceByName((receiver ? "receive_0" : "transmit_0"));
		}
		if(intf==null)
		{
			intf = getInterfaces(SystemDataType.STREAMING, receiver).firstElement();
			Logger.logln("TSEMonolithic: TSE named " + getInstanceName() + 
					" does not have a port named '" + (receiver ? "receive" : "transmit") +"'." +
					" Randomly trying first streaming " + sRxTx + " port (" + intf.getName() + ')', LogLevel.WARNING);
		}
		BasicComponent comp = getDMAEngineForIntf(intf);
		if((comp == null))
		{
			Logger.logln("TSEMonolithic: Failed to find SGDMA " + sRxTx + " engine", LogLevel.WARNING);
			rx_dma = null;
			
		} else if(!(comp instanceof SICSgdma))
		{
			Logger.logln("TSEMonolithic: Failed to find SGDMA " + sRxTx + " engine", LogLevel.WARNING);
			Logger.logln("TSEMonolithic: Found " + comp.getInstanceName() + " of class " + comp.getClassName() + " instead.", LogLevel.DEBUG);
		} else {
			dma = (SICSgdma)comp;
		}
		return dma;
	}
	public boolean removeFromSystemIfPossible(AvalonSystem sys)
	{
		boolean bChanged = false;

		if(rx_dma == null)
		{
			rx_dma = findSGDMA(true);
			if(rx_dma != null)
			{
				sys.removeSystemComponent(rx_dma);
				bChanged = true;
				encapsulateSGDMA(rx_dma, "rx");
			}
		}
		if(tx_dma == null)
		{
			tx_dma = findSGDMA(false);
			if(tx_dma != null)
			{
				sys.removeSystemComponent(tx_dma);
				bChanged = true;
				encapsulateSGDMA(tx_dma, "tx");
			}
		}
		if(desc_mem == null)
		{
			if(rx_dma == null)
			{
				Logger.logln("TSEMonolithic: No RX-DMA engine. Cannot find descriptor memory", LogLevel.WARNING);
			} else {
				Interface intfDescr = rx_dma.getInterfaceByName("descriptor_read");
				desc_mem = findSlaveComponent(intfDescr, "memory", "onchipmem");
				if(desc_mem == null)
				{
					Logger.logln("Failed to find onchip descriptor memory. " +
							"Trying other memories", LogLevel.WARNING);
					desc_mem = findSlaveComponent(intfDescr, "memory", null);
				}
				if(desc_mem!=null)
				{
					sys.removeSystemComponent(desc_mem);
					bChanged = true;
					Interface s1 = desc_mem.getInterfaceByName("s1");
					desc_mem.removeInterface(s1);
					s1.setOwner(this);
					vInterfaces.add(s1);
				} else {
					Logger.logln("Failed to find descriptor memory.", LogLevel.WARNING);
				}
			}
		}
		return bChanged;
	}
	BasicComponent findSlaveComponent(Interface intf, String group, String device)
	{
		BasicComponent res = null;
		for(Connection conn : intf.getConnections())
		{
			res = conn.getSlaveModule();
			if(res != null)
			{
				if(res.getScd().getGroup().equals("bridge"))
				{
					Logger.logln("Warning decriptor memory connected through a bridge. " +
							"I'll probably mess things up trying to guess what memory I'm connected to...",
							LogLevel.WARNING);
					Vector<Interface> vIntf = res.getInterfaces(SystemDataType.MEMORY_MAPPED, true);
					res = null;
					for(int i=0; (i<vIntf.size()) && (res==null); i++)
					{
						res = findSlaveComponent(vIntf.get(i), group, device);
					}
				} else {
					if(group!=null)
					{
						if(!res.getScd().getGroup().equals(group))
						{
							res = null;
						}
					}
					if((res!=null)&&(device!=null))
					{
						if(!res.getScd().getDevice().equals(device))
						{
							res = null;
						}
					}
				}
			}
			if(res!=null)
			{
				return res;
			}
		}
		return res;
	}
}

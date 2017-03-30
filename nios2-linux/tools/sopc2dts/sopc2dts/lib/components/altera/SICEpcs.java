/*
sopc2dts - Devicetree generation for Altera systems

Copyright (C) 2011 Walter Goossens <waltergoossens@home.nl>

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

import sopc2dts.lib.BoardInfo;
import sopc2dts.lib.Connection;
import sopc2dts.lib.SopcComponentLib;
import sopc2dts.lib.components.base.SICFlash;
import sopc2dts.lib.devicetree.DTNode;
import sopc2dts.lib.devicetree.DTPropNumber;
import sopc2dts.lib.devicetree.DTPropString;

public class SICEpcs extends SICFlash {

	public SICEpcs(String cName, String iName, String ver) {
		super(cName, iName, ver, SopcComponentLib.getInstance().getScdByClassName("altera_avalon_spi"));
	}
	
	@Override
	public DTNode toDTNode(BoardInfo bi, Connection conn)
	{
		DTNode node = super.toDTNode(bi, conn);
		node.addProperty(new DTPropNumber("#address-cells", 1L));
		node.addProperty(new DTPropNumber("#size-cells", 0L));
		DTNode m25p80 = new DTNode("m25p80@0");
		m25p80.addProperty(new DTPropString("compatible", "m25p80"));
		m25p80.addProperty(new DTPropNumber("spi-max-frequency", 25000000L));
		m25p80.addProperty(new DTPropNumber("reg", 0L));
		addPartitionsToDTNode(bi, m25p80);
		node.addChild(m25p80);
		return node;
	}
	@Override
	protected long getAddrFromConnection(Connection conn)
	{
		//Yes this is REALLY ugly. But it just might work :)
		int regOffset;
		try {
			regOffset = Integer.decode(getParamValByName("embeddedsw.CMacro.REGISTER_OFFSET"));
		} catch(Exception e)
		{
			regOffset = 0;
		}
		return (conn==null ? getAddr() : conn.getConnValue()) + regOffset;
	}
}

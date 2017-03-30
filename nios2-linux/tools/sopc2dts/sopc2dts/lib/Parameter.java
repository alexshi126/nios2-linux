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
package sopc2dts.lib;

import sopc2dts.lib.devicetree.DTPropBool;
import sopc2dts.lib.devicetree.DTPropHexNumber;
import sopc2dts.lib.devicetree.DTPropNumber;
import sopc2dts.lib.devicetree.DTPropString;
import sopc2dts.lib.devicetree.DTProperty;

public class Parameter {
	public enum DataType { NUMBER, UNSIGNED, BOOLEAN, STRING };
	String name;
	String value;
	DataType dataType = DataType.BOOLEAN;
	
	public Parameter(String name, String value, DataType t)
	{
		this.name = name;
		this.dataType = t;
		switch(t)
		{
		case UNSIGNED: {
			if(value.charAt(0) == '-')
			{
					this.value = String.format("0x%08X", Integer.decode(value));
			}
		} break;
		default: {
			this.value = value;
		}
		}
	}
	public static DataType getDataTypeByName(String dtName)
	{
		if(dtName == null) 
		{
			return null;
		} else if(dtName.equalsIgnoreCase("BOOLEAN") ||
				dtName.equalsIgnoreCase("BOOL"))
		{
			return DataType.BOOLEAN;
		} else if(dtName.equalsIgnoreCase("NUMBER"))
		{
			return DataType.NUMBER;
		} else if(dtName.equalsIgnoreCase("UNSIGNED"))
		{
			return DataType.UNSIGNED;
		}
		return null;
	}
	public String getName()
	{
		return name;
	}
	public String getValue()
	{
		return value;
	}
	public boolean getValueAsBoolean() {
		if(value==null) return false;
		if(value.length()==0) return false;
		try {
			if(Integer.decode(value)==0)
			{
				return false;
			}
		} catch (NumberFormatException e) {
			if(value.equalsIgnoreCase("false"))
			{
				return false;
			}
		}
		//Treat all other strings and numbers as true
		 return true;
	 }
	public DTProperty toDTProperty()
	{
		return toDTProperty(name, dataType);
	}
	public DTProperty toDTProperty(String dtsName)
	{
		return toDTProperty(dtsName, dataType);
	}
	public DTProperty toDTProperty(String dtsName, DataType dt)
	{
		DTProperty prop;
		if(dt==null)
		{
			dt = dataType;
		}
		switch(dt)
		{
		case UNSIGNED: {
			prop = new DTPropHexNumber(dtsName, Long.decode(value), null,name + " type " + dataType);
		} break;
		case NUMBER: {
			prop = new DTPropNumber(dtsName, Long.decode(value), null,name + " type " + dataType);
		} break;
		case BOOLEAN: {
			if(getValueAsBoolean())
			{
				prop = new DTPropBool(dtsName, null, name + " type " + dataType);
			} else {
				prop = null;
			}
		} break;
		case STRING: {
			String tmpVal = value.trim();
			if (tmpVal.startsWith("\""))
			{
				tmpVal = tmpVal.substring(1);
			}
			if(tmpVal.endsWith("\""))
			{
				tmpVal = tmpVal.substring(0, tmpVal.length()-1);
			}
			prop = new DTPropString(dtsName, tmpVal, null, name + " type " + dataType);
		} break;
		default:{
			prop = null;
		}
		}
		return prop;
	}
}

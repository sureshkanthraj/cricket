package metaquery;

import java.io.*;
import java.util.*;

public class ElemenateTag implements Serializable
{
	
	public String elemenateTag(String txt)
	{
		byte b1[]=new byte[10];
		String ss="";
		try
		{
			String str=txt;
			String str1="";
			
		
			str1=script(str);
			StringBuffer strbuf=new StringBuffer(str1);
			StringBuffer temp=new StringBuffer();
			while(true)
			{
				strbuf=run(strbuf);
				if(new String(strbuf).trim().equals("endnull"))
				break;
				temp=strbuf;
			}
			String temp1=new String(temp);
	
			for(int i=2;i<temp1.length();i++)
			{
				
				if(temp1.charAt(i)!='\n')
					ss=ss+temp1.charAt(i);
				if(temp1.substring(i-2,i).equals("  "))
				{
					//System.out.print("slash");
					ss=ss.trim();
				}
				
				
			}
		}
		catch(Exception ex)
		{
			System.out.println("Error :"+ex);
		}
		return ss;
	}
	public String script(String ss)
	{	
		String str=ss;
		try
		{
	 		System.out.println("CALING TOSCRIPT FUNCTION");
	 		for(int i=7;i<str.length();i++)
			{
				String str1="";
				String str2="";
				
				String substr=str.substring(i-7,i);
				
				if(substr.equalsIgnoreCase("<SCRIPT"))
				{
					str1=str.substring(0,str.indexOf("<SCRIPT")).trim();
					str2=str.substring(str.indexOf("</SCRIPT>")+9,str.length()).trim();
					//System.out.println("** :"+str1);
					str=str1+" "+str2+" ";
					str1="";
					str2="";
				}
			    
			}
		}
		catch(Exception ex)
		{
			System.out.println("Error in script :"+ex);	
		}
		return str;
	}
public StringBuffer run(StringBuffer in)
	{
		int find=in.indexOf("<");
		int endind=in.indexOf(">");
		if(find!=-1&&endind!=-1)
		{
			in=in.delete(find,endind+1);
			return in;
		}
		else
		{
			StringBuffer tin=new StringBuffer("endnull");
			return tin;
		}
	}
		
}
		
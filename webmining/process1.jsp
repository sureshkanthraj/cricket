<%@ page import="java.util.*,java.sql.*,java.io.*,java.lang.*" %>
<jsp:useBean id="db" class="metaquery.QueryDB"/>
<jsp:useBean id="ele" class="metaquery.ElemenateTag"/>
<jsp:useBean id="tdidf" class="metaquery.CalculateTfidf"/>
<jsp:useBean id="porter" class="metaquery.PorterStemmer"/>


<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<LINK href="image/font.css" type=text/css rel=stylesheet>
<%
//String sss=request.getParameter("ff");
//String username="";
//username=request.getParameter("username");
//System.out.println("THE USER NAME IS================ "+sss);
String filename="",dd,st,stem;
int p=0;
String str1="";
String str2[]=new String[50];
String str4[]=new String[50];
int j=0,i=0,m=0;
Vector vec=new Vector();

Vector v12=new Vector();
Vector v2=new Vector();
Vector v3=new Vector();
Vector v1=new Vector();
Vector v=new Vector();
%>

<title>New Page 1</title>

<body topmargin="0" leftmargin="0" bgcolor="#3399FF">
<form name="frm" method="post" action="fweightlinks1.jsp">
 <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber1" width="527" height="141">
    <tr>
    <tr>
    </tr>
    <tr>
    </tr>
    <td>
    &nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td>
    </td>
    
    
      <td width="400" height="86" colspan="5">
      <center>
      <img border="0" src="image/1.jpg" width="780" height="86"></td>
    </center>
    </tr>
    
    
    <tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
    </table>
     
     
      
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="98%" id="AutoNumber2" height="165">
   		    <tr>
   		   
   		    <td width="100%" align="center" height="19">
		<b>
			<font color="#111111" face="verdana">&nbsp;&nbsp;&nbsp;&nbsp;
		
			Sucessfully Split in Meta Tag </font></b></td></tr>

   		    <tr>
			<b> 
			<font color="#111111" face="verdana">
            <td width="100%" align="center" height="44" colspan="7"><font face="Verdana"><b>
            <font size="1">&nbsp;</font><font size="1" color="#FFFFFF">
            <input type=submit  class="tBox" value="Next" name="Submit"size="200"></font></b></font></td>
                           
        </font></b></td></tr>

        <%

try
{

	
	Vector vector=new Vector();
	Vector filevector=new Vector();
	filevector=db.searchFiles();
	System.out.println("THE INPUT FILE SIZE IS search  "+filevector.size());
	String real=request.getRealPath("/");
	String ral=real+"jsp\\pagerank\\search\\";
		File file[]=new File(ral).listFiles();
	//insert metatags are insert to the data base
	
	
	try
	{
	for( p=0;p<filevector.size();p++)
	{	
		dd=(String)filevector.elementAt(p);
	/*	filename=ral+dd;
		File f=new File(filename);
		if(f.exists())
		{
			FileInputStream fi=new FileInputStream(f);
			byte b1[]=new byte[fi.available()];
			fi.read(b1,0,b1.length);
			fi.close();	
			filename=ral+dd.substring(0,dd.indexOf("."))+".txt";
			FileOutputStream fout=new FileOutputStream(filename);
			fout.write(b1);
			fout.close();
		}	*/
	}
	}
	catch(Exception exp)
	{
	out.println(exp);
	}
	
	try
	{
	for( p=0;p<filevector.size();p++)
	{
		dd=(String)filevector.elementAt(p);
		filename=ral+dd;//.substring(0,dd.indexOf("."))+".html";
		File f=new File(filename);
		if(f.exists())
		{
			FileInputStream fin=new FileInputStream(filename);
			byte b[]=new byte[fin.available()];
			fin.read(b,0,b.length);
			fin.close();
			String str=new String(b);
			int x=str.indexOf("<META");
			System.out.println ("xxxxxxxx1");
		
		try
		{
		
			str=str.substring(x,str.length());
			}
			catch(Exception exp1)
			{System.out.println (exp1);
			
			}
		
			int n=0;
			for (i=5;i<=str.length();i++)
			{
				System.out.println ("xxxxxxxx2");
		
		    	 if(str.substring(i-5,i).equalsIgnoreCase("<meta"))
			     {
					n++;
				
					System.out.println ("xxxxxxxx3");
		
				
					}
			}
			for( j=0;j<n;j++)
			{
				int xx=str.indexOf(">");
				str2[j]=str.substring(3,xx);
				str1=str1+str.substring(3,xx);
				str=str.substring(xx+1,str.length());
				
					System.out.println ("xxxxxxxx4");
		
			}
			for(i=0;i<j;i++)
			{
				String str3=str2[i];
				if(str3.indexOf("content=\"")>0)
				{
				
				System.out.println ("XXXXXXX5");
					filename=filename.substring(filename.lastIndexOf("\\")+1,filename.length());
					db.insertTerm(filename,str3.substring(str3.indexOf("content=\"")+9,str3.lastIndexOf("\"")));
				}
			}
		}
	}
	}
	catch(Exception ed)
	{
	out.println(ed);
	}
	

}
catch(Exception e)
{
out.println(e);
}%>
        </table>
          </center>
        </div>
      </td>
      <td width="18" height="188" bgcolor="#FFFFFF">
     </td>
    </tr>
    <tr>
      <td width="732" colspan="3" height="9" bgcolor="#FFFFFF">
     </td>
    </tr>
    </table>
  </center>
  </form>
</body>
</html>


<%@ page import="java.util.*,java.sql.*,java.io.*,java.lang.*,java.util.regex.*" %>

<% 	
String xx=request.getParameter("ff");

	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null,rs1=null;
	Statement st=null,st1=null;
	
	try
	{
	
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:metaquery");
		st=con.createStatement();
		st=con.createStatement();
		st1=con.createStatement();
		
String real=request.getRealPath("/");
	String ral=real+"jsp\\pagerank\\search1\\";
		
	%>
<html>
<head>
<title>hhhhhhhhhhhhhhhhhhh</title>
</head>
<body bgcolor="#3399FF">
<meta http-equiv="Content-Language" content="en-us">
<style type="text/css">

</style><!-- InstanceBeginEditable name="head" -->

<link href="index_files/VED_style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style4 {
	font-size: 10pt;
	font-weight: bold;
}
-->
</style><!-- InstanceEndEditable -->

<table align="center" border="0" cellpadding="0" cellspacing="0" width="765" bgcolor="#3399FF">
  <!-- fwtable fwsrc="ved_layout_2006.png" fwbase="ved_layout_2006.gif" fwstyle="Dreamweaver" fwdocid = "734876058" fwnested="0" -->
  <tbody><tr>
    <td><img src="index_files/spacer.gif" alt="" name="undefined_2" border="0" height="1" width="200"></td>
    <td><img src="index_files/spacer.gif" alt="" name="undefined_2" border="0" height="1" width="133"></td>
    <td><img src="index_files/spacer.gif" alt="" name="undefined_2" border="0" height="1" width="114"></td>
    <td><img src="index_files/spacer.gif" alt="" name="undefined_2" border="0" height="1" width="72"></td>
    <td><img src="index_files/spacer.gif" alt="" name="undefined_2" border="0" height="1" width="95"></td>
    <td><img src="index_files/spacer.gif" alt="" name="undefined_2" border="0" height="1" width="67"></td>
    <td><img src="index_files/spacer.gif" alt="" name="undefined_2" border="0" height="1" width="84"></td>
    <td><img src="index_files/spacer.gif" alt="" name="undefined_2" border="0" height="1" width="1"></td>
  </tr>
  <tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>


   <tr>
    <td colspan="7">
    <img border="0" src="image/1.jpg" width="765" height="100"></td>
    <td><img src="index_files/spacer.gif" alt="" name="undefined_2" border="0" height="42" width="1"></td>
  </tr>
  
  <tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
  </table>
  <table align="center" border="2" cellpadding="0" cellspacing="0" width="400" bgcolor="ddeeff">
 
  


  <tr>
  <td colspan="7" background="index_files/ved_layout_2006_r5_c1.gif" valign="top">
&nbsp;<b>FileName :</b></p></td>
<td colspan="7" background="index_files/ved_layout_2006_r5_c1.gif" valign="top">
&nbsp;<b>Links :</b></p></td>
<td colspan="7" background="index_files/ved_layout_2006_r5_c1.gif" valign="top">
&nbsp;<b>Word :</b></p></td>
  </tr>
 
    
    <%
    
    	
	 double countval=0;
		rs1=st1.executeQuery("select * from link ");
		
		while(rs1.next())
		{
	
			String name=rs1.getString("filename");
			String link=rs1.getString("link");
			String word=rs1.getString("word");
			
	%> 
	 <tr>
    
    
	
	 <td colspan="7" background="index_files/ved_layout_2006_r5_c1.gif" valign="top"><%= name %><br><br></td>
    		  <td colspan="7" background="index_files/ved_layout_2006_r5_c1.gif" valign="top">  	<a href="search1\\<%=link%>"><%=link%></a> <br><br>
    			</td>
    			  <td colspan="7" background="index_files/ved_layout_2006_r5_c1.gif" valign="top"><%= word %><br><br>
    		
    <%  
    	}
    	%>
    	

    <p align="center">
    </td> 
      </tr>
 
  
  <tr>
    <td colspan="7">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</tbody></table>
<form action="final.jsp">
 <center><input type="submit" value="Process" name="B1" style="border: 4px double #FF0000">

   </form>

</body></html>
<% 
	}
	catch(Exception e)
	{
		out.print("zdsdsdsdsdsd");
		out.println("Exception search "+e);
		}

%>
<%@ page import="java.util.*,java.sql.*,java.io.*,java.lang.*,java.awt.*,javax.swing.*" %>
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


<title>New Page 2</title>

<body topmargin="0" leftmargin="0" bgcolor="#3399FF" >
<form name="frm" method="post" action="admin2.jsp">
 <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber1" width="527" height="141">
   
   <tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>
<tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr><tr ></tr><tr></tr><tr></tr><tr><tr></tr><tr></tr>


   
   
   
   
   
   
   
    <tr>
      <td width="400" height="86" colspan="3">
      <img border="0" src="image/1.jpg" width="780" height="86"></td>
    </tr>
    <tr>
      <td width="78" height="188" bgcolor="#3399FF">
      <p align="left">
      </td>
      <td width="657" height="188" bgcolor="#3399FF">
        <div align="center">
          <center>
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="98%" id="AutoNumber2" height="165" bgcolor="#3399FF">
   		    <tr><td width="50%" align="center" height="19">
			<u><b>
		
   		    <tr>
   		    
   		    
   		    <td width="50%" align="center" height="18">
			<b> 
			<tr>
			   <td width="50%" align="center" height="18">
			
    <%
        
        String alldata1="";
Connection con;

try
{

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:metaquery");
	con.setAutoCommit(true);
	
	
		Statement sate1=con.createStatement();
ResultSet rsate1=sate1.executeQuery("select * from answer");
	if(rsate1.next())
	{
//	db.ans(rsate1.getString("word"));

//System.out.println (rsate1.getString("word"));
try
{%>

<font color="#ff1212" face="verdana">Enter the Meaning of  <%=rsate1.getString("word") %> ?</font></b></td></tr>

<%// alldata1=rsate1.getString("word");
//System.out.println (alldata1);
 }
catch(Exception ed)
{ed.printStackTrace();
}

	}
	
	

}




catch(Exception exp)
{
}%>
     

	<tr>
	
	<center>
	<td>
	<font color="#ff1212" face="verdana">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type=text size="50" name="query" class="tBox">
	</font>
	</td>
</center>

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
    <tr>
    <td width="100%" align="center" height="44" colspan="7"><font face="Verdana"><b>
            <font size="1">&nbsp;</font><font size="1" color="#FFFFFF"><input type=submit  class="tBox" value="NEXT" name="Submit"size="200"></font></b></font></td>
            
            </td>
    </tr>
    
    </table>
  </center>
  </form>
</body>
</html>
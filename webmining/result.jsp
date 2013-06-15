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
<body topmargin="0" leftmargin="0" bgcolor="#3399FF">
<form name="frm">
 <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber1" width="527" height="141" bgcolor="#3399FF">
    <tr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <td width="400" height="86" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <img border="0" src="image/1.jpg" width="780" height="86"></td>
    </tr>
    <tr>
      <td width="78" height="188" bgcolor="#3399FF">
      <p align="left">
     </td>
      <td width="657" height="188" bgcolor="#3399FF">
        <div align="center">
          <center>
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" width="98%" id="AutoNumber2" height="165" bgcolor="#3399FF">
   		    <tr><td width="50%" align="center" height="19">
			<u><b>
			<font color="#ffffff" face="verdana">Final Result</font></b></u></td></tr>

   		    <tr><td width="50%" align="center" height="18">
			<b> 
			<font color="#ffffff" face="verdana">The Output is</font></b></td></tr>
        
		     <tr><td width="50%" align="center" height="37" bgcolor="#3399FF">
						<font color="#ffffff"><b><p align="left">
		    <%	
		    try{
		    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	        Connection con = DriverManager.getConnection("jdbc:odbc:metaquery", "","");
			Statement state = con.createStatement();
			String sw="select distinct(doc) from final";
		    ResultSet rs=state.executeQuery("select * from finalresult");
		    if(rs.next())
		    {
		    
		    Statement sate=con.createStatement();
		    ResultSet rsate=sate.executeQuery("select * from finalresult order by count desc");
		    while(rsate.next()) 	
		    {	
		    	String url=rsate.getString("filename");
		    	
		    	System.out.println (url);
		    	
		    	
		    	
		    %>
					<a href="search\<%=url%>"><%=url%></a><br>
						<%
					
		      
			   }
			    }
			    else
			    {
			    
			    Statement sate1=con.createStatement();
		    ResultSet rsate1=sate1.executeQuery("select * from document1 order by total desc");
		    while(rsate1.next()) 	
		    {	
		    	String url1=rsate1.getString("filename");
		    	
		    	System.out.println (url1);
		    	
		    	
		    	
		    %>
					<a href="search\<%=url1%>"><%=url1%></a><br>
						<%
					
		      
			   }
			    
			    
			    
			    
			    
			    }
			  
			  
			   %><b></font></b></td>
          </tr><% 
		  
		  
}
catch(Exception e)
{
out.println(e);
}%>
        </table>
          </center>
        </div>
      </td>
      <td width="18" height="188" bgcolor="#3399FF">
      </td>
    </tr>
    <tr>
      <td width="732" colspan="3" height="9" bgcolor="#3399FF">
      </td>
    </tr>
    </table>
  </center>
  </form>
</body>
</html>
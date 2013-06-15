<jsp:useBean id="log" class="metaquery.LoginDB"/>
<%@ page import="java.util.*,java.sql.*,java.io.*,java.lang.*" %>

<% 

String data=request.getParameter("query"); 
Connection con;
String name=" ";
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:metaquery");
	con.setAutoCommit(true);	
	try{
	
	Statement saten=con.createStatement();
	ResultSet rsaten=saten.executeQuery("select * from answer");
	if(rsaten.next())
	{
 name=rsaten.getString("word");
 
 
 
 String mou=name+" "+ data;
	
	try
	{
		Statement saten1=con.createStatement();
		saten1.executeUpdate("update split set word='"+mou+"' where word='"+name+"'");
	
	
	
	}
	catch(Exception Exp)
	{
	}
	
		
	try
	{
		Statement saten2=con.createStatement();
		saten2.executeUpdate("delete * from answer where word='"+name+"'");
	
	}
	catch(Exception Exp)
	{
	}
	
	
	
	
	
	
	
	
	
	}
	
	
	

	}
	catch(Exception expo)
	{
	}
	
	int im=0;
	
String sname=" ";
try
{
Statement saten4=con.createStatement();
	ResultSet rsaten4=saten4.executeQuery("select * from answer");
	if(rsaten4.next())
	
{%>
		<jsp:forward page="answer.jsp">
	
			<jsp:param name="ff" value="<%=name%>" />
		</jsp:forward>

	<%}
else
{%>

		<jsp:forward page="query.jsp"/>
			<jsp:param name="ff" value="<%=name%>" />
		<% System.out.println ("hhhh");}%>
		</jsp:forward>






<%}
catch(Exception expo)
{
}












  
 }
 catch(Exception e)
 {System.out.println(e);
 } %>

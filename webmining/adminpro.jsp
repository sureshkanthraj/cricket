<jsp:useBean id="log" class="metaquery.LoginDB"/>
<%@ page import="java.util.*,java.sql.*,java.io.*,java.lang.*" %>

<% 

String data=request.getParameter("data"); 
Connection con;
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:metaquery");
	con.setAutoCommit(true);	
	try{
	
	Statement satem=con.createStatement();
	satem.executeUpdate("delete * from split");
		
	Statement satem1=con.createStatement();
	satem1.executeUpdate("delete * from answer");
	
	
		Statement satem5=con.createStatement();
	satem5.executeUpdate("delete * from index");
		
	Statement satem6=con.createStatement();
	satem6.executeUpdate("delete * from metatable");

	Statement satem7=con.createStatement();
	satem7.executeUpdate("delete * from documents");
	
	Statement satem8=con.createStatement();
	satem8.executeUpdate("delete * from document1");
	
		
	Statement satem9=con.createStatement();
	satem9.executeUpdate("delete * from link");
	
	
			
	Statement satem10=con.createStatement();
	satem10.executeUpdate("delete * from finalquery");
	
	Statement satem11=con.createStatement();
	satem11.executeUpdate("delete * from finalresult");
	
	
	}
	catch(Exception expo)
	{
	}
	
	int im=0;
	
String sname=" ";
try
{

StringTokenizer strm=new StringTokenizer(data," ");
if(strm.countTokens()>0)
{
while(strm.hasMoreTokens())
{
 sname=strm.nextToken();
try
{
	Statement sate=con.createStatement();
sate.executeUpdate("insert into split values('"+sname+"')");
}
catch(Exception epo)
{
}


try
{
	Statement sate1=con.createStatement();
ResultSet rsate1=sate1.executeQuery("select * from vvv where word='"+sname+"'");
	if(rsate1.next())
	{
	im++;
//	cc=sname;
	
		Statement sate2=con.createStatement();
		sate2.executeUpdate("insert into answer values('"+sname+"')");
	
	
	}

}
catch(Exception edf)
{edf.printStackTrace();
}
}





}


if(im==0)
{


%>
		<jsp:forward page="query.jsp">
		<jsp:param name="ff" value="<%=sname%>" />
		</jsp:forward>

	<%}
else
{
System.out.println ("mm");

%>

		<jsp:forward page="answer.jsp"/>
			<jsp:param name="ff" value="<%=sname%>" />
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

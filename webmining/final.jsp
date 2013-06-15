<jsp:useBean id="log" class="metaquery.LoginDB"/>
<%@ page import="java.util.*,java.sql.*,java.io.*,java.lang.*" %>

<% 

Connection con;
String name=" ";
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:metaquery");
	con.setAutoCommit(true);	


try
{
String query="";

int count=0;

Statement sat=con.createStatement();
ResultSet rsat=sat.executeQuery("select * from finalquery");
while(rsat.next())
{
count++;

}
System.out.println (count);

try
{


Statement sdf=con.createStatement();
ResultSet rsdf=sdf.executeQuery("select * from index");
while(rsdf.next())
{
String filename=rsdf.getString("weburl");

int ftot=0;
int count1=0;

Statement sdf1=con.createStatement();
ResultSet rsdf1=sdf1.executeQuery("select * from finalquery");
while(rsdf1.next())
{
String word=rsdf1.getString("word");
System.out.println (filename);
Statement sdf2=con.createStatement();
ResultSet rsdf2=sdf2.executeQuery("select * from document1 where word='"+word+"' and filename='"+filename+"'");
if(rsdf2.next())
{
int tot=rsdf2.getInt("total");
ftot=tot+ftot;
count1++;

}

}


if(count==count1)
{
Statement satb=con.createStatement();
satb.executeUpdate("insert into finalresult values('"+filename+"',"+ftot+")");
}
}

}


catch(Exception expo)
{expo.printStackTrace();
}

}
catch(Exception es)
{
es.printStackTrace();
}
  
 }
 catch(Exception e)
 {System.out.println(e);
 } %>
<jsp:forward page="result.jsp">

</jsp:forward>
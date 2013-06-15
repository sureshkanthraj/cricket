<jsp:useBean id="log" class="metaquery.LoginDB"/>
<jsp:useBean id="db" class="metaquery.QueryDB"/>
<jsp:useBean id="ele" class="metaquery.ElemenateTag"/>
<jsp:useBean id="tdidf" class="metaquery.CalculateTfidf"/>
<jsp:useBean id="porter" class="metaquery.PorterStemmer"/>

<%@ page import="java.util.*,java.sql.*,java.io.*,java.lang.*" %>

<% 

String data=request.getParameter("data"); 
Connection con;
String hk="";

try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:metaquery");
	con.setAutoCommit(true);	
	try{
	
	Statement sate=con.createStatement();
	ResultSet rsate=sate.executeQuery("select * from split");
	while(rsate.next())
	{
	String vv=rsate.getString("word");
	
	hk=hk+" "+vv;
	
	}
	
System.out.println (hk);


	}
	catch(Exception expo)
	{
	}
	


String hard="";
StringTokenizer to=new StringTokenizer(hk," ");
if(to.countTokens()>0)
{
	while(to.hasMoreTokens())
	{
		String ss=to.nextToken();
		 ss=ss.toLowerCase();
		if((!db.selectverb(ss))&&(!db.selectSubject(ss))&&(!db.selectConnection(ss)))	
		{
			
			hard=hard+" "+ss;
			
			Statement sate=con.createStatement();
sate.executeUpdate("insert into finalquery values('"+ss+"')");
					
		}	
	}
	


}
%>

<jsp:forward page="listfile.jsp">
		<jsp:param name="ff" value="<%=hard%>" />
		</jsp:forward>








  
 <%}
 catch(Exception e)
 {System.out.println(e);
 } %>

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
String sss=request.getParameter("query");
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

<title>New Page 2</title>

<body topmargin="0" leftmargin="0" bgcolor="#3399FF" >
<form name="frm" method="post" action="adminpro.jsp" bgcolor="#3399FF">
 <table border="0" cellpadding="0" bgcolor="#3399FF" cellspacing="0" style="border-collapse: collapse" bordercolor="#232323" id="AutoNumber1" width="527" height="141">
   
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
			<font color="#111111" face="verdana">Streamming And NLP Processing </font></b></u></td></tr>

   		    <tr>
   		    
   		    
   		    <td width="50%" align="center" height="18">
			<b> 
			<font color="#111111" face="verdana">The Output is</font></b></td></tr>
			<tr>
			   <td width="50%" align="center" height="18">
			

        <%
        
        String alldata="";

try
{

	StringTokenizer to=new StringTokenizer(sss," ");
	while(to.hasMoreTokens())
	{
		String ss=to.nextToken();
		 ss=ss.toLowerCase();
		if((!db.selectverb(ss))&&(!db.selectSubject(ss))&&(!db.selectConnection(ss)))	
		{
		if(ss.endsWith("e"))
		{
		stem=ss;
		}
		else
		{
			stem=porter.stem(ss);
			
			System.out.println (stem);
			}
			alldata=alldata+" "+stem;
			
			
			
			
				
		}	
	}
%>

<font color="#ff1212" face="verdana"><%= alldata %></font></b></td></tr>
	
	<input type="hidden" name="data" value="<%=alldata%>">
	
<%}
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
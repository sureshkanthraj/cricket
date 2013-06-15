<%@ page import="java.util.*,java.sql.*,java.io.*,java.lang.*" %>
<jsp:useBean id="db" class="metaquery.QueryDB"/>

<html>
<script language="javascript">

</script>
<body topmargin="0" leftmargin="0" bgcolor="#ccddaa" ">
<div align="center">
  <center>
<%
String finalword=request.getParameter("ff");
out.println("<form name=\"frm\" method=\"get\" action=\"document.jsp\">");
out.println("<br><br><br><br><br><br><h3><p align=center >ALL DOCUMNETS ARE REDAED</p></h3>");
out.println("<br><br><br><br><p align=\"center\"> <input type=\"submit\" value=\"Next\" name=\"next\" style=\"font-size: 9pt; font-weight: bold\"></p>");
try
{

	db.deleteIndex();
	String real=request.getRealPath("/");
	String ral=real+"jsp\\pagerank\\search\\";
	System.out.println (ral);

	String path=ral;
	File file[]=new File(path).listFiles();
	System.out.println ("XXXXXXXXXXX");
	for(int i=0;i<file.length;i++)
	{
		String filename=file[i].getName().trim();
		System.out.println (filename);
		if(filename.indexOf(".") != -1)
		{
			String type=filename.substring(filename.indexOf(".")+1,filename.length());
			out.println("<br>File name :"+filename);
			if( (type.equalsIgnoreCase("html")) || (type.equalsIgnoreCase("htm")) ||(type.equalsIgnoreCase("jsp")) )
			{
				String st=filename.substring(0,filename.indexOf(".")+1)+"txt";
				db.insertIndex(filename,st);	
			}	
		}
		else
		{
			File fi=new File(path+"/"+filename);
			if(fi.isDirectory())
			{
				File file1[]=new File(path+"/"+filename).listFiles();
				for(int j=0;j<file1.length;j++)
				{
					String filename1=file1[j].getName().trim();
					String type=filename1.substring(filename1.indexOf(".")+1,filename1.length());
					if( (type.equalsIgnoreCase("html")) || (type.equalsIgnoreCase("htm")) ||(type.equalsIgnoreCase("jsp")) )
					{
						String st=filename1.substring(0,filename1.indexOf(".")+1)+"txt";
						db.insertIndex(filename+"\\"+filename1,st);	
					}
				}
			}
		}
	}
}
catch(Exception ex){System.out.println("Sql Exception :"+ex.toString());}
%>
<table>
<jsp:forward page="fweightlinks.jsp">
	<jsp:param name="ff" value="<%=finalword%>" />
</jsp:forward>

</center>
</div>

</body>
</html>
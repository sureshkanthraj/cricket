<%@ page import="java.util.*,java.sql.*,java.io.*,java.lang.*,java.util.regex.*" %>

<% //	String query=request.getParameter("T1"); 
	String real=request.getRealPath("/");
	String status="";
	//String path=real+"jsp \\search\\";
	String path=real+"jsp\\pagerank\\search\\";
	int index=0;
	int endindex=0;
	String s1="";
	String s2="";
	
		
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs;
	Statement st,st1,st2,sch;
	
	try
	{
	
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:metaquery");
		st=con.createStatement();
			st1=con.createStatement();
		st2=con.createStatement();
	
		ResultSet rst=st.executeQuery("select * from document1");
	
	while(rst.next())
	
	{
	String gam=rst.getString("filename");
	String word=rst.getString("word");
	
	
			FileInputStream fi=new FileInputStream(path+"/"+gam);
			byte b1[]=new byte[fi.available()];
			fi.read(b1,0,b1.length);
			String search=new String(b1);
			fi.close();
			String abc=search;
		
			
		
			
			for(int j=0;j<search.length();j++)
			{
			
				index=search.indexOf("<a href");
			
				if(index==-1)
				{
				
				}
				else
				{
				if(index>=0 && index<search.length())
				{
					
					endindex=search.indexOf(">",index);
				
				
				}
				if(endindex>=0 && endindex<search.length())
				{
					s2=search.substring(index,endindex);
					s1=search.substring(endindex,search.length());
					
				
				}
				System.out.println (s2);
				//s2=s2+">";
				
			try
			{	
			rs=st2.executeQuery("select * from wwwcom");
				while(rs.next())
				{
					String comval=rs.getString("extensions");
					int inval=s2.indexOf(comval);
					if(inval!=-1)
					{
						s2=s2.substring(9,inval+4);
						Statement satemn=con.createStatement();
						ResultSet rsatemn=satemn.executeQuery("select * from link where  word='"+word+"' and link='"+s2+"' and filename='"+gam+"'");
						if(rsatemn.next())
						{
						}
						else
						{
							st1.executeUpdate("insert into link values('"+word+"','"+s2+"','"+gam+"')");
						}
					}
				}
					}
			catch(Exception ed)
			{ed.printStackTrace();
			}	
				
				
				search=s1;
				s2="";
				
			}
		}
			
			
		}	
		
		
	try
		{
			String path1=real+"jsp\\pagerank\\search1\\";

		
		
		
		
Statement	saei=con.createStatement();
		ResultSet rsaei=saei.executeQuery("select * from link");
		while(rsaei.next())
		{
		
	
				
	String word=rsaei.getString("word");
	String link1=rsaei.getString("link");
	String filename=rsaei.getString("filename");
	
//	System.out.println (filename);
	int dd=0;
	StringTokenizer token=new StringTokenizer(link1,"//");
	if(token.countTokens()>0)
			{
				
			while(token.hasMoreTokens())
			{
				
			link1=token.nextToken();
		
			if(dd==1)
			{
		//	link1=token.nextToken();
			break;
			}
			dd++;
			
		}
			}
			
	try
	{
	

	System.out.println (path1+"/"+link1+".html");
		FileInputStream fis = new FileInputStream(path1+"/"+link1+".html");
	    	byte b[] = new byte[fis.available()];
	    	fis.read(b,0,b.length);
	    String	content = new String(b);
	    	fis.close();
	    	System.out.println (content);
	    	
	    	

	

		StringTokenizer stk = new StringTokenizer(content);
			int count = 0;
			String docWord = "";
			if(stk.countTokens()>0)
			{
			 	while(stk.hasMoreTokens())
			  	{
			  		docWord = stk.nextToken();
			  		if(word.equalsIgnoreCase(docWord)){
			  		System.out.println ("word is -- >"+docWord+" file "+filename+" count "+count);
				  		++count;
			  		}			  		
			  	}
	
			}
			
			try
			{
			
			
			Statement sate=con.createStatement();
			ResultSet rsate=sate.executeQuery("select * from document1 where word='"+word+"' and filename='"+filename+"' ");
			if(rsate.next())
			{
			int tot=rsate.getInt("total");
			tot=tot+count;
			
			try
			{
			Statement satn=con.createStatement();
			satn.executeUpdate("update document1 set total="+tot+" where word='"+word+"' and filename='"+filename+"'");
		
		System.out.println ("XXXXXXXXXXXXXXXXXX123");
		
		
			}
			catch(Exception expow)
			{
			}
			
			
			
			
			}
			
			
			}
			catch(Exception ed)
			{
			}
	
	}
	catch(Exception expb)
	{
	}
			
	}
		}
		catch(Exception exp2)
		{	out.println("Exception search "+exp2);
		}

	

		
		

	}
	catch(Exception e)
	{
		out.print("zdsdsdsdsdsd");
		out.println("Exception search "+e);
	}
	
	
	
		
%>
<jsp:forward page="fweightlinks2.jsp">

</jsp:forward>
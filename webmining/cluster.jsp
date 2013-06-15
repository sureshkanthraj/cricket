<jsp:useBean id="log" class="metaquery.LoginDB"/>
<%@ page import="java.util.*,java.sql.*,java.io.*,java.lang.*" %>
<jsp:useBean id="db" class="metaquery.QueryDB"/>
<jsp:useBean id="ele" class="metaquery.ElemenateTag"/>
<jsp:useBean id="tdidf" class="metaquery.CalculateTfidf"/>
<jsp:useBean id="porter" class="metaquery.PorterStemmer"/>

<% 
String hk="";
Connection con;

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
	

String real=request.getRealPath("/");
	String ral=real+"jsp\\pagerank\\search\\";
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
					
		}	
	}
	}




try
	    {
			File f = new File(ral);
			File fileList[] = f.listFiles();
		int	fileLength = fileList.length;
			for(int i=0;i<fileList.length;i++)
			{
				
		
		
		
		
		try
	    {
	 		String search = "";
			StringTokenizer sk = new StringTokenizer(hard," ,','");
			System.out.println(" sk.countTokens() "+sk.countTokens());
								
			if(sk.countTokens()>0){
				while(sk.hasMoreTokens())
			  	{
			  		search = sk.nextToken();
			  		//////////////insert data base/////////////////////////////
			  		
			  		
			  	try {
		FileInputStream fis = new FileInputStream(ral+"/"+fileList[i].getName());
	    	byte b[] = new byte[fis.available()];
	    	fis.read(b,0,b.length);
	    String	content = new String(b);
	    	fis.close(); 
	    	
	    	
	    	
	    		StringTokenizer stk = new StringTokenizer(content);
			int count = 0;
			String docWord = "";
			if(stk.countTokens()>0)
			{
			 	while(stk.hasMoreTokens())
			  	{
			  		docWord = stk.nextToken();
			  		if(search.equalsIgnoreCase(docWord)){
			  		//	System.out.println ("word is -- >"+docWord+" file "+file+" count "+count);
				  		++count;
			  		}			  		
			  	}
			  //	String query = "insert into documents values('"+search.toUpperCase()+"',"+count+",'"+file+"')";
			//	boolean flag = DB.update(con,query);
			//	System.out.println(" execute flag "+flag+" query is "+query);	
				//makeCluster(search.toUpperCase(),file);
	       
	       try
	       {
	       Statement saten=con.createStatement();
	       saten.executeUpdate("insert into documents values('"+search.toUpperCase()+"',"+count+",'"+fileList[i].getName()+"')");
	       }
	       catch(Exception exp)
	       {
	       }
	       
	       
	       
	        }
	    }    
	    catch(Exception e){
	      
	    }
			  		
			  		
			  		
			  	}
			  	
			  	
			}
	    }
	    catch(Exception e)
	    {
	      
	    }
		
		
		}	    	  
			
	    }
	    catch(Exception e)
	    {
	     
	    }
	    
//String	fileList[]=null;
	try
	    {
	   File f2 = new File(ral);
			File fileList[] = f2.listFiles();
		int	fileLength = fileList.length;
	    	for(int i=0;i<fileList.length;i++)
	    	{
	    	String file=fileList[i].getName();
	    	System.out.println (file);
	    try
	    {
	    	Statement sdf=con.createStatement();
	    	ResultSet rdf=sdf.executeQuery("select * from documents where filename= '"+file+"' and total>"+0+"");
	    	while(rdf.next())
	    		{
	    		
	    			String word = rdf.getString("word");
	    			int total 	= rdf.getInt("total");
	    			String filename 	= rdf.getString("filename");
	    			System.out.println ("word "+word+" filename "+filename+" total "+total);
	    			if(total>0) {
	    			
	    			
	    			
	    try
	    {
	    	String clusDir =real+"jsp\\pagerank\\CLUSTER";
	    	//FileManager.makeDir(clusDir);
	    //	FileManager.makeDir();
	    	
	    	System.out.println ("BBBBBBBBBBBBBBBb");
	    	//	
	    	
	    	try
	    {
	    	File f1  = new File(clusDir+"/"+word.toUpperCase());
	    	if(!f1.exists())
	    	{
	    		f1.mkdir();
	    	}
	    }
	    catch(Exception e)
	    {
	     // e.printStackTrace();
	    }
	    	
	    	
	    	
	    	String path =clusDir+"/"+word+"/"+filename;
	    	
	    	
	    	FileInputStream fis = new FileInputStream(ral+"/"+filename);
	    	byte b[] = new byte[fis.available()];
	    	fis.read(b,0,b.length);
	    String 	content1 = new String(b);
	    	fis.close();
	    	
	    	FileOutputStream fos = new FileOutputStream(path);
	    	 fos.write(content1.getBytes()) ;
	    	 fos.close();
	    	
	   	    }
	    catch(Exception ex)
	    {
	     ex.printStackTrace();
	    }
		}
	    		}
		    	}
		    	catch(Exception er)
		    	{
		    	er.printStackTrace();
		    	}	
	    	}
	    }
	    catch(Exception ex)
	    {
	     
	    }
	    try
	    {
	    Statement sat11=con.createStatement();
	   ResultSet rsat11=sat11.executeQuery("select * from documents where total>="+1+"");
	   while(rsat11.next())
	   {
	   String word=rsat11.getString("word");
	   int tot=rsat11.getInt("total");
	   String ffi=rsat11.getString("filename");
	   
	   try
	   {
	   
	   Statement sat12=con.createStatement();
	   sat12.executeUpdate("insert into document1  values('"+word+"',"+tot+",'"+ffi+"')");
	  
	   
	   }
	   catch(Exception exp12)
	   {
	   exp12.printStackTrace();
	   }
	   
	   
	   
	   
	   }
	    }catch(Exception exp)
	    {
	    }
	    
}
 catch(Exception e)
 {System.out.println(e);
 } %>
<jsp:forward page="link.jsp">

</jsp:forward>

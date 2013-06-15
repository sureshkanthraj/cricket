package metaquery;

import java.io.PrintStream;
import java.sql.*;
import java.util.StringTokenizer;
import java.util.Vector;
import java.io.*;

public class QueryDB implements Serializable
{

    public QueryDB(){}
    
    public void init() throws Exception
    {
       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
       con = DriverManager.getConnection("jdbc:odbc:metaquery", "","");
		con.setAutoCommit(true);
    }
	public void insertIndex(String weburl,String counturl)
    {
    	try
   		{
   			  init();
   			  String query="insert into index(weburl,counturl) values('"+weburl+"','"+counturl+"')";
  			  PreparedStatement preparedstatement = con.prepareStatement(query);
    		  preparedstatement.executeUpdate();    		   
    		  con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in insert index :"+ex);
        }               
    }
    
   public Vector searchTxtFiles()
   {
    	Vector vec=new Vector();
   		try
   		{
   			  init();
   			  String query="select counturl from index";
    		   PreparedStatement preparedstatement = con.prepareStatement(query);
    		   ResultSet rs=preparedstatement.executeQuery();
    		   
    		   while(rs.next())
    		   {
    		   		String temp=rs.getString(1);
    		   		vec.addElement(temp);
    		   	}
    		   	con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in verb :"+ex);
        }
        
        return vec;
  } 
   
  public Vector searchFiles()
    {
    	Vector vec=new Vector();
   		try
   		{
   			  init();
   			  String query="select weburl from index";
    		   PreparedStatement preparedstatement = con.prepareStatement(query);
    		   ResultSet rs=preparedstatement.executeQuery();
    		   
    		   while(rs.next())
    		   {
    		   		String temp=rs.getString(1);
    		   		vec.addElement(temp);
    		   	}
    		   	con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in verb :"+ex);
        }
        
        return vec;
  }
  
    
   
  
 	public boolean selectverb(String str)
    {
    	boolean flag=false;
    	try
   		{
   		  init();
   		  String query="select word from verb where word='"+str+"'";
    	  PreparedStatement preparedstatement = con.prepareStatement(query);
    	  ResultSet rs=preparedstatement.executeQuery();
    	  while(rs.next())
    	  {
    	  	String temp=rs.getString(1);
    	  	flag=true;
    	  }
    	  //System.out.println("THE STRIMG IS ===="+str+"====="+flag);
    	con.close();
        }
        catch(Exception ex)
        {
        //	System.out.println("Error in verb :"+ex);
        }
        
        return flag;
    }
   
  public boolean selectSubject(String str)
  {
  	boolean flag=false;
    try
   	{
   		init();
   	  	String query="select *from subject where word='"+str+"'";
      	PreparedStatement preparedstatement = con.prepareStatement(query);
      	ResultSet rs=preparedstatement.executeQuery();
      	while(rs.next())
      	{
	      	String temp=rs.getString(1);
      		flag=true;
      	}
    	con.close();
   	}
    catch(Exception ex)
    {
      	//	System.out.println("Error in verb :"+ex);
   	}
    
    return flag;
 }
    
public boolean selectConnection(String str)
{
  	boolean flag=false;
   	try
	{
		//System.out.println("Call of Connection");
 		  init();
  		  String query="select word from connection where word='"+str+"'";
    	  PreparedStatement preparedstatement = con.prepareStatement(query);
    	  ResultSet rs=preparedstatement.executeQuery();
    	  while(rs.next())
    	  {
    	  	String temp=rs.getString(1);
    	  	flag=true;
    	  }
    	con.close();
     }
     catch(Exception ex)
     {
       	//System.out.println("Error in verb :"+ex);
      }
        
        return flag;
    }    
	public void insertWord(String weburl,String word,int count)
	{
    	try
   		{
   	   		init();
   			String query="select id from index where weburl='"+weburl+"'";
   			System.out.println(query);
    	  	PreparedStatement preparedstatement = con.prepareStatement(query);
    	  	ResultSet rs=preparedstatement.executeQuery();
    	  	int urlid=0;
    	  	while(rs.next())
    	  	{
	    	  	urlid=rs.getInt("id");
    	   	}	
    	  	if(urlid!=0)
   			{
   				String query1="insert into wordcount(urlid,word,totcon) values("+urlid+",'"+word+"','"+count+"')";
  				PreparedStatement preparedstatement1 = con.prepareStatement(query1);
    			preparedstatement1.executeUpdate();    		   
    		}
    			con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in insert index :"+ex);
        }               
    }
    
   

    public void deleteIndex()
    {
    	try
   		{
   			  init();
   			  String query="delete from index";
    		  PreparedStatement preparedstatement = con.prepareStatement(query);
    		  preparedstatement.executeUpdate();
    		  query="delete from wordcount";
    		  preparedstatement = con.prepareStatement(query);
    		  preparedstatement.executeUpdate();
    		  query="delete from query";
    		  preparedstatement = con.prepareStatement(query);
    		  preparedstatement.executeUpdate();
    		  query="delete from metatable";
    		  preparedstatement = con.prepareStatement(query);
    		  preparedstatement.executeUpdate();
    		  con.close();
    
        }
        catch(Exception ex)
        {
        	System.out.println("Error in Delete index :"+ex);
        }               
    }
    
   
 	
    public int fileIndex(String url)
    {
    	int id=0;
    	try
   		{
   			  init();
   			  String query="select id from index where counturl='"+url+"' ";
    		  PreparedStatement preparedstatement = con.prepareStatement(query);
    		  ResultSet rs=preparedstatement.executeQuery();
    		  
    		  while(rs.next())
    		  {
    		  	id=rs.getInt(1);
    		  
    		  }
    		  
    		  con.close();
        }
         catch(Exception ex)
        {
        	System.out.println("Error in file index :"+ex);
        }     
        System.out.println("**********id in db :"+id);          
        return id;
    }
    
    public void deleteTerms()
    {
    	try
   		{
   			  init();
   			  String query="delete from metatable";
    		  PreparedStatement preparedstatement = con.prepareStatement(query);
    		  preparedstatement.executeUpdate();    		   
    		  con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in Delete terms :"+ex);
        }               
    }
     public void insertTerm(String url,String term)
    {
    	try
   		{
   			  init();  			  
   			  String query="insert into metatable(url,term) values('"+url+"','"+term+"')";	
    		  PreparedStatement preparedstatement = con.prepareStatement(query);
    		  preparedstatement.executeUpdate();   		  
    		  con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in insert term :"+ex);
        }               
    }
    public void updateIndex(String a,String b)
    {
    	try
   		{
   			  init();
   			    			  
   			  String query1="update index set counturl='"+b+"' where weburl='"+a+"'";
   			  PreparedStatement preparedstatement1 = con.prepareStatement(query1);
    		  preparedstatement1.executeUpdate();
    		  
    		  con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in update index :"+ex);
        }               
    }
    public Vector uniqueDocument()
  {
    	Vector vec=new Vector();
   		try
   		{
   			  init();
   			  String query="select distinct(urlid) from termtable";
    		   PreparedStatement preparedstatement = con.prepareStatement(query);
    		   ResultSet rs=preparedstatement.executeQuery();
    		   
    		   while(rs.next())
    		   {
    		   		int temp1=rs.getInt(1);
    		   		String temp=""+temp1;
    		   		vec.addElement(temp);
    		   	}
    		   	con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in verb :"+ex);
        }
        
        return vec;
  }
  
  public void update(int urlid)
    {
    	try
   		{
   			  init();
   			    			  
   			  String query="select max(count) from termtable where urlid="+urlid+"";
   		
    		  PreparedStatement preparedstatement = con.prepareStatement(query);
    		  ResultSet rst=preparedstatement.executeQuery();
    		  System.out.println("11111111");
    		  while(rst.next())
    		  {
    		  	int mcount=rst.getInt(1);
    		  	String query1="update termtable set maxvalue="+mcount+" where urlid="+urlid+"";
   			  	PreparedStatement preparedstatement1 = con.prepareStatement(query1);
    		  	preparedstatement1.executeUpdate();
    		  	System.out.println("222222222");
    		  }
    		  preparedstatement.close();
    		  String query2="select count,maxvalue,id from termtable";
   			  PreparedStatement preparedstatement2 = con.prepareStatement(query2);
    		  ResultSet rs2=preparedstatement2.executeQuery();
    		  System.out.println("3333333333");
    		  while(rs2.next())
    		  {
    		  	double cc=rs2.getDouble(1);
    		  	int mm=rs2.getInt(2);
    		  	int id=rs2.getInt(3);
    		  	double average=cc/mm;
    		  	
    		  	String query3="update termtable set tfidf="+average+" where id="+id+" ";
   			  	PreparedStatement preparedstatement3 = con.prepareStatement(query3);
    		  	preparedstatement3.executeUpdate();
    		  	preparedstatement3.close();
    		  	System.out.println("444444444");
    		  }
    
    		  con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in update :"+ex);
        }               
    }
    public Vector uniqueTerm()
    {
    	Vector vec=new Vector();
   		try
   		{
   			  init();
   			  String query="select distinct(term) from termtable";
    		   PreparedStatement preparedstatement = con.prepareStatement(query);
    		   ResultSet rs=preparedstatement.executeQuery();
    		   
    		   while(rs.next())
    		   {
    		   		String temp=rs.getString(1);
    		   		vec.addElement(temp);
    		   	}
    		   	con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in verb :"+ex);
        }
        
        return vec;
  }
  public void deleteTotalCount()
    {
    	try
   		{
   			  init();
   			  String query="delete from totalcount";
    		  PreparedStatement preparedstatement = con.prepareStatement(query);
    		  preparedstatement.executeUpdate();
    		   
    		  con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in delete total count :"+ex);
        }               
    }
     public int validate(String term)
    {
    	int vec=0;
   		try
   		{
   			  init();
   			  String query="select count(urlid) from termtable where term='"+term+"'";
    		   PreparedStatement preparedstatement = con.prepareStatement(query);
    		   ResultSet rs=preparedstatement.executeQuery();
    		   
    		   while(rs.next())
    		   {
    		   		vec=rs.getInt(1);
    		   	}
    		   	con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in verb :"+ex);
        }
        
        return vec;
  }
  public void insertQuery(String query1)
    {
    	try
   		{
   			  init();
   			     			  
   			  String query="insert into query(query) values('"+query1+"')";
  
    		  PreparedStatement preparedstatement = con.prepareStatement(query);
    		  preparedstatement.executeUpdate();
    		  con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in termtable insert :"+ex);
        }               
    }
    
   public void insertTotalCount(String term,int count,int totalpage)
    {
    	try
   		{
   			  init();
   			  String query="insert into totalcount(term,pagecount,totalpage) values('"+term+"',"+count+","+totalpage+")";
    		  PreparedStatement preparedstatement = con.prepareStatement(query);
    		  preparedstatement.executeUpdate();
    		   
    		  con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in insert total count :"+ex);
        }               
    }
  public void cluster(int id)
  {
  	try
  	{
  		init();
  		String query="select term from termtable where urlid="+id +" order by tfidf";
    	PreparedStatement preparedstatement = con.prepareStatement(query);
    	ResultSet rs=preparedstatement.executeQuery();
    	while(rs.next())
    	{
    		String term = rs.getString(1);
    		System.out.println("ORDERED TERM :"+term);
    		
    	}
  		con.close();
  	}
  	catch(Exception ex)
  	{
  		System.out.println("Error in clustering :"+ex);
  	}
  }
 
    Connection con;
    
}
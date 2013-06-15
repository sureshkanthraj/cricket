package metaquery;

import java.io.PrintStream;
import java.sql.*;
import java.util.StringTokenizer;
import java.util.Vector;
import java.io.*;
import java.math.*;

public class CalculateTfidf implements Serializable
{
	Connection con;
	int max=0;
    public void init() throws Exception
    {
       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
       con = DriverManager.getConnection("jdbc:odbc:metaquery", "","");
	   con.setAutoCommit(true);
    }

    public void calculate()
    {
    	int id=0;
    	double tf=0,maxtf=0,nf=0,n=0;
    	double tfidf=0.0;
    	String qry1,qry2,redoc,qry3; 
    	PreparedStatement ps1,ps2,ps3; 	
    	ResultSet rs1,rs2;
    	try
   		{
   			init();
   			String query="select distinct(id) from index ";//where weburl='"+we+"'";
    	    PreparedStatement preparedstatement = con.prepareStatement(query);
    		ResultSet rs=preparedstatement.executeQuery();
    		while(rs.next())
    		{
    			n++;
    		}
    		//System.out.println("THE TOTAL DOCUMENT== "+n);
   			query="select distinct(id) from index ";//where weburl='"+we+"'";
    	    preparedstatement = con.prepareStatement(query);
    		rs=preparedstatement.executeQuery();
    		while(rs.next())
    		{
    			id=rs.getInt(1);
    			System.out.println(id);
    			qry1="select max(totcon) from wordcount where urlid="+id+"";
    		  	ps1= con.prepareStatement(qry1);
    			rs1=ps1.executeQuery();
    			while(rs1.next())
    			{
	    			maxtf=rs1.getDouble(1);
    			}
    			//System.out.println("THE MAximaus "+maxtf);
    			qry1="select word,totcon from wordcount where urlid="+id+"";
    		   	ps1= con.prepareStatement(qry1);
    			rs1=ps1.executeQuery();
    			while(rs1.next())
    			{	
    				redoc=rs1.getString(1);
	    			tf=rs1.getDouble(2);
	    			//System.out.println("TF "+tf);
	    			qry2="select word from wordcount where word='"+redoc+"'";
    		   		ps2= con.prepareStatement(qry2);
    				rs2=ps2.executeQuery();
    				while(rs2.next())
    				{	
	    				nf++;
	    			}
	    			tfidf=(tf/maxtf)*(nf/n);
	    			String xx=""+tfidf;
	    			double finl;
	    			if(xx.length()>5)
	    				finl=Double.parseDouble(xx.substring(0,5));
	    			else
	    				finl=tfidf;
	    			qry3="update wordcount set tfidf="+finl+" where word='"+redoc+"'";
	    			//System.out.println(qry3);
    		   		ps3= con.prepareStatement(qry3);
    				ps3.executeUpdate();
    				System.out.println("THE N="+n+"MAX="+maxtf+"THE Tf="+tf+"THE NF "+nf );
	    			System.out.println("THE TFIDF NT==="+finl);
	    			nf=0;
	    		}
    		}
    		con.close();
        }
        catch(Exception ex)
        {
        	System.out.println("Error in verb :"+ex);
        }
      }
    
    public static void main(String args[])
    {
    	CalculateTfidf t=new CalculateTfidf();
    	String a[]={"1.htm","infoseeknew.html"};
    	//for(int i=0;i<a.length;i++)
    	//{
    		t.calculate();
    //	}
    	
    }
}
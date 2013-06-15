
package metaquery;

import java.io.PrintStream;
import java.sql.*;

public class LoginDB
{

    public LoginDB()
    {
        userid = "";
        password = "";
       
    }

    public void init()
        throws Exception
    {
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con = DriverManager.getConnection("jdbc:odbc:metaquery", "","");
       // String cont="jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=d:\\Program Files\\Apache Tomcat 4.0\\webapps\\examples\\WEB-INF\\classes\\search.mdb";
       //con = DriverManager.getConnection(cont);
    }
        public boolean check(String id,String pass)
    	{
    		boolean flag=false;
       		try
    		{
    			init();
    			String s6 = "select userid from user where userid='" + id + "' and password='"+pass+"'";
    			//System.out.println(s6);
            	PreparedStatement preparedstatement = con.prepareStatement(s6);
            	ResultSet rs=preparedstatement.executeQuery();
            
            	while(rs.next())
            	{
            		flag=true;
            	}
            	con.close();
    		}
    		catch(Exception ex)
    		{
    			System.out.println("Error in Validation db page :"+ex.toString());
    		}
    		return flag;
    	}
    	
   public String admincheck(String id,String pass)
   {
   		String flag="no";
   		try
   		{
   			init();
   			String s6 = "select userid from user where userid='" + id + "' and password='"+pass+"' and ident='admin';";
           	PreparedStatement preparedstatement = con.prepareStatement(s6);
           	ResultSet rs=preparedstatement.executeQuery();
           
           	while(rs.next())
           	{
           		flag="yes";
           	}
           con.close();
   		}
   		catch(Exception ex)
   		{
   			System.out.println("Error in Validation db page :"+ex.toString());
   		}
   		
   		return flag;
   	} 	

    public String insert(String userid, String password, String password1)
    {
        String s4 = "";
        try
        {
             System.out.println("Enter into try");
            init();
            String s5 = "no";
            this.userid = userid;
            this.password = password;                      
           
            String s6 = "select userid from user where userid='" + userid + "';";
            PreparedStatement preparedstatement = con.prepareStatement(s6);
            ResultSet rs=preparedstatement.executeQuery();
            
            while(rs.next())
            {
            	s5="yes";
            }
            if(s5.equals("yes"))
            {
                s4 ="already exist";
            } else
            {
                String s8 = "insert into user(userid,password) values(?,?)";
                PreparedStatement preparedstatement2 = con.prepareStatement(s8);
                preparedstatement2.setString(1, userid);
                preparedstatement2.setString(2, password);
               
                preparedstatement2.executeUpdate();
                con.commit();
                
                System.out.println("Record Inserted successfully");
                s4 = "added";
            }
        con.close();
        }
        catch(Exception exception)
        {
            System.out.println("Error in record insertion in Login table:" + exception);
           
        }
        return s4;
    }

    String userid;
    String password;
    int id;
    Connection con;
}

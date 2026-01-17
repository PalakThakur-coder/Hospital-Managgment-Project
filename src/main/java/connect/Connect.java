package connect;
import java.sql.*;

public class Connect {
	public Connection c; //interface
	public void DataConnection()
	{
		//driver registration
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(ClassNotFoundException cnfe)

		{
			System.out.println(cnfe);
		}
		//establish the connection
		try
		{
		c = DriverManager.getConnection("jdbc:mysql://localhost:3306/BCA2021 ","root","gvmitm@123");
		//database name,ip address,port no,username,password
		
		}
		catch (SQLException se)
		{
			System.out.println(se);
		}
	}
	
	
}



package login.signup;
import java.sql.*;

public class Login
{
	@SuppressWarnings("finally")
	public static Connection getConnection(String DB)
	{
		Connection con = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+DB, "root", "root");
			
		//	return con;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			return con; 
		}
	}
}
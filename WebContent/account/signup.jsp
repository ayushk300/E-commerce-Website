<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session = 'true'  %>
<%@ page import = "java.sql.*" %>
<%@ page import = "login.signup.Login" %>
<%@ page session = "true" %>
<%
try
{
	boolean signup = false;
	String name = request.getParameter("name").trim();
	String email = request.getParameter("email").trim();
	String phn = request.getParameter("mobile");
	String password = request.getParameter("password");
	//String confirm_password = request.getParameter("confirm_password");
	//int phnno = Integer.parseInt("phn");
	Connection con = Login.getConnection("ecommerce");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from user");
	while(rs.next())
	{
		if(rs.getString("email").equalsIgnoreCase(email))
		{
			signup = true;
			out.print("user already register");
		}
	}
	if(!signup)
	{
		System.out.println("namye: "+name);
		boolean query = stmt.execute("insert into user(name, email, password, mobile) values('"+name+"','"+email+"','"+password+"','"+phn+"')");
		System.out.println("Query flag "+query);	

	}
}
catch(SQLException e)
{
	out.println(e.getMessage());
	//System.out.println(e.getMessage());
	e.printStackTrace();
}
%>

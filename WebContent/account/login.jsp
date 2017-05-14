<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.sql.*" %>
<%@ page import="login.signup.Login" %>
 <%@ page session = "true" %>
 <%
try
{
	boolean authenticate = false;
	String email = request.getParameter("email");
	System.out.println("email:"+email);
	String password = request.getParameter("password");
	System.out.println("pass:"+password);
	
	
	Connection con = Login.getConnection("ecommerce");
	 Statement stmt = con.createStatement();
	 ResultSet rs = stmt.executeQuery("select * from ecommerce.user");
	 
	 while(rs.next())
	 {
		 System.out.println("------------------");
		 System.out.println("email in db:"+rs.getString("email"));
		 System.out.println("password in db:"+rs.getString("password"));
		 if(rs.getString("email").equals(email) && rs.getString("password").equals(password))
		 {
			 authenticate = true;
		 }
		 System.out.println("------------------");
	 }
	 if(authenticate)
	 {
		 System.out.println("successful");
		 session.setAttribute("login",true);
		 out.print("successful");
	 }
	 else
	 {
		 System.out.println("unsuccessful");
		out.print("unsuccessful");
	 }
}
catch(SQLException e)
{
out.print(e.getMessage());
	e.getStackTrace();
}
 %>

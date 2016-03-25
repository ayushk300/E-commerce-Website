<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import="login.signup.Login" %>
<%@ page session = true %>


<% 	String url = "/index";
	ServletContext context = getServletContext();
	boolean login_invalid = false;	
	String Session_id = session.getId();

	//checking if a new user has visited
	
	if(session.getAttribute("ID")==null || session.getAttribute("ID").toString().equals(""))
	{
		session.setAttribute("ID",Session_id);
		session.setAttribute("type","default");
		session.setAttribute("username","default");
		
	}
	
%>

<% 
	//login code here
	if((Boolean)session.getAttribute("login_attempt"))
	{
		
		String email = request.getParameter("email").toLowerCase();
		
		String password = request.getParameter("password");
		
		
		Connection con = Login.getConnection("Ekart");
		Statement st=con.createStatement();
		ResultSet rs = st.executeQuery("select * from user");
		boolean tocontinue=false;
		if(rs.next())
		{
			tocontinue=true;
		}
		
		while(tocontinue)
		{
			if(rs.getString("Email").equals(email) && rs.getString("password").equals(password))
			{
				url = "/index";
				String id =session.getId();
				RequestDispatcher rd = context.getRequestDispatcher(url);
				session.setAttribute("ID",id);
				session.setAttribute("username", email);
				login_invalid = false;
				rd.forward(request,response);
				
			}
			else
			{	
				tocontinue=rs.next();
				 login_invalid = true;
			}
		}
		
	}
%>

<% 
	// signup code here 
	if(request.getParameter("name")==null || request.getParameter("email")==null)
	{
		if(!request.getParameter("name").equals(""))
		{
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String mobile = request.getParameter("mobile");
			String password = request.getParameter("password");
			String confirm_password = request.getParameter("confirm_password");
			if(password.equals(confirm_password))
			{
				
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekart", "root", "root");
					Statement st=con.createStatement();
					st.execute("insert into user(name, email, mobile, password) values('"+name+"','"+email+"','"+mobile+"','"+password+"';");
		
					url = "JspTest/index";
					RequestDispatcher rd = context.getRequestDispatcher(url);
					rd.forward(request,response);
				}
				catch(SQLException ex)
				{
					ex.printStackTrace();
				}
				
				
			}
			else
			{
				out.println("password do not match, try again");
				
				
			}
		}
	}
%>

<%
//onclick event of login button , call login function   	

	

//url = "/index";
	//ServletContext context = getServletContext();
//	RequestDispatcher rd = context.getRequestDispatcher(url);
/////	session.setAttribute("login_attempt",true);
	//rd.forward(request,response);*/
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<!--jsp:include page="nav.jsp" /-->
<% 
	url = "/nav.jsp";
	RequestDispatcher rd = context.getRequestDispatcher(url);
	rd.include(request,response);
%>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.sql.*" %>
<%@ page import="login.signup.Login" %>
 <%@ page session = "true" %>
 <% String table = request.getParameter("param"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
		<title>
			Product page : <%= table %>
		</title>
		<link rel = "stylesheet" href = "css/product_style.css" type = "text/css" />
		<link rel = "stylesheet" href = "css/styles.css" type = "text/css" />
</head>
<body>
				<%@include file="nav.jsp" %>

		<% 
		// get Connection here
		try
		{
			Connection con = Login.getConnection("ecommerce");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = stmt.executeQuery("Select * from "+table);
			
			//get attributes value
			if(rs==null)
			{
				//display no product available right now
				%>
				<h1>No Products of the selected category available right now</h1>
				<%
			}
			else
			{
				String name,description,brand,size,imageurl,stylecolor,quantity,language,publisher,author;
				int price,quan,pid;
				while(rs.next())
				{	
					pid = rs.getInt("pid");
					name = rs.getString("pname");
					description = rs.getString("description") ;
					 price = rs.getInt("price");
					language = rs.getString("language");
					 author= rs.getString("author");
					 publisher = rs.getString("publisher");
					quan = rs.getInt("quantity");
					imageurl = rs.getString("imagename");
					quantity ="";
					if(quan>0)
					{
						quantity = "In Stock";
						stylecolor = "green";
					}
					else
					{
						quantity = "Out Of Stock";
						stylecolor = "red";
					}
				%>
				<div id = "item1" class = "items"><a href="myproductbooksandentertainment.jsp?table=<%=table%>&pid=<%=pid%>"><img src = "<%=imageurl%>"></img></a><div class = "description"><a href="myproductbooksandentertainment.jsp?table=<%=table%>&pid=<%=pid%>"><%=name%></a><a>price:<%=price%></a><%=description%></div><div class = "extra">author: <%=author%></div><p style="color:<%=stylecolor%>"><%=quantity%></p><div class = "warrcolor">publisher : <%=publisher %><span>language : <%=language%></span></div></div>
				
				<%
					
					
				}	
			}

		}
		catch(Exception ex)
		{
			ex.getStackTrace();
		}
		%>
		
		<%@include file="footer.jsp" %>
</body>
</html>
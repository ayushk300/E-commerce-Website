<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.sql.*" %>
<%@ page import="login.signup.Login" %>
 <%@ page session = "true" %>
 
 <% String table = request.getParameter("table");
 int pid = Integer.parseInt(request.getParameter("pid"));
 %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
		<title>
			 Product : <%=table %> 
		</title>
		<link rel = "stylesheet" href = "css/myproduct.css" type = "text/css" />
	</head>
 <body>
 <% 
 System.out.println("Table "+table);
 System.out.println("PID "+pid);
 String name=null,description=null, author=null, size=null,imageurl=null,stock=null,publisher=null, language=null;
 int price=0,quantity=0,length = 0;
 try
 {
		Connection con = Login.getConnection("ecommerce");   
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from "+table+" where pid="+pid );
		
			if(rs.next())
			{
				name = rs.getString("pname");
				description = rs.getString("description");
				price = rs.getInt("price");
			author = rs.getString("author");
			publisher = rs.getString("publisher");
			language = rs.getString("language");
				quantity = rs.getInt("quantity");
				imageurl = rs.getString("imagename");
				length = rs.getInt("length");
				 System.out.println("name "+name);
				 System.out.println("description "+description);
				 System.out.println("price "+price);
			
				 System.out.println("imageurl "+imageurl);
				 if(quantity>0)
					{
						stock= "In Stock";
					}
					else
					{
						stock = "Out of stock";
					}
				 %>
				 	
		<%@include file="nav.jsp"%>
		<div id = "item1" class = "items"><a href=""><img src = "<%=imageurl%>" height="450px"></img></a><div class = "description"><a><%=name %></a><a>price: <%=price %></a><p><%=description%></p><div class = "size">author : <%=author %></div><div class = "stock">Publisher : <%=publisher %></div><div class = "size1">language : <%=language %></div><div class = "stock1"><%=stock %></div><span id = "buynow"><a href = "#">BUY NOW</a></span><div class="addtocard"><a href = "javascript:void(0)" onclick="addtocart('<%=table %>','<%=pid%>')">ADD TO CART</a></div></div></div>
		<div id = "item2" class = "items"><p><b>About The Seller: </b>Firefox is having trouble recovering your windows and tabs. This is usually caused by a recently opened web page.irefox is having trouble recovering your windows and tabs. This is usually caused by a recently opened web page.irefox is having trouble recovering your windows and tabs. This is usually caused by a recently opened web page.</p></div>
			<%@include file="footer.jsp"%>

		
				 <% 
			}
			else
			{
				System.out.println("Resultset is null");
				%>

		<%@include file="nav.jsp"%>
					<h1>No products available right now</h1>	
					<br/><br/>
					<a href = "index.jsp">go to home page</a>
		<%@include file="footer.jsp"%>
				
				<%
				
			}
			
			
	
 }
 catch(Exception ex)
 {
	   ex.getStackTrace();
 }			
 
 %>
  <script type = "text/javascript" src = "javascript/myproduct.js"></script>
</body>
</html>	
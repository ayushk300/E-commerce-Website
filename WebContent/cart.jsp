<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.util.*" %>
    <%@ page import = "com.extra.Product" %>
    <%@ page import = "login.signup.Login" %>
    <%@ page import = "java.sql.*" %>
 <%@ page session = "true" %>
  <% 
  	List<Product> ls = (ArrayList)session.getAttribute("product_list");
  	Connection con = Login.getConnection("ecommerce");
  	Statement stmt = con.createStatement();
  	
  %>
  <!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
		<title>
			MyCart Page
		</title>
		<link rel = "stylesheet" href = "css/mycart.css" type = "text/css" />
	</head>

<body>
		<div id = "wrapper" class = "wrap"><div id = "cart" class = "cart">Cart (<%=ls.size()%>)</div></div>
		<div id = "header" class = "head">
			<table width="100%" cellpadding ="0" cellspacing="0">
				<tr>
					<td  width="45%" align="center">ITEM</td>
					<td width = "5%" align="left">QTY</td>
					<td width="18.33%" align="left">PRICE</td>
					<td width="18.33%" align="left">DELIVERY DETAILS</td>
					<td width="18.33%" align="left">SUBTOTAL</td>
				</tr>
			</table>
		</div>
 
<%
	
 //display the product added to cart till now
 	System.out.println("im in cart.jsp");
	ResultSet rs;
	int total=0;
 	for(int i = 0 ; i< ls.size();i++)
    {
    	Product ps = ls.get(i);
    //	System.out.println(i+" entry/table : "+ps.table);
    //	System.out.println(i+" entry/pid : "+ps.pid);
    //	System.out.println("---------------------");
		rs = stmt.executeQuery("select * from "+ps.table+" where pid = "+ps.pid);
		rs.next();
%>
		<div id = "item<%=i%>" class = "items">
			<table width="100%" cellpadding ="0" cellspacing="0">
				<tr>
					<td width="45%"><a href=""><img src = "<%=rs.getString("imagename")%>"></img></a><div class = "description"><%=rs.getString("pname")%><a href="javascript:void(0)" onclick="remove(<%=i%>)">Remove</a></div></div></td>
					<td width = "5%" align="left">1</td>
					<td width = "18.33%" align="left"><%=rs.getInt("price")%></td>
					<td width = "18.33%" align="left">Free/delivery till 20Apr</td>
					<td width = "18.33%" align="left"><%=rs.getInt("price")%></td>
				</tr>
			</table>
		</div>
<%
	total+=rs.getInt("price");
  	}
%>
		<div id = "totalamount" class = "totalamount">Amount Payable : <span>Rs. <%=total %></span><p>Includes Standard Delivery Charges</p></div>
		<div id ="placeorder" class ="placeorder"><a href = "#" >< CONTINUE SHOPPING</a><span><a href = "#">PLACE ORDER</a></span></div>
		<div id = "footer" class = "footer" ><b>Polies:</b><a href = ""> Terms of use | </a><a href = ""> Security |</a><a href = ""> Privacy |</a><a href = ""> Infrigement</a><span>© 2007-2016 E-Kart.com</span></div>
		
		<script type = "text/javascript" src = "javascript/mycart.js"></script>
	</body>
</html>

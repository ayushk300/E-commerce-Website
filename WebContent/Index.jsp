<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import="login.signup.Login" %>
<%@ page session = "true"%>
<%

//create a default session
if(session.getAttribute("sessionId")==null)
{
	session.setAttribute("login", false);
	session.setAttribute("sessionId","default");
	session.setAttribute("username","default");
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Landing Page</title>
		<link href = "css/styles.css" rel = "stylesheet" />
		<link href = "css/login.css" rel = "stylesheet" />
		<script type = "text/javascript" src = ""></script>
</head>
	<body>
	
		<%@include file="nav.jsp"%>
		<!--jsp:include page = "nav.jsp" /-->
		
		<div class = "post">Fashion N Lifestyle<a href ="clothingandfootwear.jsp?param=formalandcasualshirtmen">view all</a><hr/><img src = "images/instruction2.png"></img><a href = ""></a></img><img src = "images/instruction2.png"></img><img src = "images/instruction2.png"></img><img src = "images/instruction3.png"></img><img src = "images/instruction4.png"></img><img src = "images/instruction5.png"></img></div>
		<div class = "post">Everything Women Want<a href ="clothingandfootwear.jsp?param=tshirtandtopwomen">view all</a><hr/><img src = "images/instruction2.png"></img><img src = "images/instruction2.png"></img><img src = "images/instruction1.png"></img><img src = "images/instruction3.png"></img><img src = "images/instruction4.png"></img><img src = "images/instruction5.png"></img></div>
		<div class = "post">Big Brands at Amazing Prices<a href ="clothingandfootwear.jsp?param=jeansandtrousersmen">view all</a><hr/><img src = "images/instruction2.png"></img><img src = "images/instruction2.png"></img><img src = "images/instruction1.png"></img><img src = "images/instruction3.png"></img><img src = "images/instruction4.png"></img><img src = "images/instruction5.png"></img></div>
		<div class = "post">Mobiles and Tablets<a href ="electronics.jsp?param=mobileandtablets">view all</a><hr/><img src = "images/instruction2.png"></img><img src = "images/instruction2.png"></img><img src = "images/instruction1.png"></img><img src = "images/instruction3.png"></img><img src = "images/instruction4.png"></img><img src = "images/instruction5.png"></img></div>
		<div class = "post">Footwear for Men<a href ="clothingandfootwear.jsp?param=footwearmen">view all</a><hr/><img src = "images/instruction2.png"></img><img src = "images/instruction2.png"></img><img src = "images/instruction1.png"></img><img src = "images/instruction3.png"></img><img src = "images/instruction4.png"></img><img src = "images/instruction5.png"></img></div>
		

		<%@include file="footer.jsp"%>
		<!--jsp:include page = "footer.jsp" /-->
		<script src = "javascript/index.js" type = "text/javascript"></script>
		<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
		<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
		
	</body>
</html>
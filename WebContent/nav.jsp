<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "css/styles.css" rel = "stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<nav class = "nav-main">
			<div class= "logo"><a href = "index.jsp">E-Kart</a></div>
			<div class= "cart"><a href = "cart.jsp"><img src = "images/cart0.png"/>My cart</a></div>
			
			<ul>
			
				<li>
					<input type= "radio" name = "nav-group" id = "men" class = "nav-option">
					<label for = "men" class = "nav-item">Men</label>
					<label for = "nav-close" class= "nav-close"></label>
					<div  class = "nav-content">
						<div class = "nav-sub">
							<ul>
								<li><a href = "clothingandfootwear.jsp?param=formalandcasualshirtmen">Formal & Casual Shirts</a></li>
								<li><a href = "clothingandfootwear.jsp?param=tshirtsmen">T-shirts</a></li>
								<li><a href = "clothingandfootwear.jsp?param=jeansandtrousersmen">Jeans & trousers</a></li>
								<li><a href = "clothingandfootwear.jsp?param=footwearmen">Footwear</a></li>
								<li><a href = "#">Everything 599</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<input type= "radio" name = "nav-group" id = "women" class = "nav-option">
					<label for = "women" class = "nav-item">Women</label>
					<label for = "nav-close" class= "nav-close"></label>
					<div  class = "nav-content">
						<div class = "nav-sub">
							<ul>
								<li><a href = "clothingandfootwear.jsp?param=formalclotheswomen">Formal Clothes</a></li>
								<li><a href = "clothingandfootwear.jsp?param=tshirtandtopwomen">T-shirts N tops</a></li>
								<li><a href = "clothingandfootwear.jsp?param=jeansandtrouserswomen">Jeans & trousers</a></li>
								<li><a href = "clothingandfootwear.jsp?param=footwearwomen">Footwear</a></li>
								<li><a href = "clothingandfootwear.jsp?param=kurtasandsarees">Kurtas & saree</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<input type= "radio" name = "nav-group" id = "electronics" class = "nav-option">
					<label for = "electronics" class = "nav-item">Electronics</label>
					<label for = "nav-close" class= "nav-close"></label>
					<div  class = "nav-content">
						<div class = "nav-sub">
								<ul>
									<li><a href = "electronics.jsp?param=mobileandtablets">Mobiles & Tablets</a></li>
									<li><a href = "electronics.jsp?param=laptopandaccessories">Laptops & accessories</a></li>
									<li><a href = "electronics.jsp?param=cameraandaccessories">Cameras</a></li>
									<li><a href = "electronics.jsp?param=telivisions">Telivisions</a></li>
									<li><a href = "electronics.jsp?param=homeandkitchenappliances">Home & Kitchen Applicances</a></li>
								</ul>
						</div>
					</div>
				</li>
				<li>
					<input type= "radio" name = "nav-group" id = "booksandentertainment" class = "nav-option">
					<label for = "booksandentertainment" class = "nav-item">Books & Entertainment</label>
					<label for = "nav-close" class= "nav-close"></label>
					<div  class = "nav-content">
						<div class = "nav-sub">
							<ul>
								<li><a href = "booksandentertainment.jsp?param=books">Books</a></li>
								<li><a href = "#">E-books and videos</a></li>
								<li><a href = "#">Movies and Tv Shows</a></li>
								<li><a href = "stationaries.jsp?param=stationariesandotherequipment">Stationaries and Other Equipment</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<input type= "radio" name = "nav-group" id = "login" class = "nav-option">
					<label for = "login" class = "nav-item"><a href = "http://localhost:8080/Ekart/account/LoginForm.jsp">Login</a></label>
					<label for = "nav-close" class= "nav-close"></label>
					
				</li>
				<li>
					<input type= "radio" name = "nav-group" id = "signup" class = "nav-option">
					<label for = "signup" class = "nav-item"><a href = "http://localhost:8080/Ekart/account/LoginForm.jsp">Signup</a></label>
					<label for = "nav-close" class= "nav-close"></label>
					
				</li>
				<li>
					<input type= "radio" name = "nav-group" id = "logout" class = "nav-option">
					<label for = "logout" class = "nav-item" style="display:none"><a href = "#">Logout</a></label>
					<label for = "nav-close" class= "nav-close"></label>
					
				</li>
	
			</ul>	
		</nav>
		<input type = "radio" name="nav-group" id = "nav-close" class = "nav-close-option">	
</body>
</html>
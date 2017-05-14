<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href = "../css/styles.css" rel = "stylesheet" />
<link href = "../css/login.css" rel = "stylesheet" />
</head>
<body>
		
		<nav class = "nav-main">
			<div class= "logo"><a href = "../index.jsp">E-Kart</a></div>
			<div class= "cart"><a href = "../cart.jsp"><img src = "images/cart0.png"/>My cart</a></div>
			
			<ul>
			
				<li>
					<input type= "radio" name = "nav-group" id = "men" class = "nav-option">
					<label for = "men" class = "nav-item">Men</label>
					<label for = "nav-close" class= "nav-close"></label>
					<div  class = "nav-content">
						<div class = "nav-sub">
							<ul>
								<li><a href = "../clothingandfootwear.jsp?param=formalandcasualshirtmen">Formal & Casual Shirts</a></li>
								<li><a href = "../clothingandfootwear.jsp?param=tshirtsmen">T-shirts</a></li>
								<li><a href = "../clothingandfootwear.jsp?param=jeansandtrousersmen">Jeans & trousers</a></li>
								<li><a href = "../clothingandfootwear.jsp?param=footwearmen">Footwear</a></li>
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
								<li><a href = "../clothingandfootwear.jsp?param=formalclotheswomen">Formal Clothes</a></li>
								<li><a href = "../clothingandfootwear.jsp?param=tshirtandtopwomen">T-shirts& tops</a></li>
								<li><a href = "../clothingandfootwear.jsp?param=jeansandtrouser">Jeans & trousers</a></li>
								<li><a href = "../clothingandfootwear.jsp?param=footwearmen">Footwear</a></li>
								<li><a href = "../clothingandfootwear.jsp?param=kurtasandsarees">Kurtas & saree</a></li>
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
									<li><a href = "electronics.jsp?param=laptop andaccessories">Laptops & accessories</a></li>
									<li><a href = "electronics.jsp?param=cameraandaccessories">Cameras</a></li>
									<li><a href = "electronics.jsp?param=telivions">Telivisions</a></li>
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
								<li><a href = "#">Books</a></li>
								<li><a href = "#">E-books and videos</a></li>
								<li><a href = "#">Movies and Tv Shows</a></li>
								<li><a href = "#">Stationaries and Other Equipment</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<input type= "radio" name = "nav-group" id = "login" class = "nav-option">
					<label for = "login" class = "nav-item"><a href="javascript:void(0)" onclick="toggle_visibility('popup-box2')">Login</a></label>
					<label for = "nav-close" class= "nav-close"></label>
					
				</li>
				<li>
					<input type= "radio" name = "nav-group" id = "signup" class = "nav-option">
					<label for = "signup" class = "nav-item"><a href="javascript:void(0)" onclick="toggle_visibility('popup-box1')">Signup</a></label>
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
		
		
			<div class = "login-card">
	
						<h3>Login</h3><br>
						<form method="post" action = "">
							<input type="text" name="email" id = "email" placeholder="email" class  = "username" />
							<input type="password" name="pass" id = "pass" placeholder="Password" class = "password" />
							
							<input type="button" name="login" class="login login-submit" value="Take me in!"  onclick = "validate_login(email.value,pass.value)"/>
							
							<div id = "sign"><a href = "terms&condition">Terms & Conditions</a> of E-kart and <a href="privacy policy">Privacy Policy</a></div>
							<hr/><div id = "oldacc">Don't Have an account?</div>
							<input type = "button" value = "Signup & Earn Goodies" name = "login" class = "login login_button" onclick = "toggle_visibility('popup-box1');"/>
						</form>
    
			</div>
		</div>
		
		
		<div id="popup-box1" class="popup-position">
			<div id="popup-wrapper" class ="signup" >
					<a href = "javascript:void(0)" onclick = "toggle_visibility('popup-box1')"><img src = "css/images/cross.png"/></a>
						<h2>Sign Up</h2>
						<form id="registerForm" method = "post">
							<input type = "text" placeholder = "Name*" id = "username" name = "username" class = "name" required/ >
							<input type = "text" placeholder = "Email*" id = "email" name = "email" class = "email" required/>
							<input type = "text" placeholder = "Mobile*" id = "mobile" name = "mobile" class = " mobile" required/>
							<input type = "password" placeholder = "Password*" id = "password" name = "password" class = "password" required/>
							<input type = "password" placeholder = "Confirm Password*" id = "confirm_password" name = "confirm_password" class = "confirm_password" required/>
							<input type = "button" value = "Create an account" name = "submit" class = "login login_submit" onclick = "validate_signup(username.value,email.value,mobile.value,password.value,confirm_password.value)" />
							<div id = "sign">By Signing Up, you agree to <a href = "terms&condition">Terms & Conditions</a> of E-kart and you have read the <a href="privacy policy">Privacy Policy</a></div>
							<hr/><div id = "oldacc">Already Have an account?</div>
							<input type = "button" value = "Login to My account" name = "login" class = "login login_button" onclick = "toggle_visibility('popup-box2');"/> 
						</form>
			</div>
		</div>
		
		
		<div id="popup-box2" class="popup-position">
			<div id="popup-wrapper" class = "login-card">
				<!--div class = "login-card"-->
					<a href="javascript:void(0)" onclick="toggle_visibility('popup-box2')"><img src="css/images/cross.png"/></a>
					
					
					<!--div class="login-card"-->
						<h3>Login</h3><br>
						<form method="post" action = "">
							<input type="text" name="email" id = "email" placeholder="email" class  = "username" />
							<input type="password" name="pass" id = "pass" placeholder="Password" class = "password" />
							
							<input type="button" name="login" class="login login-submit" value="Take me in!" onclick = "validate_login(email.value,pass.value)" />
							
							<div id = "sign"><a href = "terms&condition">Terms & Conditions</a> of E-kart and <a href="privacy policy">Privacy Policy</a></div>
							<hr/><div id = "oldacc">Don't Have an account?</div>
							<input type = "button" value = "Signup & Earn Goodies" name = "login" class = "login login_button" onclick = "toggle_visibility('popup-box1');"/>
						</form>
    
			</div>
		</div>
		
	<jsp:include page = "../footer.jsp"/>
		<script>

		function toggle_visibility(id)
		{
		   var e1 = document.getElementById('popup-box1');
			var e2 = document.getElementById('popup-box2');
		    
			
		   var e = document.getElementById(id);
		   if(e.style.display == 'block')
			{
			  e.style.display = 'none';
			}
		   else
			{
			  
				e1.style.display = 'none';
				e2.style.display = 'none';
				e.style.display = 'block';
			}
		}

		</script>
		<script src = "../javascript/login.js" rel = "stylesheet"></script>
		<script src = "../javascript/signup.js" rel = "stylesheet"></script>
		
</body>
</html>
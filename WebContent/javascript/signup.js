/**
 * 
 */
function validate_signup(username,email,mobile,password,confirm_password)
{
	alert(username);
	if(password===confirm_password)
	{
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function()
		{
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
			{
				alert(xmlhttp.responseText);
				
			}
			
		};
		xmlhttp.open("POST","signup.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("name="+username+"&email="+email+"&password="+password+"&mobile="+mobile);
	}
	else
	{
		alert('please make sure that password & confirm password fields are correct');
	}
}

function validate_login(email,password)
{
	
	// alert(email);
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function()
	{
		
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
		{
			var response = xmlhttp.responseText; 
			//document.write(response);
			if(response == "successful")
			{
				 window.location="../index.jsp";
			}
			else
			{
			//	window.location="../cart.jsp";
			}
		}
		
	};
	
	xmlhttp.open("GET","login.jsp?email="+email+"&password="+password,true);
	//xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send();
}
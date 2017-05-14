function remove(i)
{
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function()
	{
		
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
		{
			
			if(xmlhttp.responseText=="successful")
			{
				location.reload(true);
			}
			
		}
		
	};
	
	xmlhttp.open("POST","remove.jsp",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("i="+i);
}
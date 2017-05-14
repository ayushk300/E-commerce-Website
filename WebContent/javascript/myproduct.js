function addtocart(table,pid)
{
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function()
	{
		
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
		{
			
			if(xmlhttp.responseText==="successful")
			{
				alert('product added');
			}
			else
			{
				
			}
		}
		
	};
	
	xmlhttp.open("POST","addtocart.jsp",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("table="+table+"&pid="+pid);
}
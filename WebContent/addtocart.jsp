<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@  page import = "java.util.*"%>
    <%@ page import = "com.extra.Product" %>
    <%@ page session = "true" %>
    <%! boolean checkBeforeAdd(List<Product> ls, Product product)
    {
    	for(int i = 0 ; i< ls.size();i++)
		{
			Product ps = ls.get(i);
			if(ps.table.equals(product.table) && ps.pid==product.pid)
			{
				return false;
			}
			
		}
    	return true;
    }
    %>
   
    <%
    
    	String table = "",pid = "";
    	List<Product> ls ;
    	
    	table = request.getParameter("table");
    	pid = request.getParameter("pid");
    	
    	System.out.println("pid from url : "+pid);
    	System.out.println("table from url : "+table);
    	
    	if(table.equals("") || pid.equals(""))
    	{
    		out.println("unsuccessful");
    	}
    	else
    	{
    		Product product = new Product(table,pid);
    		if(session.getAttribute("product_list")==null)
    		{
    			System.out.println("product list is null");
    			ls = new ArrayList<Product>();
    			ls.add(product);
    			session.setAttribute("product_list",ls);
    		}
    		else
    		{
    			ls = (ArrayList)session.getAttribute("product_list");
    			if(checkBeforeAdd(ls,product))
    			{
    				ls.add(product);
        			session.setAttribute("product_list",ls);	
    			}
    			else{
    				//product is in the list already
    				}
    		}
    		List<Product> session_list =(ArrayList) session.getAttribute("product_list");
    		for(int i = 0 ; i< session_list.size();i++)
    		{
    			Product ps = session_list.get(i);
    			System.out.println(i+" entry/table : "+ps.table);
    			System.out.println(i+" entry/pid : "+ps.pid);
    		}
	  		out.println("successful");
    	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
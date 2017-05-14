package com.extra;

public class Product
{
	public String table;
	public int pid;
	public Product(String table,String id)
	{
		this.pid = Integer.parseInt(id);
		this.table = table;
	}
	public Product()
	{
		pid = 0;
		table = "";
	}
}

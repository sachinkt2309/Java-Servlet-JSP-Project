package com.corporate;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySqlConn {

	static Connection c;

	public static Connection getCon()
{ 
	 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	if (c==null)
	{
 c=DriverManager.getConnection("jdbc:mysql://localhost:3306/Main_Project","root",
		 "23Sachinkt@09");
 System.out.println("connected "+c);
	}
	 
 
}

catch(Exception e)
{
	System.out.println(e);
}
return c;
}
}

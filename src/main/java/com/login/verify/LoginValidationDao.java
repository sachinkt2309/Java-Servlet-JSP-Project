package com.login.verify;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.corporate.MySqlConn;
import com.usersetup.UserSetup;

public class LoginValidationDao {
	
	Connection con = null;
	ResultSet rs = null;
	Statement st = null;
	public int valid(AdminAndUser au)
	{
		int i=0;
		String userid=au.getAdminId();
		String password=au.getAdminPassword();
		String s1="select * from Admin where AdminId='"+userid+"' AND AdminPassword='"+password+"'";
		
		//System.out.println("Query: " + s1);
		try {
			con=MySqlConn.getCon();
			
			st=con.createStatement();
			rs=st.executeQuery(s1);
			boolean valid=rs.next();
			if(valid)
			{
				i=1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
		
}
	public int userValid(UserSetup us) {
		int i=0,j=0;
		String id=us.getUserId();
		String pass=us.getUserPassword();
		String s1="select * from UserSetup where userID='"+id+"' AND UserPassword='"+pass+"'";
		//String s2="select * from UserSetup where userID='"+id+"' AND UserPassword='"+pass+"';
		try {
			con=MySqlConn.getCon();
			
			st=con.createStatement();
			rs=st.executeQuery(s1);
			boolean valid1=rs.next();
			if(valid1)
			{
				int CorpId=rs.getInt("CorporateId");
				i=CorpId;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int newUser(UserSetup us) {
		int j=0;
		String pass=us.getUserPassword();
		  String newuser="select * from UserSetup where UserPassword='"+pass+"'"; 
		  try { 
			  con=MySqlConn.getCon();
	  
	  st=con.createStatement();
	  rs=st.executeQuery(newuser); 
	  boolean valid=rs.next(); 
	  if(valid) { 
		  j=1; 
		  } 
	  } catch (SQLException e) {
	  e.printStackTrace(); 
	  } 
		  return j;
	}
	public int Changepass(UserSetup us) {
		int j=0;
			Connection con=MySqlConn.getCon();
		String newpass="update UserSetup";
		return j;
	}
	 
}
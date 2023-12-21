package com.usersetup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.corporate.MySqlConn;

public class UserSetupDao {

	public int add(UserSetup us) {
		int result=0;
		try {
			Connection con=MySqlConn.getCon();
			String s="insert into UserSetup(CorporateId,UserID,UserPassword,Department,Address,PhoneNumber,DeleteStatus,newUser) values(?,?,?,?,?,?,?,?)";
			
				PreparedStatement ps=con.prepareStatement(s);
				ps.setInt(1, us.getCorporateId());
				ps.setString(2,us.getUserId());
				ps.setString(3, us.getUserPassword());
				ps.setString(4,us.getDepartment());
				ps.setString(5, us.getAddress());
				ps.setLong(6,us.getPhoneNumber());
				ps.setInt(7, 0);
				ps.setInt(8, 0);
				result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
				
		}
	public int modify(UserSetup us) {
		int result=0;
		try {
			Connection con=MySqlConn.getCon();
			String s="update UserSetup set Department=?,Address=?,PhoneNumber=? where UserID=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1,us.getDepartment());
			ps.setString(2, us.getAddress());
			ps.setLong(3,us.getPhoneNumber());
			ps.setString(4,us.getUserId());
			result=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int delete(String userid) {
		int result=0;
		try {
			Connection con=MySqlConn.getCon();
			String s="update UserSetup set DeleteStatus=1 where UserID=?";
			
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1, userid);
result=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	}
	

package com.corporate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CorporateDao {

	public int add(Corporate c) {
		int result=0;
		try {
		Connection con=MySqlConn.getCon();
		String s="insert into Corporate(CorporateName,Address,PhoneNumber,DeleteStatus) values(?,?,?,?)";
		
			PreparedStatement ps=con.prepareStatement(s);
			
			ps.setString(1, c.getCorporateName());
			ps.setString(2, c.getAddress());
			ps.setLong(3, c.getPhoneNumber());
			ps.setInt(4, 0);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int modify(Corporate c)
	{
		int result=0;
		try {
		Connection con=MySqlConn.getCon();
		String s="update Corporate set Address=?,PhoneNumber=? where CorporateId=?";
		
		PreparedStatement ps=con.prepareStatement(s);
		ps.setString(1, c.getAddress());
		ps.setLong(2, c.getPhoneNumber());
		ps.setInt(3, c.getCorporateId());
		result=ps.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int delete(int id) {
		int result=0;
		try {
			Connection con=MySqlConn.getCon();
			String s="update Corporate set DeleteStatus=1 where CorporateId=?";
			
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1,id);
			result=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}

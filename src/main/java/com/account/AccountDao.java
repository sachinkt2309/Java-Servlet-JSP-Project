package com.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.corporate.MySqlConn;

public class AccountDao {

	public int add(Account acc) {
		int result=0;
		try {
			Connection con=MySqlConn.getCon();
			String s="insert into Account(CorporateId,AccountNumber,AccountName,Currency,Branch,AvBalance,Status) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, acc.getCorporateId());
			ps.setLong(2, acc.getAccNumber());
			ps.setString(3, acc.AccName);
			ps.setString(4, acc.getCurrency());
			ps.setString(5, acc.getBranch());
			ps.setDouble(6, acc.getAvBalance());
			ps.setString(7, "Active");
			result=ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	public int close(long num) {
		int result=0;
		try {
			String value="Closed";
			Connection con=MySqlConn.getCon();
			String s="update Account set Status='"+value+"' where AccountNumber=?";
			PreparedStatement ps=con.prepareStatement(s);
			ps.setLong(1,num);
			result=ps.executeUpdate();
	}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
}
}

package net.javaguides.registration.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import databaseconnection.databaseconnection;

public class TransactionHisDao {
	static Connection con;
	static PreparedStatement ps;
	
	public int delete(String date) {
		int status = 0;
		try {
			con = databaseconnection.getcon();
			ps = con.prepareStatement("DELETE FROM bankapplication.tansaction_history WHERE date=?");
			ps.setString(1, date);
			status = ps.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
		}
	
}



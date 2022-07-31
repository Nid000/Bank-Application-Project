package appController;

import java.sql.Connection;
import java.sql.PreparedStatement;

import databaseConnection.connectionDB;

import appModels.LoanDetails;

public class LoandetailsDao {
	static Connection con;
	static PreparedStatement ps;
	
	public int delete(String loan_acc_number, int acc_number) {
		int status = 0;
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("DELETE FROM bankapplication.loan_accounts WHERE loan_acc_number=?");
			ps.setString(1, loan_acc_number);
			status = ps.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("UPDATE bankApplication.bank_customers SET TOTAL_LOANS = (TOTAL_LOANS - 1) where ACCOUNT_NUMBER= ?");
			ps.setInt(1, acc_number);
			ps.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		return status;
		}

	public int insertUpdatedLD(LoanDetails ld) {
		int status = 0;
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("UPDATE bankapplication.loan_accounts SET  L_AMOUNT = ?, L_PAID = ?, L_BALANCE = ? WHERE ACCOUNT_NUMBER = ?");
			ps.setInt(1, ld.getL_amount());
			ps.setInt(2, ld.getL_paid());
			ps.setInt(3, ld.getL_balance());
			ps.setInt(4, ld.getAccount_number());
			status = ps.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
		
	}

}

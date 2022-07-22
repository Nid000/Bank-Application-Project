package appController;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import appModels.loanAppModel;

import databaseConnection.connectionDB;

public class appController {
	static Connection con;
	static PreparedStatement ps;
	
	public loanAppModel get_details(String username) {
		loanAppModel lmodel =  new loanAppModel();
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("select bank_customers.username, loan_accounts.loan_acc_number, loan_accounts.l_amount, loan_accounts.l_balance from bankapplication.bank_customers INNER JOIN bankapplication.loan_accounts ON bank_customers.account_number = loan_accounts.account_number WHERE loan_accounts.ACCOUNT_NUMBER = (SELECT bank_customers.ACCOUNT_NUMBER from bankapplication.bank_customers WHERE username = ?;");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				lmodel.setUsername(rs.getString(1));
				lmodel.setLoanAcc(rs.getString(2));
				lmodel.setLoanAmt(rs.getInt(3));
				lmodel.setBalance(rs.getInt(4));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return lmodel;
	}
	
	public void update_Loan (int accNum, int loanAcc, int loanAmt, int loanBal) {
		loanAppModel updateLoan = new loanAppModel();
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("INSERT INTO bankapplication.loan_accounts VALUES (?, ?, ?, ?)");
			ps.setInt(2,  loanAcc);
			ps.setInt(3, loanAmt);
			ps.setInt(4, loanBal);
			ResultSet rs = ps.executeQuery();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
}

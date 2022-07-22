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
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
}

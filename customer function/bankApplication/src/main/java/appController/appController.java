package appController;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import appModels.customerDetails;
import appModels.customerModel;
import appModels.loanModel;
import appModels.transactionModel;
import databaseConnection.connectionDB;

public class appController {
	static Connection con;
	static PreparedStatement ps;
	public customerModel getCustomer(String username, String password) {
		customerModel cus = new customerModel();
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("select * from bankApplication.bank_customers  where username = ? and password = ?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cus.setUsername(rs.getString(1));
				cus.setPassword1(rs.getString(2));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return cus;
	}
	public customerDetails get_cusdetails(String username) {
		customerDetails cusmodel =  new customerDetails();
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("select NAME,ACCOUNT_NUMBER,BANK_BALANCE from bankApplication.bank_customers where USERNAME = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cusmodel.setAcc_num(rs.getInt("ACCOUNT_NUMBER"));
				cusmodel.setName(rs.getString("NAME"));
				cusmodel.setBbalance(rs.getInt("BANK_BALANCE"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return cusmodel;
	}
	public loanModel get_loandetails(int acc_num) {
		loanModel lm = new loanModel();
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("select LOAN_ACC_NUMBER,L_AMOUNT,L_PAID,L_BALANCE from bankApplication.loan_accounts where ACCOUNT_NUMBER = ?");
			ps.setInt(1, acc_num);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				lm.setL_accnum(rs.getString("LOAN_ACC_NUMBER"));
				lm.setL_amount(rs.getInt("L_AMOUNT"));
				lm.setL_paid(rs.getInt("L_PAID"));
				lm.setL_balance(rs.getInt("L_BALANCE"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return lm;
		
	}
	public void update_balance(int f_account, String t_account, int amount) {
		try {
			con = connectionDB.getcon();			
			ps = con.prepareStatement("UPDATE bankApplication.bank_customers SET BANK_BALANCE= (BANK_BALANCE + ?) WHERE ACCOUNT_NUMBER= ?");
			ps.setInt(1, amount);
			ps.setString(2,t_account);
			ps.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("UPDATE bankApplication.bank_customers SET BANK_BALANCE= (BANK_BALANCE - ?) where ACCOUNT_NUMBER= ?");
			ps.setInt(1, amount);
			ps.setInt(2,f_account);
			ps.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}}
	public void update_loanbalance(int f_account, String t_account, int amount) {
		try {
			con = connectionDB.getcon();			
			ps = con.prepareStatement("UPDATE bankApplication.loan_accounts SET L_PAID = (L_PAID + ?) WHERE LOAN_ACC_NUMBER= ?");
			ps.setInt(1, amount);
			ps.setString(2,t_account);
			ps.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		try {
			con = connectionDB.getcon();			
			ps = con.prepareStatement("UPDATE bankApplication.loan_accounts SET L_BALANCE= (L_BALANCE - ?) WHERE LOAN_ACC_NUMBER= ?");
			ps.setInt(1, amount);
			ps.setString(2,t_account);
			ps.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("UPDATE bankApplication.bank_customers SET BANK_BALANCE= (BANK_BALANCE - ?) where ACCOUNT_NUMBER= ?");
			ps.setInt(1, amount);
			ps.setInt(2,f_account);
			ps.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
	
		public 	int transaction_his(int f_account, String t_account, int amount) {
			int status = 0;
			try{
				con = connectionDB.getcon();
				ps = con.prepareStatement("insert into bankApplication.transaction_history(ACC_FROM, ACC_TO, AMOUNT,DATE) values(?,?,?,now())");
				ps.setInt(1, f_account);
				ps.setString(2, t_account);
				ps.setInt(3, amount);
				status = ps.executeUpdate();
				con.close();
			}
			catch(Exception e) {
				System.out.println(e);
			}return status;
		}

		public ArrayList<transactionModel> get_thistory(int acc_no) {
			ArrayList<transactionModel> transactions = new ArrayList<transactionModel>();
			try{
				con = connectionDB.getcon();
				ps = con.prepareStatement("select * from bankApplication.transaction_history  where ACC_FROM = ? ");
				ps.setInt(1, acc_no);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					transactionModel transaction = new transactionModel();
					transaction.setAcc_from(acc_no);
					transaction.setAcc_to(rs.getString("ACC_TO"));
					transaction.setAmount(rs.getInt("Amount"));
					transaction.setDate(rs.getString("DATE"));
					transactions.add(transaction);
				}
				rs.close();
				
			}
			catch(Exception e) {
				System.out.println(e);
			}
			return transactions;
		}
		
		public ArrayList<transactionModel> get_fhistory(String acc_no) {
			ArrayList<transactionModel> transactions = new ArrayList<transactionModel>();
			try{
				con = connectionDB.getcon();
				ps = con.prepareStatement("select * from bankApplication.transaction_history  where ACC_TO = ? ");
				ps.setString(1, acc_no);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					transactionModel transaction = new transactionModel();
					transaction.setAcc_to(acc_no);
					transaction.setAcc_from(rs.getInt("ACC_FROM"));
					transaction.setAmount(rs.getInt("Amount"));
					transaction.setDate(rs.getString("DATE"));
					transactions.add(transaction);
				}
				rs.close();
				
			}
			catch(Exception e) {
				System.out.println(e);
			}
			return transactions;
		}
		
		public String gett_account(String t_account) {
			String t_acc = "";
			try {
				con = connectionDB.getcon();
				ps = con.prepareStatement("select ACCOUNT_NUMBER from bankApplication.bank_customers  where ACCOUNT_NUMBER = ? ");
				ps.setString(1, t_account);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					t_acc = rs.getString("ACCOUNT_NUMBER");
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			return t_acc;
		}
		public String gett_loanacc(String t_account) {
			String t_acc = "";
			try {
				con = connectionDB.getcon();
				ps = con.prepareStatement("select LOAN_ACC_NUMBER from bankApplication.loan_accounts  where LOAN_ACC_NUMBER = ? ");
				ps.setString(1, t_account);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					t_acc = rs.getString("LOAN_ACC_NUMBER");
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			return t_acc;
		}
		public loanModel check_loan(String t_account) {
			loanModel lm = new loanModel();
			try {
				con = connectionDB.getcon();
				ps = con.prepareStatement("select L_AMOUNT,L_PAID from bankApplication.loan_accounts where LOAN_ACC_NUMBER = ?");
				ps.setString(1, t_account);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					lm.setL_amount(rs.getInt("L_AMOUNT"));
					lm.setL_paid(rs.getInt("L_PAID"));
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			return lm;
			
		}
		
		public void delete_loan(String t_account, int f_account) {
			try {
				con = connectionDB.getcon();
				ps = con.prepareStatement("DELETE FROM bankApplication.loan_accounts WHERE LOAN_ACC_NUMBER = ?");
				ps.setString(1, t_account);
				ps.executeUpdate();
			}
			catch (Exception e) {
				System.out.println(e);
			}
			try {
				con = connectionDB.getcon();
				ps = con.prepareStatement("UPDATE bankApplication.bank_customers SET TOTAL_LOANS = (TOTAL_LOANS - 1) where ACCOUNT_NUMBER= ?");
				ps.setInt(1, f_account);
				ps.executeUpdate();
			}
			catch (Exception e) {
				System.out.println(e);
			}
			
		}
}


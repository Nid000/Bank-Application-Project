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
/**
 * controller 
 */
public class appController {
	
	/**
	 * requirements for the connection and query run in the DB.
	 */
	static Connection con;
	static PreparedStatement ps;
	
	/**
	 * function for interacting with database table.
	 * using for customer login page
	 * @param username
	 * @param password
	 * @return custoemrModel
	 */
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
	
	/**
	 * function to get customer details from DB.
	 * @param username
	 * @return customerDetails
	 */
	public customerDetails get_cusdetails(String username) {
		customerDetails cusmodel =  new customerDetails();
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("select NAME,ACCOUNT_NUMBER,BANK_BALANCE,TOTAL_LOANS,ANNUAL_INCOME from bankApplication.bank_customers where USERNAME = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cusmodel.setAcc_num(rs.getInt("ACCOUNT_NUMBER"));
				cusmodel.setName(rs.getString("NAME"));
				cusmodel.setBbalance(rs.getInt("BANK_BALANCE"));
				cusmodel.setTloans(rs.getInt("TOTAL_LOANS"));
				cusmodel.setAnualinc(rs.getInt("ANNUAL_INCOME"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return cusmodel;
	}
	
	/**
	 * function to get loan details of customer from DB
	 * @param acc_num
	 * @return loanModel
	 */
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
	
	/**
	 * function for updating bank balance in DB for both parties after money transfered from one account.
	 * @param f_account
	 * @param t_account
	 * @param amount
	 */
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
	
	/**
	 * function for updating loan balance and bank balance in DB when customer made a loan payment.
	 * @param f_account
	 * @param t_account
	 * @param amount
	 */
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
	
	/**
	 * function for updating transaction history in DB when there is a money transfer happened.
	 * @param f_account
	 * @param t_account
	 * @param amount
	 * @return status
	 */
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
		
		/**
		 * function to get debit transaction history from DB for customers viewing.
		 * @param acc_no
		 * @return transactionModel
		 */
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
		
		/**
		 * function to get credit transaction history from DB for customers viewing.
		 * @param acc_no
		 * @return transactionModel
		 */
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
		
		/**
		 * function to check whether account number belongs to customer account in DB during money transferring. 
		 * @param t_account
		 * @return t_acc
		 */
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
		
		/**
		 * function to check whether account number belongs to loan account in DB during money transferring
		 * @param t_account
		 * @return t_acc
		 */
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
		
		/**
		 * function to check in DB if customer paid the loan in full.
		 * @param t_account
		 * @return loanModel
		 */
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
		
		/**
		 * function to delete loan account in DB if the loan is fully settled by the customer.
		 * @param t_account
		 * @param f_account
		 */
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
		
		/**
		 * function to get total loans and annual income of the customer from DB.
		 * @param accno
		 * @return customerDetails
		 */
		public customerDetails get_newcusdetails(int accno) {
			customerDetails cusmodel =  new customerDetails();
			try {
				con = connectionDB.getcon();
				ps = con.prepareStatement("select TOTAL_LOANS,ANNUAL_INCOME from bankApplication.bank_customers where ACCOUNT_NUMBER = ?");
				ps.setInt(1, accno);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					cusmodel.setTloans(rs.getInt("TOTAL_LOANS"));
					cusmodel.setAnualinc(rs.getInt("ANNUAL_INCOME"));
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			System.out.println(cusmodel.getAnualinc() + "anualincomeeee");
			return cusmodel;
		}
		
		/**
		 * function to create a new loan in DB, when customer applied for a loan.
		 * @param lm
		 */
		public void update_Loan (loanModel lm) {
			try {
				con = connectionDB.getcon();
				ps = con.prepareStatement("insert into bankApplication.loan_accounts(LOAN_ACC_NUMBER, L_AMOUNT, L_BALANCE,ACCOUNT_NUMBER) values(?,?,?,?)");
				ps.setString(1, lm.getL_accnum());
				ps.setInt(2, lm.getL_amount());
				ps.setInt(3, lm.getL_balance());
				ps.setInt(4, lm.getAcc_num());
				ps.executeUpdate();
			}
			catch (Exception e) {
				System.out.println(e);
			}
		}
		
		public void update_total_Loan(int acc_num) {
			try {
				con = connectionDB.getcon();
				ps = con.prepareStatement("UPDATE bankApplication.bank_customers SET TOTAL_LOANS = (TOTAL_LOANS + 1) where ACCOUNT_NUMBER= ?");
				ps.setInt(1, acc_num);
				ps.executeUpdate();
			}
			catch (Exception e) {
				System.out.println(e);
			}
		}
}


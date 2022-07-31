package appController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Logger;

import appModels.Customer;
import databaseConnection.connectionDB;

public class CustomerDao {
	static Connection con;
	static PreparedStatement ps;
	public int registerCustomer(Customer customer) throws ClassNotFoundException {
		
        String INSERT_CUS_SQL = "INSERT INTO bankapplication.bank_customers" +
            "  (name, account_number, bank_balance, username, password, annual_income) VALUES " +
            " (?,?,?,?,?,?);";

        int result = 0;
        
        try {
            
        	con = connectionDB.getcon();
            PreparedStatement preparedStatement = con.prepareStatement(INSERT_CUS_SQL);
               
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(4, customer.getUsername());
            preparedStatement.setString(5, customer.getPassword2());
            preparedStatement.setInt(2, customer.getAccount_number());
            preparedStatement.setInt(3, customer.getBank_balance());
            preparedStatement.setInt(6, customer.getAnnual_income());
              


            System.out.println(preparedStatement);
                
            result = preparedStatement.executeUpdate();

        } catch (Exception e) {
                // process sql exception
                System.out.println(e);
        }
        return result;
	    }
	
	public void delete(int acc_num) {
		int status = 0;
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("DELETE FROM bankapplication.bank_customers WHERE ACCOUNT_NUMBER=?");
			ps.setInt(1, acc_num);
			status = ps.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("delete" + status);
		
		}
	
	public  void insertUpdatedCus(Customer cus) {
		int status = 0;
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("UPDATE bankapplication.bank_customers SET BANK_BALANCE = ?, PASSWORD = ?, TOTAL_LOANS = ?, ANNUAL_INCOME = ? WHERE ACCOUNT_NUMBER=?");
			ps.setInt(1, cus.getBank_balance());		
			ps.setString(2, cus.getPassword1());
			ps.setInt(3, cus.gettotal_loans());
			ps.setInt(4, cus.getAnnual_income());
			ps.setInt(5, cus.getAccount_number());
			System.out.println(cus.getBank_balance()+"dashhh" + con);
			System.out.println(cus.getPassword1()+"dashhh" + con);
			System.out.println(cus.gettotal_loans()+"dashhh" + con);
			System.out.println(cus.getAnnual_income()+"dashhh" + con);
			System.out.println(cus.getAccount_number()+"dashhh" + con);
			status = ps.executeUpdate();
			con.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("status" + status);
		}
}


		


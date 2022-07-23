package net.javaguides.registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Logger;

import databaseconnection.databaseconnection;
import net.javaguides.registration.model.Customer;
import net.javaguides.registration.controller.CusServlet;

public class CustomerDao {
	static Connection con;
	static PreparedStatement ps;
	public int registerCustomer(Customer customer) throws ClassNotFoundException {
		
        String INSERT_CUS_SQL = "INSERT INTO bankapplication.bank_customers" +
            "  (name, account_number, bank_balance, username, password, annual_income) VALUES " +
            " (?,?,?,?,?,?);";

        int result = 0;
        
        try {
            
        con = databaseconnection.getcon();
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
	
	public int delete(String id) {
		int status = 0;
		try {
			con = databaseconnection.getcon();
			ps = con.prepareStatement("DELETE FROM bankapplication.bank_customers WHERE id=?");
			ps.setString(1, id);
			status = ps.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
		}
	
	public int insertUpdatedCus(Customer cus) {
		int status = 0;
		try {
			con = databaseconnection.getcon();
			ps = con.prepareStatement("UPDATE bankapplication.bank_customers SET  NAME = ?, ACCOUNT_NUMBER = ?, BANK_BALANCE = ?, USERNAME = ?,  PASSWORD = ?, TOTAL_LOANS = ?, ANNUAL_INCOME = ?");
			ps.setString(1, cus.getName());
			ps.setInt(2, cus.getAccount_number());
			ps.setInt(3, cus.getBank_balance());
			ps.setString(4, cus.getUsername());
			ps.setString(5, cus.getPassword1());
			ps.setInt(6, cus.gettotal_loans());
			ps.setInt(7, cus.getAnnual_income());
			
			
			status = ps.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
		
		}
}


		


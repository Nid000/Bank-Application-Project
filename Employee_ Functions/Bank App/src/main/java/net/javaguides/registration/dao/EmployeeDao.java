package net.javaguides.registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import databaseconnection.databaseconnection;
import net.javaguides.registration.model.Employee;

public class EmployeeDao {
	static Connection con;
	public int registerEmployee(Employee employee) throws ClassNotFoundException {
		
        String INSERT_USERS_SQL = "INSERT INTO bankapplication.bank_employee" +
            "  (name, username, password) VALUES " +
            " (?,?,?);";

        int result = 0;
        try {
          
        con = databaseconnection.getcon();
            PreparedStatement preparedStatement = con.prepareStatement(INSERT_USERS_SQL);
           
            preparedStatement.setString(1, employee.getname());
            preparedStatement.setString(2, employee.getUsername());
            preparedStatement.setString(3, employee.getPassword1());
            


            System.out.println(preparedStatement);
            
            result = preparedStatement.executeUpdate();

        } catch (Exception e) {
            // process sql exception
            System.out.println(e);
        }
        return result;
    
	}
	
	public Employee getEmployee(String username, String password1) throws ClassNotFoundException {
		
        String GET_USERS_SQL = "select * from bankapplication.bank_employee where USERNAME = ? and PASSWORD = ? ";
        Employee employee = new Employee();
        
        try {
          
        con = databaseconnection.getcon();
            PreparedStatement preparedStatement = con.prepareStatement(GET_USERS_SQL);
           
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password1 );
            
            ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				 employee.setUsername(rs.getString("username"));
				 employee.setPassword1(rs.getString("password"));
			}
			System.out.println(employee.getUsername() + employee.getPassword1() + "njn ivde und");
			
            System.out.println(preparedStatement);
            

        } catch (Exception e) {
            // process sql exception
            System.out.println(e);
        }
        return employee;
	
	}
	}

	 
	                
	            
	       
	  
	
	

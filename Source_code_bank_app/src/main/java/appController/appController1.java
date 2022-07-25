package appController;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;



import databaseConnection.connectionDB;
/**
 * controller
 */
public class appController1 {
	
	/**
	 * requirements for the connection and query run in the DB.
	 */
	static Connection con;
	static PreparedStatement ps;
	
	/**
	 * function will generate random 4 digit number for customer account number
	 * from 0 to 9999
	 * @return
	 */
	public int getRandomNumberString() {
	    Random rnd = new Random();
	    int number = rnd.nextInt(9999);
	    return number;
	}
	
	/**
	 * function to check and return loan account number from DB.
	 * @param loanacc
	 * @return result
	 */
	public String getLoannum(String loanacc) {
		String result = "";
		try {
			con = connectionDB.getcon();
			ps = con.prepareStatement("select * from bankApplication.loan_accounts  where LOAN_ACC_NUMBER = ?");
			ps.setString(1, loanacc);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
			result =rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	}


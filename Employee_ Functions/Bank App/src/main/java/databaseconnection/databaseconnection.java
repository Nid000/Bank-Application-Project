package databaseconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class databaseconnection {
	static Connection con;
	public static Connection getcon() {
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/?user=root" + "bankapplication","root","root");

} catch (Exception e) {
		e.printStackTrace();
	}
	return con;
}
}


package databaseConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class connectionDB {
	
		static Connection con;

		public static Connection getcon() {
			
			String dbName = "sql6503464";
			String userName = "sql6503464";
			String password = "ea4NFfmk2Y";
			
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("test pt 1");
				con = DriverManager.getConnection("jdbc:mysql://sql6.freesqldatabase.com:3306/" + dbName,userName,password);
				System.out.println("connection gotten");
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("con" + con);
			return con;		
	}
}
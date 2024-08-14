package in.sp.backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {

	private static Connection connection;
	public static Connection getConnection() throws ClassNotFoundException, SQLException, Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		DBconnection.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/UPLOAD", "root", "Subh123@");

		return connection;
	}

}

package com.info;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {

		// Initialize all the information regarding
		// Database Connection
		String dbDriver = "com.mysql.cj.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/";

		// Database name to access
		String dbName = "task3";
		String dbUsername = "root";
		String dbPassword = "root";

		Class.forName (dbDriver) ;

		Connection con = DriverManager.getConnection (dbURL + dbName, dbUsername, dbPassword) ;

		return con;

	}

}
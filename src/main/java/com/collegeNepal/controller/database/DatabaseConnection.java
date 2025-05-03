package com.collegeNepal.controller.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

	private static final String databaseName = "collegenepaldb";
	private static final String username = "root";
	private static final String password = "";
	private static final String jdbcURL = "jdbc:mysql://localhost:3306/" + databaseName;

	public static Connection getConnection() throws SQLException, ClassNotFoundException {

		// No need for Class.forName() for JDBC 4.0+
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(jdbcURL, username, password);
		return conn;
	}
}

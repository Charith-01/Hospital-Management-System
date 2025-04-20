package com.suwani.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		String uname = "root";
		String password = "Game@1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_management_system?characterEncoding=utf8",uname,password);
		
		return con;
	}
}

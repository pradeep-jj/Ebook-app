package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	//fields/variable
	private static Connection conn;

	//method/function
	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-app","root","");
																				//jdbc:mysql://localhost:3306/ebook-app
			//System.out.println(conn);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}

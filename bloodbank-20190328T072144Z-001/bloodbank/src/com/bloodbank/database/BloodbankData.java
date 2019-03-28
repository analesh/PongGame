package com.bloodbank.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class BloodbankData implements Db_data{
	private static Connection conn = null;
	private BloodbankData() {

	}

	public static Connection getBloodbankData() {
		return conn;

	}
	
	
	
	static {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PWD);

		} catch (Exception e) {
			System.out.println("shittttt" + e);
		}
	}

	
	public static void main(String[] args) {
		System.out.println(getBloodbankData());
	}
}

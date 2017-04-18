package com.wschool.util;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

public class DBUTIL {
	public static final String url = "jdbc:mysql://127.0.0.1/wschool";  
	public static final String name = "com.mysql.jdbc.Driver";  
	public static final String user = "root";  
	public static final String password = "root";  
	private static Connection conn;
	private static PreparedStatement sta;

	public static void init()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection(url, user,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public static int update(String sql)
	{
		try {
			if(conn==null)
				init();
			sta=(PreparedStatement) conn.prepareStatement(sql);
			return sta.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		   return Result.ERROR;
	}
	
	public static ResultSet search(String sql)
	{
		if(conn==null)
			init();
		try {
			sta=(PreparedStatement) conn.prepareStatement(sql);
			return  (ResultSet) sta.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return null;
		
	}
	
	
	private static void close()
	{
			try {
				if(sta!=null)
				sta.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null)
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	

}

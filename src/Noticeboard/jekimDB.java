package Noticeboard;

import java.sql.*;
import java.util.*;
public class jekimDB {
 
 Connection con=null;
 Statement stmt=null;
 ResultSet rs=null;
 
 public void connect(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e) {
			System.out.println("Driver Loading Error");
		}
		
		try {
			String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
	    	String dbId="jspid";
	    	String dbPass="jsppass";
	    	
	    	con=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		}catch(Exception e) {
			System.out.println("Connection Error");
		}
 	}
 
 public ResultSet resultQuery(String sql) {
	 try {
		 stmt=con.createStatement();
		 rs=stmt.executeQuery(sql);
	     }
			catch(Exception e) {
			System.out.println("Result Error");
			rs=null;
		}
	 return rs;
 		}
 
 public void nonResultQuery(String sql) {
	 try {
		 stmt=con.createStatement();
		 stmt.executeUpdate(sql);
		 stmt.close();
	 }catch(Exception e) {
			System.out.println("notResultQuery Error2");
	 }
 	}
 
 
 	public void stmtClosing() {
 		try {
 			stmt.close();
 		}catch(Exception e) {}
 	}
 	
 	public void resultClosing() {
 		try {
 			rs.close();
 		}catch(Exception e) {}
 	}
 	
 	public void DBClosing() {
 		try {
 			con.close();
 		}catch(Exception e) {}
 	}
}
		
		

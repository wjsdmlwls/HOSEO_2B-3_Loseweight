package user;

import java.io.PrintWriter;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	
	
	private static UserDAO instance = new UserDAO();

	// .jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
	public static UserDAO getInstance() {
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	//connection �?�?
	public UserDAO(){
		try {
			String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
	    	String dbId="lw_admin";
	    	String dbPass="3whakstp";
	    	
	    	Class.forName("com.mysql.jdbc.Driver");
	    	conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//?��?��?�� �??�� DB �?�?
	public int login(String id,String passwd) {
		String sql="select lw_passwd from lw_users where lw_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if(rs.getString(1).equals(passwd)) 
						return 1; //로그?�� ?���?
					else	
						return 0; //비�?번호 불일�?
		}
			return -1; //?��?��?���? ?��?��?��
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}return -2; //?��?��?��베이?�� ?���?
	}
	
	public int signup(User user) {
		String sql="insert into lw_users values(?,?,?,?,?,?,?,?,?,?,?)";  //DB?�� �? 집어?��?�� SQL�?
		try {
			pstmt =conn.prepareStatement(sql); //값을 ?���? 받아?��
			pstmt.setString(1,user.getLw_id());
			pstmt.setString(2,user.getLw_passwd());
			pstmt.setString(3,user.getLw_name());
			pstmt.setString(4,user.getLw_gender());
			pstmt.setString(5,user.getLw_e_mail1());
			pstmt.setString(6,user.getLw_e_mail2());
			pstmt.setString(7,user.getLw_zipcode());
			pstmt.setString(8,user.getLw_addr1());
			pstmt.setString(9,user.getLw_addr2());
			pstmt.setString(10,user.getLw_phone());
			pstmt.setInt(11,user.getLw_lp());
			return pstmt.executeUpdate();		//쿼리?�� ?��?��?��?��
		}catch(Exception e) {
			e.printStackTrace();
		}finally {	//?��?��반납.
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return -1; //?��?��?��베이?�� ?���?
	}
	
	public int update(User user) {
		
		String sql="update lw_users set ? where lw_passwd"; //?��?��?���? ?��?�� �?�?
		
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(2,user.getLw_passwd());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try {conn.close();} catch(SQLException e) {} //?��?��반납
		}
		return 0;
	}
	
	//마일리지 사용
	public int updatelp(User user) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql="update lw_users set lw_lp=? where lw_id=?"; 
			
			try {
				pstmt =conn.prepareStatement(sql);
				pstmt.setInt(1,user.getLw_lp());
				pstmt.setString(2,user.getLw_id());
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try {rs.close();} catch(SQLException e) {}
				if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			
			}
			return 0;
		}

	//마일리지 가져오기
	public int lpupdate(String lw_id) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int conut = 0;
		String sql="select lw_lp from lw_users where lw_id=?";	
		try {			
		pstmt =conn.prepareStatement(sql); 
		pstmt.setString(1,lw_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			conut = rs.getInt(1);
		}		
			}catch(Exception e) {
		e.printStackTrace();
				}finally {	
		if(rs!=null) try {rs.close();} catch(SQLException e) {}
		if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		
				}return conut;

	}

}

package Fitnesshop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import Fitnesshop.order_DTO;

public class order_DAO {
	
	
	
	private static order_DAO instance = new order_DAO();

	// .jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
	public static order_DAO getInstance() {
		return instance;
	}
	
	// 커넥션풀로부터 Connection객체를 얻어냄
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/loseweight_db");
		return ds.getConnection();
	}
	
	public void userdatein(String product_names,String img0,int total_money,int payment,String addr,String Recipient,String demand,String lw_id,Timestamp order_time) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="insert into order_obj(product_names,img0,total_money,payment,addr,Recipient,demand,"
				+ "lw_id,order_time) values(?,?,?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			
			pstmt =conn.prepareStatement(sql); 
			pstmt.setString(1,product_names);
			pstmt.setString(2,img0);
			pstmt.setInt(3,total_money);
			pstmt.setInt(4,payment);
			pstmt.setString(5,addr);
			pstmt.setString(6,Recipient);
			pstmt.setString(7,demand);
			pstmt.setString(8,lw_id);
			pstmt.setTimestamp(9,order_time);
			pstmt.executeUpdate();		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {	
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		
	}
	
	public int selectordernum(String lw_id,Timestamp order_time) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int conut = 0;
		String sql="select ordernum from order_obj where lw_id=? and order_time=?";
		
		try {
			
		conn = getConnection();
		pstmt =conn.prepareStatement(sql); 
		pstmt.setString(1,lw_id);
		pstmt.setTimestamp(2,order_time);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			conut = rs.getInt(1);
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {	
		if(rs!=null) try {rs.close();} catch(SQLException e) {}
		if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		if(conn!=null) try {conn.close();} catch(SQLException e) {}
	}return conut;
	
}
	
	public List<order_DTO> jumoon(String lw_id) throws Exception {
		List<order_DTO> list = new ArrayList<>();
		//DTO 값을 리스트에 저장하려 빈 리스트를 만듭니다.
		  Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs= null;
		try{
		     conn = getConnection();			     
			 pstmt = conn.prepareStatement("select * from order_obj where lw_id=?");
			 pstmt.setString(1,lw_id);
			 rs = pstmt.executeQuery();
			 //값을 찾아 쿼리 업데이트
			
			if(rs.next()) {
				do {
					order_DTO DTO = new order_DTO();
					DTO.setOrdernum(rs.getInt("ordernum"));
					DTO.setProduct_names(rs.getString("product_names"));
					DTO.setImg0(rs.getString("img0"));
					DTO.setTotal_money(rs.getInt("total_money"));
					DTO.setPayment(rs.getInt("payment"));
					DTO.setAddr(rs.getString("addr"));
					DTO.setRecipient(rs.getString("recipient"));
					DTO.setDemand(rs.getString("demand"));
					DTO.setLw_id(rs.getString("lw_id"));
					DTO.setOrder_time(rs.getTimestamp("order_time"));
					list.add(DTO);
					//빈 리스트에 값들을 전부 저장
				}while(rs.next());
			}	
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}finally {
	          if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }	
		return list;
		//리스트에 업데이트함.
	}	
	
	public List<order_DTO> adminjumoon() throws Exception {
		List<order_DTO> list = new ArrayList<>();
		//DTO 값을 리스트에 저장하려 빈 리스트를 만듭니다.
		  Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs= null;
		try{
		     conn = getConnection();			     
			 pstmt = conn.prepareStatement("select * from order_obj");
			 rs = pstmt.executeQuery();
			 //값을 찾아 쿼리 업데이트
			
			if(rs.next()) {
				do {
					order_DTO DTO = new order_DTO();
					DTO.setOrdernum(rs.getInt("ordernum"));
					DTO.setProduct_names(rs.getString("product_names"));
					DTO.setImg0(rs.getString("img0"));
					DTO.setTotal_money(rs.getInt("total_money"));
					DTO.setPayment(rs.getInt("payment"));
					DTO.setAddr(rs.getString("addr"));
					DTO.setRecipient(rs.getString("recipient"));
					DTO.setDemand(rs.getString("demand"));
					DTO.setLw_id(rs.getString("lw_id"));
					DTO.setOrder_time(rs.getTimestamp("order_time"));
					list.add(DTO);
					//빈 리스트에 값들을 전부 저장
				}while(rs.next());
			}	
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}finally {
	          if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }	
		return list;
		//리스트에 업데이트함.
	}	
	
}

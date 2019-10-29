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
	
	public void userdatein(String product_names,String img0,int total_money,int payment,String lw_addr1,String Recipient,String demand,String lw_id,Timestamp order_time,int product_total,int delivery_total,String lw_addr2,String lw_zipcode,int lw_lpminor ,int pluspoint) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="insert into order_obj(product_names,img0,total_money,payment,lw_addr1,Recipient,demand,"
				+ "lw_id,order_time,product_total,delivery_total,lw_addr2,lw_zipcode,lw_lpminor,pluspoint) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			
			pstmt =conn.prepareStatement(sql); 
			pstmt.setString(1,product_names);
			pstmt.setString(2,img0);
			pstmt.setInt(3,total_money);
			pstmt.setInt(4,payment);
			pstmt.setString(5,lw_addr1);
			pstmt.setString(6,Recipient);
			pstmt.setString(7,demand);
			pstmt.setString(8,lw_id);
			pstmt.setTimestamp(9,order_time);
			pstmt.setInt(10,product_total);
			pstmt.setInt(11,delivery_total);
			pstmt.setString(12,lw_addr2);
			pstmt.setString(13,lw_zipcode);
			pstmt.setInt(14,lw_lpminor);
			pstmt.setInt(15,pluspoint);
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
	
	public List<order_DTO> jumoon(String lw_id,String mincalendar,String maxcalendar) throws Exception {
		List<order_DTO> list = new ArrayList<>();
		//DTO 값을 리스트에 저장하려 빈 리스트를 만듭니다.
		  Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs= null;
		try{
		     conn = getConnection();			     
			 pstmt = conn.prepareStatement("select * from order_obj where lw_id=? and order_time between ? and ?  order by ordernum desc");
			 pstmt.setString(1,lw_id);
			 pstmt.setString(2,mincalendar);
			 pstmt.setString(3,maxcalendar);
			 rs = pstmt.executeQuery();
			 //값을 찾아 쿼리 업데이트
			
			if(rs.next()) {
				do {
					order_DTO DTO = new order_DTO();
					DTO.setOrdernum(rs.getInt("ordernum"));
					DTO.setProduct_names(rs.getString("product_names"));
					DTO.setImg0(rs.getString("img0"));
					DTO.setTotal_money(rs.getInt("total_money"));
					DTO.setProduct_total(rs.getInt("product_total"));
					DTO.setDelivery_total(rs.getInt("delivery_total"));
					DTO.setPayment(rs.getInt("payment"));
					DTO.setLw_addr1(rs.getString("lw_addr1"));
					DTO.setRecipient(rs.getString("recipient"));
					DTO.setDemand(rs.getString("demand"));
					DTO.setLw_id(rs.getString("lw_id"));
					DTO.setOrder_time(rs.getTimestamp("order_time"));
					DTO.setLw_addr2(rs.getString("lw_addr2"));
					DTO.setLw_zipcode(rs.getString("lw_zipcode"));
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
					DTO.setProduct_total(rs.getInt("product_total"));
					DTO.setDelivery_total(rs.getInt("delivery_total"));
					DTO.setPayment(rs.getInt("payment"));
					DTO.setLw_addr1(rs.getString("Lw_addr1"));
					DTO.setRecipient(rs.getString("recipient"));
					DTO.setDemand(rs.getString("demand"));
					DTO.setLw_id(rs.getString("lw_id"));
					DTO.setOrder_time(rs.getTimestamp("order_time"));
					DTO.setLw_addr2(rs.getString("lw_addr2"));
					DTO.setLw_zipcode(rs.getString("lw_zipcode"));
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

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
import Fitnesshop.sanpum_DTO;

public class sanpum_DAO {

	
	
	private static sanpum_DAO instance = new sanpum_DAO();

	// .jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
	public static sanpum_DAO getInstance() {
		return instance;
	}
	// 커넥션풀로부터 Connection객체를 얻어냄
		private Connection getConnection() throws Exception {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/loseweight_db");
			return ds.getConnection();
		}
		
		public void insertsanpum(sanpum_DTO sanpum_DTO) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql="insert into sangpum(ordernum,lw_salesnum,img0,lw_id,product_name,selling_price,quantity,option1,option1price,delivery_charge)"
					+ " values(?,?,?,?,?,?,?,?,?,?)";
			try {
				conn = getConnection();
				
				pstmt =conn.prepareStatement(sql); 
				pstmt.setInt(1,sanpum_DTO.getOrdernum());
				pstmt.setInt(2,sanpum_DTO.getLw_salesnum());
				pstmt.setString(3,sanpum_DTO.getImg0());
				pstmt.setString(4,sanpum_DTO.getLw_id());
				
				pstmt.setString(5,sanpum_DTO.getProduct_name());
				pstmt.setInt(6,sanpum_DTO.getSelling_price());
				pstmt.setInt(7,sanpum_DTO.getQuantity());
				pstmt.setString(8,sanpum_DTO.getOption1());
				pstmt.setInt(9,sanpum_DTO.getOption1price());
				pstmt.setInt(10,sanpum_DTO.getDelivery_charge());
				pstmt.executeUpdate();		
			}catch(Exception e) {
				e.printStackTrace();
			}finally {	
				if(rs!=null) try {rs.close();} catch(SQLException e) {}
				if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
				if(conn!=null) try {conn.close();} catch(SQLException e) {}
			}
			
		}
		
		
		public List<sanpum_DTO> testsang(int ordernum ,String lw_id) throws Exception {
			List<sanpum_DTO> list = new ArrayList<>();
			//DTO 값을 리스트에 저장하려 빈 리스트를 만듭니다.
			  Connection conn = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs= null;
			try{
			     conn = getConnection();			     
				 pstmt = conn.prepareStatement("select * from sangpum where ordernum=? and lw_id=?");
				 pstmt.setInt(1,ordernum);
				 pstmt.setString(2,lw_id);
				 rs = pstmt.executeQuery();
				 //값을 찾아 쿼리 업데이트
				
				if(rs.next()) {
					do {
						sanpum_DTO DTO = new sanpum_DTO();
						DTO.setObj_order_num(rs.getInt("obj_order_num")); 
						DTO.setOrdernum(rs.getInt("ordernum"));			
						DTO.setOrderstatus(rs.getInt("Orderstatus"));		
						DTO.setImg0(rs.getString("img0"));						
						DTO.setLw_id(rs.getString("lw_id"));					
						DTO.setProduct_name(rs.getString("product_name"));				
						DTO.setSelling_price(rs.getInt("selling_price"));			
						DTO.setQuantity(rs.getInt("quantity"));					
						DTO.setOption1(rs.getString("option1"));				
						DTO.setOption1price(rs.getInt("option1price"));					
						DTO.setDelivery_charge(rs.getInt("delivery_charge"));				
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

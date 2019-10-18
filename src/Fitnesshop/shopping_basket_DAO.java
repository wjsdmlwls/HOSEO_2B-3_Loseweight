package Fitnesshop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Fitnesshop.shopping_basket_DTO;

public class shopping_basket_DAO {

	private static shopping_basket_DAO instance = new shopping_basket_DAO();

	// .jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
	public static shopping_basket_DAO getInstance() {
		return instance;
	}

	// 커넥션풀로부터 Connection객체를 얻어냄
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/loseweight_db");
		return ds.getConnection();
	}

	// board테이블에 글을 추가(inset문)<=writePro.jsp페이지에서 사용
	@SuppressWarnings("resource")
	public void insertArticle(shopping_basket_DTO article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int number = 0;
		String sql = "";
		
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select max(lw_salesnum) from fitness_shop");
			rs = pstmt.executeQuery();

			if (rs.next())
				number = rs.getInt(1) + 1;
			else
				number = 1;
			// 쿼리를 작성
			
			sql = "insert into shopping_basket(num,lw_salesnum,lw_id,reg_date,quantity,"
					+ "link,cost,selling_price,reduced_price,delivery_charge,option1,option1price,"
					+ "big_category,middle_category,small_category,product_name,img0,select_quantity,pointplus)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, article.getNum());
			pstmt.setInt(2, article.getLw_salesnum());
			pstmt.setString(3, article.getLw_id());
			pstmt.setTimestamp(4, article.getReg_date());

			pstmt.setInt(5, article.getQuantity());
			pstmt.setString(6, article.getLink());
			
			pstmt.setInt(7, article.getCost());
			pstmt.setInt(8, article.getSelling_price());
			pstmt.setInt(9, article.getReduced_price());
			pstmt.setInt(10, article.getDelivery_charge());

			pstmt.setString(11, article.getOption1());
			pstmt.setInt(12, article.getOption1price());
			
			pstmt.setString(13, article.getBig_category());
			pstmt.setString(14, article.getMiddle_category());
			pstmt.setString(15, article.getSmall_category());
			

			pstmt.setString(16, article.getProduct_name());
			pstmt.setString(17, article.getImg0());
			pstmt.setInt(18, article.getSelect_quantity());
			pstmt.setInt(19, article.getPointplus());
			
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	}
	// 글의 목록(복수개의 글)을 가져옴(select문) <=list.jsp에서 사용
		public List<shopping_basket_DTO> getArticles(int start, int end) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<shopping_basket_DTO> articleList = null;
			try {
				conn = getConnection();

				pstmt = conn.prepareStatement("select * from shopping_basket order limit ?,? ");
				pstmt.setInt(1, start - 1);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					articleList = new ArrayList<shopping_basket_DTO>(end);
					do {
						shopping_basket_DTO article = new shopping_basket_DTO();
						article.setNum(rs.getInt("lw_Num"));
						article.setLink(rs.getString("lw_Link"));
						article.setLw_salesnum(rs.getInt("lw_salesnum"));
						article.setCost(rs.getInt("cost"));
						article.setSelling_price(rs.getInt("selling_price"));
						article.setReduced_price(rs.getInt("reduced_price"));
						
						article.setProduct_name(rs.getString("product_name"));			
						article.setQuantity(rs.getInt("quantity"));
						article.setBig_category(rs.getString("big_category"));
						article.setMiddle_category(rs.getString("middle_category"));
						
						article.setSmall_category(rs.getString("small_category"));
						article.setDelivery_charge(rs.getInt("delivery_charge"));
						
						article.setOption1(rs.getString("option1"));
						article.setOption1price(rs.getInt("option1price"));
						article.setReg_date(rs.getTimestamp("reg_date"));
						
						article.setLw_id(rs.getString("lw_id"));
				
						articleList.add(article);
					} while (rs.next());
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException ex) {
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException ex) {
					}
			}
			return articleList;
		}
		
		
		
	// 글삭제처리시 사용(delete문)<=deletePro.jsp페이지에서 사용
	public void deleteArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

	
		
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("delete from shopping_basket where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
	
	
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		
	}

}
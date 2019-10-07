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

import Fitnesshop.Fitnesshop_DTO;

public class Fitnesshop_DAO {

	private static Fitnesshop_DAO instance = new Fitnesshop_DAO();

	// .jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
	public static Fitnesshop_DAO getInstance() {
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
	public void insertArticle(Fitnesshop_DTO article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int lw_salesnum  = article.getLw_salesnum();
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
			
			sql = "insert into Fitness_shop(product_code,cost,selling_price,reduced_price,product_name,product_contents,quantity"
					+ ",big_category,middle_category,small_category,brand,delivery_charge,pointplus,img0,exposure,salestatus"
					+ ",productevent,option1,option1price,option2,option2price,option3,option3price,write_date,passwd,lw_id)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, article.getProduct_code());
			pstmt.setInt(2, article.getCost());
			pstmt.setInt(3, article.getSelling_price());
			pstmt.setInt(4, article.getReduced_price());
			pstmt.setString(5, article.getProduct_name());
			
			pstmt.setString(6, article.getProduct_contents());
			pstmt.setInt(7, article.getQuantity());
			pstmt.setString(8, article.getBig_category());
			pstmt.setString(9, article.getMiddle_category());
			pstmt.setString(10, article.getSmall_category());
			
			pstmt.setString(11, article.getBrand());
			pstmt.setInt(12, article.getDelivery_charge());
			pstmt.setInt(13, article.getPointplus());
			pstmt.setString(14, article.getImg0());
			pstmt.setInt(15, article.getExposure());
			
			pstmt.setInt(16, article.getSalestatus());
			pstmt.setInt(17, article.getProductevent());
			
			pstmt.setString(18, article.getOption1());
			pstmt.setInt(19, article.getOption1price());
			pstmt.setString(20, article.getOption2());
			pstmt.setInt(21, article.getOption2price());
			pstmt.setString(22, article.getOption3());
			
			pstmt.setInt(23, article.getOption3price());
			pstmt.setTimestamp(24, article.getWrite_date());
			
			pstmt.setString(25, article.getPasswd());
			pstmt.setString(26, article.getLw_id());
			
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

	// board테이블에 저장된 전체글의 수를 얻어냄(select문)<=list.jsp에서 사용
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select count(*) from Fitness_shop ");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
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
		return x;
	}

	// 글의 목록(복수개의 글)을 가져옴(select문) <=list.jsp에서 사용
	public List<Fitnesshop_DTO> getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Fitnesshop_DTO> articleList = null;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from fitness_shop order limit ?,? ");
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<Fitnesshop_DTO>(end);
				do {
					Fitnesshop_DTO article = new Fitnesshop_DTO();
					article.setLw_salesnum(rs.getInt("lw_salesnum"));
					article.setProduct_code(rs.getString("product_code"));
					article.setCost(rs.getInt("cost"));
					article.setSelling_price(rs.getInt("selling_price"));
					article.setReduced_price(rs.getInt("reduced_price"));
					
					article.setProduct_name(rs.getString("product_name"));					
					article.setProduct_contents(rs.getString("product_contents"));
					article.setQuantity(rs.getInt("quantity"));
					article.setBig_category(rs.getString("big_category"));
					article.setMiddle_category(rs.getString("middle_category"));
					
					article.setSmall_category(rs.getString("small_category"));
					article.setBrand(rs.getString("brand"));
					article.setDelivery_charge(rs.getInt("delivery_charge"));
					article.setPointplus(rs.getInt("pointplus"));
					
					article.setImg0(rs.getString("img0"));
					article.setExposure(rs.getInt("exposure"));
					article.setSalestatus(rs.getInt("salestatus"));
					article.setProductevent(rs.getInt("productevent"));
					
					article.setOption1(rs.getString("option1"));					
					article.setOption1price(rs.getInt("option1price"));
					article.setOption2(rs.getString("option2"));					
					article.setOption2price(rs.getInt("option2price"));
					article.setOption3(rs.getString("option3"));					
					article.setOption3price(rs.getInt("option3price"));
					
					article.setWrite_date(rs.getTimestamp("write_date"));
					
					article.setPasswd(rs.getString("passwd"));					
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

	// 글의 내용을 보기(1개의 글)(select문)<=content.jsp페이지에서 사용
	public Fitnesshop_DTO getArticle(int lw_salesnum) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Fitnesshop_DTO article = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from fitness_shop where lw_salesnum = ?");
			pstmt.setInt(1, lw_salesnum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new Fitnesshop_DTO();
				article.setLw_salesnum(rs.getInt("lw_salesnum"));
				article.setProduct_code(rs.getString("product_code"));
				article.setCost(rs.getInt("cost"));
				article.setSelling_price(rs.getInt("selling_price"));
				article.setReduced_price(rs.getInt("reduced_price"));
				
				article.setProduct_name(rs.getString("product_name"));					
				article.setProduct_contents(rs.getString("product_contents"));
				article.setQuantity(rs.getInt("quantity"));
				article.setBig_category(rs.getString("big_category"));
				article.setMiddle_category(rs.getString("middle_category"));
				
				article.setSmall_category(rs.getString("small_category"));
				article.setBrand(rs.getString("brand"));
				article.setDelivery_charge(rs.getInt("delivery_charge"));
				article.setPointplus(rs.getInt("pointplus"));
				
				article.setImg0(rs.getString("img0"));
				article.setExposure(rs.getInt("exposure"));
				article.setSalestatus(rs.getInt("salestatus"));
				article.setProductevent(rs.getInt("productevent"));
				
				article.setOption1(rs.getString("option1"));					
				article.setOption1price(rs.getInt("option1price"));
				article.setOption2(rs.getString("option2"));					
				article.setOption2price(rs.getInt("option2price"));
				article.setOption3(rs.getString("option3"));					
				article.setOption3price(rs.getInt("option3price"));
				
				article.setWrite_date(rs.getTimestamp("write_date"));
				
				article.setPasswd(rs.getString("passwd"));					
				article.setLw_id(rs.getString("lw_id"));
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
		return article;
	}
	// 글 수정폼에서 사용할 글의 내용(1개의 글)(select문)<=updateForm.jsp에서 사용
	public Fitnesshop_DTO updateGetArticle(int lw_salesnum) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Fitnesshop_DTO article = null;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from Fitness_shop where lw_salesnum = ?");
			pstmt.setInt(1, lw_salesnum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new Fitnesshop_DTO();
				article.setLw_salesnum(rs.getInt("lw_salesnum"));
				article.setProduct_code(rs.getString("product_code"));
				article.setCost(rs.getInt("cost"));
				article.setSelling_price(rs.getInt("selling_price"));
				article.setReduced_price(rs.getInt("reduced_price"));
				
				article.setProduct_name(rs.getString("product_name"));					
				article.setProduct_contents(rs.getString("product_contents"));
				article.setQuantity(rs.getInt("quantity"));
				article.setBig_category(rs.getString("big_category"));
				article.setMiddle_category(rs.getString("middle_category"));
				
				article.setSmall_category(rs.getString("small_category"));
				article.setBrand(rs.getString("brand"));
				article.setDelivery_charge(rs.getInt("delivery_charge"));
				article.setPointplus(rs.getInt("pointplus"));
				
				article.setImg0(rs.getString("img0"));
				article.setExposure(rs.getInt("exposure"));
				article.setSalestatus(rs.getInt("salestatus"));
				article.setProductevent(rs.getInt("productevent"));
				article.setOption1(rs.getString("option1"));					
				article.setOption1price(rs.getInt("option1price"));
				article.setOption2(rs.getString("option2"));					
				article.setOption2price(rs.getInt("option2price"));
				article.setOption3(rs.getString("option3"));					
				article.setOption3price(rs.getInt("option3price"));
				article.setWrite_date(rs.getTimestamp("write_date"));
				
				article.setPasswd(rs.getString("passwd"));					
				article.setLw_id(rs.getString("lw_id"));
				
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
		return article;
	}

	// 글 수정처리에서 사용(update문)<=updatePro.jsp에서 사용
	public void updateArticle(Fitnesshop_DTO article, int lw_salesnum, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		

		try {
			conn = getConnection();
			
		
					sql = "update Fitness_shop set product_code=?,product_name=?"
							+ ",cost=?,reduced_price=?,selling_price=?"
							+ ",quantity=?,brand=?,delivery_charge=?,big_category=?,middle_category=?,small_category=?,"
							+ "product_contents=?,img0=?,exposure=?,salestatus=?, productevent=?,pointplus=?,"
							+ "option1=?,option1price=?,option2=?,option2price=?,option3=?,option3price=?"
							+ " where lw_salesnum=? and passwd=?";
					pstmt = conn.prepareStatement(sql);	
					
					pstmt.setString(1, article.getProduct_code());
					pstmt.setString(2, article.getProduct_name());
					pstmt.setInt(3, article.getCost());
					pstmt.setInt(4, article.getReduced_price());
					pstmt.setInt(5, article.getSelling_price());
					
					pstmt.setInt(6, article.getQuantity());
					pstmt.setString(7, article.getBrand());
					pstmt.setInt(8, article.getDelivery_charge());
					pstmt.setString(9, article.getBig_category());
					pstmt.setString(10, article.getMiddle_category());
					pstmt.setString(11, article.getSmall_category());
					
					pstmt.setString(12, article.getProduct_contents());
					pstmt.setString(13, article.getImg0());
					pstmt.setInt(14, article.getExposure());
					pstmt.setInt(15, article.getSalestatus());
					pstmt.setInt(16, article.getProductevent());
					pstmt.setInt(17, article.getPointplus());
					
					pstmt.setString(18, article.getOption1());
					pstmt.setInt(19, article.getOption1price());
					pstmt.setString(20, article.getOption2());
					pstmt.setInt(21, article.getOption2price());
					pstmt.setString(22, article.getOption3());
					pstmt.setInt(23, article.getOption3price());
					pstmt.setInt(24, lw_salesnum);
					pstmt.setString(25, passwd);
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

	// 글삭제처리시 사용(delete문)<=deletePro.jsp페이지에서 사용
	
	public void deleteArticle(int lw_salesnum, String passwd, String lw_id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

	
		
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("delete from Fitness_shop where lw_salesnum = ? and passwd =? and lw_id=? ");
			pstmt.setInt(1, lw_salesnum);
			pstmt.setString(2, passwd);
			pstmt.setString(3, lw_id);
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

	public void updateBoardreadcount(int num) throws Exception{
		Connection conn = null;
		try {
			conn = getConnection();
			PreparedStatement pstmt = null;
			
			pstmt = conn.prepareStatement("update bf_board set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch (Exception ex) {
			ex.printStackTrace();
	}finally {
 
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    	}	
		
	}

}
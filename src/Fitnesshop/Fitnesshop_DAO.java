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

import BFboard.BF_DTO;

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
					+ ",productevent,option1,option1price,write_date)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

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
			pstmt.setTimestamp(20, article.getWrite_date());
			
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

			pstmt = conn.prepareStatement("select count(*) from Fitness_shop");
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
					
					article.setSmall_category(rs.getString("small_category "));
					article.setBrand(rs.getString("brand"));
					article.setDelivery_charge(rs.getInt("delivery_charge"));
					article.setPointplus(rs.getInt("pointplus"));
					
					article.setImg0(rs.getString("img0"));
					article.setExposure(rs.getInt("exposure"));
					article.setSalestatus(rs.getInt("salestatus"));
					article.setProductevent(rs.getInt("productevent"));
					article.setOption1(rs.getString("option1"));
					
					article.setOption1price(rs.getInt("option1price"));
					article.setWrite_date(rs.getTimestamp("write_date"));
					
					
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
		
				article.setProduct_code(rs.getString("product_code"));
				article.setCost(rs.getInt("cost"));
				article.setSelling_price(rs.getInt("selling_price"));
				article.setReduced_price(rs.getInt("reduced_price"));
				
				article.setProduct_name(rs.getString("product_name"));					
				article.setProduct_contents(rs.getString("product_contents"));
				article.setQuantity(rs.getInt("quantity"));
				article.setBig_category(rs.getString("big_category"));
				article.setMiddle_category(rs.getString("middle_category"));
				
				article.setSmall_category(rs.getString("small_category "));
				article.setBrand(rs.getString("brand"));
				article.setDelivery_charge(rs.getInt("delivery_charge"));
				article.setPointplus(rs.getInt("pointplus"));
				
				article.setImg0(rs.getString("img0"));
				article.setExposure(rs.getInt("exposure"));
				article.setSalestatus(rs.getInt("salestatus"));
				article.setProductevent(rs.getInt("productevent"));
				article.setOption1(rs.getString("option1"));
				
				article.setOption1price(rs.getInt("option1price"));
				article.setWrite_date(rs.getTimestamp("write_date"));
				
				
				
				
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
	
	public BF_DTO updateGetArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BF_DTO article = null;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from bf_board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BF_DTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
				article.setMembers(rs.getInt("members"));
				article.setFilename0(rs.getString("filename0"));
				article.setFilename1(rs.getString("filename1"));
				article.setFilepath0(rs.getString("filepath0"));
				article.setFilepath1(rs.getString("filepath1"));
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
	public int updateArticle(BF_DTO article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpasswd = "";
		String sql = "";
		int x = -1;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select passwd from bf_board where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(article.getPasswd())) {
					sql = "update bf_board set writer=?,email=?,subject=?,passwd=?,filename0=?,filename1=?,filepath0=?,filepath1=?";
					sql += ",content=? where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setString(5, article.getFilename0());
					pstmt.setString(6, article.getFilename1());
					pstmt.setString(7, article.getFilepath0());
					pstmt.setString(8, article.getFilepath1());
					pstmt.setString(9, article.getContent());
					pstmt.setInt(10, article.getNum());
					pstmt.executeUpdate();
					x = 1;
				} else {
					x = 0;
				}
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

	// 글삭제처리시 사용(delete문)<=deletePro.jsp페이지에서 사용
	public int deleteArticle(int num, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select passwd from bf_board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd)) {
					pstmt = conn.prepareStatement("delete from bf_board where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x = 1; // 글삭제 성공
				} else
					x = 0; // 비밀번호 틀림
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
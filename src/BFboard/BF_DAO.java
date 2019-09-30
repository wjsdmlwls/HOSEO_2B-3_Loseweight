package BFboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BF_DAO {

	private static BF_DAO instance = new BF_DAO();

	// .jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
	public static BF_DAO getInstance() {
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
	public void insertArticle(BF_DTO article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int number = 0;
		String sql = "";
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select max(num) from bf_board");
			rs = pstmt.executeQuery();

			if (rs.next())
				number = rs.getInt(1) + 1;
			else
				number = 1;

			if (num != 0) {
				sql = "update bf_board set re_step=re_step+1 ";
				sql += "where ref= ? and re_step> ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {
				ref = number;
				re_step = 0;
				re_level = 0;
			}
			// 쿼리를 작성
			sql = "insert into bf_board(writer,email,subject,passwd,reg_date,members,";
			sql += "ref,re_step,re_level,content,ip,img0,filename0,filepath0,filename1,filepath1) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, article.getMembers());
			pstmt.setInt(7, ref);
			pstmt.setInt(8, re_step);
			pstmt.setInt(9, re_level);
			pstmt.setString(10, article.getContent());
			pstmt.setString(11, article.getIp());
			pstmt.setString(12, article.getImg0());
			pstmt.setString(13, article.getFilename0());
			pstmt.setString(14, article.getFilepath0());
			pstmt.setString(15, article.getFilename1());
			pstmt.setString(16, article.getFilepath1());
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

			pstmt = conn.prepareStatement("select count(*) from bf_board");
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
	public List<BF_DTO> getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BF_DTO> articleList = null;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from bf_board order by ref desc, re_step asc limit ?,? ");
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<BF_DTO>(end);
				do {
					BF_DTO article = new BF_DTO();
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
					article.setImg0(rs.getString("img0"));
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
	public BF_DTO getArticle(int num) throws Exception {
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

	// 글 수정폼에서 사용할 글의 내용(1개의 글)(select문)<=updateForm.jsp에서 사용
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
	//댓글
		public void replyArticle(BF_DTO article) throws Exception {
			Connection conn = null;
		    PreparedStatement pstmt = null;  
			try {
			 
		    conn = getConnection();
			 
		 	pstmt = conn.prepareStatement("insert into bf_boardre(num,lw_id,reContent,reg_date) values(?,?,?,?)");
			pstmt.setInt(1, article.getNum());
			pstmt.setString(2, article.getLw_id());
			pstmt.setString(3, article.getRecontent());
			pstmt.setTimestamp(4, article.getReg_date());
			pstmt.executeUpdate();
			//DTO에 값을 전달함
		}catch (SQLException e) {
			throw new RuntimeException(e);
		  }finally {
	          
	          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }	
		}	
		

		public List<BF_DTO> getquestionboardreList(int num) throws Exception {
			List<BF_DTO> list = new ArrayList<>();
			//DTO 값을 리스트에 저장하려 빈 리스트를 만듭니다.
			  Connection conn = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs= null;
			try{
			
			     conn = getConnection();			     
				 pstmt = conn.prepareStatement("select * from bf_boardre where num=?");
				 pstmt.setInt(1,num);
				 rs = pstmt.executeQuery();
				 //값을 찾아 쿼리 업데이트
				
				if(rs.next()) {
					do {
						BF_DTO BoardDataBean = new BF_DTO();
						BoardDataBean.setGlenum(rs.getInt("glenum"));
						BoardDataBean.setLw_id(rs.getString("lw_id"));
						BoardDataBean.setRecontent(rs.getString("recontent"));
						BoardDataBean.setReg_date(rs.getTimestamp("reg_date"));
						list.add(BoardDataBean);
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
		//수정
			public void updatereplyArticle2(BF_DTO article)throws Exception {
				 Connection conn = null;
			        PreparedStatement pstmt = null;
			        try {
				 conn = getConnection();
				 
				 	pstmt = conn.prepareStatement("update bf_boardre set Recontent=? where glenum=? ");
				 	pstmt.setString(1, article.getRecontent());
				 	pstmt.setInt(2, article.getGlenum());
					pstmt.executeUpdate();
			        }catch (SQLException e) {
			    		throw new RuntimeException(e);
			  	  }finally {
			          
			          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			      }	
			  	}	
			//삭제
			public void deletereplyArticle(BF_DTO article)throws Exception {
				 Connection conn = null;
			        PreparedStatement pstmt = null;
			        try {
				 conn = getConnection();
				 
				 	pstmt = conn.prepareStatement("delete from bf_boardre where glenum=?");
				 	pstmt.setInt(1, article.getGlenum());
					pstmt.executeUpdate();
			        }catch (SQLException e) {
			    		throw new RuntimeException(e);
			  	  }finally {
			         
			          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			      }	
			  	}	


}
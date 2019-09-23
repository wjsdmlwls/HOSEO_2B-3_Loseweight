package ch13;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class QnAboardDAO {

		
	    private static QnAboardDAO instance = new QnAboardDAO();
	    //.jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
	    public static QnAboardDAO getInstance() {
	        return instance;
	    }
	  
	    //커넥션풀로부터 Connection객체를 얻어냄
	    private Connection getConnection() throws Exception {
	        Context initCtx = new InitialContext();
	        Context envCtx = (Context) initCtx.lookup("java:comp/env");
	        DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
	        return ds.getConnection();
	    }
	 
	    //board테이블에 글을 추가(inset문)<=writePro.jsp페이지에서 사용
	    @SuppressWarnings("resource")
		public void insertArticle2(QnAboardDTO article2) 
	            throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
			ResultSet rs = null;

			int num=article2.getNum();
			int ref=article2.getRef();
			int re_step=article2.getRe_step();
			int re_level=article2.getRe_level();
			int number=0;
	        String sql="";
	        try {
	            conn = getConnection();

	            pstmt = conn.prepareStatement("select max(num) from QnAboard");
				rs = pstmt.executeQuery();
				
				if (rs.next())
			      number=rs.getInt(1)+1;
			    else
			      number=1; 
			   
			    if (num!=0) {  
			      sql="update QnAboard set re_step=re_step+1 ";
			      sql += "where ref= ? and re_step> ?";
	              pstmt = conn.prepareStatement(sql);
	              pstmt.setInt(1, ref);
				  pstmt.setInt(2, re_step);
				  pstmt.executeUpdate();
				  re_step=re_step+1;
				  re_level=re_level+1;
			     }else{
			  	  ref=number;
				  re_step=0;
				  re_level=0;
			     }	 
	            // 쿼리를 작성
	            sql = "insert into QnAboard(writer,email,subject,passwd,reg_date,";
			    sql+="ref,re_step,re_level,content) values(?,?,?,?,?,?,?,?,?)";

	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, article2.getWriter());
	            pstmt.setString(2, article2.getEmail());
	            pstmt.setString(3, article2.getSubject());
	            pstmt.setString(4, article2.getPasswd());
				pstmt.setTimestamp(5, article2.getReg_date());
	            pstmt.setInt(6, ref);
	            pstmt.setInt(7, re_step);
	            pstmt.setInt(8, re_level);
				pstmt.setString(9, article2.getContent());		
	            pstmt.executeUpdate();
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
	    }
	    
	    //board테이블에 저장된 전체글의 수를 얻어냄(select문)<=list.jsp에서 사용
		public int getArticleCount2()
	             throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        int x=0;

	        try {
	            conn = getConnection();
	            
	            pstmt = conn.prepareStatement("select count(*) from QnAboard");
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	               x= rs.getInt(1);
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return x;
	    }

		//글의 목록(복수개의 글)을 가져옴(select문) <=list.jsp에서 사용
		public List<QnAboardDTO> getArticles2(int start, int end)
	             throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        List<QnAboardDTO> articleList2=null;
	        try {
	            conn = getConnection();
	            
	            pstmt = conn.prepareStatement(
	            	"select * from QnAboard order by ref desc, re_step asc limit ?,? ");
	            pstmt.setInt(1, start-1);
				pstmt.setInt(2, end);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                articleList2 = new ArrayList<QnAboardDTO>(end);
	                do{
	                  QnAboardDTO article2= new QnAboardDTO();
					  article2.setNum(rs.getInt("num"));
					  article2.setWriter(rs.getString("writer"));
	                  article2.setEmail(rs.getString("email"));
	                  article2.setSubject(rs.getString("subject"));
	                  article2.setPasswd(rs.getString("passwd"));
				      article2.setReg_date(rs.getTimestamp("reg_date"));
					  article2.setReadcount(rs.getInt("readcount"));
	                  article2.setRef(rs.getInt("ref"));
	                  article2.setRe_step(rs.getInt("re_step"));
					  article2.setRe_level(rs.getInt("re_level"));
	                  article2.setContent(rs.getString("content"));			   		
	                  articleList2.add(article2);
				    }while(rs.next());
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return articleList2;
	    }
	 
		//글의 내용을 보기(1개의 글)(select문)<=content.jsp페이지에서 사용
		public QnAboardDTO getArticle2(int num)
	            throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        
	        QnAboardDTO article2=null;
	        try {
	            conn = getConnection();

	 

	            pstmt = conn.prepareStatement("select * from QnAboard where num = ?");
	            pstmt.setInt(1, num);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                article2 = new QnAboardDTO();
	                article2.setNum(rs.getInt("num"));
					article2.setWriter(rs.getString("writer"));
	                article2.setEmail(rs.getString("email"));
	                article2.setSubject(rs.getString("subject"));
	                article2.setPasswd(rs.getString("passwd"));
				    article2.setReg_date(rs.getTimestamp("reg_date"));
					article2.setReadcount(rs.getInt("readcount"));
	                article2.setRef(rs.getInt("ref"));
	                article2.setRe_step(rs.getInt("re_step"));
					article2.setRe_level(rs.getInt("re_level"));
	                article2.setContent(rs.getString("content"));				    
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return article2;
	    }
	    
		//글 수정폼에서 사용할 글의 내용(1개의 글)(select문)<=updateForm.jsp에서 사용
	    public QnAboardDTO updateGetArticle2(int num)
	          throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        QnAboardDTO article2=null;
	        try {
	            conn = getConnection();

	            pstmt = conn.prepareStatement(
	            	"select * from QnAboard where num = ?");
	            pstmt.setInt(1, num);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                article2 = new QnAboardDTO();
	                article2.setNum(rs.getInt("num"));
					article2.setWriter(rs.getString("writer"));
	                article2.setEmail(rs.getString("email"));
	                article2.setSubject(rs.getString("subject"));
	                article2.setPasswd(rs.getString("passwd"));
				    article2.setReg_date(rs.getTimestamp("reg_date"));
					article2.setReadcount(rs.getInt("readcount"));
	                article2.setRef(rs.getInt("ref"));
	                article2.setRe_step(rs.getInt("re_step"));
					article2.setRe_level(rs.getInt("re_level"));
	                article2.setContent(rs.getString("content"));
      
				  
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return article2;
	    }

	    //글 수정처리에서 사용(update문)<=updatePro.jsp에서 사용
	    public int updateArticle2(QnAboardDTO article2)
	          throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs= null;

	        String dbpasswd="";
	        String sql="";
			int x=-1;
	        try {
	            conn = getConnection();
	            
				pstmt = conn.prepareStatement(
	            	"select passwd from QnAboard where num = ?");
	            pstmt.setInt(1, article2.getNum());
	            rs = pstmt.executeQuery();
	            
				if(rs.next()){
				  dbpasswd= rs.getString("passwd"); 
				  if(dbpasswd.equals(article2.getPasswd())){
	                sql="update QnAboard set writer=?,email=?,subject=?,passwd=?";
				    sql+=",content=? where num=?";
	                pstmt = conn.prepareStatement(sql);

	                pstmt.setString(1, article2.getWriter());
	                pstmt.setString(2, article2.getEmail());
	                pstmt.setString(3, article2.getSubject());
	                pstmt.setString(4, article2.getPasswd());
	                pstmt.setString(5, article2.getContent());
				    pstmt.setInt(6, article2.getNum());
	                pstmt.executeUpdate();
					x= 1;
				  }else{
					x= 0;
				  }
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return x;
	    }
	    
	    //글삭제처리시 사용(delete문)<=deletePro.jsp페이지에서 사용
	    public int deleteArticle2(int num, String passwd)
	        throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs= null;
	        String dbpasswd="";
	        int x=-1;
	        try {
				conn = getConnection();
	            pstmt = conn.prepareStatement(
	            	"select passwd from QnAboard where num = ?");
	            pstmt.setInt(1, num);
	            rs = pstmt.executeQuery();
	            
				if(rs.next()){
					dbpasswd= rs.getString("passwd"); 
					if(dbpasswd.equals(passwd)){
						pstmt = conn.prepareStatement("delete from QnAboard where num=?");
	                    pstmt.setInt(1, num);
	                    pstmt.executeUpdate();
						x= 1; //글삭제 성공
					}else
						x= 0; //비밀번호 틀림
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return x;
	    }
	    
	    //댓글	    
	    public List<QnAboardDTO> getQnAboardList(int num) throws Exception {
			List<QnAboardDTO> list = new ArrayList<>();
			//DTO 값을 리스트에 저장하려 빈 리스트를 만듭니다.
			try{
				 Connection conn = null;
			     PreparedStatement pstmt = null;
			     ResultSet rs= null;
			     conn = getConnection();			     
				 pstmt = conn.prepareStatement("select * from QnAre where num=?");
				 pstmt.setInt(1,num);
				 rs = pstmt.executeQuery();
				 //값을 찾아 쿼리 업데이트
				
				if(rs.next()) {
					do {
						QnAboardDTO QnAboardDTO = new QnAboardDTO();
						QnAboardDTO.setGlenum(rs.getInt("glenum"));
						QnAboardDTO.setLw_id(rs.getString("lw_id"));
						QnAboardDTO.setReContent(rs.getString("reContent"));
						QnAboardDTO.setReg_date(rs.getTimestamp("reg_date"));
						list.add(QnAboardDTO);
						//빈 리스트에 값들을 전부 저장
					}while(rs.next());
				}	
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}	
			return list;
			//리스트에 업데이트함.
		}
	    

	    public void QnAboardinsert(QnAboardDTO QnAboardDTO) throws Exception {
	    	//DTO에 값들을 넣어주는작업
	    	try {
	    	Connection conn = null;
		    PreparedStatement pstmt = null;   
		    conn = getConnection();
	    	 
		 	pstmt = conn.prepareStatement("insert into QnAre(num,lw_id,reContent,reg_date) values(?,?,?,?)");
			pstmt.setInt(1, QnAboardDTO.getNum());
			pstmt.setString(2, QnAboardDTO.getLw_id());
			pstmt.setString(3, QnAboardDTO.getReContent());
			pstmt.setTimestamp(4, QnAboardDTO.getReg_date());
			pstmt.executeUpdate();
			//DTO에 값을 전달함
	    }catch (SQLException e) {
			throw new RuntimeException(e);
		  }
	    }	

	public void QnAremodify(QnAboardDTO QnAboardDTO) throws Exception {
		//DTO에 값들을 넣어주는작업
		try {
		Connection conn = null;
	    PreparedStatement pstmt = null;   
	    conn = getConnection();
		 
	 	pstmt = conn.prepareStatement("update QnAre set ReContent=? where glenum=? ");
	 	pstmt.setString(1, QnAboardDTO.getReContent());
	 	pstmt.setInt(2, QnAboardDTO.getGlenum());
		pstmt.executeUpdate();
		//DTO에 값을 전달함
	}catch (SQLException e) {
		throw new RuntimeException(e);
	  }
	}	

	//댓글 삭제
	public void QnAredelete(QnAboardDTO QnAboardDTO) throws Exception {
		try {
		Connection conn = null;
	    PreparedStatement pstmt = null;   
	    conn = getConnection();
		 
	 	pstmt = conn.prepareStatement("delete from QnAre where glenum=? ");
	 	pstmt.setInt(2, QnAboardDTO.getGlenum());
		pstmt.executeUpdate();
		//DTO에 값을 전달함
	}catch (SQLException e) {
		throw new RuntimeException(e);
	  }
	}	
	
	public void updateBoardreadcount(int num) throws Exception{
		Connection conn = null;
		try {
			conn = getConnection();
			PreparedStatement pstmt = null;
			
			pstmt = conn.prepareStatement("update QnAboard set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch (Exception ex) {
			ex.printStackTrace();
	}
}
	

}

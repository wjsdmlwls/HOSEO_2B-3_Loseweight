파일명: BF_DAO.java, board_DAO.java
->//값을 찾아 쿼리에 업데이트 아래에
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
public void insertHistory(String id, int boardNum, String board) throws Exception {
				Connection conn = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs= null;
		        try {
		        	conn = getConnection();
		        	pstmt = conn.prepareStatement("SELECT count(1) AS cnt FROM quick_blist WHERE id=? AND board_num=? AND board=?");
		        	pstmt.setString(1, id);
		        	pstmt.setInt(2, boardNum);
		        	pstmt.setString(3, board);
		        	
					rs = pstmt.executeQuery();
					//값을 찾아 쿼리 업데이트
					
					if(rs.next()) {
						do {
							int cnt = rs.getInt("cnt");
							if(cnt==0) {
								pstmt = conn.prepareStatement("INSERT INTO quick_blist(id,board_num,board,readcount) VALUES(?,?,?,1)");
					        	pstmt.setString(1, id);
					        	pstmt.setInt(2, boardNum);
					        	pstmt.setString(3, board);
								pstmt.executeUpdate();
							}else {
								pstmt = conn.prepareStatement("UPDATE quick_blist SET readcount = readcount+1, reg_date = now() WHERE id=? AND board_num=? AND board=?");
								pstmt.setString(1, id);
					        	pstmt.setInt(2, boardNum);
					        	pstmt.setString(3, board);
								pstmt.executeUpdate();
							}
						}while(rs.next());
					}        	
		        }catch (SQLException e) {
		    		throw new RuntimeException(e);
		  	  }finally {
			         
		          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		      }	
		        
			}(추가)
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
파일명: bfboard_content.jsp
->//조회수 카운트 아래에
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//글 클릭시 히스토리에 인서트
dbPro.insertHistory(id,num,"bf_board");//'bf_board'(추가)
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

파일명: board_content.jsp
->//조회수 카운트 아래에
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//글 클릭시 히스토리에 인서트
dbPro.insertHistory(id,num,"board");//'bf_board'(추가)
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

파일명: bfboard_list.jsp
-></body>위에
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
<%@ include file="../../quick/quick.jsp" %>(추가)
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

파일명: board_list.jsp
-></body>위에
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
<%@ include file="../../quick/quick.jsp" %>(추가)
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

파일명: loseweight아래에
-> quick파일 (추가)

테이블 생성
create table quick_blist(
	num int not null primary key auto_increment,
	id varchar(50) not null,
	board varchar(50) not null,
	board_num int not null,
	readcount int default 0,
	reg_date datetime default current_timestamp not null
);
drop table quick_blist
select * from quick_blist
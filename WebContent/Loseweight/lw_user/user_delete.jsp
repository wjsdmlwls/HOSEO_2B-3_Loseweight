<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"
 import="java.sql.*,user.UserDAO"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	// 세션정보 가져오기
	PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
	try {
		String id = (String) session.getAttribute("id");

		String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
		String dbId="lw_admin";
		String dbPass="3whakstp";

		UserDAO db = new UserDAO();
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		
		String sql = "SELECT * FROM lw_users WHERE lw_id = ?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script>
	function sendIt() {
		if (document.getElementById("lw_passwd1").value != document
				.getElementById("lw_passwd2").value) { //비밀번호 불일치시 나오는 경고문
			alert("비밀번호가 일치하지 않습니다")
			return false;
		}
		if (document.getElementById("lw_passwd2").value == ""
				|| document.getElementById("lw_passwd1").value == null 
				|| document.getElementById("lw_passwd1").value == ""
				|| document.getElementById("lw_passwd2").value == null 
				|| document.getElementById("lw_passwd2").value == "";)
			alert("비밀번호를 입력하지 않으셨습니다.");
			return false;
		}

	
</script>
</head>
<!-- stlye css -->
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="vcheck.js">
	
</script>
<script type="text/javascript">
	var openWin;
	function openzipcode() {
		// window.name = "해당페이지로 가져옴 이름"; 
		window.name = "user_info";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("../../zipfinder/zipSearch.jsp", "childForm",
				"width=580, height=500, resizable = no, scrollbars = yes");
	}
</script>
<!-- 주소 end -->
<body>
	<div class="div_body">
<jsp:include page="../community/community_topinclude.jsp" >
			<jsp:param name="tom" value="0"/>
			<jsp:param name="toc" value="0"/>
			<jsp:param name="imgs" value="mypage.png"/>
			<jsp:param name="boardname" value="회원탈퇴"/>
</jsp:include>
		<%if(id == null) { 
	        response.sendRedirect("login.jsp");
	    }
	    else {
	    %> 
				<div style="margin-top:80px" class="delete_post" >
			    
			    	<div class="delete_provision1">
			               		<h4>LOSE WEIGHT 아이디는 재사용 및 복구 불가 안내</h4>
			               		<h5>회원탈퇴 진행시 아이디 재사용이나 복구가 불가능합니다.<br>신중히 선택후 결정해주세요</h5>
		              </div>
		              <div class="delete_provision2">
			               		<h4>게시판에 등록한 게시글 삭제 불가 안내</h4>
			               		<h5>삭제를 원하는 게시글이 있따면 반드시 회원탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다<br>
			               		탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</h5>
		              </div>
			    <form class="delete_post" name="vcheck1" method="post" action="user_delete_Action.jsp" onsubmit="return user_pw()" >
			        <table  class="delete_post_table">
			            <%while(rs.next()) { %>
			            <thead>
			            <tr>
			                <th>아이디</th>
			                 <td><input class="delete_post_tableinput"type="text" name="lw_id" value="<%=rs.getString("lw_id")%>"readonly></td>
			                 <th>비밀번호 확인</th>
			                 <td><input class="delete_post_tablepasswdinput" type="password" name="lw_passwd1" id="lw_passwd1"  placeholder="비밀번호 " onkeyup="pw_m_alert_d()"><br>
		                    <input class="delete_post_tablepasswdinput" type="password" name="lw_passwd2" id="lw_passwd2"  placeholder="비밀번호 확인 " onkeyup="pw_m_alert_d()"><br>
		                    <span id="alert_pw_d"></span>
		                   </td>
			            </tr>
			            </thead>
			            <%} %>
			        </table>
			        <div class="delete_form_button">
			       
					<input type="button" class="button white" value="돌아가기" onclick="location.href='user_Info.jsp'">
			    	<button class="button salmon" type="submit" style="width:70px;" value="회원탈퇴">회원탈퇴</button> 
			    	</div>
			    	</form>
			    </div>
			</div>
		<%
			}
		%>

		<%}catch (Exception e) {
				e.printStackTrace();
			}finally {
		          if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		      }	
		%>
</body>
</html>
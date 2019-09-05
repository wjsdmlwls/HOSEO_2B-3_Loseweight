<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,user.UserDAO" %>
    
    <%
    // 세션정보 가져오기
    try {
    String id = (String) session.getAttribute("id");
    
    String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
	String dbId="jspid";
	String dbPass="jsppass";
	
    UserDAO db= new UserDAO();
    Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    
 
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM lw_users WHERE lw_id = ?";
 
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);
    rs = pstmt.executeQuery();
%>
    
    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<!-- stlye css -->
 <link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="vcheck.js">
</script>
<body>
<div class="div_body">
		<div class="div_top"style=" width: 100%; height: 120px">
		<jsp:include page="../lw_top.jsp" flush="false" />
		</div>
		<div  style='margin: 0 auto; width: 720px'>
		<div class="div_sidecontents"style='position: relative;'>
	<div class="delete_form">
	</div>
	 <%if(id == null) { 
	        response.sendRedirect("login.jsp");
	    }
	    else {
	    %> 
	    <div class="delete_post">
	    <div style="text-align:left;margin-left:20px"><h1>회원정보 탈퇴</h1>
	    </div>
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
	       
			<input type="button" class="button white" value="돌아가기" onclick="location.href='user_Info.jsp'"></button>
	    	<button class="button salmon" type="submit" style="width:70px;" value="회원탈퇴">회원탈퇴</button> 
	    	</form>
	    </div>
	  </div>
	  </div>
	  </div>
	 <%} %>
	<%
	    }
	catch(Exception e) {
			e.printStackTrace();
		}%>
	</div>
	
</body>
</html>
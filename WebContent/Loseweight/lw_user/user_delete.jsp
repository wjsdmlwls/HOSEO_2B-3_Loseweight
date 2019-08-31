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
	<div class="mypage_form" style="margin-top:40px">
	<div><a href="../lw_main.jsp"><img src="../img/logo/logo.png" alt="" /></a>
	</div>
	 <%if(id == null) { 
	        response.sendRedirect("login.jsp");
	    }
	    else {
	    %> 
	    <div class="mypage_post">
	    <div style="text-align:left"><h1>회원정보 탈퇴</h1>
	    </div>
	    <form class="mypage_post" name="vcheck1" method="post" action="user_delete_Action.jsp" >
	        <table  class="mypage_post_table">
	            <%while(rs.next()) { %>
	            <thead>
	            <tr>
	                <th>아이디</th>
	                 <td><input class="mypage_post_tableinput"type="text" name="lw_id" value="<%=rs.getString("lw_id")%>"readonly></td>
	            </tr>
	            </thead>
	            <tr>
	                <th>이름</th>
	                <td><input class="mypage_post_tableinput" type="text" name="lw_name" value="<%=rs.getString("lw_name")%>"readonly></td>
	            </tr>
	            
	            <tr class="mypage_post_tablepasswd">
	                <th>비밀번호 확인</th>
	                <td>
	                <input class="mypage_post_tablepasswdinput" type="password" name="lw_passwd1" id="lw_passwd1"  placeholder="비밀번호 " onkeyup="pw_m_alert_d()"><br>
                    <input class="mypage_post_tablepasswdinput" type="password" name="lw_passwd2" id="lw_passwd2"  placeholder="비밀번호 확인 " onkeyup="pw_m_alert_d()"><br>
                    <span id="alert_pw_d"><span></span></span>
	                </td>
	                
	            </tr>
	            <%} %>
	        </table>
	         <h3 style="text-align:left">회원탈퇴시 해당 정보는 삭제됩니다.</h3>
	        <div class="mypage_form_button">
	       
			<input type="button" class="button white" value="돌아가기" onclick="location.href='../lw_main.jsp'"></button>
	    	<button class="button salmon" type="submit" style="width:70px;" value="회원탈퇴">회원탈퇴</button> 
	    	</form>
	    	
	    	
	        <!-- 일단 디자인에 필요없어서 뺐음 
	        <input type="button" onclick="location.href='main.jsp'" value="돌아가기">
	        <input type="button" value="회원 탈퇴" onClick="my_delete()"> -->
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
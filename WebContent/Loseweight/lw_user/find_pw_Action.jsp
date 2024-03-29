<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
 <%@page import="java.io.PrintWriter" %>
 <%@page import="user.UserDAO.*" %>
 <jsp:useBean id="user" class="user.User" scope="page"/> 
 
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경완료</title>
<head>
</head>
<!-- stlye css -->
 <link rel="stylesheet" href="../css/style.css">
 <style>
 .ps_Searcinput{
	width: 300px;
    background-color: #fff;
    border: medium none;
    border: 1px solid #ccc;
    color: #7d7d7d;
    font-size: 12px;
    font-weight: 500;
    height: 40px;
    margin-top:5px;
}
 </style>
 <script type="text/javascript" src="vcheck.js">
 </script>
<!-- ID SearchAction 스크립트 -->
<%
		

	Connection conn= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String lw_id =request.getParameter("lw_id");
	String lw_e_mail1=request.getParameter("lw_e_mail1");
	String lw_e_mail2=request.getParameter("lw_e_mail2");
	String pw =""; //유효성검사 사용 변수 
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
    	String dbId="jspid";
    	String dbPass="jsppass";
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    	
    	String sql="select lw_passwd from lw_users where lw_id=? and lw_e_mail1=? and lw_e_mail2=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, lw_id);
    	pstmt.setString(2, lw_e_mail1);
    	pstmt.setString(3, lw_e_mail2);
    	rs=pstmt.executeQuery();
    	
    	
    	
    	while(rs.next()){
    		pw = rs.getString("lw_passwd");	
    	}
    	if(pw == null || pw==""){%>
    	<%
    			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('일치하지않습니다.')");
			script.println("history.back()");
			script.println("</script>");
			%>
    	<%	
    	}else{
    	%>
    	    	<%
    	}
    	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null)
			try{rs.close();}catch(SQLException sqle){}
		if(pstmt !=null)
			try{pstmt.close();}catch(SQLException sqle){}
		if(conn !=null)
			try{conn.close();}catch(SQLException sqle){}
		
	}
	
	
%>
<body>
	<div class="idSearch_form">
		<a href="../lw_main.jsp"><img src="../img/logo/logo.png" alt="" /></a>
		<div class="idSearch_topimg">
			<img class="idSearch_topimgsort"src="../img/idpw_Search/User_Search.png" alt="" />
	    	<h1 class="idSearch_topimgsort idSearch_font">비밀번호 찾기</h1>
    	</div>
    	
    	
    	<div class="idSearch_resultform">
	    	<div class="idSearch_padding">
		    	 <%=lw_id %> 회원님의 비밀번호는 <font color="red"> <%=pw %></font> 입니다.
		   	</div>
		   	<div class="idSearch_padding">
		    	<input type="button" value="돌아가기" class="button white idpw_bt" onClick="location.href='../lw_main.jsp'"/>
				<input type="button" value="로그인 창으로가기" class="button salmon idpw_bt" onClick="location.href='login.jsp'"/>
			</div>
    	
    	</div>
    	<div class="idSearch_resultform2">
    	<form class="pwSearch_post" name="vcheck1" action="user_pw_Update.jsp" onsubmit="return pw_action_pw()">
    	<p>비밀번호 변경하기</p>
    	<input type="text" style="display: none;"name="lw_id" value=<%=lw_id%>>
    	<input type="password" class="ps_Searcinput" name="lw_passwd2" id="lw_passwd2" placeholder="새 비밀번호" onkeyup="pw_m_alert_f()"><Br>
    	<input type="password" class="ps_Searcinput" name="lw_passwd3" id="lw_passwd3" placeholder="새 비밀번호 확인" onkeyup="pw_m_alert_f()"><Br>
    	<span id="alert_pw_f"><span style="color:blue;"></span></span><br>
    	<input type="submit" value="비밀번호 변경" style="margin-top:20px" class="button salmon idpw_bt" onclick="sendIt();"/>
    	</form>
      </div>
   </div>

</body>
</html>

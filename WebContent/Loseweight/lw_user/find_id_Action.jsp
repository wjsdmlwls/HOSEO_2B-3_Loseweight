<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
 <%@page import="java.io.PrintWriter" %>
 <%@page import="user.UserDAO.*" %>
 <jsp:useBean id="user" class="user.User" scope="page"/> 
 
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<head>
</head>
<!-- stlye css -->
 <link rel="stylesheet" href="../css/style.css">
<!-- ID SearchAction 스크립트 -->
<%
		

	Connection conn= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String lw_name =request.getParameter("lw_name");
	String lw_phone=request.getParameter("lw_phone");
	String id ="";
	
	if(lw_name=="" || lw_phone==""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력 안된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
    	String dbId="jspid";
    	String dbPass="jsppass";
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    	
    	String sql="select lw_id from lw_users where lw_name=? and lw_phone=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, lw_name);
    	pstmt.setString(2, lw_phone);
    	rs=pstmt.executeQuery();
    	
    	
    	
    	while(rs.next()){
    		id = rs.getString("lw_id");	
    	}
    	if(id == null){%>
    	
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
<!-- ID SearchAction 스크립트 -->
<body>
	<div class="idSearch_form">
		<a href="../lw_main.jsp"><img src="../img/logo/logo.png" alt="" /></a>
		<div class="idSearch_topimg">
			<img class="idSearch_topimgsort"src="../img/idpw_Search/User_Search.png" alt="" />
	    	<h1 class="idSearch_topimgsort idSearch_font">아이디 찾기</h1>
    	</div>
    	
    	
    	<div class="idSearch_resultform">
	    	<div class="idSearch_padding">
		    	 회원님의 아이디는 <font color="red"> <%=id %></font> 입니다.
		   	</div>
		   	<div class="idSearch_padding">
		    	<input type="button" value="돌아가기" class="button white idpw_bt" onClick="location.href='../lw_main.jsp'"/>
				<input type="button" value="로그인 창으로가기" class="button salmon idpw_bt" onClick="location.href='login.jsp'"/>
			</div>
    	
    	</div>
    	<div class="idSearch_resultform2">
    	<p>비밀번호도 함께 찾고싶으신가요? </p>
    	<input type="button" value="비밀번호 찾기" class="button white idpw_bt" onClick="location.href='find_id_pw.jsp'"/>
    	</div>
    


	</div>
</body>
</html>

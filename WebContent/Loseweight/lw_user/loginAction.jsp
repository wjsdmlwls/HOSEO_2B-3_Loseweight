<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO" %>
<%@page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="lw_id"/>
<jsp:setProperty name="user" property="lw_passwd"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<%
	String id=null;
	if(session.getAttribute("lw_id")!=null){		
		id= (String) session.getAttribute("lw_id");
	}
	if(id !=null){
		PrintWriter script = response.getWriter();			//세션이 접속되어 아이디값을 받았을때
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");	//이미접속되어서
		script.println("window.close()");	// 메인페이지로 돌아감
		script.println("</script>");						// 로그인을 시도를 차단함
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getLw_id(),user.getLw_passwd());
	if(result == 1 ) {
		session.setAttribute("id",user.getLw_id());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("window.parent.closeModal();");
		script.println("</script>");
		//로그인이 성공했을때 메인홈페이지로 돌아감.
	}
	else if(result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다')");
		script.println("window.parent.closeModal();");
		script.println("</script>");
		//비밀번호가 틀렸을때
	}else if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
		//아이디가 틀렸을때
	}else if(result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생')");
		script.println("history.back()");
		script.println("</script>");
		//DB오류가 있을때
	}
%>
</body>
</html>
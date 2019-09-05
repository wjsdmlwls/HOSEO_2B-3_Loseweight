<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO" %> <%--데이터베이스 처리문 import--%>
<%@page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/> 

<jsp:setProperty name="user" property="lw_id"/>
<jsp:setProperty name="user" property="lw_passwd"/>
<jsp:setProperty name="user" property="lw_name"/>
<jsp:setProperty name="user" property="lw_gender"/>
<jsp:setProperty name="user" property="lw_e_mail1"/>
<jsp:setProperty name="user" property="lw_e_mail2"/>
<jsp:setProperty name="user" property="lw_zipcode"/>
<jsp:setProperty name="user" property="lw_addr1"/>
<jsp:setProperty name="user" property="lw_addr2"/>
<jsp:setProperty name="user" property="lw_phone"/>
<jsp:setProperty name="user" property="lw_lp"/>

<%--java bean에서 값들 불러오기--%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<%
	String id=null;  
	if(session.getAttribute("lw_id")!=null){
	id= (String) session.getAttribute("lw_id"); //세션로그인이 되어있으면 예외처리
	}
	if(id !=null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 로그인이 되어있습니다.')");
	script.println("location.herf ='main.jsp'");
	script.println("</script>");
	}

	if(user.getLw_id()== null ||user.getLw_passwd()== null ||user.getLw_name()== null ||
	   user.getLw_gender()== null ||user.getLw_e_mail1()== null ||user.getLw_e_mail2()== null ||
	   user.getLw_zipcode()== null ||user.getLw_addr1()== null ||
	   user.getLw_addr2()== null ||user.getLw_phone()== null
	   ){ //값을이 null값일때 처리문
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else{
		UserDAO userDAO = new UserDAO(); 
		int result = userDAO.signup(user); //java bean불러오기
		if(result == -1 ) {		
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
			
		}
  		else{	
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println(" $('#div.modal').dialog('close');");
			script.println("alert('회원가입이 완료되었습니다.')");
			script.println("</script>");
			//회원가입이 되었을때 메인페이지로 이동
		}  
	
	}
	
%>

</body>
</html>
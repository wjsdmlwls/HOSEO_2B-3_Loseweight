
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<%
	session.invalidate();  //세션연결 해제
%>

<script>
	//세션을 해제한뒤 메인페이지로 돌아감
	location.href="../lw_main.jsp";
</script>
</body>
</html>
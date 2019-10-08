<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "Fitnesshop.Fitnesshop_DAO" %>
<%@ page import = "java.sql.Timestamp" %>
     
<%request.setCharacterEncoding("utf-8"); %>


<jsp:useBean id="article"  scope="page" class="Fitnesshop.Fitnesshop_DTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
String selectoption1price = request.getParameter("option1price");

String selectoption1 = request.getParameter("option1");
%>
<%=selectoption1 %>
<%=selectoption1price %>
</body>
</html>
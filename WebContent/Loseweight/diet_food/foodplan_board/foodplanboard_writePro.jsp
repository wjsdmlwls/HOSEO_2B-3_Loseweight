<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "foodplanboard.foodplanDAO" %>
<%@ page import = "foodplanboard.foodplanDTO" %>
<%@ page import = "java.sql.Timestamp" %>
     
<%
     	request.setCharacterEncoding("utf-8");
     %>


<jsp:useBean id="article"  scope="page" class="foodplanboard.foodplanDTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	

	foodplanDAO dbPro = foodplanDAO.getInstance();
    dbPro.insertArticle(article); 
    
    String boardfiles = (request.getParameter("boardfiles"));
    int num=article.getNum();
    response.sendRedirect("foodplanboard_list.jsp");
%>
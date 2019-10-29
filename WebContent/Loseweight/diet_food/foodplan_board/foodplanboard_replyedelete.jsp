<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@page import= "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,board.*" %>

<%@ page import = "foodplanboard.foodplanDAO" %>
<%@ page import = "foodplanboard.foodplanDTO" %>
<%
     	request.setCharacterEncoding("utf-8");
     %>
 
<jsp:useBean id="article"  scope="page" class="foodplanboard.foodplanDTO"/>

<%
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));

	foodplanDAO foodplanDAO = new foodplanDAO();

	article.setGlenum(glenum);

	foodplanDAO.deletereplyArticle(article); 
	
	int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    response.sendRedirect("foodplanboard_content.jsp?num="+num+"&pageNum="+pageNum+"");
%>

<%=glenum%>
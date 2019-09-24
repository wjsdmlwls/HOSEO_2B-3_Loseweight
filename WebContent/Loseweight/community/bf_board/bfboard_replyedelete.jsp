<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@page import= "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,BFboard.*" %>
<%@ page import = "BFboard.BF_DAO" %>
<%@ page import = "BFboard.BF_DTO" %>
     
<%
     	request.setCharacterEncoding("utf-8");
     %>
 
<jsp:useBean id="article"  scope="page" class="BFboard.BF_DTO"/>

<%
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));  	
	BF_DAO boardDAO = new BF_DAO();
	article.setGlenum(glenum);

	boardDAO.deletereplyArticle(article); 
	
    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    response.sendRedirect("bfboard_content.jsp?num="+num+"&pageNum="+pageNum+"");
%>

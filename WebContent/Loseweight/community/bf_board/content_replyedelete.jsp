<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@page import= "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,BFboard.*" %>
<%@ page import = "BFboard.BoardDBBean" %>
<%@ page import = "BFboard.BoardDataBean" %>
     
<%
	request.setCharacterEncoding("utf-8");
%>
 
<jsp:useBean id="article"  scope="page" class="BFboard.BoardDataBean"/>

<%
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));  	
	BoardDBBean boardDAO = new BoardDBBean();
	article.setGlenum(glenum);

	boardDAO.deletereplyArticle(article); 

    int num=article.getNum();
    

    response.sendRedirect("list.jsp");
%>

<%=glenum%>
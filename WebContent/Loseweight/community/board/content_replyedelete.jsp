<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@page import= "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,board.*" %>
<%@ page import = "board.BoardDBBean" %>
<%@ page import = "board.BoardDataBean" %>
     
<%
	request.setCharacterEncoding("utf-8");
%>
 
<jsp:useBean id="article"  scope="page" class="board.BoardDataBean"/>

<%
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));

  	BoardDBBean boardDAO = new BoardDBBean();

	article.setGlenum(glenum);

	boardDAO.deletereplyArticle(article); 

    int num=article.getNum();
    

    response.sendRedirect("list.jsp");
%>

<%=glenum%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@page import= "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,board.*" %>
<%@ page import = "board.board_DAO" %>
<%@ page import = "board.board_DTO" %>
     
<%
     	request.setCharacterEncoding("utf-8");
     %>
 
<jsp:useBean id="article"  scope="page" class="board.board_DTO"/>

<%
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));

  	board_DAO boardDAO = new board_DAO();

	article.setGlenum(glenum);

	boardDAO.deletereplyArticle(article); 

    int num=article.getNum();
    

    response.sendRedirect("board_list.jsp");
%>

<%=glenum%>
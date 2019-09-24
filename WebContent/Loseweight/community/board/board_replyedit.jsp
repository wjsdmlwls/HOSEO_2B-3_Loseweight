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
	String recontent2 = request.getParameter("recontent2");
	String lw_id = request.getParameter("lw_id");
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));

  	board_DAO boardDAO = new board_DAO();

	article.setLw_id(lw_id);
	article.setGlenum(glenum);
	article.setRecontent(recontent2);

	boardDAO.updatereplyArticle2(article); 

    int num=article.getNum();
    

    response.sendRedirect("board_list.jsp");
%>

<%=glenum%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@page import= "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,Noticeboard.*" %>
<%@ page import = "Noticeboard.BoardDBBean" %>
<%@ page import = "Noticeboard.BoardDataBean" %>
     
<%
	request.setCharacterEncoding("utf-8");
%>
 
<jsp:useBean id="article"  scope="page" class="Noticeboard.BoardDataBean"/>

<%
	String recontent2 = request.getParameter("recontent2");
	String lw_id = request.getParameter("lw_id");
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));

	BoardDBBean boardDAO = new BoardDBBean();

	article.setLw_id(lw_id);
	article.setGlenum(glenum);
	article.setRecontent(recontent2);

	boardDAO.updatereplyArticle2(article); 

    int num=article.getNum();
    

    response.sendRedirect("list.jsp");
%>

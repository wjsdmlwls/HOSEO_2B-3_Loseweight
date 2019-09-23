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
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));

	BoardDBBean boardDAO = new BoardDBBean();

	article.setGlenum(glenum);
	
	boardDAO.deletereplyArticle(article); 

    int num=article.getNum();
    

    response.sendRedirect("list.jsp");
%>

<%=glenum%>
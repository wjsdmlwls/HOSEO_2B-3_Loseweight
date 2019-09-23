<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@page import= "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,questionboard.*" %>
<%@ page import = "questionboard.BoardDBBean" %>
<%@ page import = "questionboard.BoardDataBean" %>
     
<%
	request.setCharacterEncoding("utf-8");
%>
 
<jsp:useBean id="article"  scope="page" class="questionboard.BoardDataBean"/>

<%
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));

  	BoardDBBean boardDAO = new BoardDBBean();

	article.setGlenum(glenum);

	boardDAO.deletereplyArticle(article); 

    int num=article.getNum();
    

    response.sendRedirect("list.jsp");
%>

<%=glenum%>
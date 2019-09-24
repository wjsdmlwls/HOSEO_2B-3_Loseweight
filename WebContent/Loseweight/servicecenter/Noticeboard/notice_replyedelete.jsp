<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@page import= "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,Noticeboard.*" %>
<%@ page import = "Noticeboard.NoticeDAO" %>
<%@ page import = "Noticeboard.NoticeDTO" %>
     
<%
     	request.setCharacterEncoding("utf-8");
     %>
 
<jsp:useBean id="article"  scope="page" class="Noticeboard.NoticeDTO"/>

<%
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));

	NoticeDAO boardDAO = new NoticeDAO();

	article.setGlenum(glenum);
	
	boardDAO.deletereplyArticle(article); 

    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    response.sendRedirect("notice_content.jsp?num="+num+"&pageNum="+pageNum+"");

%>

<%=glenum%>
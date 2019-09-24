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
	String recontent2 = request.getParameter("recontent2");
	String lw_id = request.getParameter("lw_id");
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));

	NoticeDAO boardDAO = new NoticeDAO();

	article.setLw_id(lw_id);
	article.setGlenum(glenum);
	article.setRecontent(recontent2);

	boardDAO.updatereplyArticle2(article); 

    int num=article.getNum();
    

    response.sendRedirect("notice_list.jsp");
%>

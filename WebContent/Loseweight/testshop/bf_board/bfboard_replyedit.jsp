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
	String recontent2 = request.getParameter("recontent2");
	String lw_id = request.getParameter("lw_id");
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));
	
  	BF_DAO boardDAO = new BF_DAO();

	article.setLw_id(lw_id);
	article.setGlenum(glenum);
	article.setRecontent(recontent2);

	boardDAO.updatereplyArticle2(article); 

    int num=article.getNum();
    

    response.sendRedirect("bfboard_list.jsp");
%>

<%=glenum%>
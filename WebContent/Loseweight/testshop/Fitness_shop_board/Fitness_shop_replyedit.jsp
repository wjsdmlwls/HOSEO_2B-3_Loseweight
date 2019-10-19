<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@page import= "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,BFboard.*" %>
<%@ page import = "Fitnesshop.Fitnesshop_DAO" %>
<%@ page import = "Fitnesshop.Fitnesshop_DTO" %>
     
<%
     	request.setCharacterEncoding("utf-8");
     %>
 
<jsp:useBean id="article"  scope="page" class="Fitnesshop.Fitnesshop_DTO"/>

<%
	String recontent2 = request.getParameter("recontent2");
	String lw_id = request.getParameter("lw_id");
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));
	
	Fitnesshop_DAO boardDAO = new Fitnesshop_DAO();
	
	article.setLw_id(lw_id);
	article.setGlenum(glenum); 
	article.setRecontent(recontent2); 
	
	boardDAO.updatereplyArticle2(article);   

    response.sendRedirect("Fitness_shop_list.jsp");
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     
<%@ page import = "Fitnesshop.Fitnesshop_DAO" %>
<%@ page import = "java.sql.Timestamp" %>
     
<%request.setCharacterEncoding("utf-8"); %>


<jsp:useBean id="article"  scope="page" class="Fitnesshop.Fitnesshop_DTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	article.setWrite_date(new Timestamp(System.currentTimeMillis()));

	Fitnesshop_DAO dbPro = Fitnesshop_DAO.getInstance();
    dbPro.insertArticle(article); 
    
    String boardfiles = (request.getParameter("boardfiles"));
   	int num=article.getLw_salesnum();
    response.sendRedirect("Fitness_shop_list.jsp");
%>
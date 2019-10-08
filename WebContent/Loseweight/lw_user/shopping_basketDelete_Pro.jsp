<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     
<%@ page import = "Fitnesshop.shopping_basket_DAO" %>
<%@ page import = "java.sql.Timestamp" %>
     
<%
     	request.setCharacterEncoding("utf-8");
     %>


<jsp:useBean id="article"  scope="page" class="Fitnesshop.shopping_basket_DTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	shopping_basket_DAO dbPro = shopping_basket_DAO.getInstance();
    dbPro.deleteArticle(num); 
    
    String boardfiles = (request.getParameter("boardfiles"));
    response.sendRedirect("user_shopping_basket.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "Fitnesshop.Fitnesshop_DAO" %>
<%@ page import = "Fitnesshop.Fitnesshop_DTO" %>
<%@ page import = "java.sql.Timestamp" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="article" scope="page" class="Fitnesshop.Fitnesshop_DTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%

	int lw_salesnum = Integer.parseInt(request.getParameter("lw_salesnum"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	Fitnesshop_DAO dbPro = Fitnesshop_DAO.getInstance();
	dbPro.updateArticle(article,lw_salesnum,passwd); 

%>
<meta http-equiv="Refresh" content="0;url=Fitness_shop_list.jsp?pageNum=<%=pageNum%>" >


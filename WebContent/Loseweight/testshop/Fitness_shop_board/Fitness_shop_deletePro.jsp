<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Fitnesshop.Fitnesshop_DAO" %>
<%@ page import = "java.sql.Timestamp" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	int lw_salesnum = Integer.parseInt(request.getParameter("lw_salesnum"));
  	String pageNum = request.getParameter("pageNum");
  	String passwd = request.getParameter("passwd");
  	String lw_id = request.getParameter("lw_id");

  Fitnesshop_DAO dbPro = Fitnesshop_DAO.getInstance(); 
  dbPro.deleteArticle(lw_salesnum,passwd,lw_id); 

 
%>
	<meta http-equiv="Refresh" content="0;url=Fitness_shop_list.jsp?pageNum=<%=pageNum%>">


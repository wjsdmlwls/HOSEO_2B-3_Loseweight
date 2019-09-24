<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@page import= "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,questionboard.*" %>
<%@ page import = "questionboard.questionDAO" %>
<%@ page import = "questionboard.questionDTO" %>
     
<%
     	request.setCharacterEncoding("utf-8");
     %>
 
<jsp:useBean id="article"  scope="page" class="questionboard.questionDTO"/>

<%
	int glenum = Integer.parseInt(request.getParameter("glenumpost"));

  	questionDAO boardDAO = new questionDAO();

	article.setGlenum(glenum);

	boardDAO.deletereplyArticle(article); 

    int num=article.getNum();
    

    response.sendRedirect("question_list.jsp");
%>

<%=glenum%>
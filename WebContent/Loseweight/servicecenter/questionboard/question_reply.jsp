<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     
<%@ page import = "questionboard.questionDAO" %>
<%@ page import = "java.sql.Timestamp" %>
     
<%
     	request.setCharacterEncoding("utf-8");
     %>


<jsp:useBean id="article"  scope="page" class="questionboard.questionDTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	
	
    questionDAO dbPro = questionDAO.getInstance();
    dbPro.replyArticle(article); 
    
    String boardfiles = (request.getParameter("boardfiles"));
    int num=article.getNum();
    response.sendRedirect("question_list.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     
<%@ page import = "board.board_DAO" %>
<%@ page import = "java.sql.Timestamp" %>
     
<%
     	request.setCharacterEncoding("utf-8");
     %>


<jsp:useBean id="article"  scope="page" class="board.board_DTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	
	
    board_DAO dbPro = board_DAO.getInstance();
    dbPro.insertArticle(article); 
    
    String boardfiles = (request.getParameter("boardfiles"));
    int num=article.getNum();
    response.sendRedirect("board_list.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     
<%@ page import = "Noticeboard.NoticeDAO" %>
<%@ page import = "java.sql.Timestamp" %>
     
<%
     	request.setCharacterEncoding("utf-8");
     %>


<jsp:useBean id="article"  scope="page" class="Noticeboard.NoticeDTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	
	
    NoticeDAO dbPro = NoticeDAO.getInstance();
    dbPro.replyArticle(article); 
    
    String boardfiles = (request.getParameter("boardfiles"));
    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    response.sendRedirect("notice_content.jsp?num="+num+"&pageNum="+pageNum+"");

%>
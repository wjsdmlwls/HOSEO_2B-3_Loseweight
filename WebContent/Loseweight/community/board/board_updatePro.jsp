<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "board.board_DAO" %>
<%@ page import = "java.sql.Timestamp" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="article" scope="page" class="board.board_DTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	String pageNum = request.getParameter("pageNum");

	board_DAO dbPro = board_DAO.getInstance();
    int check = dbPro.updateArticle(article); 

    if(check==1){
%>
	  <meta http-equiv="Refresh" content="0;url=board_list.jsp?pageNum=<%=pageNum%>" >
<% }else{%>
      <script type="text/javascript">      
      <!--      
        alert("비밀번호가 맞지 않습니다");
        history.go(-1);
      -->
     </script>
<%
  }
%> 
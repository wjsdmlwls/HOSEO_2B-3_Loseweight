<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "BFboard.BF_DAO" %>
<%@ page import = "java.sql.Timestamp" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String passwd = request.getParameter("passwd");

  BF_DAO dbPro = BF_DAO.getInstance(); 
  int check = dbPro.deleteArticle(num, passwd);

  if(check==1){
%>
	<meta http-equiv="Refresh" content="0;url=bfboard_list.jsp?pageNum=<%=pageNum%>">
<%}else{%>
    <script type="text/javascript">      
       <!--      
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
       -->
   </script>
<%} %>
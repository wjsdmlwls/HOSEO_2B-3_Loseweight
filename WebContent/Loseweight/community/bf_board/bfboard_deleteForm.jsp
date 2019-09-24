<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,user.UserDAO"%>
   	<%@ page import="java.io.File" %>
    <%@page import="java.sql.*" %>    
<%@page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
    <%
    // 세션정보 가져오기
    try {
    String id = (String) session.getAttribute("id");
    
    String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
	String dbId="lw_admin";
	String dbPass="3whakstp";
	
    UserDAO db= new UserDAO();
    Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
 
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM lw_users WHERE lw_id = ?";
 
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);
    rs = pstmt.executeQuery();
%>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<!-- stlye css -->
<link rel="stylesheet" href="../../css/style.css">
<style>
.writeinput{
font-size: 14px;
    display: block;
    width: 40%;
    height: 42px;
    margin-bottom: 12px;
    padding: 16px 13px;
    color: #999999;
    border: 1px solid #d9d9d9;
    background: transparent;
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
 }

</style>
<!-- 주소 end -->
<body>

	<div class="div_body">
		
		<jsp:include page="../community_topinclude.jsp" >
			<jsp:param name="tom" value="3"/>
			<jsp:param name="toc" value="1"/>
			<jsp:param name="imgs" value="cemu_1.png"/>
		</jsp:include>
		
		<div style='width: 1000px;margin-top:5%;margin:0 auto;'>
				<div class="mypage_form">
				<form method="POST" name="delForm" action="bfboard_deletePro.jsp?pageNum=<%=pageNum%>" onsubmit="return deleteSave()"> 
				 <table id="del_table" style="margin:0 auto;border:solid;margin-top: 200px;">
				  <tr height="30">
				     <td align=center style="padding-top: 20px; padding-left: 100;padding-right: 100;">
				       <b>비밀번호를 입력해 주세요.</b></td>
				  </tr>
				  <tr height="30">
				     <td align=center style="padding-top:30px">
				       <input type="password" name="passwd" class="writeinput" style="width:200px">
					   <input type="hidden" name="num" value="<%=num%>"></td>
				 </tr>
				 <tr height="30">
				    <td align=center style="padding:20px;padding-top:0">
				      <input type="button" value="취소" class="newbutton"
				       onclick="document.location.href='bfboard_list.jsp?pageNum=<%=pageNum%>'">    
				       
				      <input type="submit" value="확인"class="newbutton" > 
				    </td>
				 </tr>  
				</table> 
				</form>
		</div>
	</div>
	</div>
		<%
		}catch(Exception e){} 
					 %>
	
</body>
</html>
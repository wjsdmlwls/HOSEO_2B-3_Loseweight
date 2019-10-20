
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*" %>

<%@page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>

<%
	int ordernum =Integer.parseInt(request.getParameter("ordernum"));
	int orderstatus =Integer.parseInt(request.getParameter("orderstatus"));
%>
<%--java bean에서 값들 불러오기--%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>

<%	

	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String str="";
	try{
	String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
	String dbId="lw_admin";
	String dbPass="3whakstp";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql="update sangpum set orderstatus=? where ordernum=?";
	
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, orderstatus);
	pstmt.setInt(2, ordernum);
	pstmt.executeUpdate();
	
	}catch(Exception e){
	e.printStackTrace();
	str="member 테이블에 새로운 레코드를 추가에 실패하였습니다.";
	}finally{
	if(pstmt!=null)
		try{pstmt.close();}catch(SQLException sqle){}
	if(conn!=null)
		try{conn.close();}catch(SQLException sqle){}
	}
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('정상적으로 변경 되었습니다.')");
	script.println("history.back()");
	script.println("</script>");
%>
<%=ordernum %>
<%=orderstatus %>
</body>
</html>
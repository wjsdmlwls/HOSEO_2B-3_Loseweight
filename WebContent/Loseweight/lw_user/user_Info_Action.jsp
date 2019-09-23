
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*" %>

<%@page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>

<%
	String lw_id =request.getParameter("lw_id");
	String lw_e_mail1 =request.getParameter("lw_e_mail1");
	String lw_e_mail2 =request.getParameter("lw_e_mail2");
	String lw_zipcode =request.getParameter("lw_zipcode");
	String lw_addr1 =request.getParameter("lw_addr1");
	String lw_addr2 =request.getParameter("lw_addr2");
	String lw_phone =request.getParameter("lw_phone");
	/*변경 버튼*/
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
	String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
	String dbId="jspid";
	String dbPass="jsppass";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql="update lw_users set lw_e_mail1=?,lw_e_mail2=?,lw_zipcode=?,lw_addr1=?,lw_addr2=?,lw_phone=? where lw_id=?";
	
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, lw_e_mail1);
	pstmt.setString(2, lw_e_mail2);
	pstmt.setString(3, lw_zipcode);
	pstmt.setString(4, lw_addr1);
	pstmt.setString(5, lw_addr2);
	pstmt.setString(6, lw_phone);
	pstmt.setString(7, lw_id);
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

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*" %>

<%@page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>

<%
	String id =request.getParameter("id");
	String e_mail1 =request.getParameter("e_mail1");
	String e_mail2 =request.getParameter("e_mail2");
	String zipcode =request.getParameter("zipcode");
	String addr1 =request.getParameter("addr1");
	String addr2 =request.getParameter("addr2");
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
	
	String sql="update lw_users set lw_e_mail1=?,lw_e_mail2=?,lw_zipcode=?,lw_addr1=?,lw_addr2=? where lw_id=?";
	
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, e_mail1);
	pstmt.setString(2, e_mail2);
	pstmt.setString(3, zipcode);
	pstmt.setString(4, addr1);
	pstmt.setString(5, addr2);
	pstmt.setString(6, id);
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
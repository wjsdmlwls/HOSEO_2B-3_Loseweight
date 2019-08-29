<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page"/>

<%request.setCharacterEncoding("UTF-8"); %>

<%
	Connection conn= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String lw_id = (String) session.getAttribute("lw_id");
	String lw_passwd1=request.getParameter("lw_passwd1");
	String lw_passwd2=request.getParameter("lw_passwd2");
	String pw ="";
	
	if(lw_passwd1=="" && lw_passwd2=="" || lw_passwd1==""||lw_passwd2==""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원 정보가 일치하지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
    	String dbId="jspid";
    	String dbPass="jsppass";
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    	
    	String sql="select lw_passwd from lw_users where lw_passwd=? and lw_passwd=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, lw_passwd1);
    	pstmt.setString(2, lw_passwd2);
    	rs=pstmt.executeQuery();

    	while(rs.next()){
    		pw = rs.getString("lw_passwd");	
    	}
    	if(pw == ""){%>
    	<%
    			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원 정보가 일치하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
			%>
    	<%	
    	}else{
    		String sql1 = "delete FROM lw_users WHERE lw_id = ? and lw_passwd = ? and lw_passwd=?";

    		pstmt = conn.prepareStatement(sql1);
    		pstmt.setString(1,lw_id);
    		pstmt.setString(2,lw_passwd1);
    		pstmt.setString(3,lw_passwd2);
    		pstmt.executeUpdate();
    	%>
  	 <%
	session.invalidate();  //세션연결 해제
		%>
			<%
    			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원 탈퇴가 완료되었습니다.')");
			script.println("location.href='../lw_main.jsp'");
			script.println("</script>");
			%>
	
    	    	<%
    	}
    	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null)
			try{rs.close();}catch(SQLException sqle){}
		if(pstmt !=null)
			try{pstmt.close();}catch(SQLException sqle){}
		if(conn !=null)
			try{conn.close();}catch(SQLException sqle){}
		
	}
	
	
%>
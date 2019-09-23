<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.File" %>
    <%@page import="java.sql.*" %>

<%@page import="java.io.PrintWriter" %>
    
     <%request.setCharacterEncoding("utf-8"); %>
    <% 
    	String imgs =request.getParameter("abc");
     	String name =request.getParameter("abd");
		String directory = application.getRealPath("/img/");
		String files[] = new File(directory).list();
		
	%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.area{
word-break:break-all;
}
.divs{
width:100px;
height:100px;
background-color:#f0f;
color:red;
margin-left:100px;
}
</style>
<title>Insert title here</title>
</head>
<body>

<div class="divs">
<%
	
	String file2=request.getContextPath() +"/downloadAction?file="+
			java.net.URLEncoder.encode(name,"UTF-8");
	String file3=request.getContextPath()+"/downloadAction?file="+name;
%>
</div>

<a href="<%=file2 %>"> <%=name %></a><br>
<a href="<%=file3 %>"> <%=name %>1</a><br>
<div class="area" width="100px" height="100px"><img src="<%=imgs%>"/></div>



</body>
</html>
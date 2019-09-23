<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.File" %>
    <%@page import="java.sql.*" %>

<%@page import="java.io.PrintWriter" %>
    
     <%request.setCharacterEncoding("utf-8"); %>
     <% String imgs =request.getParameter("abc");
     	String name =request.getParameter("abd");
     
		String directory = application.getRealPath("/img/");
		String files[] = new File(directory).list();
		
		for(String file : files){
			if(file.equals(name)){
				out.write("<a href=\""+ request.getContextPath() +"/downloadAction?file="+
				java.net.URLEncoder.encode(file,"UTF-8")+"\">" +file+"</a><br>");
			}
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.area{
word-break:break-all;
}
</style>
<title>Insert title here</title>
</head>
<body>



<div class="area" width="100px" height="100px"><img src="<%=imgs%>"/></div>
</body>
</html>
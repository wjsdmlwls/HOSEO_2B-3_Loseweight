<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
 request.setCharacterEncoding("utf-8");
 String realFolder = "";
 String filename1 = "";
 int maxSize = 1024*1024*5;
 String encType = "UTF-8";
 String savefile = "img";
 ServletContext scontext = getServletContext();
 realFolder = scontext.getRealPath(savefile);
 
 try{
  MultipartRequest multi=
		  new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

  Enumeration<?> files = multi.getFileNames();
     String file1 = (String)files.nextElement();
     filename1 = multi.getFilesystemName(file1);
 } catch(Exception e) {
  e.printStackTrace();
 }
 
 String fullpath = realFolder + "\\" + filename1;
 
 String file123 = filename1;
%>

<form method="post" enctype="multipart/form-data">

<input type="file" name="filename1" size=40>

<input type="submit" value="업로드"><br><br>


</form>
<%if(filename1==""){%>
<div style="display:none;"><img src="<%=fullpath%>" width=512 height=384 name="upimg"></img>
</div>
<%}else{%>
<img src="<%=fullpath%>" width=512 height=384></img>
<input type=text value="<%=fullpath%>">
<%} %> 	

<form method="post" action="test123.jsp">
<input type=text value="<%=fullpath%>" name="abc">
<input type=text value="<%=file123%>" name="abd">
<input type="submit" value="보내기"/>
</form>
<body>

</body>
</html>
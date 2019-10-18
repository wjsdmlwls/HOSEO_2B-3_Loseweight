<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Fitnesshop.*" %>
<%@ page import = "java.sql.Timestamp,java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="order" scope="page" class="Fitnesshop.order_DTO">
   <jsp:setProperty name="order" property="*"/>
</jsp:useBean>
<%
String id= null;
if(session.getAttribute("id")!=null){
	id=(String)session.getAttribute("id");
	}else{
	id=""; 
	}	

 List<order_DTO> orderList = new ArrayList<>();
 order_DAO db = new order_DAO();
 orderList = db.jumoon(id);

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ㅗㅗㅗ</title>
</head>
<body>
<%if(id!=""){%>
<%for(int i=0; orderList.size()>i; i++ ){
	order = orderList.get(i);
%>
<a href="jusantest.jsp?ordernum=<%=order.getOrdernum()%>" onclick="" id="<%=order.getOrdernum()%>">
<%=order.getProduct_names()%><br></a>
<%} %>
<%}else{ %>
로그인을해라 이자 슥아
<%} %>
</body>
</html>
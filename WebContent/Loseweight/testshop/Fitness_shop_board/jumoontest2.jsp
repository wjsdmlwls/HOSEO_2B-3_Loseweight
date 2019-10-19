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
<jsp:useBean id="sanpum" scope="page" class="Fitnesshop.sanpum_DTO">
   <jsp:setProperty name="sanpum" property="*"/>
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
<%
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%if(id!=""){%>
<%for(int i=0; orderList.size()>i; i++ ){
	order = orderList.get(i);
%>
<a href="jusantest.jsp?ordernum=<%=order.getOrdernum()%>" onclick="" id="<%=order.getOrdernum()%>">
<%=order.getProduct_names()%><br></a><br>
<% 
int ordernum = order.getOrdernum();	

List<sanpum_DTO> orderList2 = new ArrayList<>();
sanpum_DAO db2 = new sanpum_DAO();
orderList2 = db2.testsang(ordernum,id); 
%>
<%for(int d=0; orderList2.size()>d; d++ ){
	sanpum = orderList2.get(d);
%>
<%=sanpum.getObj_order_num()%><br>  
<%=sanpum.getLw_id()%><br>
<img src="<%=sanpum.getImg0()%>" width="100px;" height="100px;"><br>


<%} %>
<%} %>
<%}else{ %>
로그인을해라 이자 슥아
<%} %>


</body>
</html>
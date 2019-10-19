<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Fitnesshop.*" %>
<%@ page import = "java.sql.Timestamp,java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
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

	int ordernum = Integer.parseInt(request.getParameter("ordernum"));	
	
	 List<sanpum_DTO> orderList = new ArrayList<>();
	 sanpum_DAO db = new sanpum_DAO();
	 orderList = db.testsang(ordernum,id); 
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
	sanpum = orderList.get(i);
%>
<%=sanpum.getObj_order_num()%><br>  
<%=sanpum.getLw_id()%><br>
<img src="<%=sanpum.getImg0()%>" width="100px;" height="100px;"><br>


<%} %>
<%}else{ %>
물품이 하나도 없어연 아시겠어연?
<%} %>

</body>
</html>
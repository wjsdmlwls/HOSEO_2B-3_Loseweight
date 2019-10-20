<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Fitnesshop.*" %>
<%@ page import = "java.sql.Timestamp,java.util.*,java.text.SimpleDateFormat,java.text.DateFormat" %>
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
String mincalendar =""; 	
String maxcalendar ="";
if(session.getAttribute("id")!=null){
	id=(String)session.getAttribute("id");
	}else{
	id=""; 
	}	
	mincalendar = request.getParameter("mincalendar");
	maxcalendar = request.getParameter("maxcalendar");
	if(mincalendar==null || mincalendar==""){
		mincalendar = "2000-01-01";
	}
	if(maxcalendar==null || maxcalendar==""){
		maxcalendar = "2099-12-31";
	}
	
 List<order_DTO> orderList = new ArrayList<>();
 order_DAO db = new order_DAO();
 orderList = db.jumoon(id,mincalendar,maxcalendar);
 
%>
<%
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>

<title></title>
<style>
.user_shopping_ordertable{
	margin:20px auto;
	width: 1000px;
	text-align:center;
}
.user_shopping_ordertable thead{
background:#f9f9f9;
}
.user_shopping_ordertable thead tr{
	height:40px;
	border-top:solid #ccc 1px;
	border-bottom:solid #ccc 1px;
}
.total a{
	font-weight: bold;
    font-size: 20px;
}
.sub_menu3 ul li a{
  	padding-left: 90px;
    padding-right: 90px;
    margin-left: 80px;
    margin-right: 80px;
}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
</head>
<body>
<div class="div_body" >
		<jsp:include page="../community/community_topinclude.jsp" >
			<jsp:param name="tom" value="6"/>
			<jsp:param name="toc" value="1"/>
			<jsp:param name="imgs" value="byshoping.png"/>
			<jsp:param name="boardname" value="구매내역"/>
		</jsp:include>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
        <script>
            $(function() {
                
            
                //오늘 날짜를 출력
                $("#today").text(new Date().toLocaleDateString());

                //datepicker 한국어로 사용하기 위한 언어설정
                $.datepicker.setDefaults($.datepicker.regional['ko']); 
                
                // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
                // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

                //시작일.
                $('#mincalendar').datepicker({
                    showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
                    buttonImage: "../admin/images/calendar.png", // 버튼 이미지
                    buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                    buttonText: "날짜선택",             // 버튼의 대체 텍스트
                    dateFormat: "yy-mm-dd",             // 날짜의 형식
                    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                    //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                    onClose: function( selectedDate ) {    
                        // 시작일(fromDate) datepicker가 닫힐때
                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                        $("#maxcalendar").datepicker( "option", "minDate", selectedDate );
                    }                
                });

                //종료일
                $('#maxcalendar').datepicker({
                    showOn: "both", 
                    buttonImage: "../admin/images/calendar.png", 
                    buttonImageOnly : true,
                    buttonText: "날짜선택",
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    //minDate: 0, // 오늘 이전 날짜 선택 불가
                    onClose: function( selectedDate ) {
                        // 종료일(toDate) datepicker가 닫힐때
                        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                        $("#mincalendar").datepicker( "option", "maxDate", selectedDate );
                    }                
                });
            });
		</script>
		
		<div style="width: 1000px;margin: 50px auto;margin-bottom: 200px;">
		<form method="post" action="user_jumoon.jsp" style="text-align: right;">
			<div style="margin:0 auto; margin-top:10px;">
			<input  style="display: none;" class="search_input" name="lw_id" value="<%=id%>">
				주문일자
	          <label for="mincalendar"></label>
	          <input type="text" id="mincalendar" name="mincalendar" readonly>
	          ~
	          <label for="maxcalendar"></label>
	          <input type="text" id="maxcalendar" name="maxcalendar" readonly>
	          <input type="submit" value="검색">
			</div>        
		</form>
		<table class="user_shopping_ordertable">
		<thead>
		   		 <tr>
				      <td width="150">주문번호</td> 
				      <td width="450">상품정보</td>
				      <td width="150">상품금액(수량)</td>  
				      <td width="100">배송비</td> 
				      <td width="150">주문상태</td>  
					</tr>
		    </thead>
		    <tbody>
				<%if(id!=""){%>
					<%for(int i=0; orderList.size()>i; i++ ){
						order = orderList.get(i);
						
					%>			
						<% 
						int ordernum = order.getOrdernum();	
						
						List<sanpum_DTO> orderList2 = new ArrayList<>();
						sanpum_DAO db2 = new sanpum_DAO();
						orderList2 = db2.testsang(ordernum,id); 
						
						DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
						Date fomat1 = order.getOrder_time();
						String tempDate = sdFormat.format(fomat1);
						
						DateFormat sdFormat2 = new SimpleDateFormat("kk:mm");
						Date fomat2= order.getOrder_time();
						String tempDate2 = sdFormat2.format(fomat2);
						%>
						
						<tr style="border-bottom: solid #ccc 1px;">
							<td rowspan="<%=orderList2.size()%>"><%=order.getOrdernum()%><br>결제 완료<br>(<%=tempDate%> <%=tempDate2%>)</td>
						<%for(int d=0; orderList2.size()>d; d++ ){
								sanpum = orderList2.get(d);
							%>
							<td style="text-align:left;padding: 16px;"><img style="float: left;"src="<%=sanpum.getImg0()%>" width="100px;" height="100px;"><a style="font-weight: bold;margin-left: 20px;"><%=sanpum.getProduct_name()%></a><br><a style="margin-left: 20px;"><%=sanpum.getOption1()%></a></td>
							<td><%=sanpum.getSelling_price()%>원(<%=sanpum.getQuantity()%>개)</td>
							<td><%=sanpum.getDelivery_charge()%>원</td>			
							<td class="order_status">
								<% if(sanpum.getOrderstatus()==0){%><%} %><a>입금 확인중</a>
								<% if(sanpum.getOrderstatus()==1){%><a>입금 완료</a><%} %>
								<% if(sanpum.getOrderstatus()==2){%><a>배송 준비중</a><%} %>
								<% if(sanpum.getOrderstatus()==3){%><a>배송 중</a><%} %>
								<% if(sanpum.getOrderstatus()==4){%><a>배송 완료</a><%} %>
								<% if(sanpum.getOrderstatus()==5){%><a>거래 완료</a><%} %>
								</td>
							</tr>	
							<%if (d==orderList2.size()-1){ %>
							<tr style="height:50px;border-top: solid #ccc 1px;border-bottom: solid #ccc 1px;" >
									<td colspan="5" style="text-align:right;" class="total"><a>총 상품가격</a> <a class="total_price"><%=order.getProduct_total()%></a> + <a>총 배송비</a> <a class="total_price"><%=order.getDelivery_total()%></a> = <a>결제금액</a><a class="total_price"><%=order.getTotal_money()%></a>
									</td>
							<%} %>
							<%} %>				
					<%} %>
			<%}else{ %>
			<tr><td colspan="5" style="padding: 200px;font-size: 30px;border-bottom: solid #ccc 1px;font-weight: bold;">주문내역이 없습니다.</td></tr>
			
			<%} %>
			<%if (orderList.size()==0) {%><tr><td colspan="5" style="padding: 200px;font-size: 30px;border-bottom: solid #ccc 1px;font-weight: bold;">주문내역이 없습니다.</td></tr><%} %>
			
			</tbody>
		</table>
		</div>
</div>
<jsp:include page="../community/community_footerinclude.jsp" ></jsp:include>	

</body>
</html>
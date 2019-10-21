<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import = "Fitnesshop.shopping_basket_DAO" %>
<%@ page import = "Fitnesshop.shopping_basket_DTO" %>
<%@ page import = "user.UserDAO"%>
<%request.setCharacterEncoding("utf-8");%>

<%

int lw_salesnum = Integer.parseInt(request.getParameter("lw_salesnum"));
String product_name = request.getParameter("product_name");

String img0 = request.getParameter("img0"); 
int quantity = Integer.parseInt(request.getParameter("quantity"));

String options = request.getParameter("options");
int option1price = Integer.parseInt(request.getParameter("option1price"));

int selling_price = Integer.parseInt(request.getParameter("selling_price"));
int delivery_charge = Integer.parseInt(request.getParameter("delivery_charge"));

int pointplus = Integer.parseInt(request.getParameter("pointplus"));


//연산 작업
int selling  = quantity*selling_price;  //물건가격
int sellings = quantity*(selling_price+option1price);  //물건가격

int pluspoint = quantity*pointplus;  //물건가격

int totals = ((quantity*selling_price)+delivery_charge);  //물건가격+배송비+옵션 가격



String id= null;

if(session.getAttribute("id")!=null){
	id=(String)session.getAttribute("id");
	}else{
	id=""; 
	}	

UserDAO db = new UserDAO();
int point = db.lpupdate(id);

String lw_name = db.pupdate(id);
String lw_phone = db.pupdatephone(id);
String lw_email1 = db.pupdateemail1(id);
String lw_email2 = db.pupdateemail2(id);
String lw_addr1 = db.pupdateaddr1(id);
String lw_addr2 = db.pupdateaddr2(id);
String lw_zipcode = db.pupdatezipcode(id);

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/style.css">
<link rel="stylesheet" href="/2019_JeonJSP/Loseweight/css/bootstrap.min.css">
<script src="/2019_JeonJSP/Loseweight/js/jquery.slim.min.js"></script>
<script src="/2019_JeonJSP/Loseweight/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/2019_JeonJSP/Loseweight/community/include.css">
<script type="text/javascript">
function chack_buy(){
	var payment1 =  document.getElementById("payment1").checked;
	var payment2 =  document.getElementById("payment2").checked;
	
	if(payment1 == true){
		document.getElementById("d").style.display='none';
		document.getElementById("c").style.display='block';
		return false;
	}
	
	else if(payment2 == true){
		document.getElementById("d").style.display='block';
		document.getElementById("c").style.display='none';
		return false;
	}	
}

function cardnumsum(){
	var num1 =  document.getElementById("cardnum1").value;
	var num2 =  document.getElementById("cardnum2").value;
	var num3 =  document.getElementById("cardnum3").value;
	var num4 =  document.getElementById("cardnum4").value; 
	 
	var numsum = num1+''+num2+''+num3+''+num4

	document.getElementById("rscardnum").innerHTML=(value=numsum);	
}

var openWin;

function openzipcode()
{
    // window.name = "해당페이지로 가져옴 이름"; 
    window.name = "user_info";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("/2019_JeonJSP/zipfinder/zipSearch.jsp",
            "childForm", "width=580, height=500, resizable = no, scrollbars = yes");    
}

function hap(){
	var hap1 =  document.getElementById("lw_lpminor").value;
	var hap2 =  document.getElementById("totalhap").value;
	
	var hap3 = hap2-hap1;
	
	document.getElementById("totalhpas").value=hap3;
	document.getElementById("totalhpass").value=hap3;
	
}

</script>
<style>
.order_body{
	width: 1000px;
    margin: 20px auto;
}
.div_top{
    width: 100%;
    height: 90px;
    border-bottom: #f0f0f0 solid 1px;
}
.top_logo{
	width: 1000px;
    margin: 0 auto;
}
.order_title{
	width: 1000px;
    margin: 0 auto;
    border-bottom: solid #777;
    padding-bottom: 10px;
}
.order_board{
	margin-top:20px
}
.shop_byinfomation{
	width: 100%;
	border-top: solid #ccc 2px;
}
.shop_byinfomation th{
	background: #f9f9f9;
	width:140px;
	border-right: solid #ccc 1px;
	padding-right: 10px;
    text-align: right;
    font-size: 14px;
}
.shop_byinfomation tr{
	border-top: solid #ccc 1px;
    border-bottom: solid #ccc 1px;
    height:50px;    
}
.myinfo{
 border:none;
 margin-left: 15px;
 font-size: 15px;
}
.pick_up{
	margin-top: 30px;
}
.Payment_method{
	margin-top:30px;
}
.Payment_method td{
	margin-top:30px;
}
.order_product{
	margin-top:30px;
}
.order_product_table{
	width: 1000px;
	border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
.order_product_table thead{
	border-bottom: 1px solid #ccc;
	background: #f9f9f9;
}
.order_product_table thead tr{
	text-align: center;
}
.order_product_table tbody tr{
	height:30px;
}
.order_product_table tr td{
	padding:10px;
}
.order_total_reslut{
	text-align:right;
}
.order_total_reslut a{
	padding:3px;
}
.Payment_select {
	width: 100%;
    border-top: solid 2px #ccc;
}
.Payment_select tr{
	height: 50px
}
.Payment_select td{
	padding-left: 15px;
}
.Payment_select th{
	background:#f9f9f9;
	width:150px;
}
.Bank_card_table {
	width: 100%;
    border-bottom: solid 1px #ccc;
    border-top: solid 1px #ccc;
}
.Bank_card_table tr{
	height: 50px;	
    border-top: solid 1px #ccc;
}
.Bank_card_table td{
	padding-left: 15px;
}
.Bank_card_table th{
	background:#f9f9f9;
	width:150px;
}
.Bank_Transfer_table {
	width: 100%;
    border-bottom: solid 1px #ccc;
    border-top: solid 1px #ccc;
}
.Bank_Transfer_table tr{
	height: 50px;	
    border-top: solid 1px #ccc;
}
.Bank_Transfer_table td{
	padding-left: 15px;
}
.Bank_Transfer_table th{
	background:#f9f9f9;
	width:150px;
}
.order_useLP {
	width: 100%;
    border-bottom: solid 1px #ccc;
}
.order_useLP tr{
	height: 50px;	
}
.order_useLP td{
	padding-left: 15px;
}
.order_useLP th{
	background:#f9f9f9;
	width:150px;
}
input {
	border: 1px solid #ccc;
	height:20px;
} 
</style>
</head>

<body>
		<div class="div_top">
			<div class="top_logo">
			<a href="/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp"><img style="position: absolute;width: 150px;height: auto;margin-top: 15px;" src="/2019_JeonJSP/Loseweight/img/footer_include/logo.png"></a>
			</div>
		</div>
		<div class="order_body">
			<div class="order_title">
				<h3>주문/결제</h3>
			</div>
		<div class="order_board">
			<form method="post" action="order_pro2.jsp">
			<div class="by_my_info"><h4>구매자 정보</h4>
			<table class="shop_byinfomation">		
				<tr><th>이름</th><td><a class="myinfo"><%=lw_name%></a><input class="myinfo" type="hidden" name="Recipient" value="<%=lw_name%>" readonly></td></tr>
				<tr><th>이메일</th><td><a class="myinfo"><%=lw_email1%>@<%=lw_email2%></a></td></tr>
				<tr><th>휴대폰번호</th><td><a class="myinfo"><%=lw_phone%></a></td></tr>
					
				</table>
			</div>
			<div class="pick_up"><h4>수령지</h4>
			<table class="shop_byinfomation">		
				<tr><th>이름</th><td><a class="myinfo"><%=lw_name%></a><input class="myinfo" type="hidden" name="Recipient" value="<%=lw_name%>" readonly></td></tr>
				<tr><th>주소</th><td><a class="myinfo"><%=lw_addr1%> <%=lw_addr2%>(<%=lw_zipcode %>)</a></td></tr>
				<tr><th>연락처</th><td><a class="myinfo"><%=lw_phone%></a></td></tr>
				<input type="hidden" name="lw_zipcode" value="<%=lw_zipcode%>" readonly>
				<input type="hidden" name="lw_addr1" value="<%=lw_addr1%>" readonly>
				<input type="hidden" name="lw_addr2" value="<%=lw_addr2%>" readonly>
				</table>
			</div>		
			<div class="Payment_method"><h4>결제정보</h4>
		<table class="Payment_select">
		<tr>
		<th>결제 방법</th>
		<td>
			<input type="radio" name="payment" id="payment1" value="0" onclick="chack_buy()" checked>카드
			<input type="radio" name="payment" id="payment2" value="1" onclick="chack_buy()">계좌
		</td>
		</tr>
		</table>
		<!-- 계좌이체 -->
		<div id="d">
			<table class="Bank_Transfer_table">
				<tr><th>계좌이체</th><td>우리은행 1002 537 480416 전의진</td></tr>
				<tr><th>입금 계좌 </th><td><input type="text" name="account"></td></tr>
				<tr><th>예금주</th><td><input type="text" name="account_name"></td></tr>
			</table>
		</div>
		<!-- 카드 -->
		<div id="c">
			<table class="Bank_card_table">
				<tr>
				<th>카드사</th>
				<td>
					<input type="radio" name="cardname" value="BC" checked>BC
					<input type="radio" name="cardname" value="신한">신한
					<input type="radio" name="cardname" value="국민">국민
					<input type="radio" name="cardname" value="우리">우리
					<input type="radio" name="cardname" value="카카오">카카오
					<input type="radio" name="cardname" value="토스">토스
				</td></tr>
				<tr><th>
				카드번호 </th>
				<td>  
				<input type="text"  name="cardnum1" id="cardnum1" maxlength="4" style="width:40px;" onkeyup="cardnumsum()"> - 
						 <input type="text" name="cardnum2" id="cardnum2" maxlength="4" style="width:40px;" onkeyup="cardnumsum()">
						- <input type="text"  name="cardnum3" id="cardnum3" maxlength="4" style="width:40px;" onkeyup="cardnumsum()"> - 
						 <input type="text" name="cardnum4" id="cardnum4" maxlength="4" style="width:40px;" onkeyup="cardnumsum()">
						 <input type="hidden" name="cardnum" id="rscardnum">
				</td></tr>
				<tr>
					<th>Month / Year</th>
					<td>
						<input type="text" maxlength="2" style="width:40px;border: none;border-bottom: 1px solid #ccc;" name="cardmonth"><a style="margin-left: 5px;margin-right: 5px;">/</a><input type="text" maxlength="2" style="width:40px;border: none;border-bottom: 1px solid #ccc;" name="cardyear">
					</td>
				</tr>
				<tr>
					<th>CVC</th>
					<td>
						<input type="text" maxlength="3" style="width:40px;" name="cardcvc">
					</td>
				</tr>
				<tr>
					<th>비밀번호 앞자리</th>
					<td>
						<input type="text" maxlength="2" style="width:20px;" name="cardpasswd">**
					</td>
				</tr>
				
		
		</table>
		</div>
		<table class="order_useLP">
			 <tr>
			 	<th>
			 		LP 할인
			 	</th>
				 <td>
				 	<input type="text" style="width: 100px; margin-right:10px;" id="lw_lpminor" name="lw_lpminor" onkeyup="hap();">LP (<a style="font-weight:bold">사용가능한 LP:<%=point%></a>)<br>
				 	<input type="hidden" name="lw_lp" value="<%=point%>">
				 	 <input type="hidden" name="lw_lp_plus" value="<%=pluspoint%>">
				 </td>
			 </tr>
		</table>
		
			<div class="order_product"><h4>상품 <a><%=product_name%></a></h4>
					<input type="hidden" name="product_names"value="상품 <%=product_name%> ">
					<table class="order_product_table">
					<thead>
						<tr> 
						      <td colspan="2" width="800">상품정보</td>
						      <td width="100">상품금액</td>  
						      <td width="100">배송비</td>
						</tr>
					</thead>
					
						
							<tr style="border-top: 1px solid #ccc;">
								<td rowspan="2" width="120px"><img src="<%=img0%>" width="100px;" height="80px"><input type="hidden" name="img0" value="<%=img0%>">
								<input type="hidden" name="imgs" value="<%=img0%>">
								<input type="hidden" name="lw_salesnum" value="<%=lw_salesnum%>"></td>
								<td style="border-bottom: 1px solid #ccc;"><a style="font-size:15px; font-weight:bold;"><%=product_name%></a><a style="color:#ccc;font-size:12px;">(<%=options%>)</a> 
								<input type="hidden" name="product_name" value="<%=product_name%>"></td>
								<td rowspan="2" style="text-align: center;border-left: solid 1px #ccc;">
								<%=selling_price%><input type="hidden" name="selling_price" value="<%=sellings%>">원</td>
								<td rowspan="2" style="text-align: center;border-left: solid 1px #ccc;"><%=delivery_charge%>
								<input type="hidden" name="delivery_charge" value="<%=delivery_charge%>">원</td>
							</tr>
							
							<tr>
								<td>
									<input type="hidden" name="option1" value="<%=options%>">
									<input type="hidden" name="option1price" value="<%=option1price%>">
									<a style="float:right;">수량 <%=quantity%></a> <input type="hidden" name="quantity" value="<%=quantity%>">
								</td>				
							</tr>					
					<tr class="order_total_reslut"style="border-top: 1px solid #ccc;">
						<td colspan="5">
						<a>상품금액 </a> : <a><%=sellings%>원</a><a>배송비 </a> : <a><%=delivery_charge%>원</a>
						<a style="font-weight: bold;">총 결제 금액 </a> : <a>
						<input type="text" id="totalhpas" style="width:50px;border:none;font-weight: bold;color: #ae0000;" readonly>원</a>
						<input type="hidden" name="product_total" value="<%=sellings%>">
						<input type="hidden" name="delivery_total" value="<%=delivery_charge%>">
						<input type="hidden" id="totalhap" value="<%=totals%>">
						<input type="hidden" id ="totalhpass" name="total_money">
						</td>
					</tr>
					</table>
			</div>
		<!-- 결제 방법 체크 -->
		<script>
		chack_buy();
		hap();
		</script>
		<input type="hidden" name="lw_id" value="<%=id%>">
		<button type="submit">결제하기</button>
		</div>
		</form>
		</div>
	</div>
	<jsp:include page="../../community/community_footerinclude.jsp"></jsp:include>	
</body>
</html>
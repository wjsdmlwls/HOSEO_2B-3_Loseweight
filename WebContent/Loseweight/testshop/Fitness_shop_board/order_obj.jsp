<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import = "Fitnesshop.shopping_basket_DAO" %>
<%@ page import = "Fitnesshop.shopping_basket_DTO" %>
<%@ page import = "user.UserDAO"%>
<%request.setCharacterEncoding("utf-8");%>

<%
String[] lw_salesnum = request.getParameterValues("lw_salesnum2");
String[] product_name = request.getParameterValues("product_name");
String[] img0 = request.getParameterValues("img0"); 
String[] select_quantity = request.getParameterValues("select_quantity");
String[] options = request.getParameterValues("options");
String[] option1price = request.getParameterValues("option1price");
String[] selling_price = request.getParameterValues("total");
String[] delivery_charge = request.getParameterValues("delivery");

int product_total = Integer.parseInt(request.getParameter("product_total"));
int delivery_total = Integer.parseInt(request.getParameter("delivery_total"));
int total_hap = Integer.parseInt(request.getParameter("total_hap"));



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
	border-top: solid #ccc 1px;
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
</style>
</head>

<body>
		<div class="div_top">
			<div class="top_logo">
			<a href="/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp"><img style="position: absolute;width: 150px;height: auto;margin-top: 15px;" src="/2019_JeonJSP/Loseweight/img/footer_include/logo.png"></a>
			</div>
		</div>
		<%=lw_name%>
		<%=point%>
		<%=lw_phone%>
		<div class="order_body">
			<div class="order_title">
				<h3>주문/결제</h3>
			</div>
		<div class="order_board">
			<form method="post" action="order_pro.jsp">
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
			
				상품 <a><%=product_name[0]%></a>외 <%=product_name.length-1%>개.
					<input type="hidden" name="product_names"value="상품 개수<%=product_name[0]%>외 <%=product_name.length-1%>개 ">
					<%for(int i = 0; img0.length>i; i++){%>
					<div>
					
						<table>
							<tr>
								<td><%=lw_salesnum[i]%></td>
								<td><img src="<%=img0[i]%>" width="100px" height="100px"><input type="hidden" name="img0" value="<%=img0[0]%>">
								<input type="hidden" name="imgs" value="<%=img0[i]%>">
								<input type="hidden" name="lw_salesnum" value="<%=lw_salesnum[i]%>"></td>
								<td>제품<%=product_name[i]%> |<input type="hidden" name="product_name" value="<%=product_name[i]%>"></td>
								<td>상품 개수<%=select_quantity[i]%> | <input type="hidden" name="quantity" value="<%=select_quantity[i]%>"></td>
								<td>상품옵션 <%=options[i]%>|<input type="hidden" name="option1" value="<%=options[i]%>"><input type="hidden" name="option1price" value="<%=option1price[i]%>"></td>
								<td>상품가격<%=selling_price[i]%> + (<%=option1price[i]%>) |<input type="hidden" name="selling_price" value="<%=selling_price[i]%>"></td>
								<td>배송비 <%=delivery_charge[i]%> <input type="hidden" name="delivery_charge" value="<%=delivery_charge[i]%>"></td>
							</tr>
						</table>
				</div>
		
		<%} %>
		
		<div class="Payment_method"><h4>결제방법</h4>
		<input type="radio" name="payment" id="payment1" value="0" onclick="chack_buy()" checked>카드
		<input type="radio" name="payment" id="payment2" value="1" onclick="chack_buy()">계좌
		<!-- 계좌이체 -->
		<div id="d">
			<table>
				<tr><td>계좌이체 : 우리은행 1002 537 480416 전의진</td></tr>
				<tr><td> 상품:<%=product_total%>|배송비:<%=delivery_total%>|총 결제 금액:<%=total_hap%></td></tr>
				<tr><td>입금 계좌 : <input type="text" name="account"></td></tr>
				<tr><td>예금주 :   <input type="text" name="account_name"></td></tr>
			</table>
		</div>
		<!-- 카드 -->
		<div id="c">
			<table>
				<tr><td>카드사
					<input type="radio" name="cardname" value="BC" checked>BC
					<input type="radio" name="cardname" value="신한">신한
					<input type="radio" name="cardname" value="국민">국민
					<input type="radio" name="cardname" value="우리">우리
					<input type="radio" name="cardname" value="카카오">카카오
					<input type="radio" name="cardname" value="토스">토스
				</td></tr>
				<tr><td>
				카드번호 :  <input type="text"  name="cardnum1" id="cardnum1" maxlength="4" style="width:40px;" onkeyup="cardnumsum()"> - 
						 <input type="text" name="cardnum2" id="cardnum2" maxlength="4" style="width:40px;" onkeyup="cardnumsum()">
						- <input type="text"  name="cardnum3" id="cardnum3" maxlength="4" style="width:40px;" onkeyup="cardnumsum()"> - 
						 <input type="text" name="cardnum4" id="cardnum4" maxlength="4" style="width:40px;" onkeyup="cardnumsum()">
						 <input type="hidden" name="cardnum" id="rscardnum">
				</td></tr>
				<tr><td>Month / Year<br>
					<input type="text" maxlength="2" style="width:40px;" name="cardmonth">
					<input type="text" maxlength="2" style="width:40px;" name="cardyear">
				</td></tr>
				<tr><td>CVC<br>
					<input type="text" maxlength="3" style="width:40px;" name="cardcvc">
				</td></tr>
				<tr><td>
					비밀번호 앞자리<br>
					<input type="text" maxlength="2" style="width:20px;" name="cardpasswd">**
				</td></tr>
				<tr><td>상품 금액:<%=product_total%>
					<input type="hidden" name="product_total" value="<%=product_total%>">
				</td></tr>
				<tr><td>배송비:<%=delivery_total%>
					<input type="hidden" name="delivery_total" value="<%=delivery_total%>">
				</td></tr>
				<tr><td>총 결제 금액:<%=total_hap%>
					<input type="hidden" name="total_money" value="<%=total_hap%>">
				</td></tr>
		
		</table>
		</div>
		<table>
		 <tr><td><input type="text" name="lw_lpminor">마일리지 사용<br>
		 잔여 마일리지:<%=point%> 
		 <input type="hidden" name="lw_lp" value="<%=point%>">
		 </td></tr>
		</table>
		<!-- 결제 방법 체크 -->
		<script>
		chack_buy();
		</script>
		<input type="hidden" name="lw_id"value="<%=id%>">
		<button type="submit">결제하기</button>
		</div>
		
		</form>
		</div>
</div>
	<jsp:include page="../../community/community_footerinclude.jsp"></jsp:include>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import = "Fitnesshop.shopping_basket_DAO" %>
<%@ page import = "Fitnesshop.shopping_basket_DTO" %>
<%request.setCharacterEncoding("utf-8");%>
<%
/* String[] lw_salesnum =  request.getParameterValues("lw_salesnum");

int quantity = Integer.parseInt(request.getParameter("quantity"));  */

String[] product_name = request.getParameterValues("product_name");
String[] img0 = request.getParameterValues("img0"); 
String[] quantitys = request.getParameterValues("quantitys");
String[] options = request.getParameterValues("options");
String[] option1price = request.getParameterValues("option1price");

int product_total = Integer.parseInt(request.getParameter("product_total"));
int delivery_total = Integer.parseInt(request.getParameter("delivery_total"));
int total_hap = Integer.parseInt(request.getParameter("total_hap"));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
</script>
</head>

<body>


<%=product_name.length%>개의 제품을 구매하시려 합니다.

<%for(int i = 0; product_name.length>i; i++){%>

<div>
<table>
<tr><td><img src="<%=img0[i]%>" width="100px" height="100px"></td>
<td>제품 이름<%=product_name[i]%> |</td>
<td>상품 개수<%=quantitys[i]%> |</td>
<td>상품옵션 <%=options[i]%> + <%=option1price[i]%> </td></tr>
</table>
</div>

<%} %>

결제방법
<input type="radio" name="payment" id="payment1" value="0" onclick="chack_buy()" checked>카드
<input type="radio" name="payment" id="payment2" value="1" onclick="chack_buy()">계좌
<!-- 계좌이체 -->
<div id="d">
<table>
<tr><td>계좌이체 : 우리은행 1002 537 480416 전의진</td></tr>
<tr><td>총 결제 금액:<%=product_total%></td></tr>
<tr><td>입금 계좌 : <input type="text" name="account"></td></tr>
<tr><td>예금주 :   <input type="text" name="account_name"></td></tr>
</table>
</div>
<!-- 카드 -->
<div id="c">
<table>
<tr><td>카드 결제 입니다</td></tr>
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
<tr><td>상품 금액:<%=product_total%></td></tr>
<tr><td>배송비:<%=delivery_total%></td></tr>
<tr><td>총 결제 금액:<%=total_hap%></td></tr>
</table>
</div>
<input type="hidden" name="lw_salesnum">
<!-- 결제 방법 체크 -->
<script>
chack_buy();
</script>
</body>
</html>
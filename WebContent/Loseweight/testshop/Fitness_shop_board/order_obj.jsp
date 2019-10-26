<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import = "Fitnesshop.shopping_basket_DAO" %>
<%@ page import = "Fitnesshop.shopping_basket_DTO" %>
<%@ page import = "user.UserDAO"%>
<%request.setCharacterEncoding("utf-8");%>

<%
String[] num = request.getParameterValues("num");
String[] lw_salesnum = request.getParameterValues("lw_salesnum2");
String[] product_name = request.getParameterValues("product_name");
String[] img0 = request.getParameterValues("img0"); 
String[] select_quantity = request.getParameterValues("select_quantity");
String[] options = request.getParameterValues("options");
String[] option1price = request.getParameterValues("option1price");
String[] selling_price = request.getParameterValues("total");
String[] delivery_charge = request.getParameterValues("delivery");

String[] pointplus = request.getParameterValues("pointplus");


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
<link rel="stylesheet" href="order.css">
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
function chack_addr(){
	var addr_befor =  document.getElementById("addr_befor").checked;
	var addr_after =  document.getElementById("addr_after").checked;
	
	if(addr_befor == true){
		document.getElementById("addr_a").style.display='none';
		document.getElementById("addr_b").style.display='block';
		document.getElementById('Recipient_befor').name='Recipient';
		document.getElementById('lw_zipcode_befor').name='lw_zipcode';
		document.getElementById('lw_addr1_befor').name='lw_addr1';
		document.getElementById('lw_addr2_befor').name='lw_addr2';
		document.getElementById('Recipient').name='Recipient_after';
		document.getElementById('lw_zipcode').name='lw_zipcode_after';
		document.getElementById('lw_addr1').name='lw_addr1_after';
		document.getElementById('lw_addr2').name='lw_addr2_after';
		return false;
	}
	
	else if(addr_after == true){
		document.getElementById("addr_a").style.display='block';
		document.getElementById("addr_b").style.display='none';
		document.getElementById('Recipient_befor').name='Recipient_befor';
		document.getElementById('lw_zipcode_befor').name='lw_zipcode_befor';
		document.getElementById('lw_addr1_befor').name='lw_addr1_befor';
		document.getElementById('lw_addr2_befor').name='lw_addr2_befor';
		document.getElementById('Recipient').name='Recipient';
		document.getElementById('lw_zipcode').name='lw_zipcode';
		document.getElementById('lw_addr1').name='lw_addr1';
		document.getElementById('lw_addr2').name='lw_addr2';
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
	
	if(isNaN(num1)==true){
		alert('숫자만 입력해 주세요');
		document.getElementById("cardnum1").value="";
	}else if(isNaN(num2)==true){
		alert('숫자만 입력해 주세요');
		document.getElementById("cardnum2").value="";
	}else if(isNaN(num3)==true){
		alert('숫자만 입력해 주세요');
		document.getElementById("cardnum3").value="";
	}else if(isNaN(num4)==true){
		alert('숫자만 입력해 주세요');
		document.getElementById("cardnum4").value="";
	}
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
	var point =  document.getElementById("lw_lp").value;
	var hap3 = hap2-hap1;
	
	if(parseInt(hap1)>parseInt(point)){
		alert('LP가 부족합니다');
		document.getElementById("lw_lpminor").value=0;
		return false;
	}
	//마일리지 입력
	if(isNaN(hap1)==true){
		alert('숫자만 입력해 주세요');
		document.getElementById("lw_lpminor").value=0;
		return false;
	}
	document.getElementById("totalhpas").value=hap3;
	document.getElementById("totalhpass").value=hap3;	
}

function cardmy(){
	var m =  document.getElementById("cardmonth").value;
	var y =  document.getElementById("cardyear").value;
	
	
	if(isNaN(m)==true){
		alert('숫자만 입력해 주세요');
		document.getElementById("cardmonth").value="";
		return false;
	}else if(isNaN(y)==true){
		alert('숫자만 입력해 주세요');
		document.getElementById("cardyear").value="";
		return false;
	}
	
}

function cvc(){
	var num5 =  document.getElementById("cardcvc").value;
	if(isNaN(num5)==true){
		alert('숫자만 입력해 주세요');
		document.getElementById("cardcvc").value="";
		return false;
	}
}


function passwd(){
	var num6 =  document.getElementById("cardpasswd").value;
	if(isNaN(num6)==true){
		alert('숫자만 입력해 주세요');
		document.getElementById("cardpasswd").value="";
		return false;
	}
}

function gezaa(){
	var geza =  document.getElementById("geza").value;
	if(isNaN(geza)==true){
		alert('숫자만 입력해주세요');
		document.getElementById("geza").value="";
		return false;
	}
}

function tongpassd(){
	var tongpass =  document.getElementById("tongpass").value;
	if(isNaN(tongpass)==true){
		alert('숫자만 입력해주세요');
		document.getElementById("tongpass").value="";
		return false;
	}
}

function card(){
	var payment1 = document.getElementById("payment1");
	var payment2 = document.getElementById("payment2");
	//카드 유효성
	if(payment1.checked == true){
		var num1 =  document.getElementById("cardnum1").value;
		var num2 =  document.getElementById("cardnum2").value;
		var num3 =  document.getElementById("cardnum3").value;
		var num4 =  document.getElementById("cardnum4").value;
		var num5 =  document.getElementById("cardcvc").value;
		var num6 =  document.getElementById("cardpasswd").value;
		var m =  document.getElementById("cardmonth").value;
		var y =  document.getElementById("cardyear").value;
		
		if(num1.length<=3||num2.length<=3||num3.length<=3||num4.length<=3||
		   num1.length==""||num2.length==""||num3.length==""||num4.length==""){
			alert('카드번호가 전부 입력되지 않았습니다.');
			document.getElementById("cardnum1").value="";
			document.getElementById("cardnum2").value="";
			document.getElementById("cardnum3").value="";
			document.getElementById("cardnum4").value="";
			return false;
		}else if(y.length==""||m.length==""){
			alert('월/년 이 입력안된사항이있습니다.');
			return false;
		}else if(num5.length<=2||num5.length==""){
			alert('CVC가 전부 입력되지 않았습니다.');
			document.getElementById("cardcvc").value="";
			return false;
		}else if(num6.length==""){
			alert('카드 패스워드가 입력되지 않았습니다.');
			document.getElementById("cardpasswd").value="";
			return false;
		}
	}
	//계좌번호 유효성
	else if(payment2.checked == true){	
		var bank =  document.getElementById("bank").value;	
		var geza =  document.getElementById("geza").value;
		var dpdirname =  document.getElementById("dpdirname").value;
		var tongpass =  document.getElementById("tongpass").value;
	
		  if((bank=="신한" && geza.length != 11) && (bank=="신한" && geza.length != 12)) {
	            alert("계좌번호가 잘못되었습니다.");
	            return false;
	            document.getElementById("accountNumber").focus();   
	        }
	        //우리 13자리
	        else if(bank=="우리" && geza.length != 13){
	            alert("계좌번호가 잘못되었습니다.");
	            return false;
	            document.getElementById("accountNumber").focus();
	           
	        }
	        //농협 13자리
	        else if(bank=="농협" && geza.length != 13){
	            alert("계좌번호가 잘못되었습니다.");
	            return false;
	            document.getElementById("accountNumber").focus();	    
	        }
	        //국민 (구) 12자리 (신) 14자리
	        else if((bank=="국민" && geza.length != 12) && (bank=="국민" && geza.length != 14)) {
	            alert("계좌번호가 잘못되었습니다.");
	            return false;
	            document.getElementById("accountNumber").focus();    
	        }   
		  	//하나 은행 14자리
	        else if(bank=="하나" && geza.length != 14){
	            alert("계좌번호가 잘못되었습니다.");
	            return false;
	            document.getElementById("accountNumber").focus();
	        }
	       //IBK 은행 14자리
	        else if (bank=="ibk" && geza.length != 14){
	            alert("계좌번호가 잘못되었습니다.");
	            return false;
	            document.getElementById("accountNumber").focus();
	        }
	        else if(geza==""||geza==null){
	            alert("계좌번호를 입력해주세요");
	            return false;
	            document.getElementById("geza").focus();
	        }
	        else if(dpdirname==""||dpdirname==null){
	            alert("예금주를 입력해주세요.");
	            return false;
	            document.getElementById("dpdirname").focus();
	        }else if(tongpass==""||tongpass==null){
	            alert("계좌 비밀번호를 입력해주세요.");
	            return false;
	            document.getElementById("tongpass").focus();	           
	        }
	    }
}
//주소창
var openWin;
function openzipcode() {
	// window.name = "해당페이지로 가져옴 이름"; 
	window.name = "user_info";
	// window.open("open할 window", "자식창 이름", "팝업창 옵션");
	openWin = window.open("../../../zipfinder/zipSearch.jsp", "childForm",
			"width=580, height=500, resizable = no, scrollbars = yes");
}
</script>
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
			<form method="post" action="order_pro.jsp" onsubmit="return card();"> 
			<div class="by_my_info"><h4>구매자 정보</h4>
			<table class="shop_byinfomation">		
				<tr><th>이름</th><td><a class="myinfo"><%=lw_name%></a></tr>
				<tr><th>이메일</th><td><a class="myinfo"><%=lw_email1%>@<%=lw_email2%></a></td></tr>
				<tr><th>휴대폰번호</th><td><a class="myinfo"><%=lw_phone%></a></td></tr>
					
				</table>
			</div>
			<div class="pick_up"><h4>수령지</h4>
			<table class="shop_byinfomation">
			<Tr>	
				<th>배송지</th>
				<td>
					<input type="radio" name="addr_select" id="addr_befor" value="0" onclick="chack_addr()" checked>기존 배송지
					<input type="radio" name="addr_select" id="addr_after" value="1" onclick="chack_addr()">신규 배송지
				</td>	
			</Tr>
			</table>
			<input type="hidden" id="lw_zipcode_befor" name="lw_zipcode" value="<%=lw_zipcode%>">
			<input type="hidden" id="lw_addr1_befor"  name="lw_addr1" value="<%=lw_addr1%>"readonly>
			<input type="hidden" id="lw_addr2_befor" name="lw_addr2" value="<%=lw_addr2%>"readonly>
			<input type="hidden" id="Recipient_befor" name="Recipient" value="<%=lw_name%>" >
			<div id="addr_b">
				
			<table class="shop_byinfomation2">
				<tr><th>이름</th><td><a class="myinfo"><%=lw_name%></a><input class="myinfo" type="hidden" name="Recipient" value="<%=lw_name%>" readonly></td></tr>
				<tr><th>주소</th><td><a class="myinfo"><%=lw_addr1%> <%=lw_addr2%>(<%=lw_zipcode %>)</a></td></tr>
				<tr><th>연락처</th><td><a class="myinfo"><%=lw_phone%></a></td></tr>
				
				</table>
			</div>
			<div id="addr_a" style="display:none">
			<table class="shop_byinfomation2">
				<tr><th>이름</th><td><input id="Recipient" name="Recipient_after" value="<%=lw_name%>"></td></tr>
				<tr><th>우편번호</th><td><input id="lw_zipcode"name="lw_zipcode_after" value="<%=lw_zipcode%>"><button class="button salmon button_addr" type="button"onclick="openzipcode()">주소검색</button></td></tr>
				<tr><th>주소</th><td>	<input id="lw_addr1"name="lw_addr1_after" value="<%=lw_addr1%>"></td></tr>
				<tr><th>상세주소</th><td><input id="lw_addr2"name="lw_addr2_after" value="<%=lw_addr2%>"></td></tr>
				<tr><th>연락처</th><td><input value="<%=lw_phone%>"></td></tr>
				</table>
			</div>
			
			
				
			</div>
			
		<input type="hidden" name="product_total" value="<%=product_total%>">
		<input type="hidden" name="delivery_total" value="<%=delivery_total%>">
		<input type="hidden" id ="totalhpass" name="total_money" >

		
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
				<tr><th>실시간 계좌이체</th><td>우리은행 1002 537 480416 전의진</td></tr>
				<tr><th>입금 계좌 </th><td><input id="geza" type="text" name="account" onkeyup="gezaa();">
				<select id="bank">
				<option value="신한">신한은행</option>
				<option value="국민">국민은행</option>
				<option value="우리">우리은행</option>
				<option value="하나">하나은행</option>
				<option value="농협">농협</option>
				<option value="ibk">IBK기업은행</option>	
				</select>
				</td></tr>
				<tr><th>통장 비밀번호</th><td><input type="text" id="tongpass" name="tongpass" maxlength="5" style="width:40px;" onkeyup="tongpassd();"></td></tr>
				<tr><th>예금주</th><td><input type="text" id="dpdirname" name="account_name" maxlength="5" style="width:40px;"></td></tr>
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
						<input type="text" maxlength="2" style="width:40px;border:none;
						border-bottom: 1px solid #ccc;" id="cardmonth" name="cardmonth" onkeyup="cardmy()"><a style="margin-left: 5px;margin-right: 5px;">/</a>
						<input type="text" maxlength="2" style="width:40px;border:none;
						border-bottom: 1px solid #ccc;" id="cardyear" name="cardyear" onkeyup="cardmy()">
					</td>
				</tr>
				<tr>
					<th>CVC</th>
					<td>
						<input type="text" id="cardcvc" maxlength="3" style="width:40px;" name="cardcvc" onkeyup="cvc();">
					</td>
				</tr>
				<tr>
					<th>비밀번호 앞자리</th>
					<td>
						<input type="text" id="cardpasswd" maxlength="2" style="width:20px;" name="cardpasswd" onkeyup="passwd();">**
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

				 	<input type="text" style="width: 100px; margin-right:10px;" id="lw_lpminor" name="lw_lpminor" onkeyup="hap();" value="0">
				 	LP (<a style="font-weight:bold">사용가능한 LP:<%=point%></a>)<br>

				 	<input type="hidden" id="lw_lp" name="lw_lp" value="<%=point%>">
				 </td>
			 </tr>
		</table>
		<div class="order_product"><h4>상품 <a><%=product_name[0]%></a>외 <%=product_name.length-1%>개</h4>
					<input type="hidden" name="product_names"value="상품 개수<%=product_name[0]%>외 <%=product_name.length-1%>개 ">
					<table class="order_product_table">
					<thead>
						<tr> 
						      <td colspan="2" width="800">상품정보</td>
						      <td width="100">상품금액</td>  
						      <td width="100">배송비</td>
						</tr>
					</thead>

					<%int points = 0; %>
					<%for(int i = 0; img0.length>i; i++){%>
						<%points = points+Integer.parseInt(pointplus[i])*Integer.parseInt(select_quantity[i]); %>
							<tr style="border-top: 1px solid #ccc;">
								<td rowspan="2" width="120px"><img src="<%=img0[i]%>" width="100px;" height="80px"><input type="hidden" name="img0" value="<%=img0[0]%>">

								<input type="hidden" name="imgs" value="<%=img0[i]%>">
								<input type="hidden" name="lw_salesnum" value="<%=lw_salesnum[i]%>"></td>
								<input type="hidden" name="num" value="<%=num[i]%>" readonly>
								<td style="border-bottom: 1px solid #ccc;"><a style="font-size:15px; font-weight:bold;"><%=product_name[i]%></a><a style="color:#ccc;font-size:12px;">(<%=options[i]%>)</a> <input type="hidden" name="product_name" value="<%=product_name[i]%>"></td>
								<td rowspan="2" style="text-align: center;border-left: solid 1px #ccc;"><%=selling_price[i]%><input type="hidden" name="selling_price" value="<%=selling_price[i]%>">원</td>
								<td rowspan="2" style="text-align: center;border-left: solid 1px #ccc;"><%=delivery_charge[i]%><input type="hidden" name="delivery_charge" value="<%=delivery_charge[i]%>">원</td>
							</tr>
							
							<tr>
								<td>
									<input type="hidden" name="option1" value="<%=options[i]%>">
									<input type="hidden" name="option1price" value="<%=option1price[i]%>">
									<a style="float:right;">수량 <%=select_quantity[i]%></a> <input type="hidden" name="quantity" value="<%=select_quantity[i]%>">
								</td>				
							</tr>
					<%} %>

					
					<input type="hidden" name="pluspoint" value="<%=points%>"><br>
					<tr class="order_total_reslut"style="border-top: 1px solid #ccc;">
						<td colspan="5">
						<a>상품금액 </a> : <a><%=product_total%>원</a><a>배송비 </a> : <a><%=delivery_total%>원</a>
						<a style="font-weight: bold;">총 결제 금액 </a> : <a>
						<input type="text" id="totalhpas" name="total_money" style="width:50px;border:none;font-weight: bold;color: #ae0000;" readonly>원</a>
						<input type="hidden" id="totalhap" value="<%=total_hap%>">

						</td>
					</tr>
					</table>
			</div>
		<!-- 결제 방법 체크 -->
		<script>
		chack_buy();
		hap();
		maxpoint();
		</script>
		<input type="hidden" name="lw_id"value="<%=id%>">  
		<div style="text-align: center;margin: 30px;">
			<a href="/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp"><input class="shopping_btn"type="button" value="계속 쇼핑하기"></a>
			<button type="submit" class="by_btn">결제하기</button>
		</div>
		</div>
		
		</form>
		</div>
</div>
	<jsp:include page="../../community/community_footerinclude.jsp"></jsp:include>	
</body>
</html>
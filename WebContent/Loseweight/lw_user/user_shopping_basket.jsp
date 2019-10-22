<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,user.UserDAO"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "Fitnesshop.shopping_basket_DAO" %>
<%@ page import = "Fitnesshop.shopping_basket_DTO" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%!int pageSize = 9;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");%>

<%
	// 세션정보 가져오기
	try {
		String id = (String) session.getAttribute("id");

		Statement stmt=null;
		Connection con=null;
		String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
		String dbId="lw_admin";
		String dbPass="3whakstp";
		
		UserDAO db = new UserDAO();
		Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		stmt=conn.createStatement();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM lw_users WHERE lw_id = ?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		
		int pageSize = 10;
	    String pageNum = request.getParameter("pageNum");

	    if (pageNum == null) {
	        pageNum = "1";
	    }
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage-1) * pageSize  ;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number = 0;
	    List<shopping_basket_DTO> articleList = null; 
	    
		
		jekimDB usedb = new jekimDB();
		
		usedb.connect();

		String listsql1="select count(*) from shopping_basket where lw_id like '"+id+"' ";
		ResultSet listrs = stmt.executeQuery(listsql1);
		String listsql2="select * from shopping_basket where lw_id like '"+id+"' ";
		ResultSet listsearchresult = usedb.resultQuery(listsql2);
	%>	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
</head>
<!-- stlye css -->
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="vcheck.js">
	
</script>
<script type="text/javascript">
	var openWin;
	function openzipcode() {
		// window.name = "해당페이지로 가져옴 이름"; 
		window.name = "user_info";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("../../zipfinder/zipSearch.jsp", "childForm",
				"width=580, height=500, resizable = no, scrollbars = yes");
	}
	
	
	function  DeleteProcess(f){
		f.action="shopping_basketDelete_Pro.jsp";
	    f.submit();      
	    
	}
	
</script>

<style>
.user_shopping_baskettable{
	margin:0 auto;
	width: 1000px;
	text-align:center;
}
.user_shopping_baskettable thead{
background:#f9f9f9;
}
.user_shopping_baskettable thead tr{
	height:40px;
	border-top:solid #ccc 1px;
	border-bottom:solid #ccc 1px;
}
.user_shopping_baskettable tbody tr{
	height:60px;	
	border-bottom:solid #ccc 1px;
}
.delete_check{
margin: 0 20px;
}
.basket_img{
margin: 0 20px;
width: 80px;
height: auto;
}
.selling{
border-left:solid #ccc 1px;
border-right:solid #ccc 1px;
}
.selling{
border-left:solid #ccc 1px;
border-right:solid #ccc 1px;
}
.delivery{
border-left:solid #ccc 1px;
}


.break_basket{
	background: #fff;
    border: solid 1px #000;
    width: 23px;
    text-align: center;
    float:right;
    margin-right: 10px;
}
.product_name{
font-weight:bold;
font-size: 20px;
}
.option{
margin-left: 5px;
font-size: 12px;

}
.basket_pricersultbox{
	margin: 50 auto;
    width: 1000px;
    border: solid 4px #afafaf;
    text-align: center;
    padding: 20 20 20 20;
}
.basket_result{
    display: inline;
}
.basket_pricersultinputbox{
	border: none;
    width: 100px;
    font-size: 24px;
    color: #00aa;
	font-weight:bold;;
    text-align:right;
}

.quantity_input{
}
.selling_input{
	border: none;
    width: 80px;
    font-size: 18px;
    text-align:right;
}
.total_input{
	border: none;
    width: 80px;
    font-size: 18px;
    text-align:center;
}
.delivery_input{
	border: none;
    width: 80px;
    font-size: 18px;
    text-align:center;	
}
.shopping_btn{
	font-size: 22px;
    font-weight: 700;
    display: inline-block;
    position: relative;
    width: 216px;
    line-height: 18px;
    border: 2px solid #aba0a0;
    border-radius: 4px;
    padding: 22px 0 19px;
    text-align: center;
    background: #fff;
}
.by_btn{
	font-size: 22px;
    font-weight: 700;
    display: inline-block;
    position: relative;
    width: 216px;
    line-height: 18px;
    border: 2px solid #aba0a0;
    border-radius: 4px;
    padding: 22px 0 19px;
    text-align: center;
    background: #aba0a0;
    color: #fff;
}

</style>

<!-- 주소 end -->
<body>
	<div class="div_body">
		<jsp:include page="../community/community_topinclude.jsp" >
			<jsp:param name="tom" value="6"/>
			<jsp:param name="toc" value="0"/>
			<jsp:param name="imgs" value="byshoping.png"/>
			<jsp:param name="boardname" value="장바구니"/>
		</jsp:include>
		</div>
		
			<form method="post" action="/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/order_obj.jsp" style="margin-top: 50px;">
		<table class="user_shopping_baskettable">
		<thead>
		   		 <tr>
				      <td width="100"></td> 
				      <td width="100"></td> <!-- imge -->
				      <td width="500">상품정보</td>
				      <td width="100">상품금액</td>  
				      <td width="100">배송비</td>
					</tr>
		    </thead>
			<%
					if(listsearchresult.next()){
						int i=0;
						int totalprice=0;
								do{
									String num=listsearchresult.getString("num");
								int lw_salesnum=listsearchresult.getInt("lw_salesnum");
								String product_name=listsearchresult.getString("product_name");	
								String img0=listsearchresult.getString("img0");			
								int cost=listsearchresult.getInt("cost");
								int quantity=listsearchresult.getInt("quantity");
								int delivery_charge=listsearchresult.getInt("delivery_charge");
								Timestamp reg_date=listsearchresult.getTimestamp("reg_date");	
								String option1=listsearchresult.getString("option1");			
								int option1price=listsearchresult.getInt("option1price");	
								int selling_price=listsearchresult.getInt("selling_price")+option1price;
								int select_quantity=listsearchresult.getInt("select_quantity");
								int pointplus=listsearchresult.getInt("pointplus");
								i=i+5;
				%>		
				<script language='javascript'>
									function maxquantitys<%=i%>(){
						
						var max = document.getElementById("quantitys<%=i%>").textContent;
						var maxs = parseInt(max);
						var maxt = document.getElementById("quantity<%=i%>").value;
						var maxx = parseInt(maxt);
						
						if(max<maxx){
							
							alert("주문량이 현재 제고량보다 많습니다.");
							 document.getElementById("total_hap").value=parseInt(document.getElementById("product_total").value)-parseInt(document.getElementById("total<%=i%>").value);
							 document.getElementById("total_hap").value=parseInt(document.getElementById("product_total").value)-parseInt(document.getElementById("total<%=i%>").value);
							 document.getElementById("product_total").value=parseInt(document.getElementById("product_total").value)-parseInt(document.getElementById("total<%=i%>").value);
							 document.getElementById("delivery_total").value=parseInt(document.getElementById("delivery_total").value)-parseInt(document.getElementById("delivery<%=i%>").value);
							 document.getElementById("quantity<%=i%>").value=0;
							 document.getElementById("total<%=i%>").value=0;	 
							return false;
						}
					}

					var one<%=i%> = true;
						function basketplus<%=i%>(){
							   if(document.getElementById("quantity<%=i%>").value =="0"){
							 document.getElementById("total_hap").value=parseInt(document.getElementById("product_total").value)-parseInt(document.getElementById("total<%=i%>").value);
							 document.getElementById("product_total").value=parseInt(document.getElementById("product_total").value)-parseInt(document.getElementById("total<%=i%>").value);
							 document.getElementById("delivery_total").value=parseInt(document.getElementById("delivery_total").value)-(parseInt(document.getElementById("delivery<%=i%>").value));
							 one<%=i%> = true;
							   }
							   if(document.getElementById("quantity<%=i%>").value !="0"){
									 document.getElementById("total_hap").value=parseInt(document.getElementById("product_total").value)-parseInt(document.getElementById("total<%=i%>").value);
									 document.getElementById("product_total").value=parseInt(document.getElementById("product_total").value)-parseInt(document.getElementById("total<%=i%>").value);
									 if (one<%=i%>){
										 one<%=i%> = false;
									 document.getElementById("delivery_total").value=parseInt(document.getElementById("delivery_total").value)+parseInt(document.getElementById("delivery<%=i%>").value);
									
									 }
									   }
							   
							   if(document.getElementById("selling<%=i%>").value && document.getElementById("quantity<%=i%>").value){
						  document.getElementById("total<%=i%>").value = parseInt(document.getElementById("selling<%=i%>").value) * parseInt(document.getElementById("quantity<%=i%>").value);
						  document.getElementById("total_sub<%=i%>").value = document.getElementById("total<%=i%>").value
						  document.getElementById("delivery_total").value=parseInt(document.getElementById("delivery_total").value);
						  document.getElementById("product_total").value=parseInt(document.getElementById("total<%=i%>").value)+parseInt(document.getElementById("product_total").value);
						  document.getElementById("total_hap").value=parseInt(document.getElementById("product_total").value)+parseInt(document.getElementById("delivery_total").value);
						  }
						}

						$(function () {

						 var idval = $('#quantityss<%=i%>');

						   $('#quantity<%=i%>').change(function(){

						        var element = $(this).find('option:selected'); 

						        var myTag = element.attr('cost_value<%=i%>'); 

						         idval.val(myTag);
						   });
						});
			</script>
				<tr>
					<td rowspan="2" colspan="2">
					<%if (img0.equals("null")){%>
						<img class="basket_img" src="/2019_JeonJSP/Loseweight/img/logo/logo_BY.png" >
				    <%}else{%>			    
				    	<img class="basket_img" name="img0" src="<%=img0%>">
				    	 <input type="hidden" name="img0" value="<%=img0%>">
				    <%}%>
				    </td>
			    <td style="text-align: left;"><a class="product_name"><%=product_name%></a>
			    <input type="hidden" name="product_name" value="<%=product_name%>">
			    
			    <a class="option<%=i%>"><%=option1%></a>
			    <input type="hidden" name="options" value="<%=option1%>">
			     <input type="hidden" name="option1price" value="<%=option1price%>">
			    <input type="submit" class="break_basket" value="X" onClick="DeleteProcess(this.form); writeSave();"></td>
			    <td rowspan="2" class="selling">
			    <input type="text" class="total_input" readonly name="total<%=i%>" id="total<%=i%>" value=0>원</td><!-- 개수+가격=총가격  -->
			    
			    <td rowspan="2" class="delivery"><%if(delivery_charge!=0){ %><input class="delivery_input"type="text" id="delivery<%=i%>"name="delivery<%=i%>"value="<%=delivery_charge%>"readonly>원<%
			    }else{ %>무료<input type="hidden" id="delivery<%=i%>" name="delivery<%=i%>"value="0"readonly><%} %></td>	<!-- 배송비  -->
			</tr>    	
			<tr>
				<td style="text-align: right;">
					<input class="selling_input" id="selling<%=i%>"name="selling<%=i%>"onkeyup='basketplus<%=i%>()'value="<%=selling_price%>"readonly>원<!-- 판매가격  -->
					<select class="quantity_input"id="quantity<%=i%>" name="quantity<%=i%>" value="1" onchange="basketplus<%=i%>(); maxquantitys<%=i%>();sum(this.value);">
						<option value="<%=select_quantity %>" cost_value<%=i%>="<%=select_quantity %>"selected><%=select_quantity%></option>
						<option value="1" cost_value<%=i%>="1">1</option>
						<option value="2" cost_value<%=i%>="2">2</option>
						<option value="3" cost_value<%=i%>="3">3</option>
						<option value="4" cost_value<%=i%>="4">4</option>
						<option value="5" cost_value<%=i%>="5">5</option>
						<option value="6" cost_value<%=i%>="6">6</option>
						<option value="7" cost_value<%=i%>="7">7</option>
						<option value="8" cost_value<%=i%>="8">8</option>
						<option value="9" cost_value<%=i%>="9">9</option>
					</select><!-- 수량  -->
					<input type="hidden" name="select_quantity" id="quantityss<%=i%>">
				</td>
			</tr>
			<tr style="display:none;">
				<td>
				
					<span id="quantitys<%=i%>" ><%=quantity%></span>
					<input name="num" value="<%=num%>">	
					<input name="lw_salesnum" value="<%=lw_salesnum%>">
					<input name="pointplus" value="<%=pointplus%>">
					<input type="hidden" name="lw_salesnum2" value="<%=lw_salesnum%>">
						
					<input type="hidden" name="total" id="total_sub<%=i%>" value="0">
					<input type="hidden" name="delivery" value="<%=delivery_charge%>">
				</td>
			</tr>
		<%
			}while(listsearchresult.next());
		%>
		<%}else{ %>
		<Tr><td colspan=9><h4 style="padding: 200;"><%=id %>님 담은 물건이 없습니다 ^^</h4></td></Tr>
		<%} %>
		
		</table>
		
		<div class="basket_pricersultbox">
		
		<h4 class="basket_result">총 상품가격 </h4><input type="text"  class="basket_pricersultinputbox" name ="product_total" id="product_total" value=0 readonly><h4 class="basket_result">원</h4>
		<h4 class="basket_result">총 배송비 </h4> <input type="text" class="basket_pricersultinputbox" name="delivery_total" id="delivery_total" value=0 readonly><h4 class="basket_result">원</h4>
		<h4 class="basket_result">총 주문금액</h4><input type="text" class="basket_pricersultinputbox" style="color:#ae0000" name="total_hap" id="total_hap" value=0 readonly><h4 class="basket_result">원</h4>
		</div>
	
		
		<div style="width: 1000px;margin: 0 auto;text-align: center;">
		<a href="/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp"><input class="shopping_btn"type="button" value="계속 쇼핑하기"></a>
		<button class="by_btn"type="submit">구매하기</button>
		</div>
		</form>
		<%}catch (Exception e) {
				e.printStackTrace();
			}
		%>
		
		<jsp:include page="../community/community_footerinclude.jsp" ></jsp:include>	
</body>
</html>
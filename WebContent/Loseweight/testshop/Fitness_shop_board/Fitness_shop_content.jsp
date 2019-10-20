<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,user.UserDAO"%>

<%@ page import="java.io.File" %>
<%@ page import = "Fitnesshop.Fitnesshop_DAO" %>
<%@ page import = "Fitnesshop.Fitnesshop_DTO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page language="java" import="java.net.InetAddress" %>
<% request.setCharacterEncoding("utf-8");%>
<%
     		String imgs =request.getParameter("abc"); //경로 
               	String name =request.getParameter("abd"); //파일이름
               
          		String directory = application.getRealPath("/img/");
          		String files[] = new File(directory).list();
       		
     			Fitnesshop_DAO stars = Fitnesshop_DAO.getInstance(); 
				int starcount = stars.starcount(); %>
<%!//댓글기능 date에도 사용 
    int pageSize = 10;
    SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
				String id= null;
				if(session.getAttribute("id")!=null){
					id=(String)session.getAttribute("id");
					}else{
					id=""; 
					}	

    		PreparedStatement pstmt = null;
            ResultSet rs = null;
            Connection conn = null;
            try {
            
            
            String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
        	String dbId="lw_admin";
        	String dbPass="3whakstp";
        	
            UserDAO db= new UserDAO();
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
         
            
            String sql = "SELECT * FROM lw_users WHERE lw_id = ?";
         
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();

	//content load
   int lw_salesnum = Integer.parseInt(request.getParameter("lw_salesnum"));
   String pageNum = request.getParameter("pageNum");

	int pageSize = 10;
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1) * pageSize  ;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	 
	SimpleDateFormat sdf = 
    	new SimpleDateFormat("yyyy-MM-dd");
	//댓글 date양식

   try{
	   Fitnesshop_DAO dbPro = Fitnesshop_DAO.getInstance(); 
	   Fitnesshop_DTO article =  dbPro.getArticle(lw_salesnum);
       count = dbPro.getArticleCount(); 
	  
	//reply search
	jekimDB usedb = new jekimDB();
	usedb.connect();
	Statement stmt=null;
	Connection con=null;
	con=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	stmt=con.createStatement();
	
	String replylistsql1="select count(*) from fitness_shop_re where lw_salesnum="+article.getLw_salesnum()+"";
	ResultSet rs2 = stmt.executeQuery(replylistsql1);
	String replylistsql2="select * from fitness_shop_re where lw_salesnum="+article.getLw_salesnum()+"";
	ResultSet replylist = usedb.resultQuery(replylistsql2);
	//댓글 개수 확인후 개수만큼 select문 뿌려주려고함
	
    number = count-(currentPage-1)*pageSize;
	if(rs2.next()){ rs2.getInt(1); } rs2.close();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="/2019_JeonJSP/Loseweight/js/jquery.slim.min.js"></script>
<script src="/2019_JeonJSP/Loseweight/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="Fitness_shop_content_css.css">
</head>
<!-- stlye css -->
<link rel="stylesheet" href="../../css/style.css">
<script type="text/javascript">

//form 두개 사용 
$(function() {
	$(".replyedit").on("click", function() {
		$(this).parent().prev().children(".replyeditleft1").css({"display": "none","position":"absolute"});
		$(this).parent().prev().children(".replyeditleft2").css({"display": "block"});
		$(this).parent().prev().children(".replyeditleft2").attr('name','recontent2');
		$(this).parent().prev().children(".replyedit_submit").css({"display": "block"});
		$(this).parent().prev().children(".glenumname").attr('name','glenumpost');
		$(this).css({"display":"none"});
		$(this).next(".replydelete").css({"display":"none"});
		$(this).next().next(".replycancel").css({"display":"block"});
	});
	$(".replycancel").on("click", function() {
		$(this).parent().prev().children(".replyeditleft1").css({"display": "block","position":"relative"});
		$(this).parent().prev().children(".replyeditleft2").css({"display": "none"});
		$(this).parent().prev().children(".replyeditleft2").attr('name','');
		$(this).parent().prev().children(".replyedit_submit").css({"display": "none"});
		$(this).parent().prev().children(".glenumname").attr('name','');
		$(this).prev().prev(".replyedit").css({"display":"inline"});
		$(this).prev(".replydelete").css({"display":"inline"});
		$(this).css({"display":"none"});
	});
	$(".replydelete").on("click", function() {
		$(this).parent().prev().children(".glenumname").attr('name','glenumpost');
	});
	
});
function  sendProcess(f){
	f.action="Fitness_shop_replyedelete.jsp";
    f.submit();      
    
}
function  sendedit(f){
	f.action="Fitness_shop_replyedit.jsp";
    f.submit();      
    
}
function myFunction(str){

    document.getElementById("option_value").innerHTML=('<span style="color:red;font-size:12px;">'+str+'</span>');
}
function sum(count){
	
	var option_value = document.getElementById("option_value").textContent;
	if(option_value==""){
		option_value=0;
	}
	var optionFormat = parseInt(option_value);
	var price = document.getElementById("price2").textContent;
	var priceFormat = parseInt(price);

	
	var total = (count * optionFormat) + (count * priceFormat);
	document.getElementById("total_price").textContent = total;
	document.getElementById("post_total_price").value = total;
	
}

function maxquantitys(){
	
	var max = document.getElementById("quantitys").textContent;
	var maxs = parseInt(max);
	var maxt = document.getElementById("quantity").value;
	var maxx = parseInt(maxt);
	if(max<maxx){
		alert("재고량보다 많은 수 를 입력하셨어요^^");
		 document.getElementById("quantity").value=0;
		 document.getElementById("select_quantity").value=0;
		return false;
	}
	else{
		document.getElementById("select_quantity").value=document.getElementById('quantity').value
	}
}
function setValues(){
	   var sh = document.getElementById("option1price");
	   var soption = document.getElementById("select_option1");   
	   var soptionprice = document.getElementById("select_option1price");   
	   soption.value = sh.options[sh.selectedIndex].text;   
	   soptionprice.value = $("#option1price option:selected").val(); 
	}
function basket_check(){
	var obj = document.basketforms;
	var con = document.concheck;
	if(obj.img0.value=="null"){
		alert("상품 이미지가 없습니다");
		return false;
	}else if(con.quantity.value==0){
		alert("수량을 입력해 주세요");
		return false;
	}else if(obj.option1.value==""){
		alert("옵션을 선택해주세요");
		return false;
	}
	
}

$( document ).ready( function() {
	var jbOffset = $( '.shop_contents' ).offset(); /*여기가 스크롤 다운시 base가 됨*/
		$( window ).scroll( function() {
		if ( $( document ).scrollTop() > jbOffset.top ) {
			$( '.shop_contents' ).addClass( 'shopsub_in_menuFixed' );
			$( '.submenu1' ).addClass( 'shop_submenu_select' );
			}
	else {
		$( '.shop_contents' ).removeClass( 'shopsub_in_menuFixed' );
		$( '.submenu1' ).removeClass( 'shop_submenu_select' );
		}
	});
	} );
	
	$(window).scroll(function() { 
		var scroll = $(window).scrollTop();
		//console.log(scroll);
		if (scroll >= 3000) {
			//console.log('a');
			$(".shop_contents").addClass(".shopsub_in_menuFixed");
			} else {
		}
	});
	
	$( document ).ready( function() {
		var jbOffset = $( '.reply_contents' ).offset(); /*여기가 스크롤 다운시 base가 됨*/
			$( window ).scroll( function() {
			if ( $( document ).scrollTop() > jbOffset.top ) {
				$( '.submenu1' ).removeClass( 'shop_submenu_select' );
				$( '.submenu2' ).addClass( 'shop_submenu_select' );
				}
		else {
			$( '.submenu2' ).removeClass( 'shop_submenu_select' );
			}
		});
		} );
	
	$( document ).ready( function() {
		var jbOffset = $( '.product-etc' ).offset(); /*여기가 스크롤 다운시 base가 됨*/
			$( window ).scroll( function() {
			if ( $( document ).scrollTop() > jbOffset.top ) {
				$( '.submenu2' ).removeClass( 'shop_submenu_select' );
				$( '.submenu3' ).addClass( 'shop_submenu_select' );
				}
		else {
			$( '.submenu3' ).removeClass( 'shop_submenu_select' );
			}
		});
		} );
		
	
</script>
	<style>
.shop_submenu_select{
	    border-bottom: none;
    background: #eee;
}
	</style>
<body>
<div class="div_body">
		<jsp:include page="../../community/community_topinclude.jsp" >
				<jsp:param name="tom" value="5"/>
				<jsp:param name="toc" value="0"/>
				<jsp:param name="imgs" value="shop.png"/>
				<jsp:param name="boardname" value="기구"/>
		</jsp:include>

		<div style='width: 100%;'>
			<div class="div_sidecontents" >
					<div class="mypage_form">
				<div style="margin:0 auto;margin-top:5%;width:1000px;margin-bottom:30px;">
				
				<!--썸네일 이미지 및 상품 이미지 -->			
				<div>
				<div class="someimg" style="background-image:url('<%=article.getImg0()%>');"></div>
				
				<!-- 오른쪽 박스 -->
				<form name="concheck" onsubmit="return basket_check();">
				<div class="content_ttt">
				<!-- <p>등록 날짜: <%=sdf.format(article.getWrite_date())%></p> -->
				<p style="font-size: 16px; color: #555555;"><%=article.getProduct_name()%></p>
				<p style="font-size: 12px;color: #aaaaaa;border-bottom: 1px solid #e8e8e8; padding-bottom: 13px;">
				<%if(article.getProduct_contents()==null){}else{%>
				<%} %>
				</p>
					<ul class="price01">
						<li>
							<p><span>원가</span></p><span style="text-decoration:line-through;"><%=article.getCost()%></span>
						</li>
						<li>
							<p><span>할인가</span></p><span id="price2"><strong><%=article.getSelling_price()%></strong> <a style="color:red;"><%=article.getReduced_price()%>%</a></span>
						</li>
						<li>
							<p><span>적립금</span></p><span><%=article.getPointplus()%>LP</span>
						</li>
						<li>
							<p><span>배송비</span></p><span><strong><%if(article.getDelivery_charge()==0){%>무료				
							<%}else{%><%=article.getDelivery_charge()%>원<%} %></strong></span>
						</li>
						<li style="border-bottom: 1px solid #e8e8e8;margin-bottom:30px;"></li>
						<li>
							<p><span>재고량</span></p><span id="quantitys"><%=article.getQuantity()%></span>
						</li>
						<li>
							<p><span>수량</span></p><span><input type="text" id="quantity" name="quantity" size="3" onchange="maxquantitys();sum(this.value);" value="0"></span>
						</li>
						<li>
							<p>
							<span><select style="height:30px; width:300px;"name="option1price" id="option1price" onchange="myFunction(this.value); setValues();" onmouseup="sum(quantity.value)">
    			<option value="" selected="selected" >옵션 선택</option>
    			<%if(article.getOption1()!=null){%>
    			<option value="<%=article.getOption1price()%>"><%=article.getOption1()%></option>
    			<%}else{} %>
    			<%if(article.getOption2()!=null){%>
    			<option value="<%=article.getOption2price()%>"><%=article.getOption2()%></option>
    			<%}else{} %>
    			<%if(article.getOption3()!=null){%>
    			<option value="<%=article.getOption3price()%>"><%=article.getOption3()%></option>
    			<%}else{} %>
				</select></span></p>
						</li>
						<li style="margin-top:10px;">
							<p><span>추가 금액</span></p><strong><span id="option_value"></span></strong>
						</li>
						<li style="border-bottom:2px solid #e8e8e8;margin-bottom:30px;margin-top:10px;"></li>
						<%if(article.getQuantity()==0){ %>
						<li style="margin-top:10px;">
							<p style="font-size:30px ;text-align:center; color:red;"><strong>일시 품절</strong></p>
						</li>
						<%}else{%>
						<li>
							<p><span>결제 금액</span></p><strong><span id="total_price"></span>
							<input type="hidden" name="total" id="post_total_price"></strong>
						</li>
					</ul>
			</form>
		<form method="post" name="basketforms" class="basket_form"  onsubmit="return basket_check();" action="shopping_basket_Pro.jsp">
		<input name="link"value="/2019_JeonJSP/Loseweight/testshop/Fitness_shop_content.jsp?lw_salesnum =<%=lw_salesnum%>&pageNum=<%=currentPage%>">
		<input name="lw_salesnum" value="<%=article.getLw_salesnum()%>">
		<input name="lw_id" value="<%=id%>">
		<input type="text" id="select_option1" name="option1">
		<input type="text" id="select_option1price" name="option1price">
		<input name="quantity" value="<%=article.getQuantity()%>">
		<input id="select_quantity" name="select_quantity" value="">
		<input name="img0" value="<%=article.getImg0()%>">
		<input name="cost" value="<%=article.getCost()%>">
		<input name="selling_price" value="<%=article.getSelling_price()%>">
		<input name="reduced_price" value="<%=article.getReduced_price()%>">
		<input name="big_category" value="<%=article.getBig_category()%>">
		<input name="middle_category" value="<%=article.getMiddle_category()%>">
		<input name="small_category" value="<%=article.getSmall_category()%>">		
		<input name="product_name" value="<%=article.getProduct_name()%>">
		<input name="delivery_charge" value="<%=article.getDelivery_charge()%>">
		<input name="pointplus" value="<%=article.getPointplus()%>">
		<%if(id==""){ %>
		<a data-toggle="modal" data-target="#myModal_l" href="/2019_JeonJSP/Loseweight/lw_user/login(old).jsp" type="submit" class="reply_button_no_login">
		<button class="buttons" style="margin-right:30px;display: block;float: left;">장바구니</button></a>
		<%}else{ %>
		<button type="submit" class="buttons" style="margin-right:30px;display: block;float: left;">장바구니</button> 
		<%} %>
		</form>
		 <button class="buttons">구매하기</button>
		<%} %>
				</div>	
			</div>
		</div>
			
		</div>
	
		</div>
		</div>
		<div name="contents" style="margin-top:100px; margin-bottom:100px;">
			<div class="shop_content_submenu">
				<div class="shop_contents" name="shop_contents">
					<ul>
						<a href="#1"><li class="submenu1">상품상세
						</li></a>
						<a href="#2"><li class="submenu2">상품평
						</li></a>
						<a href="#3"><li class="submenu3">배송/교환/반품 안내 
						</li></a>
					</ul>
				</div>
			 <div class="target" id="1" style="text-align: center; max-width: 1000px;margin: 50 auto;" >
							<%=article.getProduct_contents()%>
			</div>
			</div>
		
		<div class="reply_box target" id="2">
		<form  class="reply_contents" action ="Fitness_shop_reply.jsp" method="post" name="replyform">
		<div style="display:none">
			<input name="lw_id" value="<%=id%>">
			<input name="lw_salesnum" value="<%=article.getLw_salesnum()%>">
			<input name="pageNum" value="<%=pageNum%>">
		</div>
		<%if(id!=null){%>
	
		<div class="reply_box_centent">
		
			
			<textarea name="recontent" id="recontent" cols="110" rows="7"></textarea>
			<input type="submit" class="reply_button" value="상품평 등록">
			<p>
			<select name="star" style="float:left; margin-left:64px; margin-top:-10px; width:100px;height:30px;" >
			<option value="1">★</option>
			<option value="2">★★</option>
			<option value="3">★★★</option>
			<option value="4">★★★★</option>
			<option value="5">★★★★★</option>
			</select>		
			</p>
		</div>	
		</div>
			<%}else{ %>
			<div class="reply_box_centent">
			<textarea name="recontent" id="recontent" cols="110" rows="7"></textarea>
			<a data-toggle="modal" data-target="#myModal_l" href="/2019_JeonJSP/Loseweight/lw_user/login(old).jsp" type="submit" class="reply_button_no_login"><div style="padding-top:50%">상품평 등록</div></a>
			<%} %>
		</div>
	  </form>
	</div>
	
	<div style="padding-bottom:60px;">
		<form method="post" action="fitness_shop_replyedit.jsp" onsubmit="return writeSave()">
			<div style="display:none">
				<input name="lw_salesnum" value="<%=article.getLw_salesnum()%>">
				<input name="pageNum" value="<%=pageNum%>">
			</div>
			<!-- 댓글 부분 -->
			<table style="margin:0 auto;width:1000px"> 
				
    <%int sumstar = 0; %>				
	<%if(replylist.next()){
		do{
		String num2=replylist.getString("lw_salesnum");
		String glenum2=replylist.getString("glenum");
		String lw_id=replylist.getString("lw_id");
		String recontent=replylist.getString("recontent");
		int star=replylist.getInt("star");
		Timestamp reg_date=replylist.getTimestamp("reg_date");
		%>  
		<% sumstar= sumstar+star; %>
			
		 <tr height="50" >
			    <td width="600"><input style="border:none; font-weight:bold; font-size:16px;width:60px;" name="lw_id" value="<%=lw_id%>" readonly></blod><a style="font-size:12px;"><%= sdf.format(reg_date)%></a></td>
			    </tr>
			    <tr>
			    <td width="250" >
			    
			    <input type="text" class="replyeditleft1"style="border: none;display:block; " name="recontent" id="reply<%=glenum2%>_1" value="<%=recontent%>"readonly>			    
			    <input type="text" class="replyeditleft2" style="display:none; width:100%; height:60px;" id="reply<%=glenum2%>_2" value="<%=recontent%>">
			    <p style="font-size:12px;">
		         평점 :<%if(star==1){ %> ★ 
			     <%}else if(star==2){ %> ★★
			     <%}else if(star==3){ %> ★★★
			     <%}else if(star==4){ %> ★★★★
			     <%}else if(star==5){ %> ★★★★★
			     <%} %> 			    
			    </p>		    
			    <button id="all_button" class="replyedit_submit" style="display:none; float:right;"  onClick="sendedit(this.form); writeSave();"onclick="replyedit()">등록</button>
			    <input type="hidden"class="glenumname" value="<%=glenum2%>">
			    
				</td>
					
				
				<td id="replybtn<%=num2%>_1" style="text-align:right;"><%if (id!=null){
						if(id.toString().equals(lw_id)){%>
						<input type="button" id="all_button"class="replyedit"value="수정">
						<input type="submit" id="all_button"class="replydelete" onClick="sendProcess(this.form); writeSave();"value="삭제">
						<input type="button" id="all_button"class="replycancel" value="수정취소" style="display:none;">
					
						<%
						}}%></td>			 
			  </tr>
			  <tr class="tableline"><td colspan="6"></td></tr>
		  
		<%}while(replylist.next());
		}else{%>
		 
			<div class="noreple">상품평이 없습니다</div>
		
		<%}%>
		<%float star1 = sumstar;
		  float star2 = starcount;
		  float staravg =star1/star2;
		%>
		 <p style="margin:0 auto;font-size:12px;width:1000px;">상품 평점<%=Math.round(staravg*100)/100.0%></p>
	</table>
				
	<div class="btn_box">
	<div align="right">
		<%if(id==""){%>
	 <input type="button" value="글목록" class="all_button"
		onclick="document.location.href='Fitness_shop_list.jsp?pageNum=<%=pageNum%>'">
			<%}%>
							<%if(id.equals("admin")){%>
						  <input type="button" value="글수정" class="all_button"
					       onclick="document.location.href='Fitness_shop_updateForm.jsp?lw_salesnum=<%=article.getLw_salesnum()%>&pageNum=<%=pageNum%>'">
						   &nbsp;&nbsp;
						   
						  <input type="button" value="글삭제" class="all_button"
 					       onclick="document.location.href='Fitness_shop_deleteForm.jsp?lw_salesnum=<%=article.getLw_salesnum()%>&pageNum=<%=pageNum%>'">
						   &nbsp;&nbsp;			
						  <input type="button" value="글목록" class="all_button"
					       onclick="document.location.href='Fitness_shop_list.jsp?pageNum=<%=pageNum%>'">			   				    
						 		   <%}%>
			</div>
		</div>		
	</form>	
	</div>
	<div  class="product-etc target" id="3">
		<h5 class="prod-delivery-return-policy-title">배송정보</h5>
		<table class="prod-delivery-return-policy-table">
		    <colgroup>
		        <col width="150px">
		        <col width="340px">
		        <col width="150px">
		        <col width="*">
		    </colgroup>
		    <tbody>
		    <tr>
		        <th>배송방법</th>
		        <td>순차배송</td>
		            <th rowspan="2">배송비</th>
		            <td rowspan="2">
		               - 도서산간 지역 추가비용 없음
		            </td>
		    </tr>
		    <tr>
		        <th>묶음배송 여부</th>
		        <td>가능</td>
		    </tr>
		    <tr>
		        <th>배송기간</th>
		        <td colspan="3">
		            <ul>
		                <li class="prod-delivery-period-contents etc-pdd-info">
								ㆍ<span>쿠팡맨 배송 지역 : 주문 및 결제 완료 후, 1-2일 이내 도착</span>
		                </li>
		                <li class="prod-delivery-period-contents">
		                    ㆍ쿠팡맨 미배송 지역 : 주문 및 결제 완료 후, 2-3일 이내 도착
		                    <p class="prod-delivery-period__notice">
		                            - 도서 산간 지역 등은 하루가 더 소요될 수 있습니다. 곧 고객님께도 쿠팡맨이 찾아갈 수 있도록 노력하겠습니다
		                    </p>
		                </li>
		                <li class="prod-delivery-period-contents">ㆍ천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 다소 지연될 수 있는 점 양해 부탁드립니다.</li>
		            </ul>
		        </td>
		    </tr>
		    </tbody>
		</table>
		
		<h5 class="prod-delivery-return-policy-title">교환/반품 안내</h5>
		<table class="prod-delivery-return-policy-table">
		    <colgroup>
		        <col width="160px">
		        <col width="*">
		    </colgroup>
		    <tbody>
		    <tr>
		        <th>교환/반품 비용</th>
		        <td>
		            5,000원<br>- 단, 고객 변심의 경우에만 발생<br>- 부분반품 시, 남은금액이 무료배송 조건을 유지하면 일부 반품비용이 부과
		        </td>
		    </tr>
		    <tr>
		        <th>교환/반품 신청 기준일</th>
		            <td>
		                <p>ㆍ단순변심에 의한 로켓배송 상품의 교환/반품은 제품 수령 후 30일 이내까지만 가능 (교환/반품비용 고객부담)</p>
		                <p>ㆍ상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터<br>
		                    <span class="prod-delivery-return-policy__limit-list__indent">30일 이내에 청약철회 가능</span>
		                </p>
		            </td>
		    </tr>
		    </tbody>
		</table>
		
		
		<h5 class="prod-delivery-return-policy-title">교환/반품 제한사항</h5>
		<ul class="prod-delivery-return-policy__limit-list">
		    <li>ㆍ주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
		    <li>ㆍ상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 훼손된 경우 (단, 내용 확인을 위한 포장 개봉의 경우는 예외)</li>
		    <li>ㆍ고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
		    <li>ㆍ세트상품 일부 사용, 구성품을 분실하였거나 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</li>
		    <li>ㆍ모니터 해상도의 차이로 인해 색상이나 이미지가 실제와 달라, 고객이 단순 변심으로 교환/반품을 무료로 요청하는 경우</li>
		    <li>ㆍ제조사의 사정 (신모델 출시 등) 및 부품 가격 변동 등에 의해 무료 교환/반품으로 요청하는 경우</li>
		</ul>
		<p class="prod-delivery-return-policy__limit-text">※ 각 상품별로 아래와 같은 사유로 취소/반품이 제한 될 수 있습니다.</p>
		<table class="prod-delivery-return-policy-table">
		    <colgroup>
		        <col width="150px">
		        <col width="*">
		    </colgroup>
		    <tbody>
		        <tr>
		            <th>의류/잡화/수입명품</th>
		            <td>
		                <p>ㆍ상품의 택(TAG) 제거, 라벨 및 상품 훼손, 구성품 누락으로 상품의 가치가 현저히 감소된 경우</p>
		            </td>
		        </tr>
		        <tr>
		            <th>계절상품/식품/화장품</th>
		            <td>
		                <p>ㆍ신선냉동 식품의 단순변심의 경우</p>
		                <p>ㆍ뷰티 상품 이용 시 트러블(알러지, 붉은 반점, 가려움, 따가움)이 발생하는 경우,<br>
		                    <span class="prod-delivery-return-policy__limit-list__indent">진료 확인서 및 소견서 등을 증빙하면 환불이 가능 (제반비용 고객부담)</span>
		                </p>
		            </td>
		        </tr>
		        <tr>
		            <th>전자/가전/설치상품</th>
		            <td>
		                <p>ㆍ설치 또는 사용하여 재판매가 어려운 경우, 액정이 있는 상품의 전원을 켠 경우</p>
		                <p>ㆍ상품의 시리얼 넘버 유출로 내장된 소프트웨어의 가치가 감소한 경우 (내비게이션, OS시리얼이 적힌 PMP)</p>
		                <p>ㆍ홀로그램 등을 분리, 분실, 훼손하여 상품의 가치가 현저히 감소하여 재판매가 불가할 경우 (노트북, 데스크탑 PC 등)</p>
		            </td>
		        </tr>
		        <tr>
		            <th>자동차용품</th>
		            <td>
		                <p>ㆍ상품을 개봉하여 장착한 이후 단순변심인 경우</p>
		            </td>
		        </tr>
		        <tr>
		            <th>CD/DVD/GAME/<br>BOOK</th>
		            <td>
		                <span>ㆍ복제가 가능한 상품의 포장 등을 훼손한 경우</span>
		            </td>
		        </tr>
		    </tbody>
		</table>
		        <div class="product-item__table product-seller">
		            <p class="prod-delivery-return-policy-title">판매자 정보</p>
		                <table class="prod-delivery-return-policy-table">
		                    <colgroup>
		                        <col width="150px">
		                        <col width="*">
		                    </colgroup>
		                    <tbody><tr>
		                        <th>판매자</th>
		                        <td>쿠팡</td>
		                    </tr>
		                </tbody></table>
		
		                <p class="prod-minor-notice">
		                    미성년자가 체결한 계약은 법정대리인이 동의하지 않는 경우 본인 또는 법정대리인이 취소할 수 있습니다.
		                </p>
		        </div>
		</div>

<div>

</div>

	

	
	
	<%}
		catch(Exception e){}finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
   		 }	  
	
			 }
            catch(Exception e){}finally {
	        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    }	  
	 %>
						   
					     
	   	  
</body>
</html>
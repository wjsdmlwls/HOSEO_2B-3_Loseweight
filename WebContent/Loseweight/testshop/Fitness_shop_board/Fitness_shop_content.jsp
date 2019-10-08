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
%>
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
	  
/*
//ip불러오는부분
	  InetAddress inet = InetAddress.getLocalHost();
	  String svrIP = inet.getHostAddress();
	  
		//조회수 중복 체크 부분
		Cookie[] cookieFromRequest= request.getCookies();
		String cookieValue = null;
		for(int i = 0; i<cookieFromRequest.length;i++){
			cookieValue = cookieFromRequest[0].getValue();
		}
	 	// 쿠키 세션 입력
		if (session.getAttribute(num+":cookie") == null) {
		 	session.setAttribute(num+":cookie", num + ":" + cookieValue);
		}else {
			session.setAttribute(num+":cookie ex", session.getAttribute(num+":cookie"));
			if (!session.getAttribute(num+":cookie").equals(num + ":" + cookieValue )) {
			 	session.setAttribute(num+":cookie", num + ":" + cookieValue);
			}
		}
		article.setNum(num);
		article = dbPro.getArticle(num);
		
	 	// 조회수 카운트
	 	if (!session.getAttribute(num+":cookie").equals(session.getAttribute(num+":cookie ex"))) {
	 		dbPro.updateBoardreadcount(num);	
		 	article.setReadcount(article.getReadcount() + 1);
	 	} 
	 	*/

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
<!--slide-->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="Fitness_shop_content_css.css">
<script src="jquery-1.10.2.js"></script>
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<!--slide end-->
<style>
.someimg{
width:600px;
height:500px;
background-size:cover;
float:left;
}
.content_ttt{
float:left;
width:300px;
height:auto;
padding-left:10%;

}

.mypage_form:after {
content:"";
display:block;
clear:both;
} 
.textjump{
padding-left:30px;
}
 ul, ol, li {list-style:none; margin:0; padding:0;}
.price01 li p {display:inline-block; width:150px; height:15px;color:#666;}
.price01 li p span {}
.price01 li span {}
.buttons{
width:125px; 
height:60px;
border:none;
}
.basket_form input{
display:none;
}
</style>
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
	f.action="fitness_shop_replyedelete.jsp";
    f.submit();      
    
}
function  sendedit(f){
	f.action="fitness_shop_replyedit.jsp";
    f.submit();      
    
}



function myFunction(str) {

	
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
		return false;
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
	}
	
}

</script>



	
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
				<%=article.getProduct_contents()%>
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
							<p><span>수량</span></p><span><input type="text" id="quantity" name="quantity" size="3"
					      onchange="maxquantitys();sum(this.value);" value="0"></span>
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
		<input name="lw_salenum" value="<%=article.getLw_salesnum()%>">
		<input name="lw_id" value="<%=id%>">
		<input type="text" id="select_option1" name="option1">
		<input type="text" id="select_option1price" name="option1price">
		<input name="quantity" value="<%=article.getQuantity()%>">
		<input name="img0" value="<%=article.getImg0()%>">
		<input name="cost" value="<%=article.getCost()%>">
		<input name="selling_price" value="<%=article.getSelling_price()%>">
		<input name="reduced_price" value="<%=article.getReduced_price()%>">
		<input name="big_category" value="<%=article.getBig_category()%>">
		<input name="middle_category" value="<%=article.getMiddle_category()%>">
		<input name="small_category" value="<%=article.getSmall_category()%>">		
		<input name="product_name" value="<%=article.getProduct_name()%>">
		<input name="delivery_charge" value="<%=article.getDelivery_charge()%>">
		
		<button type="submit" class="buttons" style="margin-right:30px;display: block;float: left;">장바구니</button> 
		</form>
		 <button class="buttons">구매하기</button>
		<%} %>
				</div>	
			</div>
		</div>
			
		</div>
	
		</div>
		</div>
		</div>
	<div>
		<div class="reply_box">
		<form action = "fitness_shop_reply.jsp" method="post" name="replyform">
		<div style="display:none">
			<input name="lw_id" value="<%=id%>">
			<input name="lw_salesnum" value="<%=article.getLw_salesnum()%>">
			<input name="pageNum" value="<%=pageNum%>">
		</div>
		<%if(id!=null){%>
		<div class="reply_box_centent">
			<textarea name="recontent" id="recontent" cols="110" rows="7"></textarea>
			<input type="submit" class="reply_button" value="댓글 등록">
		</div>	
		</div>
			<%}else{ %>
			<div class="reply_box_centent">
			<textarea name="recontent" id="recontent" cols="110" rows="7"></textarea>
			<a data-toggle="modal" data-target="#myModal_l" href="/2019_JeonJSP/Loseweight/lw_user/login(old).jsp" type="submit" class="reply_button_no_login"><div style="padding-top:50%">댓글 등록</div></a>
			<%} %>
		</div>
	  </form>


	  
	</div>
	<div style="padding-bottom:60px;">
	
		<form method="post" action="bfboard_replyedit.jsp" onsubmit="return writeSave()">
			<div style="display:none">
				<input name="lw_salesnum" value="<%=article.getLw_salesnum()%>">
				<input name="pageNum" value="<%=pageNum%>">
			</div>
			<!-- 댓글 부분 -->
			<table style="margin:0 auto;width:1000px"> 
			 
						  			
	<%if(replylist.next()){
		do{
		String num2=replylist.getString("num");
		String glenum2=replylist.getString("glenum");
		String lw_id=replylist.getString("lw_id");
		String recontent=replylist.getString("recontent");
		Timestamp reg_date=replylist.getTimestamp("reg_date");
		%>
		
		 <tr height="50" >
			    <td width="600"><input style="border:none; font-weight:bold; font-size:16px;width:60px;" name="lw_id" value="<%=lw_id%>" readonly></blod><a style="font-size:12px;"><%= sdf.format(reg_date)%></a></td>
			    </tr>
			    <tr>
			    <td width="250" >
			    <input type="text" class="replyeditleft1"style="border: none;display:block; " name="recontent" id="reply<%=glenum2%>_1" value="<%=recontent%>"readonly>			    
			    <input type="text" class="replyeditleft2" style="display:none; width:100%; height:60px;" id="reply<%=glenum2%>_2" value="<%=recontent%>">		    
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
		 
			<div class="noreple">댓글이 없습니다</div>
		
		<%}%>	
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
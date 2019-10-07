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
    	// 세션정보 가져오기
    		PreparedStatement pstmt = null;
            ResultSet rs = null;
            Connection conn = null;
            try {
            String id = (String) session.getAttribute("id");
            
            String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
        	String dbId="lw_admin";
        	String dbPass="3whakstp";
        	
            UserDAO db= new UserDAO();
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
         
            
            String sql = "SELECT * FROM lw_users WHERE lw_id = ?";
         
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
%>
<%
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
height:300px;
padding-left:10%;

}

.mypage_form:after {
content:"";
display:block;
clear:both;
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
				<div class="someimg" style="background-image:url('');"></div>
				<div class="content_ttt">
				<p>등록 날짜: <%=sdf.format(article.getWrite_date())%></p>
				<p>제품이름 : <%=article.getProduct_name()%></p>
				<p>원가:<%=article.getCost()%></p>
				<p>구매가:<span id="price2"><%=article.getSelling_price()%></span></p>
				<p>배송비:
				<%if(article.getDelivery_charge()==0){%>
				무료				
				<%}else{%> 
				<%=article.getDelivery_charge()%>원
				<%} %>
				</p>
				
				<p style="font-color:red;">할인율 :  (<%=article.getReduced_price()%>) %</p>
				<p>마일리지 적립금: <%=article.getPointplus()%></p>
				
				<p>재고량 :<span id="quantitys"><%=article.getQuantity()%></span></p>

				<p>
				구입 수량 <input type="text" id="quantity" name="quantity" size="3"
					      onchange="maxquantitys();sum(this.value);">
				</p>
								<p>옵션선택</p>
				<select id="2" onchange="myFunction(this.value)" onmouseup="sum(quantity.value)">
    			<option value="" selected="selected">옵션 선택</option>
    			<%if(article.getOption1()!=null){%>
    			<option value="<%=article.getOption1price()%>"><%=article.getOption1()%></option>
    			<%}else{} %>
    			<%if(article.getOption2()!=null){%>
    			<option value="<%=article.getOption2price()%>"><%=article.getOption2()%></option>
    			<%}else{} %>
    			<%if(article.getOption3()!=null){%>
    			<option value="<%=article.getOption3price()%>"><%=article.getOption3()%></option>
    			<%}else{} %>
				</select>				
				<p>+<span id="option_value"></span></p>
				
				<!-- 최종 가격 -->
				<p>
				결제 금액: <span id="total_price"></span>
				<input type="hidden" name="total" id="post_total_price">
				</p>
				<%=article.getProduct_contents()%>
				</div>
					    
					  
					   <br> <!-- 할인율 -->
					    <br> <!-- 글 간단한 내용 -->
					    
					  		    			  					    
			
		</div>
		<button>장 바 구 니</button>
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
	<%if(id!=null){%>
						  <input type="button" value="글수정" class="all_button"
					       onclick="document.location.href='Fitness_shop_updateForm.jsp?lw_salesnum=<%=article.getLw_salesnum()%>&pageNum=<%=pageNum%>'">
						   &nbsp;&nbsp;
						   
						  <input type="button" value="글삭제" class="all_button"
 					       onclick="document.location.href='Fitness_shop_deleteForm.jsp?lw_salesnum=<%=article.getLw_salesnum()%>&pageNum=<%=pageNum%>'">
						   &nbsp;&nbsp;						   				    
						   
					       <input type="button" value="글목록" class="all_button"
					       onclick="document.location.href='Fitness_shop_list.jsp?pageNum=<%=pageNum%>'">
					       </div>
					          <%}else{ %><input type="button" value="글목록" class="all_button"
					       onclick="document.location.href='Fitness_shop_list.jsp?pageNum=<%=pageNum%>'">
					       <%} %>
	</div>	
	
		
	
	
	</form>
	
	
	
	
	<%}catch(Exception e){}finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }	  
	 %>
	 <%}catch(Exception e){}finally {
	        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    }	  
	 %>
	
</body>
</html>
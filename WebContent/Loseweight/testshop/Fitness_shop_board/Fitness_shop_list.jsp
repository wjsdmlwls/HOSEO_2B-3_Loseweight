<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import = "Fitnesshop.Fitnesshop_DAO" %>
<%@ page import = "Fitnesshop.Fitnesshop_DTO" %>
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%!int pageSize = 9;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");%>

<%
	request.setCharacterEncoding("UTF-8");
	String listsearch = ""; 
	String selectcategory = ""; 
	String selectevent = ""; 
	String orderby = ""; 
	String ascdesc = ""; 
    String pageNum = request.getParameter("pageNum");
	
    if (pageNum == null) {
        pageNum = "1";
    }
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage-1) * pageSize  ;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
    List<Fitnesshop_DTO> articleList = null; 
    
    listsearch = request.getParameter("listsearch");
	if(listsearch==null){
		listsearch ="";
	}
	selectcategory = request.getParameter("selectcategory");
	if(selectcategory==null){
		selectcategory ="";
	}
	selectevent = request.getParameter("selectevent");
	if(selectevent==null){
		selectevent ="";
	}
	orderby = request.getParameter("orderby");
	if(orderby==null){
		orderby ="lw_salesnum";
	}
	ascdesc = request.getParameter("ascdesc");
	if(ascdesc==null){
		ascdesc ="desc";
	}
	Fitnesshop_DAO dbPro = Fitnesshop_DAO.getInstance();
    count = dbPro.getArticleCount(); 

	String searchcol=request.getParameter("searchcol"); //검색 조건 
	if(searchcol==""||searchcol==null){
		searchcol ="product_name";
	}

	jekimDB usedb = new jekimDB();
	usedb.connect();
	
	Statement stmt=null;
	Connection con=null;
	String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
	String dbId="lw_admin";
	String dbPass="3whakstp";
	con=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	stmt=con.createStatement();
	
	String listsql1="select count(*) from Fitness_shop where "+searchcol+"  like '%"+listsearch+"%' and middle_category like '%"+selectcategory+"%'and productevent like '%"+selectevent+"%' order by "+orderby+" "+ascdesc+"  ";
	ResultSet rs = stmt.executeQuery(listsql1);
	
	String listsql2="select * from Fitness_shop where "+searchcol+"  like '%"+listsearch+"%'and middle_category like '%"+selectcategory+"%' and productevent like '%"+selectevent+"%' order by "+orderby+" "+ascdesc+" limit "+startRow+","+pageSize+"";
	ResultSet listsearchresult = usedb.resultQuery(listsql2);
	number = count-(currentPage-1)*pageSize;
	if(rs.next()){ count = rs.getInt(1); } rs.close();
%>	

<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<link href="Fitness_shop_listcss.css" rel="stylesheet" type="text/css">
<script>
//select category 할때 1차 2차 3차 골라주기 
function fitcategory1_change(){
	 
	var sporting_goods = ["2차 분류","부위별운동기구","웨이트기구","기타헬스용품"];
	var health_food  = ["2차 분류","보조식품","다이어트/미용음료"];
	 
	var selectItem = $("#categoryselect1").val();
	 
	var changeItem;
	  
	if(selectItem == "기구"){
	  changeItem = sporting_goods;
	}
	else if(selectItem == "식품"){
	  changeItem = health_food;
	}
		 
	$('#categoryselect2').empty();
	$('#categoryselect3').empty();
	for(var count = 0; count < changeItem.length; count++){                
	                var option = $("<option value="+changeItem[count]+">"+changeItem[count]+"</option>");
	                $('#categoryselect2').append(option);
	            }
	}
function fitcategory2_change(){
	 
	var part_exercise = ["3차 분류","전신운동","체형관리","상체","하체"];
	var weight_exercise = ["3차 분류","덤벨","벤치프레스","바벨"];
	var Other_exercise = ["3차 분류","철봉","악력기","재활/보조운동","밴드"];
	var supplement_food = ["3차 분류","프로틴","식이섬유","다이어트 간식"];
	var diet_drink = ["3차 분류","다이어트 차","건강즙","식초/홍초"];
	var selectItem = $("#categoryselect2").val();
	 
	var changeItem;
	  
	if(selectItem == "부위별운동기구"){
	  changeItem = part_exercise;
	}
	else if(selectItem == "웨이트기구"){
	  changeItem = weight_exercise;
	}
	else if(selectItem == "기타헬스용품"){
	  changeItem =  Other_exercise;
	}
	else if(selectItem == "보조식품"){
		  changeItem = supplement_food;
		}
	else if(selectItem == "다이어트/미용음료"){
		 changeItem =  diet_drink;
	}
	 
	$('#categoryselect3').empty();
	 
	for(var count = 0; count < changeItem.length; count++){                
	                var option = $("<option value="+changeItem[count]+">"+changeItem[count]+"</option>");
	                $('#categoryselect3').append(option);
	            }
	 
	}
</script>
<style>
.shop_sidemenu{
	width: 200px;
    float: left;
    margin-top: 10px;
    border: solid 1px #ccc;
    margin-left: 100px;
}
.shop_sidemenu ul{

}
.shop_sidemenu ul li{
    margin-left: -20px;
    margin-top: 20px;
    width: 160px;
}
.shop_sidemenu ul li span{
	font-size: 15px;
    font-weight: bold;
}
.shop_sidemenu ul li ul{
	border-top: solid 1px #ccc;
    width: 120px;
    margin-top: 12px;
}
.shop_sidemenu ul li ul li{
	font-size: 14px;
}
.shop_orderselect{
	height: 30px;
    margin-top: -30px;
}
.shop_orderselect ul li{
	float:right;
	font-size: 13px;
    padding: 0px 5px;
}
.shop_orderselect_order{
	font-weight: bold;
}
</style>
<title>게시판</title>
</head>
<body>

<%
	String id= null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}else{
		id="";
	}
	//로그인이 성공하면 아이디값으로 세션에 접속을함.
%>
<jsp:include page="../../community/community_topinclude.jsp" >
				<jsp:param name="tom" value="5"/>
				<jsp:param name="toc" value="not"/>
				<jsp:param name="imgs" value="shop.png"/>
				<jsp:param name="boardname" value="SHOP"/>
</jsp:include>

<div class="search_bar">
	<form method="post" action="Fitness_shop_list.jsp">
		<div style="margin: 0 auto;margin-top: 10px;width: 415px;border: solid 2px #6f4e37;">
				<input class="search_input" name="listsearch" type="text">
				<div style="width: 40px;height: 50px;float: right;">
					<input style="width: 35px;height: 35px;margin-top: 7px;"type="image" type="submit" src="../../img/search/search.png">
			</div>	
		</div>
	</form>
</div>
		<div class="shop_sidemenu">
		<ul>
			<li><SPAN>이벤트</SPAN>
				<ul>
					<li><label for="event0"><a id="event0" href="Fitness_shop_list.jsp?pageNum=1&searchcol=product_name&listsearch=<%=listsearch%>&selectcategory=<%=selectcategory%>&orderby=<%=orderby%>&ascdesc=<%=ascdesc%>&selectevent=0"><input type="checkbox" <%if(selectevent.equals("0")){ %>checked<%} %>><img src="/2019_JeonJSP/Loseweight/img/shop/new_shop.png"></a></label></li>
					<li><a href="Fitness_shop_list.jsp?pageNum=1&searchcol=product_name&listsearch=<%=listsearch%>&selectcategory=<%=selectcategory%>&orderby=<%=orderby%>&ascdesc=<%=ascdesc%>&selectevent=1"><input type="checkbox" id="event1" <%if(selectevent.equals("1")){ %>checked<%} %>><img src="/2019_JeonJSP/Loseweight/img/shop/freedelivery_shop.png"></a></li>
					<li><a href="Fitness_shop_list.jsp?pageNum=1&searchcol=product_name&listsearch=<%=listsearch%>&selectcategory=<%=selectcategory%>&orderby=<%=orderby%>&ascdesc=<%=ascdesc%>&selectevent=2"><input type="checkbox" id="event2" <%if(selectevent.equals("2")){ %>checked<%} %>><img src="/2019_JeonJSP/Loseweight/img/shop/hit_shop.png"></a></li>
				</ul>
			</li>
			<li><SPAN>기구</SPAN>
				<ul>
					<li><a <%if (selectcategory.equals("부위별운동기구")){ %>class="shop_orderselect_order"<%}%>
				href="Fitness_shop_list.jsp?pageNum=1&searchcol=product_name&listsearch=<%=listsearch%>&selectcategory=부위별운동기구&orderby=<%=orderby %>&ascdesc=<%=ascdesc %>&selectevent=<%=selectevent%>">부위별운동기구</a></li>
					<li><a <%if (selectcategory.equals("웨이트기구")){ %>class="shop_orderselect_order"<%}%>
				href="Fitness_shop_list.jsp?pageNum=1&searchcol=product_name&listsearch=<%=listsearch%>&selectcategory=웨이트기구&orderby=<%=orderby %>&ascdesc=<%=ascdesc %>&selectevent=<%=selectevent%>">웨이트기구</a></li>
					<li><a <%if (selectcategory.equals("기타헬스용품")){ %>class="shop_orderselect_order"<%}%>
				href="Fitness_shop_list.jsp?pageNum=1&searchcol=product_name&listsearch=<%=listsearch%>&selectcategory=기타헬스용품&orderby=<%=orderby %>&ascdesc=<%=ascdesc %>&selectevent=<%=selectevent%>">기타헬스용품</a></li>
				</ul>
			</li>
			<li><SPAN ACCESSKEY=D TABINDEX=2 ONKEYPRESS="checkKey(this)" ONCliCK="disp(this.parentElement)">식품</SPAN>
				<ul>
					<li><a <%if (selectcategory.equals("보조식품")){ %>class="shop_orderselect_order"<%}%>
				href="Fitness_shop_list.jsp?pageNum=1&searchcol=product_name&listsearch=<%=listsearch%>&selectcategory=보조식품&orderby=<%=orderby %>&ascdesc=<%=ascdesc %>&selectevent=<%=selectevent%>">보조식품</a></li>
					<li><a <%if (selectcategory.equals("다이어트/미용음료")){ %>class="shop_orderselect_order"<%}%>
				href="Fitness_shop_list.jsp?pageNum=1&searchcol=product_name&listsearch=<%=listsearch%>&selectcategory=다이어트/미용음료&orderby=<%=orderby %>&ascdesc=<%=ascdesc %>&selectevent=<%=selectevent%>">다이어트/미용음료</a></li>
				</ul>
			</li>
		</ul>
		</div>
		<div id="img_border_main">
		<ul class="shop_board_ul">
		
		<div class="shop_orderselect">
			<ul>
				<li><a id="event0" <%if (orderby.equals("selling_price")){if(ascdesc.equals("asc")){ %>class="shop_orderselect_order"<%}}%> 
				href="Fitness_shop_list.jsp?pageNum=1&searchcol=product_name&listsearch=<%=listsearch%>&selectcategory=<%=selectcategory%>&orderby=selling_price&ascdesc=asc&selectevent=<%=selectevent%>">낮은 가격순</a></li>
				
				<li><a <%if (orderby.equals("selling_price")){if(ascdesc.equals("desc")){ %>class="shop_orderselect_order"<%}}%> 
				href="Fitness_shop_list.jsp?pageNum=1&searchcol=product_name&listsearch=<%=listsearch%>&selectcategory=<%=selectcategory%>&orderby=selling_price&ascdesc=desc&selectevent=<%=selectevent%>">높은 가격순</a></li>
				
				<li><a <%if (orderby.equals("lw_salesnum")){if(ascdesc.equals("desc")){ %>class="shop_orderselect_order"<%}}%>
				href="Fitness_shop_list.jsp?pageNum=1&searchcol=product_name&listsearch=<%=listsearch%>&selectcategory=<%=selectcategory%>&orderby=lw_salesnum&ascdesc=desc&selectevent=<%=selectevent%>">최신 상품순</a></li>
			</ul>
		</div>
	<%
					if(listsearchresult.next()){
								do{
								String lw_salesnum=listsearchresult.getString("lw_salesnum");
								String product_name=listsearchresult.getString("product_name");											
								String product_code=listsearchresult.getString("product_code");										
								int reduced_price=listsearchresult.getInt("reduced_price");
								String product_contents=listsearchresult.getString("product_contents");	
								int cost=listsearchresult.getInt("cost");
								int selling_price=listsearchresult.getInt("selling_price");
								int quantity=listsearchresult.getInt("quantity");
								int productevent=listsearchresult.getInt("productevent");
								Timestamp write_date=listsearchresult.getTimestamp("write_date");								
								String img0=listsearchresult.getString("img0");
								int salestatus=listsearchresult.getInt("salestatus");
								int replycount=0;
								Fitnesshop_DAO dbPro1 = Fitnesshop_DAO.getInstance();
								Fitnesshop_DTO article =  dbPro.getArticle(Integer.parseInt(lw_salesnum));
								   	String replylistsql1="select count(*) from Fitness_shop_re where lw_salesnum="+article.getLw_salesnum()+"";
								   	ResultSet rs2 = stmt.executeQuery(replylistsql1);
								if(rs2.next()){ replycount = rs2.getInt(1); } rs.close();
				%>
				<%if(salestatus==0){ %>
			       <li class="shop_board_li">
			    <div class="shopboard_img" style="background-image:url('<%=img0%>');">
			    	<div class="img_backgrounds"></div>
			    </div>
			   
			  	<div class="nameTxt"><%=product_name%></div> 
			  	<div class="flex">
			  		<p class="afcoin">
			  			<%=reduced_price%>%
			  		</p>
			  		<p class="bfcoin">
			  			<strong><%=cost%></strong>
			  		</p>
			  		<br>
			  	</div>
				  	
			  	<div class="icon">
			  	<p class="cfcoin">
			  			<strong><%=selling_price%>원</strong>
			  		</p>
			  		<%if(productevent==1){%>
			  		<img src="/2019_JeonJSP/Loseweight/img/shop/freedelivery_shop.png">
			  		<%}else if(productevent==2){ %>
			  		<img src="/2019_JeonJSP/Loseweight/img/shop/hit_shop.png">
			  		<%}else{ %>
			  		<img src="/2019_JeonJSP/Loseweight/img/shop/new_shop.png">
			  		<%} %>
			  	
			  	</div>
			  </li>
			     
			    <%}else if(salestatus==1){ %>
			    <li class="shop_board_li" OnClick="location.href ='Fitness_shop_content.jsp?lw_salesnum=<%=lw_salesnum%>&pageNum=<%=currentPage%>'">
			    <%if(quantity==0){%>
			     <div class="shopboard_img" style="background-image:url('<%=img0%>');">
			    	<div class="img_backgroundq"></div>
			    </div>
			    <%}else{%>
			    <div class="shopboard_img" style="background-image:url('<%=img0%>');">
			    	<div class="img_background"></div>
			    </div>
			   <%} %>
			  	<div class="nameTxt"><%=product_name%></div> 
			  	<div class="flex">
			  		<p class="afcoin">
			  			<%=reduced_price%>%
			  		</p>
			  		<p class="bfcoin">
			  			<strong><%=cost%></strong>
			  		</p>
			  		<br>
			  	</div>
				  	
			  	<div class="icon">
			  	<p class="cfcoin">
			  			<strong><%=selling_price%>원</strong>
			  		</p>
			  		<%if(productevent==1){%>
			  		<img src="/2019_JeonJSP/Loseweight/img/shop/freedelivery_shop.png">
			  		<%}else if(productevent==2){ %>
			  		<img src="/2019_JeonJSP/Loseweight/img/shop/hit_shop.png">
			  		<%}else{ %>
			  		<img src="/2019_JeonJSP/Loseweight/img/shop/new_shop.png">
			  		<%} %>
			  	
			  	</div>
			  </li>
		 <%} %>
			
	
		

			  
			
		<%
			}while(listsearchresult.next());
		%>
		
	<%
	}else{
			%>
			  
			  <tr class="tableline">
			  <td colspan="6">
			  <h4 style="padding: 200;"><%=listsearch %>에 대한 검색 결과가 없습니다</h4>
			  </td></tr>
			
			
			
			
			<%}
	%>
	
		</ul>
				</div>
	<%if(id==null||id==""){%>
	<%}else if(id.equals("admin")){%>
		<div style="width: 1200px;margin: 10px auto;height: 50px;">
				<a href="Fitness_shop_writeForm.jsp" style="float: right;">
				<input class="write_btn" value="글쓰기"></a>
		</div>
	<%} %>
	<div class="bottom_img">
	<%
	    if (count > 0) {
	        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage =1;
			
			if(currentPage % 9 != 0)
	           startPage = (int)(currentPage/9)*9 + 1;
			else
	           startPage = ((int)(currentPage/9)-1)*9 + 1;
	
			int pageBlock = 9; 
	        int endPage = startPage + pageBlock - 1;
	        if (endPage > pageCount) endPage = pageCount;
	        
	        if (startPage > 9) { %>
	          <a href="Fitness_shop_list.jsp?pageNum=<%= startPage - 9 %>"><img class="page_next_pre_img" src="images/btn_pre.gif"></a>
	<%      }
	        
	        for (int i = startPage ; i <= endPage ; i++) {  %>
	        	<%if(i == Integer.parseInt(pageNum)){%>
	           <a href="Fitness_shop_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol%>&listsearch=<%=listsearch%>&selectcategory=<%=selectcategory%>&selectevent=<%=selectevent%>&orderby=<%=orderby%>&ascdesc=<%=ascdesc%>" id="lw_salesnum<%=i %>"><div class="pageselect_num"><%= i %></div></a>
		          <% }
		           else{%>
	           <a href="Fitness_shop_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol%>&listsearch=<%=listsearch%>&selectcategory=<%=selectcategory%>&selectevent=<%=selectevent%>&orderby=<%=orderby%>&ascdesc=<%=ascdesc%>" id="lw_salesnum<%=i %>"><div class="pageselect_num"><%= i %></div></a>
	<%      }}
	        	
	        
	        
	        if (endPage < pageCount) {  %>
	        <a href="Fitness_shop_list.jsp?pageNum=<%= startPage + 9 %>"><img class="page_next_pre_img" src="images/btn_next.gif"></a>
	<%	
	        }
	        
	    }
	
	%>
	</div>	
		<jsp:include page="../../community/community_footerinclude.jsp" ></jsp:include>				
</body>
</html>
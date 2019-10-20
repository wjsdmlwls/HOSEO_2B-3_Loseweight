<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import="java.util.*" %>
<%@ page import = "Fitnesshop.*" %>
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%!int pageSize = 20;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<jsp:useBean id="sanpum" scope="page" class="Fitnesshop.sanpum_DTO">
   <jsp:setProperty name="sanpum" property="*"/>
</jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String listsearch = ""; 
	String mincalendar = ""; 	
	String maxcalendar ="";
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
    mincalendar = request.getParameter("mincalendar");
    maxcalendar = request.getParameter("maxcalendar");
	if(listsearch==null){
		listsearch ="";
	}
	if(mincalendar==null || mincalendar==""){
		mincalendar = "2000-01-01";
	}
	if(maxcalendar==null || maxcalendar==""){
		maxcalendar = "2099-12-31";
	}
	Fitnesshop_DAO dbPro = Fitnesshop_DAO.getInstance();
    count = dbPro.getArticleCount(); 

	String searchcol=request.getParameter("searchcol"); //검색 조건 
	if(searchcol==""||searchcol==null){
		searchcol ="ordernum";
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
	
	String listsql1="select count(*) from order_obj where order_time between '"+mincalendar+"' and '"+maxcalendar+"' and "+searchcol+"  like '%"+listsearch+"%'";
	ResultSet rs = stmt.executeQuery(listsql1);
	
	String listsql2="select * from order_obj where (order_time between '"+mincalendar+"' and '"+maxcalendar+"') and ("+searchcol+"  like '%"+listsearch+"%') limit "+startRow+","+pageSize+"";
	ResultSet listsearchresult = usedb.resultQuery(listsql2);
	number = count-(currentPage-1)*pageSize;
	if(rs.next()){ count = rs.getInt(1); } rs.close();
%>	

<html>
<head>
<link rel="stylesheet" href="/2019_JeonJSP/Loseweight/css/bootstrap.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>

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
                    buttonImage: "images/calendar.png", // 버튼 이미지
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
                    buttonImage: "images/calendar.png", 
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
<link href="style.css" rel="stylesheet" type="text/css">
<link href="/2019_JeonJSP/Loseweight/css/style.css" rel="stylesheet" type="text/css">
<link href="admin_shoplist.css" rel="stylesheet" type="text/css">
<%=mincalendar %>
<%=maxcalendar %>
<%=listsearch %>
<%=searchcol %>
<%=startRow %>
<%=pageSize %>
<title>게시판</title>
<style>
table.lw_shopboard {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    margin: 0 auto;
}
table.lw_shopboard tbody:hover .lw_shoplistboard{
	background: #ccc;
    opacity: 0.9;
}
table.lw_shopboard thead tr {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}

table.lw_shopboard thead td {
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.lw_shopboard tbody tr {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.lw_shopboard tbody td {
	border-left: 1px solid;
    border-right: solid 1px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
.lw_shopadmintable{
    }
.loseweight_admintop{
	width: 100%;
    height: 50px;
    background: #333;
}
</style>
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
<div class="loseweight_admintop">
	<div class='menu'>			
					<ul class="nav01" style="margin: 0 auto;width: 1400px;">
						<li>
							<a href='/2019_JeonJSP/Loseweight/lw_main.jsp'>메인화면</a>
						</li>
						<li>
							<a href='/2019_JeonJSP/Loseweight/admin/admin_main.jsp'>관리자 메인</a>
						</li>
						<li>
							<a href='/2019_JeonJSP/Loseweight/admin/admin_fit_shop_list.jsp'>fit게시판</a>
						</li>
						<li class='last'>
							<a href='/2019_JeonJSP/Loseweight/servicecenter/Noticeboard/notice_list.jsp'>임시1</a>
						</li>
						<li>
							<a href='/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp'>임시2</a>
						</li>
						
					</ul>
				</div>
</div>

<div class="search_bar">
	<form method="post" action="admin_order_list.jsp">
		<div style="margin:0 auto; margin-top:10px;">
		<SELECT class="search_list" name='searchcol'> <!-- 검색 컬럼 -->
		
	        <OPTION value='ordernum'>글번호</OPTION>
	        <OPTION value='product_names'>상품이름</OPTION>
	        <OPTION value='payment'>결제방법</OPTION>
	        <OPTION value='lw_id'>아이디</OPTION>
	        <OPTION value='Recipient'>이름</OPTION>
	    </SELECT>
		<input class="search_input" name="listsearch" type="text">
		<input type="image" type="submit" src="images/search.gif">
			작성일<span id="today"></span>
          <label for="mincalendar"></label>
          <input type="text" id="mincalendar" name="mincalendar" readonly>
          ~
          <label for="maxcalendar"></label>
          <input type="text" id="maxcalendar" name="maxcalendar" readonly>
		</div>        
	</form>
</div>
		<div class="lw_shopadmintable">
		<table class="lw_shopboard">
		    <thead>
		   		 <tr>
				      <td scope="cols">글 번 호</td> 
				      <td>물품이름</td> 
				      <td>물건 가격</td> 
				      <td>배송 가격</td> 
				      <td>총가격/개수</td> 
				      <td>거래방법/옵션</td> 
				      <td>이름/옵션가격</td> 
				      <td>아이디/상태</td> 
				      <td>주문일자/주문번호</td>
					</tr>
				<tr>
				
				</tr>
		    </thead>
	<%
					if(listsearchresult.next()){
								do{
								int ordernum=listsearchresult.getInt("ordernum");
								String product_names=listsearchresult.getString("product_names");
								int product_total=listsearchresult.getInt("product_total");
								int delivery_total=listsearchresult.getInt("delivery_total");
								int total_money=listsearchresult.getInt("total_money");
								int payment=listsearchresult.getInt("payment");
								String recipient=listsearchresult.getString("recipient");
								String lw_id=listsearchresult.getString("lw_id");
								Timestamp order_time=listsearchresult.getTimestamp("order_time");			
								int replycount=0;
								Fitnesshop_DAO dbPro1 = Fitnesshop_DAO.getInstance();
								Fitnesshop_DTO article =  dbPro.getArticle(ordernum);
								   	String replylistsql1="select count(*) from order_obj where ordernum="+article.getLw_salesnum()+"";
								   	ResultSet rs2 = stmt.executeQuery(replylistsql1);
								if(rs2.next()){ replycount = rs2.getInt(1); } rs.close();
				%>
				<tbody>
				<tr class="lw_shoplistboard">
			    <td><%=ordernum %></td>
			    <td><%=product_names %></td>
			    <td><%=product_total %></td>
			    <td><%=delivery_total %></td>
			    <td><%=total_money %></td>
			    <td><%=payment %></td>
			    <td><%=recipient %></td>
			    <td><%=lw_id %></td>
			    <td><%=order_time %></td>
			   </tr>
			  <%List<sanpum_DTO> orderList2 = new ArrayList<>();
					sanpum_DAO db2 = new sanpum_DAO();
					orderList2 = db2.testsang(ordernum,lw_id); 
					%><%for(int d=0; orderList2.size()>d; d++ ){
						sanpum = orderList2.get(d);%>
			    <tr class="lw_shoplistboard">
			    <td style="background:#fff;"></td>
			    <td><%=sanpum.getProduct_name()%></td>
			    <td><%=sanpum.getSelling_price()%></td>
			    <td><%=sanpum.getDelivery_charge()%></td>
			    <td><%=sanpum.getQuantity()%></td>
			    <td><%=sanpum.getOption1()%></td>
			    <td><%=sanpum.getOption1price()%></td>
			    <td><%=sanpum.getOrderstatus()%></td>
			    <td><%=sanpum.getObj_order_num()%></td>
			    <%} %>
			    <td>
			    <% if(sanpum.getOrderstatus()==0) {%><a href="/2019_JeonJSP/Loseweight/admin/admin_order_Action.jsp?ordernum=<%=ordernum%>&orderstatus=1"><input type="button"value="입금확인"></a><%} %>
			    <% if(sanpum.getOrderstatus()==1) {%><a href="/2019_JeonJSP/Loseweight/admin/admin_order_Action.jsp?ordernum=<%=ordernum%>&orderstatus=2"><input type="button"value="배송확인"></a><%} %>
			    <% if(sanpum.getOrderstatus()==2) {%>배송중<%} %>
			    <% if(sanpum.getOrderstatus()==3) {%><a>거래완료</a><%} %>
			    <% if(sanpum.getOrderstatus()==4) {%><a href="/2019_JeonJSP/Loseweight/admin/admin_order_Action.jsp?ordernum=<%=ordernum%>&orderstatus=5" ><input type="button"value="환불요청"></a><%} %>
			    <% if(sanpum.getOrderstatus()==5) {%>환불완료<%} %>
			    
			    </td>
			    </tr>
		<%
			}while(listsearchresult.next());
		%>
	<%
	}else{
		%>
			  <tr class="tableline">
			  <td colspan="30">
			  <h4 style="padding: 300;text-align:center;"><%=listsearch %>에 대한 검색 결과가 없습니다</h4>
			  </td></tr>
				</tbody>
			<%}	%>
	
			</table>
			</div>
			
	<div class="bottom_img" style="margin-top:50px">
	<hr style="margin-bottom: 40px;">
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
	          <a href="admin_order_list.jsp?pageNum=<%= startPage - 9 %>"><img class="page_next_pre_img" src="images/btn_pre.gif"></a>
	<%      }
	        
	        for (int i = startPage ; i <= endPage ; i++) {  %>
	        	<%if(i == Integer.parseInt(pageNum)){%>
	           <a href="admin_order_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="lw_salesnum<%=i %>"><div class="pageselect_num"><%= i %></div></a>
		          <% }
		           else{%>
	           <a href="admin_order_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="lw_salesnum<%=i %>"><div class="pageselect_num"><%= i %></div></a>
	<%      }}
	        	
	        
	        
	        if (endPage < pageCount) {  %>
	        <a href="admin_order_list.jsp?pageNum=<%= startPage + 9 %>"><img class="page_next_pre_img" src="images/btn_next.gif"></a>
	<%	
	        }
	        
	    }
	
	%>
	<%if(id==null||id==""){%>
	
	
	<%}else{%>
	<a href="/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_writeForm.jsp"><input id="bottom_write_button" class="write_btn" value="글쓰기"></a>
	<%} %>

	</div>					
</body>
</html>
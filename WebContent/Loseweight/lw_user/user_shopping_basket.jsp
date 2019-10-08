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
<script>
	function check() {

	}
</script>
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
	function maxquantitys(){
		
		var max = document.getElementById("quantitys").textContent;
		var maxs = parseInt(max);
		var maxt = document.getElementById("quantity").value;
		var maxx = parseInt(maxt);
		
		if(max<maxx){
			
			alert("주문량이 현재 제고량보다 많습니다.");
			 document.getElementById("quantity").value=0;
			return false;
		}
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

.selling input{
	width: 50px;
    border: none;
    text-align: center;
}
.delivery input{
	width: 90px;
    border: none;
    text-align: center;
}
.break_basket{
    width: 25px;
    text-align: center;
}
.product_name{
font-weight:bold;
font-size: 20px;
}
.option{
margin-left: 5px;
font-size: 12px;

}
</style>
<!-- 주소 end -->
<body>
	<div class="div_body">
		<jsp:include page="../community/community_topinclude.jsp" >
			<jsp:param name="tom" value="0"/>
			<jsp:param name="toc" value="0"/>
			<jsp:param name="imgs" value="mypage.png"/>
			<jsp:param name="boardname" value="회원탈퇴"/>
		</jsp:include>
		</div>
		
		<table class="user_shopping_baskettable">
		<thead>
		   		 <tr>
				      <td width="100">전체선택</td> 
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
								String lw_salesnum=listsearchresult.getString("lw_salesnum");
								String product_name=listsearchresult.getString("product_name");	
								String img0=listsearchresult.getString("img0");			
								int cost=listsearchresult.getInt("cost");
								int quantity=listsearchresult.getInt("quantity");
								int selling_price=listsearchresult.getInt("selling_price");
								int delivery_charge=listsearchresult.getInt("delivery_charge");
								Timestamp reg_date=listsearchresult.getTimestamp("reg_date");	
								String option1=listsearchresult.getString("option1");			
								int option1price=listsearchresult.getInt("option1price");	
								
								i=i+1;
				%>		
			
				<span id="quantitys" style="display:none;"><%=quantity%></span>	
					<form  method="post">
				<tr>
					<td rowspan="2"><input type='checkbox' class="delete_check"name='basket_delete' value="<%=num %>"></td>
					<td rowspan="2">
					<%if (img0.equals("null")){%>
						<img class="basket_img" src="/2019_JeonJSP/Loseweight/img/logo/logo_BY.png" >
				    <%}else{%>			    
				    	<img class="basket_img" src="<%=img0%>">
				    <%}%>
				    </td>
			    <td style="text-align: left;"><a class="product_name"><%=product_name%></a>
			    <a class="option"><%=option1%></a></td>
			    <td rowspan="2" class="selling"><input type="hidden" name="total" id="post_total_price">원</td>
			    <td rowspan="2" class="delivery"><%if(delivery_charge!=0){ %><input type="text" name="delivery<%=i%>"value="<%=delivery_charge%>"readonly>원<%
			    	}else{ %><input type="text" name="delivery<%=i%>"value="무료"readonly><%} %></td>	
			</tr>    	
			<tr>
			<td style="text-align: right;"><%=selling_price%>원
				<input type="text" id="quantity" name="quantity" value="1" size="3" onchange="maxquantitys();sum(this.value);">
				<input type="submit" class="break_basket" name="num" value=<%=num%> onClick="DeleteProcess(this.form); writeSave();">
			</td>
			</tr>
			<Tr style="display:none;">
				<td>
					<input name="num" value="<%=num %>">
				</td>
			</Tr>
			
		</form>
		<%
			}while(listsearchresult.next());
		%>
		<%}else{ %>
		<h4 style="padding: 200;"><%=id %>에 대한 검색 결과가 없습니다</h4>
		<%} %>
		
		</table>
		<%}catch (Exception e) {
				e.printStackTrace();
			}
		%>
		<jsp:include page="../community/community_footerinclude.jsp" ></jsp:include>	
</body>
</html>
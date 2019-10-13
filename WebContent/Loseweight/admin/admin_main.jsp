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
    String pageNum = request.getParameter("pageNum");
	String mincalendar = "2000-01-01"; 	
	String maxcalendar = "2099-12-31"; 	
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
	
	String listsql1="select count(*) from Fitness_shop where "+searchcol+"  like '%"+listsearch+"%'";
	ResultSet rs = stmt.executeQuery(listsql1);
	
	String listsql2="select * from Fitness_shop where "+searchcol+" like '%"+listsearch+"%' limit "+startRow+","+pageSize+"";
	ResultSet listsearchresult = usedb.resultQuery(listsql2);
	number = count-(currentPage-1)*pageSize;
	if(rs.next()){ count = rs.getInt(1); } rs.close();
%>	

<html>
<head>
<link rel="stylesheet" href="/2019_JeonJSP/Loseweight/css/bootstrap.min.css">
<script src="/2019_JeonJSP/Loseweight/js/jquery.slim.min.js"></script>
<script src="/2019_JeonJSP/Loseweight/js/bootstrap.bundle.min.js"></script>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="/2019_JeonJSP/Loseweight/css/style.css" rel="stylesheet" type="text/css">
<link href="admin_shoplist.css" rel="stylesheet" type="text/css">

<title>게시판</title>
<style>
table.lw_shopboard {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

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
	overflow: scroll;
    min-width: 2080px;
    }
.loseweight_admintop{
	width: 100%;
    height: 50px;
    background: #333;
}
.adminpage_body{
	height: 93%;
    background: #efefef;
}
.adminpage_list{
	margin-top:100px;
}
.adminpage_list a{
font-size:50px
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
<div class="adminpage_body">
	<h1>LoseWeight 관리자 페이지</h1>
	<div class="adminpage_list">
	<a href='/2019_JeonJSP/Loseweight/admin/admin_fit_shop_list.jsp'>상품 리스트</a><Br>
	<a href='/2019_JeonJSP/Loseweight/admin/admin_user_list.jsp'>유저 리스트</a>
	</div>
</div>	
</body>
</html>
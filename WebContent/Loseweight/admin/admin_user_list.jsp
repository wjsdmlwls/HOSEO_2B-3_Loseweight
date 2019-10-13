<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import = "user.UserDAO" %>
<%@ page import = "user.User" %>
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%!int pageSize = 20;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");%>

<%
	request.setCharacterEncoding("UTF-8");
	String listsearch = ""; 
    String pageNum = request.getParameter("pageNum");
    String mincalendar =  "";
    String maxcalendar =  "";
    mincalendar=request.getParameter("mincalendar");
    maxcalendar=request.getParameter("maxcalendar");
    if (pageNum == null) {
        pageNum = "1";
    }
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage-1) * pageSize  ;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
    List<User> articleList = null; 
    listsearch = request.getParameter("listsearch");
	if(listsearch==null){
		listsearch ="";
	}
	if(mincalendar==null){
		mincalendar ="0";
	}
	if(maxcalendar==null){
		maxcalendar ="200000000";
	}
	String searchcol=request.getParameter("searchcol"); //검색 조건 
	if(searchcol==""||searchcol==null){
		searchcol ="lw_id";
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
	
	String listsql1="select count(*) from lw_users where "+searchcol+" like '%"+listsearch+"%'  and (lw_lp between '"+mincalendar+"' and '"+maxcalendar+"')";
	ResultSet rs = stmt.executeQuery(listsql1);
	
	String listsql2="select * from lw_users where "+searchcol+" like '%"+listsearch+"%' and (lw_lp between '"+mincalendar+"' and '"+maxcalendar+"')";
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
           
        </script>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="/2019_JeonJSP/Loseweight/css/style.css" rel="stylesheet" type="text/css">
<link href="admin_shoplist.css" rel="stylesheet" type="text/css">
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
    min-width: 100px;
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
	<form method="post" action="admin_user_list.jsp">
		<div style="margin:0 auto; margin-top:10px;">
		<SELECT class="search_list" name='searchcol'> <!-- 검색 컬럼 -->
		
	        <OPTION value='lw_id'>아이디</OPTION>
	        <OPTION value='lw_name'>이름</OPTION>
	        <OPTION value='lw_phone'>전화번호</OPTION>
	    </SELECT>
		<input class="search_input" name="listsearch" type="text">
		<input type="image" type="submit" src="images/search.gif">
			LP_검색
          <label for="mincalendar"></label>
          <input type="text" id="mincalendar" name="mincalendar" value=0>~
          <label for="maxcalendar"></label>
          <input type="text" id="maxcalendar" name="maxcalendar" value=0>LP
		</div>        
	</form>
</div>
		<div class="lw_shopadmintable">
		<table class="lw_shopboard">
		    <thead>
		   		 <tr>
				      <td scope="cols">아이디</td> 
				      <td>이름</td>
				      <td>성별</td>
				      <td>이메일1</td>
				      <td>이메일2</td>
				      <td>우편번호</td>
				      <td>주소</td>
				      <td>상세주소</td>
				      <td>전화번호</td>
				      <td>LP</td>
					</tr>
		    </thead>
			<%
					if(listsearchresult.next()){
								do{	
								String lw_id=listsearchresult.getString("lw_id");
								String lw_name=listsearchresult.getString("lw_name");
								String lw_gender=listsearchresult.getString("lw_gender");
								String lw_e_mail1=listsearchresult.getString("lw_e_mail1");
								String lw_e_mail2=listsearchresult.getString("lw_e_mail2");
								String lw_zipcode=listsearchresult.getString("lw_zipcode");
								String lw_addr1=listsearchresult.getString("lw_addr1");
								String lw_addr2=listsearchresult.getString("lw_addr2");
								String lw_phone=listsearchresult.getString("lw_phone");
								int lw_lp=listsearchresult.getInt("lw_lp");					
								int replycount=0;
								   	String replylistsql1="select count(*) from lw_users";
								   	ResultSet rs2 = stmt.executeQuery(replylistsql1);
								if(rs2.next()){ replycount = rs2.getInt(1); } rs.close();
				%>
				<tbody>
				<tr class="lw_shoplistboard">
			    <td><%=lw_id%></td>
			    <td><%=lw_name%></td>
			    <td><%=lw_gender%></td>
			    <td><%=lw_e_mail1%></td>
			    <td><%=lw_e_mail2%></td>
			    <td><%=lw_zipcode%></td>
			    <td><%=lw_addr1%></td>
			    <td><%=lw_addr2%></td>
			    <td><%=lw_phone%></td>
			    <td><%=lw_lp%></td>
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
	          <a href="admin_fit_shop_list.jsp?pageNum=<%= startPage - 9 %>"><img class="page_next_pre_img" src="images/btn_pre.gif"></a>
	<%      }
	        
	        for (int i = startPage ; i <= endPage ; i++) {  %>
	        	<%if(i == Integer.parseInt(pageNum)){%>
	           <a href="admin_fit_shop_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="lw_salesnum<%=i %>"><div class="pageselect_num"><%= i %></div></a>
		          <% }
		           else{%>
	           <a href="admin_fit_shop_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="lw_salesnum<%=i %>"><div class="pageselect_num"><%= i %></div></a>
	<%      }}
	        	
	        
	        
	        if (endPage < pageCount) {  %>
	        <a href="admin_fit_shop_list.jsp?pageNum=<%= startPage + 9 %>"><img class="page_next_pre_img" src="images/btn_next.gif"></a>
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
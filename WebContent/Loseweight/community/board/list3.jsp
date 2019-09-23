<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import = "board.BoardDBBean" %>
<%@ page import = "board.BoardDataBean" %>
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jspf"%>
    
<%!
    int pageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
	request.setCharacterEncoding("UTF-8");
	String listsearch = ""; 
    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage-1) * pageSize  ;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
    List<BoardDataBean> articleList = null; 
    
    listsearch = request.getParameter("listsearch");
	if(listsearch==null){
		listsearch ="";
	}
    BoardDBBean dbPro = BoardDBBean.getInstance();
    count = dbPro.getArticleCount(); 

	String searchcol=request.getParameter("searchcol"); //검색 조건 
	if(searchcol==""||searchcol==null){
		searchcol ="subject";
	}
	
%>
<%
jekimDB usedb = new jekimDB();
usedb.connect();
Statement stmt=null;
Connection con=null;
String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
String dbId="jspid";
String dbPass="jsppass";
con=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
stmt=con.createStatement();
String listsql1="select count(*) from board where "+searchcol+"  like '%"+listsearch+"%'";
ResultSet rs = stmt.executeQuery(listsql1);
String listsql2="select * from board where "+searchcol+"  like '%"+listsearch+"%' order by ref desc, re_step asc limit "+startRow+","+pageSize+"";
ResultSet listsearchresult = usedb.resultQuery(listsql2);
number = count-(currentPage-1)*pageSize;
if(rs.next()){ count = rs.getInt(1); } rs.close();
%>	
<html>
<head>
<!--slide-->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<!--slide end-->
<!-- modal windows -->
<script>
window.closeModal = function() {
   $( '#myModal_l' ).modal( 'hide' );
}
</script>
<!-- modal windows -->
<link href="style.css" rel="stylesheet" type="text/css">

<link href="../css/style.css" rel="stylesheet" type="text/css">
<style>
tr.headtableline td{
	border-bottom:1px solid #000;
}
tr.tableline td{
	border-bottom:1px solid #ddd;
}
.pageselect {
margin:15;
margin-left:70px;
}
.pageselect a{
color:000;
font-size:18px;
}
</style>

<title>게시판</title>
</head>

<body>
<%
	String id= null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}	
	//로그인이 성공하면 아이디값으로 세션에 접속을함.
	%>
<div class="div_body" >
				<div class="div_top" style="width: 100%; height: 120px">
		 	<div class="Opacity_box" style="height:150px; background-color: rgba(0, 0, 0, 0.9);">
		 	<a href="../lw_main.jsp"><img src="../img/logo/logo_BY.png" style="margin: 0 auto; margin-left:55px; position: absolute;width: 130px;padding-top: 10px;"></a>
			<nav style="float:right; padding:10px;">
					<li class="nav">
							<%if(id==null){ %>
							<a href="#" id="login_bt"data-toggle="modal" data-target="#myModal_l">로그인</a>
							
							<a href="#" id="singup_bt"data-toggle="modal" data-target="#myModal_s">회원가입</a>
							<!-- 클릭시 모달창 새로 띄움  -->
								
							<%}else{%>
							<a href="../lw_user/user_Info.jsp">마이페이지</a>
							<a href="../lw_user/logout.jsp">로그아웃</a>
							<%} %>
					</li>
			</nav>
			<div class='menu' style="width:1340px;height:50px; margin:0 auto;padding-top:100px">			
				<ul>
					<li>
						<a href='#'>운동방법</a>
					</li>
					<li>
						<a href='#'>식단조절</a>
					</li>
					<li>
						<a href='../board/list.jsp'>커뮤니티</a>
					</li>
					<li class='last'>
						<a href='../Noticeboard/list.jsp'>고객센터</a>
					</li>
					<li>
						<a href='#'>shop</a>
					</li>
				</ul>
			</div>
		</div>
		</div>
		<div class='sub_menu3'>			
						<ul>
							<li>
								<a href='list.jsp'style="font-weight:bold;border-bottom: 1px solid #444;">자유게시판</a>
							</li>
							<li>
								<a href='../bf_board/list.jsp'>BEFOR & AFTER </a>
							</li>
						</ul>
					</div>
		<div style='margin: 0 auto; width: 1120px;margin-top: 80px;'>
		
			<table class="lw_board"> 
			    <tr height="40"> 
			      <td align="center"  width="50"  >번 호</td> 
			      <td align="center"  width="650" >제   목</td> 
			      <td align="center"  width="150" >작성자</td>
			      <td align="center"  width="150" >작성일</td> 
			      <td align="center"  width="100" >조 회</td> 
			    </tr>
			    <tr class="headtableline"><td colspan="6"></td></tr>
			
	<%if(listsearchresult.next()){
		do{
		String num=listsearchresult.getString("num");
		String subject=listsearchresult.getString("subject");
		String writer=listsearchresult.getString("writer");
		String email=listsearchresult.getString("email");
		Timestamp reg_date=listsearchresult.getTimestamp("reg_date");
		int readcount=listsearchresult.getInt("readcount");
		int re_level=listsearchresult.getInt("re_level");
		int members=listsearchresult.getInt("members");
		%>
		 <tr height="50" style="border-top: 1pt solid gray">
			    <td  width="50" > <%=number--%></td>
			    <td  width="250" align="left">
			<%
				int wid=0; 
				if(re_level>0){
				   wid=5*(re_level); 
			%>
				  <img src="images/level.png" width="<%=wid%>" height="16">
				  <img src="images/re.png">
			<%  }else{%>
				  <img src="images/level.png" width="<%=wid%>" height="16">
				  
			<%  }%>
			           
			      <a href ="#" onclick="modi('<%=num%>','<%=pageNum%>')"><%=subject%></a>
			          
				
			<% if(readcount>=20){%>
			         <img src="images/hot.png" border="0"  height="16"><%}%> </td>
			    <td width="100" align="center"> 
			       <a href="mailto:<%=email%>"style="margin-left: 10;">
			        <%=writer%>
			        
			       <% if(members>=1){%>
			         <img src="images/pig.png" border="0"  height="16"><%}%>
			        </a></td>
			    <td width="150"><%= sdf.format(reg_date)%></td>
			    <td width="50"><%=readcount%></td>
			  </tr>
			  <tr class="tableline"><td colspan="6"></td></tr>
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
	</table>
	<div class="pageselect">
	<%
	    if (count > 0) {
	        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage =1;
			
			if(currentPage % 10 != 0)
	           startPage = (int)(currentPage/10)*10 + 1;
			else
	           startPage = ((int)(currentPage/10)-1)*10 + 1;
	
			int pageBlock = 10;
	        int endPage = startPage + pageBlock - 1;
	        if (endPage > pageCount) endPage = pageCount;
	        
	        if (startPage > 10) { %>
	          <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
	<%      }
	        
	        for (int i = startPage ; i <= endPage ; i++) {  %>
	        	<%if(i == Integer.parseInt(pageNum)){%>
	           <a href="list.jsp?pageNum=<%= i %>" id="num<%=i %>"style="font-weight: bold;">[<%= i %>]</a>
		          <% }
		           else{%>
	           <a href="list.jsp?pageNum=<%= i %>" id="num<%=i %>">[<%= i %>]</a>
	<%      }}
	        	
	        
	        
	        if (endPage < pageCount) {  %>
	        <a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
	<%	
	        }
	        
	    }
	%><%if(id!=null){%><a href="writeForm.jsp"><input style="text-align: center;margin-top: -5px;float:right;"class="newbutton"value="글쓰기"></a></div>
	<%} %>
	<form method="post" action="list.jsp">
		<div style="margin:0 auto; margin-top:10px;">
		<SELECT style="height: 42px;width: 95;"name='searchcol'> <!-- 검색 컬럼 -->
	        <OPTION value='subject'>제목</OPTION>
	        <OPTION value='writer'>작성자</OPTION>
	        <OPTION value='content'>내용</OPTION>
	    </SELECT>
		<input style="width: 250;height:42px"name="listsearch" type="text">
		<input style="font-size: 12px;  line-height: 40px; width: 100px; cursor: pointer; letter-spacing: 2px; text-transform: uppercase; color: #263238; border: 1px solid #263238; background: transparent;" type="submit"  value="검색"><Br>
</div>
	</form>
	</div>

</div>
<div class="modallist">
	<!-- signUp modal -->
	<div id="myModal_l" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<iframe id="iframe_l"src="../lw_user/login_signUp.jsp" style="margin-top:-113px;margin-left:-10px;width:140%; height:880px; background:##f7f7f7;" scrolling="no"></iframe>
			</div>
		</div>
	</div>
	<div id="myModal_s" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<iframe id="iframe_s"src="../lw_user/signUp_login.jsp" style="margin-top:-103px;margin-left:-3px;width:100%;width:140%; height:880px; background:##f7f7f7;" scrolling="no"></iframe>
			</div>
		</div>
	</div>
</div>
<script>
	function modi(num,pageNum){
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "content.jsp?pageNum=1");
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "modify");
		hiddenField.setAttribute("value", 0);
		form.appendChild(hiddenField)
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "num");
		hiddenField.setAttribute("value", num);
		form.appendChild(hiddenField)
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "pageNum");
		hiddenField.setAttribute("value", pageNum);
		form.appendChild(hiddenField)
		
		document.body.appendChild(form);
		
		form.submit();
	}
</script>						
</body>
</html>
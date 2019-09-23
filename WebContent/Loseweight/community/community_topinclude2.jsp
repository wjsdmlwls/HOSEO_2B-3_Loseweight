<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import = "board.BoardDBBean" %>
<%@ page import = "board.BoardDataBean" %>
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<html>
<head>
<!--slide-->
<link rel="stylesheet" href="/2019_JeonJSP/Loseweight/css/bootstrap.min.css">
<script src="/2019_JeonJSP/Loseweight/js/jquery.slim.min.js"></script>
<script src="/2019_JeonJSP/Loseweight/js/bootstrap.bundle.min.js"></script>
<!--slide end-->
<!-- modal windows -->
<script>
window.closeModal = function() {
   $( '#myModal_l' ).modal( 'hide' );
}
</script>
<!-- modal windows -->
<link href="style.css" rel="stylesheet" type="text/css">

<link href="/2019_JeonJSP/Loseweight/css/style.css" rel="stylesheet" type="text/css">
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
	
	<%
	String imgs = request.getParameter("imgs");
	%>

<div class="div_body" >
	<div class="div_top" style="margin:0 auto; width: 100%; height: 120px; position:relative;">
	
		
		<h1 style="width:135px; margin:0 auto;margin-bottom:-100px; position:fixed; z-index:3;"><a href="/2019_JeonJSP/Loseweight/lw_main.jsp"><img id="logo" src="/2019_JeonJSP/Loseweight/img/logo/logo_BY.png" alt="logo" style="width:135px; margin:0 735%;"></a></h1>
		<h1 style="width:100%; margin:0 auto; position:relative; z-index:1;">
		<img id="community" src="/2019_JeonJSP/Loseweight/community/C_img/<%=imgs%>" alt="community" style="width:100%;"></h1>
		<div class="Opacity_box" style="position:fixed; left:0px; top:0%; z-index:2; height:150px; background-color: rgba(0, 0, 0, 0.5);">
		
			<nav style="float:right; padding:10px;">
					<ul>
						<li class="nav">
								<%if(id==null ||id==""){ %>
								<a href="#" id="login_bt"data-toggle="modal" data-target="#myModal_l">로그인</a>
								
								<a href="#" id="singup_bt"data-toggle="modal" data-target="#myModal_s">회원가입</a>
								<!-- 클릭시 모달창 새로 띄움  -->
									
								<%}else{%>
								<a href="/2019_JeonJSP/Loseweight/lw_user/user_Info.jsp">마이페이지</a>
								<a href="/2019_JeonJSP/Loseweight/lw_user/logout.jsp">로그아웃</a>
								<%} %>
						</li>
					</ul>
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
						<a href='/2019_JeonJSP/Loseweight/community/board/list.jsp'>커뮤니티</a>
					</li>
					<li class='last'>
						<a href='/2019_JeonJSP/Loseweight/servicecenter/Noticeboard/list.jsp'>고객센터</a>
					</li>
					<li>
						<a href='#'>shop</a>
					</li>
				</ul>
			</div>
		</div>
	
		</div>
		<% 
		String tom = request.getParameter("tom"); /*table of menu*/
		String toc = request.getParameter("toc"); /*table of contents*/
		%>
		<%if(tom.equals ("0")){ %>
		<div class='sub_menu'>			
						<ul>
							<li>
								<a href='user_Info.jsp'<%if(toc.equals ("0")){ %>style="font-weight:bold;border-bottom: 1px solid #444;<%}%>">회원정보</a>
							</li>
							<li>
								<a href='#'<%if(toc.equals ("1")){ %>style="font-weight:bold;border-bottom: 1px solid #444;<%}%>">나의 몸무게 </a>
							</li>
							<li>
								<a href='user_delete.jsp'<%if(toc.equals ("2")){ %>style="font-weight:bold;border-bottom: 1px solid #444;<%}%>">회원탈퇴</a>
							</li>
						</ul>
					</div>
		<%} %>
		<%if(tom.equals ("3")){ %>
		<div class='sub_menu3' style="margin-top:25%;">			
		
						<ul>
							<li>
								<a href='/2019_JeonJSP/Loseweight/community/board/list.jsp'<%if(toc.equals ("0")){ %>style="font-weight:bold;border-bottom: 1px solid #444;<%}%>">자유게시판</a>
							</li>
							<li>
								<a href='/2019_JeonJSP/Loseweight/community/bf_board/list.jsp'<%if(toc.equals ("1")){ %>style="font-weight:bold;border-bottom: 1px solid #444;<%}%>">BEFOR & AFTER </a>
							</li>
						</ul>
		</div>
		<%} %>
		<%if(tom.equals ("4")){ %>
		<div class='sub_menu4' style="margin-top:25%">			
						<ul>
							<li>
								<a href='/2019_JeonJSP/Loseweight/servicecenter/Noticeboard/list.jsp'<%if(toc.equals ("0")){ %>style="font-weight:bold;border-bottom: 1px solid #444;<%}%>">공지사항</a>
							</li>
							<li>
								<a href='/2019_JeonJSP/Loseweight/servicecenter/questionboard/list.jsp'<%if(toc.equals ("1")){ %>style="font-weight:bold;border-bottom: 1px solid #444;<%}%>"> 문의하기 </a>
							</li>
						</ul>
					</div>
		<%} %>
		<div class="modallist">
	<!-- signUp modal -->
	<div id="myModal_l" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<iframe id="iframe_l"src="/2019_JeonJSP/Loseweight/lw_user/login_signUp.jsp" style="margin-top:-113px;margin-left:-10px;width:140%; height:880px; background:##f7f7f7;" scrolling="no"></iframe>
			</div>
		</div>
	</div>
	<div id="myModal_s" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<iframe id="iframe_s"src="/2019_JeonJSP/Loseweight/lw_user/signUp_login.jsp" style="margin-top:-103px;margin-left:-3px;width:100%;width:140%; height:880px; background:##f7f7f7;" scrolling="no"></iframe>
			</div>
		</div>
	</div>
</div>	
</div>			
</body>
</html>
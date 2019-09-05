<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>

<html>
	<head>
		<title>Lose weight</title>
		<meta charset="UTF_8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<!-- 모달창 오픈   -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function(){
	    $("#popbutton").click(function(){
	        $('div.modal').modal({remote : 'layer.jsp'});
	    })
	})
	</script>
	<link rel="stylesheet" href="css/style.css">
	<!-- 모달창 오픈   -->
	<body>
	<%
	String id= null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}	
	//로그인이 성공하면 아이디값으로 세션에 접속을함.
%>
				<!-- Header -->
			<header id="header">
					<nav id="nav">
						<li class="nav">
							<%if(id==null){ %>
							<a href="lw_user/login.jsp">Login</a>
							<a style="cursor:pointer;'"id="popbutton">회원가입</a>
							<!-- 클릭시 모달창 새로 띄움  -->
							<div class="modal fade">
								  <div class="modal-dialog">
								    <div class="modal-content">
								        <!-- remote ajax call이 되는영역 -->
								    </div>
								  </div>
								</div>
							<%}else{%>
							<a href="lw_user/user_Info.jsp">MyPage</a>
							<a href="lw_user/logout.jsp">LogOut</a>
							<%} %>
						</li>
					</nav>
		<div class='menu'>			
			<ul>
				<li>
					<a href='#'>운동방법</a>
				</li>
				<li>
					<a href='#'>식단조절</a>
				</li>
				<li>
					<a href='#'>shop</a>
					<ul>
						<li class='sub'>
							<a href='#'>운동기구</a>
						</li>
						<li class='sub'>
							<a href='#'>프로틴</a>
						</li>
					</ul>
				</li>
				<li>
					<a href='#'>자유게시판</a>
				</li>
				<li class='last'>
					<a href='#'>고객센터</a>
				</li>
			</ul>
		</div>
		<hr class="hr">
				
			</header>

	</body>
</html>
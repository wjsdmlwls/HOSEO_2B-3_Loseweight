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
							<a href="#">Login</a>
							<a href="#">회원가입</a>
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
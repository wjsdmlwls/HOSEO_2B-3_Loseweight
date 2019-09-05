<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>

<html>
<head>
<title>Lose weight</title>
<meta charset="UTF_8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<style>
.nav{
	margin-right: 50px;
	font-weight: 600;
	font-size:13px;
	float:right;
}
.nav a{
	padding:10px;
}
.topmain_form{
width: 1020px;
margin: 0 auto;
}
<!--메뉴 css-->
.menu {
		  position: relative;
		  height: 44px;
		  background: #fff;
		  width: auto;
		  padding-right: 0%;
		  text-align: center;
		  margin:0 auto;
		}
		.menu ul {
		  padding: 2;
		  margin: 0;
		  line-height: 0;
		}
		.menu ul li ul li a{
		  padding: 2;
		  margin: 0;
		  line-height: 2;
		}

		.manu ul li a{
			padding-top: 0;
			margin-bottom: 30px;
		}
		.menu > ul {

		  display: block;
		  background: #fff;
		  width: 100%;
		  height: 0;
		}
		.menu:after, .menu > ul:after {
		  content: ".";
		  display: block;
		  clear: both;
		  visibility: hidden;
		  line-height: 0;
		  height: 0;
		}
		.menu.align-right > ul > li {
		  float: left;
		}
		.menu.align-center ul {
		  text-align: center;
		}
		.menu.align-center ul ul {
		  text-align: left;
		}
		.menu > ul > li {
		  display: inline-block;
		  position: relative;
		  margin: 0;
		  padding: 0;
		  margin-top:10px;
		  margin-left:20px;
		}
		.menu ul li a {
		  display: block;
		  font-family: Neucha, Arial, sans serif ;
		  text-decoration: none;
		  margin-bottom: 10px;
    	  padding-bottom: 10px;
		}
		.menu > ul > li > a {
		  font-size: 14px;
		  font-weight: bold;
		  padding: 15px 20px;
		  color: #000;
		  text-transform: uppercase;
		  -webkit-transition: color 0.25s ease-out;
		  -moz-transition: color 0.25s ease-out;
		  -ms-transition: color 0.25s ease-out;
		  -o-transition: color 0.25s ease-out;
		  transition: color 0.25s ease-out;
		}
		.menu > ul > li.sub > a {
		  padding-left: 1000px;m
		}
		.menu > ul > li:hover > a {
		  color: #bbb;
		}
		.menu li.sub::after {
		  display: block;
		  content: "";
		  position: absolute;
		  width: 0;
		  height: 0;
		}
		.menu > ul > li.sub::after {
		  right: -10px;
		  top: 25px;
		  border: 5px solid transparent;
		  border-top-color: #7a8189;
		}
		.menu > ul > li:hover::after {
		  border-top-color: #bbb;
		}
		.menu ul ul {
		  position: absolute;
		  left: -9999px;
		  top: 80px;
		  opacity: 0;
		  -webkit-transition: opacity .3s ease, top .25s ease;
		  -moz-transition: opacity .3s ease, top .25s ease;
		  -ms-transition: opacity .3s ease, top .25s ease;
		  -o-transition: opacity .3s ease, top .25s ease;
		  transition: opacity .3s ease, top .25s ease;
		  z-index: 1000;
		}
		.menu ul ul ul {
		  top: 40px;
		  padding-left: 0px;
		}
		.menu ul ul li {
		  position: relative;
		}
		.menu > ul > li:hover > ul {
		  left: auto;
		  top: 25px;
		  opacity: 1;
		}
		.menu.align-right > ul > li:hover > ul {
		  left: auto;
		  right: 0;
		  opacity: 1;
		}
		.menu ul ul li:hover > ul {
		  left: 170px;
		  top: 0;
		  opacity: 1;
		}
		.menu.align-right ul ul li:hover > ul {
		  left: auto;
		  right: 100px;
		  top: 0;
		  opacity: 1;
		  padding-right: 10px;
		}
		.menu ul ul li a {
		  width: 100px;
		  padding-top: -20px;
		  font-size: 12px;
		  background: #fff;

		}
		.menu.align-right ul ul li a {
		  text-align: left;
		}
<!--menu css-->
<!--여기는 스타일에다가 가져가지 말기 -->
ul{
   list-style:none;
   padding-left:0px;
}
li{
   list-style:none;
   padding-left:0px;
}
a:link { 
color: #000; text-decoration: none;
}
.top_hr {
    border: 0;
    height: 1px;
    background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
}
</style>
	<%
		String id = null;
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}
		//로그인이 성공하면 아이디값으로 세션에 접속을함.
	%>
<body>
	<div class="topmain_form">
		<div>
		<a href="../lw_main.jsp" style="position:absolute;margin-left:390;"><img src="../img/logo/logo.png" alt="" /></a>
		</div>
		<div id="nav">
			<li class="nav">
			<%if(id==null){ %>
							<a href="lw_user/login.jsp">로그인</a>
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
							<a href="user_Info.jsp">마이페이지</a>
							<a href="logout.jsp">로그아웃</a>
							<%} %>
			</li>
		</div>
		<div class='menu' style="width: 650px;margin-top:50px;padding-top:50px;margin:0 auto">
			<ul>
				<li><a href='#'>운동방법</a></li>
				<li><a href='#'>식단조절</a></li>
				<li><a href='#'>shop</a>
					<ul>
						<li class='sub'><a href='#'>운동기구</a></li>
						<li class='sub'><a href='#'>프로틴</a></li>
					</ul></li>
				<li><a href='#'>자유게시판</a></li>
				<li class='last'><a href='#'>고객센터</a></li>
			</ul>
		</div>
		
	<hr class="top_hr"style="margin-top:50px">
	</div>
		
</body>
</html>
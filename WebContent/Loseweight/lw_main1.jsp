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
				
		<!-- Banner -->
			<section id="banner">
				 <a href="lw_main.jsp"><img class="logo" alt="logo" src="img\main_img\logo1.jpg"></a> 
				<p>안녕하세요 Loseweight에 오신것을 환영합니다.</p>
				<p class="p2"></p>
			</section>
<!-- 그림 사진 파일 설명(슬라이드) -->
<div id="wrapper">
      <div id="slider-wrap">
          <ul id="slider">
             <li data-color="#1abc9c">               
<img src="img\main_img\main.png">
             </li>
             
             <li data-color="#3498db">
<img src="img\main_img\main1.png">
             </li>
             
             <li data-color="#9b59b6">
<img src="img\main_img\main2.png">
             </li>      
          </ul>
          
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
          <!--controls-->  
                 
      </div>
  
   </div>
		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<div class="flex">
						<div class="copyright">
							&copy; 팀명 : Lose Weignt<br>
							</a>&copy; 블로그 주소 : 
							<a href="https://blog.naver.com/loseweight_2019_2b03">https://blog.naver.com/loseweight_2019_2b03</a>.
						</div>
					</div>
				</div>
			</footer>
			<!-- Scripts -->
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<!--텍스트 자바스크립트 애니멘이션 효과-->
			<script type="text/javascript">
			function changeText(cont1,cont2,speed){
				var Otext=cont1.text();
				var Ocontent=Otext.split("");
				var i=0;
				function show(){
					if(i<Ocontent.length)
					{		
						cont2.append(Ocontent[i]);
						i=i+1;
					};
				};
					var Otimer=setInterval(show,speed);	
			};
			$(document).ready(function(){
				changeText($("p"),$(".p2"),150);
			});
			</script>
		

	</body>
</html>
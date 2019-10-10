<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!--slide-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="maincss.css">
<script src="js/jquery.slim.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<!--slide end-->
<!-- modal windows -->
<script>
function loginshow() {
	   $( '#myModal_l' ).modal( 'show' );
	}
window.closeModal = function() {
   $( '#myModal_l' ).modal( 'hide' );
   location.reload();
}
</script>
<style>
.menu{
width:1340px;
height:50px;
margin:0 auto;
padding-top:150px;
}
</style>
<!-- modal windows -->
<body style="overflow:hidden;">
	<%
	String id= null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}	
	//로그인이 성공하면 아이디값으로 세션에 접속을함.
	%>
	<div class="div_body">
	<!-- slider 영역 -->
		  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="position: fixed; width: 100%; height: 100%;" >
			    <ol class="carousel-indicators" style="position:absolute">
			      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			    </ol>
			    <div class="carousel-inner" role="listbox" style="position:absolute">
			      <!-- Slide One - Set the background image for this slide in the line below -->
			      <div class="carousel-item active" style="background-image: url('img/main_img/lw_background.png')">
			        <div class="carousel-caption d-none d-md-block">
			          <h3 class="display-4">First Slide</h3>
			          <p class="lead">This is a description for the first slide.</p>
			        </div>
			      </div>
			      <!-- Slide Two - Set the background image for this slide in the line below -->
			      <div class="carousel-item" style="background-image: url('img/main_img/lw_background1.png')">
			        <div class="carousel-caption d-none d-md-block">
			          <h3 class="display-4">Second Slide</h3>
			          <p class="lead">This is a description for the second slide.</p>
			        </div>
			      </div>
			      <!-- Slide Three - Set the background image for this slide in the line below -->
			      <div class="carousel-item" style="background-image: url('img/main_img/lw_background2.png')">
			        <div class="carousel-caption d-none d-md-block">
			          <h3 class="display-4">Third Slide</h3>
			          <p class="lead">This is a description for the third slide.</p>
			        </div>
			      </div>
			    </div>
			  </div>
					<!-- slider end -->
		
		<div class="div_top">
		<!-- 클릭시 모달창 새로 띄움  -->
							<div class="modallist" id="myModal">
								<!-- signUp modal -->
								 <div id="myModal_l" class="modal fade" style="margin-top:40px">
							        <div class="modal-dialog" style="margin-top:100px">
							            <div class="modal-content">
							               <iframe id="iframe_l"src="lw_user/login(old).jsp" scrolling="no" style="width: 660px; height: 690px;"></iframe>
							            </div>
							        </div>
							    </div>
								<div id="myModal_s" class="modal fade" style="margin-top:40px">
								        <div class="modal-dialog" style="margin-top:100px">
								            <div class="modal-content">
								                <iframe id="iframe_s"src="lw_user/user_signUp(old).jsp" scrolling="no" style="width: 530px;height: 750px;"></iframe>
								            </div>
								        </div>
								</div>
							</div>
		
		<h1 class="mainlogo_box"><a href="lw_main.jsp"><img id="logo" src="img/logo/logo_BY.png" alt="logo"></a></h1>
		<div class="Opacity_box" style="position:relative; left:0px; top:-110px; z-index:1; height:200px;">
			<nav style="float:right; padding:10px;">
					<li class="nav">
							<%if(id==null){ %>
							<a href="#" id="login_bt"data-toggle="modal" data-target="#myModal_l" onclick="loginshow();">로그인</a>
							
							<a href="#" id="singup_bt"data-toggle="modal" data-target="#myModal_s">회원가입</a>
							
							<%}else{%>
							<a href="lw_user/user_Info.jsp">마이페이지</a>
							<a href="lw_user/logout.jsp">로그아웃</a>
							<%} %>
					</li>
			</nav>
			<div class='menu'>			
			<ul class="nav01">
				<li>
					<a href='#'>운동방법</a>
				</li>
				<li>
					<a href='#'>식단조절</a>
				</li>
				<li>
					<a href='community/board/board_list.jsp'>자유게시판</a>
				</li>
				<li class='last'>
					<a href='servicecenter/Noticeboard/notice_list.jsp'>고객센터</a>
				</li>
				<li>
					<a href='#'>shop</a>
				</li>
			</ul>
		</div>
		</div>
		</div>
	</div>
	
</body>
</html>
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
<script src="js/jquery.slim.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<!--slide end-->
<!-- modal windows -->
<script>
window.closeModal = function() {
   $( '#myModal_l' ).modal( 'hide' );
}
</script>
<!-- modal windows -->
<link rel="stylesheet" href="css/style.css">
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
		  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="position: fixed; width: 100%; height: 100%;">
			    <ol class="carousel-indicators" style="position:absolute">
			      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			    </ol>
			    <div class="carousel-inner" role="listbox"style="position:absolute">
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
		
		<div class="div_top" style="margin:0 auto; width: 100%; height: 120px; position:relative;">
		<!-- 클릭시 모달창 새로 띄움  -->
							<div class="modallist" style="position:absolute; z-index:999999;"	>
								<!-- signUp modal -->
								 <div id="myModal_l" class="modal fade" >
							        <div class="modal-dialog">
							            <div class="modal-content" >
							               <iframe id="iframe_l"src="lw_user/login_signUp.jsp" style="margin-top:-113px;margin-left:-10px;width:140%; height:880px; background:##f7f7f7;" scrolling="no"></iframe>
							            </div>
							        </div>
							    </div>
								<div id="myModal_s" class="modal fade">
								        <div class="modal-dialog">
								            <div class="modal-content">
								                <iframe id="iframe_s"src="lw_user/signUp_login.jsp" style="margin-top:-103px;margin-left:-3px;width:100%;width:140%; height:880px; background:##f7f7f7;" scrolling="no"></iframe>
								            </div>
								        </div>
								</div>
							</div>
		
		<h1 style="width:130px; margin:0 auto; position:relative; z-index:222;"><a href="lw_main.jsp"><img id="logo" src="img/logo/logo_BY.png" alt="logo" style="width:135px;"></a></h1>
		<div class="Opacity_box" style="position:relative; left:0px; top:-100px; z-index:1;">
			<nav style="float:right; padding:10px;">
					<li class="nav">
							<%if(id==null){ %>
							<a href="#" id="login_bt"data-toggle="modal" data-target="#myModal_l">로그인</a>
							
							<a href="#" id="singup_bt"data-toggle="modal" data-target="#myModal_s">회원가입</a>
							
							<%}else{%>
							<a href="lw_user/user_Info.jsp">마이페이지</a>
							<a href="lw_user/logout.jsp">로그아웃</a>
							<%} %>
					</li>
			</nav>
			<div class='menu' style="width:1340px;height:50px; margin:0 auto;padding-top:100px">			
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
		<div style='margin: 0 auto; width: 1020px;height:200px'>
			<div class="div_sidemenu"style='width: 250px; position: absolute;'></div>
			<div class="div_sidecontents" style=';position: relative; margin-left: 250px;'></div>
			
		</div>
	</div>
	
</body>
</html>
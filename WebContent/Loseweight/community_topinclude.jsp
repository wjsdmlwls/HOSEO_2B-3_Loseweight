<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import = "board.board_DAO" %>
<%@ page import = "board.board_DTO" %>
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<html>
<head>
<link rel="stylesheet" href="/2019_JeonJSP/Loseweight/css/bootstrap.min.css">
<script src="/2019_JeonJSP/Loseweight/js/jquery.slim.min.js"></script>
<script src="/2019_JeonJSP/Loseweight/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/2019_JeonJSP/Loseweight/community/include.css">
<link rel="stylesheet" href="/2019_JeonJSP/Loseweight/maincss.css">
<script>
	<!-- modal windows -->
	window.closeModal = function() {
		   $( '#myModal_l' ).modal( 'hide' );
		}
	
	$( document ).ready( function() {

		var jbOffset = $( '.menu' ).offset(); /*여기가 스크롤 다운시 base가 됨*/
			$( window ).scroll( function() {
			if ( $( document ).scrollTop() > jbOffset.top ) {
				$( '.Opacity_box' ).addClass( 'top_in_menuFixed' );
				$(".mainlogo_box").addClass("top_in_delete_logo");
				$(".top_in_login-up").addClass("top_in_login-up_delete");
				}
		else {
			$( '.Opacity_box' ).removeClass( 'top_in_menuFixed' );
			$(".mainlogo_box").removeClass("top_in_delete_logo");
			$(".top_in_login-up").removeClass("top_in_login-up_delete");
			}
		});
		} );

		$(window).scroll(function() { 
			var scroll = $(window).scrollTop();
			//console.log(scroll);
			if (scroll >= 200) {
				//console.log('a');
				$(".Opacity_box").addClass(".top_in_scrollchange");
				$(".mainlogo_box").addClass("top_in_delete_logo");
				$(".top_in_login-up").addClass("top_in_login-up_delete");
				} else {
				//console.log('a');
				$(".mainlogo_box").removeClass(".top_in_scrollchange");
			}
		});
	
		
</script>


<title>게시판</title>
</head>
<%
	String imgs = request.getParameter("imgs");
%>
<body>
<%
	String id= null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}	
	//로그인이 성공하면 아이디값으로 세션에 접속을함.
	%>
<% 
		String tom = request.getParameter("tom"); /*table of menu*/
		String toc = request.getParameter("toc"); /*table of contents*/
		String boardname = request.getParameter("boardname"); /*table of contents*/
%>
	<div class="top_include_body">
		<img id="community" src="/2019_JeonJSP/Loseweight/community/C_img/<%=imgs%>" alt="community" >
			<div class="Opacity_box">
				<nav class="top_in_login-up">
						<li class="nav">
								<%if(id==null){ %>
								<a href="#" id="login_bt"data-toggle="modal" data-target="#myModal_l">로그인</a>
								<a href="#" id="singup_bt"data-toggle="modal" data-target="#myModal_s">회원가입</a>
								
								<%}else{%>
								<a href="/2019_JeonJSP/Loseweight/lw_user/user_Info.jsp">마이페이지</a>
								<a href="/2019_JeonJSP/Loseweight/lw_user/logout.jsp">로그아웃</a>
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
							<a href='/2019_JeonJSP/Loseweight/community/board/board_list.jsp'>게시판</a>
						</li>
						<li class='last'>
							<a href='/2019_JeonJSP/Loseweight/servicecenter/Noticeboard/notice_list.jsp'>고객센터</a>
						</li>
						<li>
							<a href='#'>shop</a>
						</li>
						
					</ul>
				</div>
			</div>
	</div>
	<!-- nav menu -->
	<div class="menubar" style="margin-top:370px">
<ul>
 <li style="width:100px"><a href='/2019_JeonJSP/Loseweight/lw_main.jsp'><img style="width: 30px; height: 30px;margin-top: 13px;" src="/2019_JeonJSP/Loseweight/img/top_include/btn_home_location.png"></a></li>
 
 <li><a href="#" id="current">
 <%if(tom.equals ("0")){ %>마이 페이지<%}%>
 <%if(tom.equals ("1")){ %>운동방법<%}%>
 <%if(tom.equals ("2")){ %>식단조절<%}%>
 <%if(tom.equals ("3")){ %>게시판<%}%>
 <%if(tom.equals ("4")){ %>고객센터<%}%>
 <%if(tom.equals ("5")){ %>shop<%}%>
 </a>
 
	<ul>
     <li><a href="#">운동방법</a></li>
     <li><a href="#">식단조절</a></li>
     <li><a href='/2019_JeonJSP/Loseweight/community/board/board_list.jsp'>게시판</a></li>
     <li><a href='/2019_JeonJSP/Loseweight/servicecenter/Noticeboard/notice_list.jsp'>고객센터</a></li>
     <li><a href="#">shop</a></li>
    </ul>
    
 </li>
 	<li><a href="#"><%=boardname %></a>	
	 	<ul>
		 	<%if(tom.equals ("0")){ %>
		 		 <li><a href="#">회원정보</a></li>
			     <li><a href="#">나의 몸무게</a></li>
			     <li><a href="#">회원탈퇴</a></li>
			<%}%>
			 <%if(tom.equals ("1")){ %><%}%>
			 <%if(tom.equals ("2")){ %><%}%>
			 <%if(tom.equals ("3")){ %> 
			 	 <li><a href='/2019_JeonJSP/Loseweight/community/board/board_list.jsp'>자유게시판</a></li>
			     <li><a href='/2019_JeonJSP/Loseweight/community/bf_board/bfboard_list.jsp'>BEFOR & AFTER</a></li>
			 <%}%>
			 <%if(tom.equals ("4")){ %>
			 	 <li><a href='/2019_JeonJSP/Loseweight/servicecenter/Noticeboard/notice_list.jsp'>공지사항</a></li>
			     <li><a href='/2019_JeonJSP/Loseweight/servicecenter/questionboard/question_list.jsp'>문의하기</a></li>
			 <%}%>
			 <%if(tom.equals ("5")){ %><%}%>
	 	</ul>
 	</li>
</div>
<hr style="background:#ccc; margin-top: -1px;">
	<!-- nav menu -->
		
		<%if(tom.equals ("0")){ %>
		<div class='sub_menu' >			
						<ul>
							<li>
								<a href='user_Info.jsp'<%if(toc.equals ("0")){ %><%}%>>회원정보</a>
							</li>
							<li>
								<a href='#'<%if(toc.equals ("1")){ %><%}%>>나의 몸무게 </a>
							</li>
							<li>
								<a href='user_delete.jsp'<%if(toc.equals ("2")){ %><%}%>>회원탈퇴</a>
							</li>
						</ul>
					</div>
		<%} %>
		<%if(tom.equals ("3")){ %>
		<div class='sub_menu3'>			
		
						<ul>
							<li>
								<a href='/2019_JeonJSP/Loseweight/community/board/board_list.jsp'<%if(toc.equals ("0")){ %><%}%>>자유게시판</a>
							</li>
							<li>
								<a href='/2019_JeonJSP/Loseweight/community/bf_board/bfboard_list.jsp'<%if(toc.equals ("1")){ %><%}%>>BEFOR & AFTER </a>
							</li>
						</ul>
		</div>
		<%} %>
		<%if(tom.equals ("4")){ %>
		<div class='sub_menu4'>			
						<ul>
							<li>
								<a href='/2019_JeonJSP/Loseweight/servicecenter/Noticeboard/notice_list.jsp'<%if(toc.equals ("0")){ %><%}%>">공지사항</a>
							</li>
							<li>
								<a href='/2019_JeonJSP/Loseweight/servicecenter/questionboard/question_list.jsp'<%if(toc.equals ("1")){ %><%}%>"> 문의하기 </a>
							</li>
						</ul>
					</div>
		<%} %>
		
<div class="modallist">
								<!-- signUp modal -->
								<div id="myModal_l" class="modal fade" style="margin-top:40px">
							        <div class="modal-dialog" style="margin-top:100px;">
							            <div class="modal-content">
							               <iframe id="iframe_l"src="/2019_JeonJSP/Loseweight/lw_user/login(old).jsp" style="width: 660px; height: 690px;" scrolling="no"></iframe>
							            </div>
							        </div>
							    </div>
								<div id="myModal_s" class="modal fade" style="margin-top:40px">
								        <div class="modal-dialog" style="margin-top:100px">
								            <div class="modal-content">
								                <iframe id="iframe_s"src="/2019_JeonJSP/Loseweight/lw_user/user_signUp(old).jsp"style="width: 530px;height: 750px;" scrolling="no"></iframe>
								            </div>
								        </div>
								</div>
							</div>
</body>
</html>
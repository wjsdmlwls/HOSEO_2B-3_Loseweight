<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import = "board.board_DAO" %>
<%@ page import = "board.board_DTO" %>
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "user.*"%>

<html>
<head>
<style>
.menu_s:hover{
text-decoration: underline; 
}
</style>
<link rel="stylesheet" href="/2019_JeonJSP/Loseweight/css/bootstrap.min.css">
<script src="/2019_JeonJSP/Loseweight/js/jquery.slim.min.js"></script>
<script src="/2019_JeonJSP/Loseweight/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/2019_JeonJSP/Loseweight/community/include.css">
<link rel="stylesheet" href="/2019_JeonJSP/Loseweight/maincss.css">
<script>
function loginshow() {
	   $( '#myModal_l' ).modal( 'show' );
	}
	window.closeModal = function() {
	$( '#myModal_l' ).modal( 'hide' );
	location.reload();
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
	$( document ).ready( function() {
		var jbOffset = $( '.shop_contents' ).offset(); /*여기가 스크롤 다운시 base가 됨*/
			$( window ).scroll( function() {
			if ( $( document ).scrollTop() > jbOffset.top ) {
				$( '.Opacity_box' ).removeClass( 'top_in_menuFixed' );
				$(".mainlogo_box").removeClass("top_in_delete_logo");
				$(".top_in_login-up").removeClass("top_in_login-up_delete");
				}
		});
		} );
		$(window).scroll(function() { 
			var scroll = $(window).scrollTop();
			//console.log(scroll);
			if (scroll >= 0) {
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
	UserDAO db = new UserDAO();
	int point = db.lpupdate(id);
	%>
<% 
		String tom = request.getParameter("tom"); /*table of menu*/
		String toc = request.getParameter("toc"); /*table of contents*/
		String boardname = request.getParameter("boardname"); /*table of contents*/
%>
	<div class="top_include_body">
		<div class="top_backgorund">
		
		<img id="community" src="/2019_JeonJSP/Loseweight/community/includeback_img/<%=imgs%>" alt="community" >
		<div style="position: relative;text-align: center;padding-top: 155px;"><a style="color: #fff;font-size: 40px;font-weight: bold;cursor: context-menu;text-decoration: none;"><%=boardname %></a></div>
		</div>
			<div class="Opacity_box">
				<nav class="top_in_login-up">
						<li class="nav">
								<%if(id==null){ %>
								<a href="#" id="login_bt"data-toggle="modal" data-target="#myModal_l">로그인</a>
								<a href="#" id="singup_bt"data-toggle="modal" data-target="#myModal_s">회원가입</a>
								
								<%}else{%>
								<a><img src="lp.png" style="padding-right:10px;"><%=point %></a>
								<a href="/2019_JeonJSP/Loseweight/lw_user/user_shopping_basket.jsp">주문내역</a>
								<a href="/2019_JeonJSP/Loseweight/lw_user/user_Info.jsp">마이페이지</a>
								<a href="/2019_JeonJSP/Loseweight/lw_user/logout.jsp">로그아웃</a>
								<%} %>
						</li>
				</nav>
				<div class="iner">
				<div>
					<a href="/2019_JeonJSP/Loseweight/lw_main.jsp">
						<img style="position: absolute;width: 150px;height: auto;margin-top: 15px;"src="/2019_JeonJSP/Loseweight/img/footer_include/logo.png">
					</a>
				</div>
				<div class='menu'>			
					<ul class="nav01">
						<li>
							<a href='/2019_JeonJSP/Loseweight/ex/ex.jsp'>운동방법</a>
						</li>
						<li>
							<a href='/2019_JeonJSP/Loseweight/diet_food/foodplan_board/foodplanboard_list.jsp'>식단조절</a>
						</li>
						<li>
							<a href='/2019_JeonJSP/Loseweight/community/board/board_list.jsp'>게시판</a>
						</li>
						<li class='last'>
							<a href='/2019_JeonJSP/Loseweight/servicecenter/Noticeboard/notice_list.jsp'>고객센터</a>
						</li>
						<li>
							<a href='/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp'>shop</a>
						</li>
						
							<ul>
							     <li style="margin-left: 40px;"><a href="/2019_JeonJSP/Loseweight/ex/ex.jsp">맨몸운동</a></li>
							     <li style="margin-left:20px;"><a href="/2019_JeonJSP/Loseweight/diet_food/foodplan_board/foodplanboard_list.jsp">추천식단</a></li>
							     <li style="margin-left: -5px;"><a href='/2019_JeonJSP/Loseweight/community/board/board_list.jsp'>자유게시판</a></li>
							     <li style="margin-left: -10px;"><a href='/2019_JeonJSP/Loseweight/servicecenter/Noticeboard/notice_list.jsp'>공지사항</a></li>
							     <li style="margin-left: 10px;"><a href="/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp">shop</a></li>
							     
							     <li style="margin-left: 40px;margin-top:0;"><a href="/2019_JeonJSP/Loseweight/ex/ex_gigu1.jsp">기구운동</a></li>
							     <li style="margin-top:0;margin-left: 25px;"><a href="/2019_JeonJSP/Loseweight/ex/exfood.jsp">식단TIP</a></li>
							     <li style="margin-left: -15px;margin-top:0;"><a href='/2019_JeonJSP/Loseweight/community/bf_board/bfboard_list.jsp'>BEFOR & AFTER</a></li>
							     <li style="margin-left: -30px;margin-top:0;"><a href='/2019_JeonJSP/Loseweight/servicecenter/questionboard/question_list.jsp'>문의하기</a></li>
							     <li style="margin-top:0; margin-left: 10px;"><a href="/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp"></a></li>
							</ul>
					</ul>
				</div>
			</div>
			</div>
	</div>
	<!-- nav menu -->
	<div class="menubar" style="margin-top:155px">
<ul>
 <li style="width:100px"><a href='/2019_JeonJSP/Loseweight/lw_main.jsp'><img style="width: 30px; height: 30px;margin-top: 13px;" src="/2019_JeonJSP/Loseweight/img/top_include/btn_home_location.png"></a></li>
 
 <li><a href="#" id="current">
 <%if(tom.equals ("0")){ %>마이 페이지<%}%>
 <%if(tom.equals ("1")){ %>운동방법<%}%>
 <%if(tom.equals ("2")){ %>식단조절<%}%>
 <%if(tom.equals ("3")){ %>게시판<%}%>
 <%if(tom.equals ("4")){ %>고객센터<%}%>
 <%if(tom.equals ("5")){ %>shop<%}%>
 <%if(tom.equals ("6")){ %>주문내역<%}%>
 
 </a>
 
 
	<ul>
     <li><a href="/2019_JeonJSP/Loseweight/ex/ex.jsp">운동방법</a></li>
     <li><a href="/2019_JeonJSP/Loseweight/diet_food/foodplan_board/foodplanboard_list.jsp">식단조절</a></li>
     <li><a href='/2019_JeonJSP/Loseweight/community/board/board_list.jsp'>게시판</a></li>
     <li><a href='/2019_JeonJSP/Loseweight/servicecenter/Noticeboard/notice_list.jsp'>고객센터</a></li>
     <li><a href="/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp">shop</a></li>
    

    </ul>
    
 </li>
<% if(!toc.equals ("not")){%>
 	<li><a href="#"><%=boardname%></a>
	 	<ul>
		 	<%if(tom.equals ("0")){ %>
		 		 <li><a class="menu_s" href="/2019_JeonJSP/Loseweight/lw_user/user_Info.jsp">회원정보</a></li>
			     <li><a class="menu_s" href="#">나의 몸무게</a></li>
			     <li><a class="menu_s" href="/2019_JeonJSP/Loseweight/lw_user/user_delete.jsp">회원탈퇴</a></li>
			     
			<%}%>
			 <%if(tom.equals ("1")){ %>
				 <li><a class="menu_s" href="/2019_JeonJSP/Loseweight/ex/ex.jsp">맨몸운동</a></li>
				 <li><a class="menu_s" href="/2019_JeonJSP/Loseweight/ex/ex_gigu1.jsp">기구운동</a></li>
			 <%}%>
			 <%if(tom.equals ("2")){ %>
			 	 <li><a class="menu_s" href='/2019_JeonJSP/Loseweight/community/board/board_list.jsp'>추천식단</a></li>
			     <li><a class="menu_s" href='/2019_JeonJSP/Loseweight/community/bf_board/bfboard_list.jsp'>식단TIP</a></li>
			 <%}%>
			 <%if(tom.equals ("3")){ %> 
			 	 <li><a class="menu_s" href='/2019_JeonJSP/Loseweight/community/board/board_list.jsp'>자유게시판</a></li>
			     <li><a class="menu_s" href='/2019_JeonJSP/Loseweight/community/bf_board/bfboard_list.jsp'>BEFOR & AFTER</a></li>
			 <%}%>
			 <%if(tom.equals ("4")){ %>
			 	 <li><a class="menu_s" href='/2019_JeonJSP/Loseweight/servicecenter/Noticeboard/notice_list.jsp'>공지사항</a></li>
			     <li><a class="menu_s" href='/2019_JeonJSP/Loseweight/servicecenter/questionboard/question_list.jsp'>문의하기</a></li>
			     
			 <%}%>

			 <%if(tom.equals ("5")){ %>
			 <li><a href='/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp'>기구</a></li>
			 <li><a href='/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp'>식품</a></li>
			     <%}%>

			 <%if(tom.equals ("6")){ %>
			  <li><a href='/2019_JeonJSP/Loseweight/lw_user/user_shopping_basket.jsp'>장바구니</a></li>
			 <li><a href='/2019_JeonJSP/Loseweight/lw_user/user_jumoon.jsp'>구매목록</a></li>
			 <%}%>
			<%if(tom.equals ("shop")){ %>
			 <li><a href='/2019_JeonJSP/Loseweight/lw_user/user_shopping_basket.jsp'>장바구니</a></li>
			 <li><a href='/2019_JeonJSP/Loseweight/lw_user/user_jumoon.jsp'>구매목록</a></li>
			 <%}%>
			 
			  <%if(tom.equals ("7")){ %>
			
			 <%}%>
	 	</ul>
 	</li>
 	<%} %>
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
								<a class="menu_s" href='/2019_JeonJSP/Loseweight/community/board/board_list.jsp'<%if(toc.equals ("0")){ %><%}%>>자유게시판</a>
							</li>
							<li>
								<a class="menu_s" href='/2019_JeonJSP/Loseweight/community/bf_board/bfboard_list.jsp'<%if(toc.equals ("1")){ %><%}%>>BEFOR & AFTER </a>
							</li>
						</ul>
		</div>
		<%} %>
		<%if(tom.equals ("4")){ %>
		<div class='sub_menu3'>			
						<ul>
							<li>
								<a class="menu_s" href='/2019_JeonJSP/Loseweight/servicecenter/Noticeboard/notice_list.jsp'<%if(toc.equals ("0")){ %><%}%>">공지사항</a>
							</li>
							<li>
								<a class="menu_s" href='/2019_JeonJSP/Loseweight/servicecenter/questionboard/question_list.jsp'<%if(toc.equals ("1")){ %><%}%>"> 문의하기 </a>
							</li>
						</ul>
					</div>
		<%} %>
		<%if(tom.equals ("5")){if(!toc.equals ("not")){ %>
		<div class='sub_menu3'>			
						<ul>
							<li>
								<a href='/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp'<%if(toc.equals ("0")){ %><%}%>">SHOP</a>
							</li>
							<li>
								<a href='/2019_JeonJSP/Loseweight/testshop/Fitness_shop_board/Fitness_shop_list.jsp'<%if(toc.equals ("1")){ %><%}%>">식품 </a>
							</li>
						</ul>
					</div>
		<%}}%>
		<%if(tom.equals ("6")){ %>
		<div class='sub_menu3' >			
						<ul>
							<li>
								<a href='user_shopping_basket.jsp'<%if(toc.equals ("0")){ %><%}%>>장바구니</a>
							</li>
							<li>
								<a href='user_jumoon.jsp'<%if(toc.equals ("1")){ %><%}%>>구매내역</a>
							</li>
						</ul>
					</div>
		<%} %>
		<%if(tom.equals ("shop")){ %>
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
								                <iframe id="iframe_s"src="/2019_JeonJSP/Loseweight/lw_user/user_signUp(old).jsp"style="width: 530px;height: 850px;" scrolling="no"></iframe>
								            </div>
								        </div>
								</div>
							</div>
						
</body>
</html>
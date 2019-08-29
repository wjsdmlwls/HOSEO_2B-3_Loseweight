<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	<title>로그인</title>
</head>
<!-- stlye css -->
<style>

</style>
 <link rel="stylesheet" href="../css/style.css">
<body style="background:#f7f7f7;">
	<div class="page_form">
		<div style="margin-top:50px;">
				<a href="../lw_main.jsp"><img src="../img/logo/logo.png" alt=""></a>
		</div>
		<div class="login_form autosize">
			<form class="login_postform" action="loginAction.jsp" method="post" name="vcheck">  
				<h4 class="login_inputfont">아이디</h4>
				<input class="login_input" type="text" name="lw_id" placeholder="아이디">
				<h4 class="login_inputfont">비밀번호</h4>
				<input class="login_input" type="password" name="lw_passwd" placeholder="비밀번호">				
				<input type="text" name="lw_lp" value="0" style="display:none"> 
				<a href="./find_id_pw.jsp" style="margin-top:15px;"class="find_info">아이디  비밀번호찾기</a>                     
				<div class="login_butonbar">
					<button type="submit" class="button salmon" style="margin-top:15px; width:400px; height:50px; font-size:20px; cursor:pointer;">로그인</button>
				</div>
			</form>
			<div style="margin-top:-25px"> 
			<hr class="login_hr">
			<button onclick="location.href='user_signUp.jsp'"type="button" class="button" style="margin-top:5px;width:400px; height:50px; font-size:20px; cursor:pointer;">회원가입</button>
			</div>
		</div>
		<div class="login_findinfo">
		</div>
	</div>

</body>
</html>

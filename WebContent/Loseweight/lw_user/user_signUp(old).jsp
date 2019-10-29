<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
<script type="text/javascript" src="vcheck.js"> 
    </script>
	<!-- 주소 데이터 가져오는 스크립트  -->
    <script type="text/javascript">
        var openWin;
        function openzipcode()
        {
            // window.name = "해당페이지로 가져옴 이름"; 
            window.name = "user_info";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("/2019_JeonJSP/zipfinder/zipSearch.jsp",
                    "childForm", "width=580, height=500, resizable = no, scrollbars = yes");    
        }
        
   </script>
   <!-- 주소 end -->
</head>
<!-- stlye css -->
 <link rel="stylesheet" href="../css/style.css">
<body  style="background:#f7f7f7;">
	<!-- header start -->
	<div class="singup_form">
		<div>
			<div>
				<a style="margin-top: -30px;"><img src="logo.png" alt="" /></a>
			</div>
		</div>
		<div class="singup_postform autosize" style="margin-top:-30px;">
			<form class="singupform" action="user_signUpAction.jsp" method="post" name="vcheck">
				<h4 class="singup_inputfont">아이디</h4>
				<input class="singup_input" type="text" name="lw_id" placeholder="아이디">
				<h4 class="singup_inputfont">비밀번호</h4>
				<input class="singup_input" type="password" name="lw_passwd" placeholder="비밀번호" onkeyup="pw_m_alert_s()">
				<h4 class="singup_inputfont">비밀번호 확인</h4>
				<input class="singup_input" type="password" name="lw_passwd2" placeholder="비밀번호 확인" onkeyup="pw_m_alert_s()">
				<span id="alert_pw_s" ></span><br>
				<h4 class="singup_inputfont" style="position: absolute;">이름</h4>
				<h4 class="singup_inputfont" style="margin-left: 210px;">성별</h4>
				<input class="singup_input" type="text" name="lw_name" placeholder="이름" style="width:190px;margin-right:12px">
				<select class="singup_select" name="lw_gender" style="width:190px;">
					<option value="남성"selected="selected">남성</option>
					<option value="여성">여성</option>
				</select><br>
				<h4 class="singup_inputfont">이메일</h4>
				<input class="singup_input" type="text" name="lw_e_mail1" placeholder="이메일" style="width:138px"/><a style="margin-left:4px">@</a>
				<input class="singup_input" type="text" name="lw_e_mail2" style="width:138px"/>
				<select class="singup_select" name="e_mail3" onchange="email3(this.form)">
					<option value="naver.com">네이버</option>
					<option value="daum.com">다음</option>
					<option value="nate.com">네이트</option>
					<option value="gmail.com">구글</option>
					<option value="0"selected="selected">집적입력</option>
				</select><br>
				<h4 class="singup_inputfont">주소</h4>
				<input class="singup_input" type="text" id ="lw_zipcode" name="lw_zipcode" placeholder="우편번호" style="width:100px; float:left;"><button class="button salmon button_addr" style="line-height: 37px; float: left; margin-top: 4px;" type="button" onclick="openzipcode()">주소검색</button>
				<input class="singup_input" type="text" id="lw_addr1" name="lw_addr1" placeholder="주소 ">
				<input class="singup_input" type="text" id="lw_addr2" name="lw_addr2" placeholder="상세주소를 입력해주세요" >
				<h4 class="singup_inputfont">전화번호</h4>
				<input class="singup_input" type="text" name="lw_phone" placeholder="전화번호">
				<input type="text" name="lw_lp" value=0 style="display:none">                      
				<div class="singupbuttonarer">
					<button type="submit" class="button salmon" style="width:400px;height:40px"><span>회원가입</span></button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

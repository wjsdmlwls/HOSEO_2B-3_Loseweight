<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
	<head>
	<meta charset="UTF-8">
	<title>http://www.blueb.co.kr</title>
<script type="text/javascript" src="vcheck.js"> </script>
<style rel="stylesheet">
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;
}
body .container {
  position: relative;
  overflow: hidden;
  width: 700px;
  height: 500px;
  margin: 80px auto 0;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
body .container .half {
  float: left;
  width: 50%;
  height: 100%;
  padding: 58px 40px 0;
}
body .container .half.bg {
  background-image: url("http://www.blueb.co.kr/SRC2/_image/v01.jpg");
  background-size: 400px;
  background-repeat: no-repeat;
}
body .container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .container .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
body .container .tabs .tab {
  display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
}
body .container .tabs .tab.active {
  border-bottom: 1px solid #263238;
}
body .container .content form {
  position: relative;
  height: 287px;
}
body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .container .content label:not([for='remember']) {
  display: none;
}
body .container .content input.inpt {
  font-size: 14px;
  display: block;
  width: 100%;
  height: 42px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}

body .container .content input.inpte {
  font-size: 14px;
  display: block;
  width: 40%;
  height: 42px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:focus {
  border-color: #999999;
}
body .container .content input.submit {
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 100%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
body .container .content input:focus {
  outline: none;
}
body .container .content .checkbox {
  margin-top: 4px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px;
  padding: 0;
  border: 0;
}
body .container .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .container .content .checkbox + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .container .content .checkbox:checked + label:before {
  content: "✓";
}
body .container .content .submit-wrap {
  position: relative;
  bottom: 0;
  width: 100%;
}
body .container .content .submit-wrap a {
  font-size: 12px;
  display: block;
  margin-top: 20px;
  text-align: center;
  text-decoration: none;
  color: #999999;
}
body .container .content .submit-wrap a:hover {
  text-decoration: underline;
}
body .container .content .signup-cont {
  display: none;
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}

</style>
<!-- 우편창 -->
    <script type="text/javascript">
        var openWin;
        function openzipcode()
        {
            // window.name = "해당페이지로 가져옴 이름"; 
            window.name = "user_info";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("../../zipfinder/zipSearch.jsp",
                    "childForm", "width=580, height=500, resizable = no, scrollbars = yes");    
        }
        function closemodal(){
        	window.parent.closeModal();
        }
   </script>
</head>
<body style="margin-left:-3px">
<script>

</script>
<section class="container"style="height:800px">
		    <article class="half" >
			        <h1>LOSE WEIGHT</h1>
			        <div class="tabs">
				            <span class="tab signin "><a href="#signin">로그인</a></span>
				            <span class="tab signup active"><a href="#signup">회원가입</a></span>
			        </div>
			        <div class="content">
				            <div class="signin-cont cont"style="display: none;" >
					                <form action="loginAction.jsp" method="post">
						                    <input type="text" name="lw_id" id="lw_id" class="inpt" required="required" placeholder="아이디">
						                    <label for="lw_id">아이디</label>
						                    <input type="password" name="lw_passwd" id="lw_passwd" class="inpt" required="required" placeholder="비밀번호">
                						    <label for="lw_passwd">비밀번호</label>
						                    <input type="checkbox" id="remember" class="checkbox" checked>
						                    <label for="remember">비밀번호 저장</label>
						                    <div class="submit-wrap">
							                        <input type="submit" value="로그인" class="submit">
							                        <a href="find_id_pw.jsp" class="more">아이디 비밀번호찾기 </a>
						                    </div>
        					        </form>
    				        </div>
    				        
    				        <div class="signup-cont cont" style="display: block;">
         				       <form action="user_signUpAction.jsp" method="post">
						                     <input type="text" name="lw_id" id="lw_id" class="inpt" required="required" placeholder="아이디">
						                    <label for="lw_id">아이디</label>
						                    <input type="password" name="lw_passwd" id="lw_passwd" class="inpt" required="required" placeholder="비밀번호">
						                    <input type="password" name="lw_passwd2" id="lw_passwd2" class="inpt" required="required" placeholder="비밀번호 확인">
                						    <label for="lw_passwd">비밀번호</label>
                						    <input type="text" name="lw_name" id="lw_name" class="inpt" required="required" placeholder="이름"style="width:130px;float:left;">
                						    <select class="singup_select" name="lw_gender" style=" display: block;height:42px;width: 130px; float:right;margin-bottom: 12px;padding: 10px;color: #999999;border: 1px solid #d9d9d9;background: transparent;-moz-border-radius: 2px;-webkit-border-radius: 2px;border-radius: 2px;">
												<option value="남성"selected="selected">남성</option>
												<option value="여성">여성</option>
											</select>
						                    <label for="lw_name">이름</label>
                						    <input type="text" name="lw_e_mail1" style="width:125px;float:left"id="lw_e_mail1" class="inpte" required="required" placeholder="이메일"> 
                						    <a style="font-size: 20px; margin-left: 2px;line-height: 40px;">@</a>
                						    <input type="text" name="lw_e_mail2" style="width:125px;float:right"id="lw_e_mail2" class="inpte" required="required" placeholder="직접입력">
                						 	<select class="singup_select" name="e_mail3" onchange="email3(this.form)" style=" display: block;width: 100%; height:40px;margin-bottom: 12px;padding:10px;color: #999999;border: 1px solid #d9d9d9;background: transparent;-moz-border-radius: 2px;-webkit-border-radius: 2px;border-radius: 2px;">
												<option value="naver.com">네이버</option>
												<option value="daum.com">다음</option>
												<option value="nate.com">네이트</option>
												<option value="gmail.com">구글</option>
												<option value="0"selected="selected">집적입력</option>
											</select>
						                    <label for="email">이메일</label>
                   							<input type="text" name="lw_zipcode" id="lw_zipcode" style="width:200px;float:left;"class="inpt" required="required" placeholder="우편번호"><button class="button salmon button_addr" style="line-height: 37px; float: right;" type="button" onclick="openzipcode()">주소검색</button>
						                    <input type="text" name="lw_addr1" id="lw_addr1" class="inpt" required="required" placeholder="주소">
                   							<input type="text" name="lw_addr2" id="lw_addr2" class="inpt" required="required" placeholder="상세주소를 입력해주세요">
						                    <label for="addr1">주소</label>
                   							<input type="text" name="lw_phone" id="lw_phone" class="inpt" required="required" placeholder="전화번호">
                   							<input type="text" name="lw_lp" value=0 style="display:none">      
						                    <label for="phone">전화번호</label>
						                    <div class="submit-wrap">
							                        <input type="submit" value="회원가입" class="submit" ">
							                        <a href="#" class="more">이용약관</a>
						                    </div>
        					        </form>
           				 </div>
			        </div>
		    </article>
		    <div class="half bg"></div>
	</section>



<script src="../js/jquery.slim.min.js"></script> 
<script type="text/javascript">
$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
        $('.container').height( '800px' );
        $('.half').height( '100%' );
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
        $('.container').height( '800px' );
        $('.half').height( '100%' );
    }
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
	<head>
	<meta charset="UTF-8">
	<title>http://www.blueb.co.kr</title>
<script type="text/javascript" src="vcheck.js"> </script>
<link rel="stylesheet" href="modalstyle.css">
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
				            <span class="tab signin active"><a href="#signin">로그인</a></span>
				            <span class="tab signup "><a href="#signup">회원가입</a></span>
			        </div>
			        <div class="content">
				            <div class="signin-cont cont" >
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
    				        
    				        <div class="signup-cont cont">
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
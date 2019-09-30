<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
<head>
<meta charset="UTF-8">
<!-- stlye css -->
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="vcheck.js">
</script>
</head>
<body style="width:550px">
	<div class="idps_topform">
		<a href="login(old).jsp"><img src="../img/logo/logo.png" alt="" /></a>
		<div class="idps_form">
			<h3>아이디찾기</h3>	
		</div>
	<div class="idps_post">
	    <form class="idpas_post" method="post" name="vcheck1" action="find_id_Action.jsp" onsubmit="return id_pw_name_phone()">
	        <table class="idps_post_table">  
	            <thead>
	            <tr>
	                <th>이름</th>
	                 <td><input class="idps_input" type="text" name="lw_name"></td>
	            </tr>
	            </thead>
	            <tr>
	                <th>핸드폰번호</th>
	                <td><input class="idps_input" type="text" name="lw_phone" placeholder="-를 빼고 기입해주세요" onkeyup="ph_m_alert()">
	                <span id="alert"><span style="color:blue;"></span></span></td>
	                
	            </tr>
	            </table>
	            <div class="idps_btcenter">
	            <input type="submit" class="button salmon idps_bt"  id="schBT" value="아이디 찾기" />	
	            </div>
	    </form>
	    <div class="idps_form">
			<h3>비밀번호찾기</h3>	
		</div>
	    <form class="idps_post" name="vcheck" action="find_pw_Action.jsp" onsubmit="return id_pw_id_e_mail()">
	          <table  class="idps_post_table"> 
	          <thead>
	            <tr>
	                <th>아이디</th>
	                <td>
	                <input class="idps_input" type="text" name="lw_id">
	                </td>
	            </tr>
	           </thead> 	           
	            <tr>
	                <th>이메일</th>
	                <td>
		                <input class="idps_input" type="text" name="lw_e_mail1" ><a>@</a>
		                <input class="mypage_post_e_mail" type="text" name="lw_e_mail2" value="">
		                <select class="mypage_post_e_mailselect" name="e_mail3" onchange="email3(this.form)">
														<option value="naver.com">네이버</option>
													    <option value="daum.com">다음</option>
													    <option value="nate.com">네이트</option>
													    <option value="gmail.com">구글</option>
													    <option value="0" selected="selected">집적입력</option>
						</select>
					</td>	    
					          
	            </tr>
	        </table>
		<div class="idps_btcenter">
			<button class="button salmon idps_bt" type="submit" value="비밀번호 찾기" id="schBT">비밀번호 찾기</button>
		</div>
	    </form>
	 </div> 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="ex.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link href="notice_list_css.css" rel="stylesheet" type="text/css">
<link href="../community/include.css" rel="stylesheet" type="text/css">
<title>운동방법</title>
</head>
<body>
<%
	String id= null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}else{
		id="";
	}	
	
	//로그인이 성공하면 아이디값으로 세션에 접속을함.
%>
<jsp:include page="../community/community_topinclude.jsp" >
			<jsp:param name="tom" value="1"/>
			<jsp:param name="toc" value="0"/>
			<jsp:param name="imgs" value="Exercise.png"/>
			<jsp:param name="boardname" value="맨몸운동"/>
</jsp:include>

<div class="main">

<div class="box">
<div class="textleft">
<p class="text1">한쪽팔 푸쉬업</p>
<p class="bluefont">난이도</p>
<p class="blackfont">고급</p>
<p class="bluefont">초점</p>
<p class="blackfont">근력</p>
<p class="bluefont">사용되는 근육</p>
<p class="blackfont">흉근, 어깨 근육, 삼두근,토털 바디</p>
<p class="bluefont">장비</p>
<p class="blackfont">없음 </p>

<p class="bluefont_link">진행</p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex.jsp">푸시업</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex2.jsp">푸쉬업 - 무릎을 꿇은 자세</a></p>
	</div>
<div class="videos">
<iframe src="https://prod-video-cms-amp-microsoft-com.akamaized.net/tenant/amp/entityid/AATtd2?blobrefkey=103&$blob=1" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
		</div>
		
			</div>
			
<div class="box2">

<div class="img">
<img class="img1" src="eximg/한쪽팔푸쉬업.jpg" alt="dd">
<p class="img_text_1">1단계</p>
<p class="img_text_2">
발을 어깨너비보다 넓게 벌리고 기본 푸시업 자세를 취합니다. 
한쪽 손을 가슴 바로 아래 바닥에 놓고 다른 손은 허리 뒤에 놓습니다. 
다리를 펴고 넓게 벌린 채 발끝이 바닥을 향하도록 합니다.</p>
</div>

<div class="img">
<img class="img1" src="eximg/한쪽팔푸쉬업2.jpg" alt="dd">
<p class="img_text_1">2단계</p>
<p class="img_text_2">
몸의 중심에 힘을 주고 바닥에 놓은 손의 손바닥을 살짝 비틀어 고정한 채 천천히 아래로 내려갑니다. 
잠시 멈췄다가 시작 자세로 돌아옵니다.</p>
</div>
</div>

<div class="box3">

<p class="next_text">진행 및 변형</p>
<!-- img box1 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex.jsp">
<img class="next_img" src="eximg/푸쉬업_1단계.jpg">
<p class="next_img_text1">푸쉬업</p>
<p class="next_img_text2">근력 | 초급</p>
</a>
</div>

<div class="next_imgs_div">
<a class="next_img_a" href="ex2.jsp">
<img class="next_img" src="eximg/무릎을 꿇은 자세.jpg">
<p class="next_img_text1">무릎을 꿇은 자세 </p>
<p class="next_img_text2">근력| 초급</p>
</a>
</div>
</div>
<!-- img box2 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex3.jsp">
<img class="next_img" src="eximg/메디슨1.jpg">
<p class="next_img_text1">푸시업-메디슨볼</p>
<p class="next_img_text2">근력 | 고급</p>
</a>
</div>

<div class="next_imgs_div">
<a class="next_img_a" href="ex4.jsp">
<img class="next_img" src="eximg/한쪽팔 푸쉬업-메디슨.jpg">
<p class="next_img_text1">한쪽팔 푸쉬업 - 메디슨볼</p>
<p class="next_img_text2">근력| 고급</p>
</a>
</div>
</div>
<!-- img box3 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex5.jsp">
<img class="next_img" src="eximg/푸쉬업 - 메디슨볼, 클로즈그립.jpg">
<p class="next_img_text1">푸쉬업 - 메디슨볼, 클로즈그립</p>
<p class="next_img_text2">근력| 고급</p>
</a>
</div>

</div>


<!-- 팁 -->
<div class="tip_box">
<p style="padding-bottom:15px;">팁</p>
<p class="tip_text">팔꿈치가 벌어지지 않도록 합니다.</p>
<p class="tip_text">움직이는 팔꿈치를 몸 옆에 밀착시킵니다.</p>
<p class="tip_text">골반이 밑으로 쳐지거나 올라가지 않도록 하십시오.</p>
<p class="tip_text">동작하는 내내 코어에 단단히 힘을 단단히 주고 등은 곧게 편 상태를 유지합니다.</p>
</div>
</div>			
			
</div>
<jsp:include page="../community/community_footerinclude.jsp"></jsp:include>
</body>
</html>
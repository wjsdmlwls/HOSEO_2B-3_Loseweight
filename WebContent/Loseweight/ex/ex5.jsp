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
<p class="text1">푸쉬업  메디슨볼,클로즈그립</p>
<p class="bluefont">난이도</p>
<p class="blackfont">고급</p>
<p class="bluefont">초점</p>
<p class="blackfont">근력</p>
<p class="bluefont">사용되는 근육</p>
<p class="blackfont">흉근, 어깨 근육, 삼두근,토털 바디</p>
<p class="bluefont">장비</p>
<p class="blackfont">메디슨볼</p>

<p class="bluefont_link">진행</p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex.jsp">푸시업</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex6.jsp">한쪽팔 - 푸시업</a></p>
	</div>
<div class="videos">
<iframe src="https://prod-video-cms-amp-microsoft-com.akamaized.net/tenant/amp/entityid/AATyj9?blobrefkey=103&$blob=1" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
		</div>
		
			</div>
			
<div class="box2">

<div class="img">
<img class="img1" src="eximg/클로즈그립1.jpg" alt="dd">
<p class="img_text_1">1단계</p>
<p class="img_text_2">
가슴 바로 아래쪽에 메디슨 볼을 놓고 양손을 볼 위에 올려 기본 팔굽혀펴기 자세를 취합니다. 
왼쪽 엄지손가락과 집게손가락이 오른쪽 엄지손가락과 집게손가락에 닿아야 합니다.</p>
</div>

<div class="img">
<img class="img1" src="eximg/클로즈그립2.jpg" alt="dd">
<p class="img_text_1">2단계</p>
<p class="img_text_2">
팔은 완전히 펴고 팔꿈치는 몸에 가깝게 붙이고 코어에 힘을 줍니다. 
몸을 천천히 메디슨 볼 쪽으로 내립니다. 
가슴이 볼에 닿으면 다시 밀어서 처음 위치로 돌아옵니다.</p>
</div>
</div>

<div class="box3">

<p class="next_text">진행 및 변형</p>
<!-- img box1 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex.jsp">
<img class="next_img" src="eximg/푸쉬업.jpg">
<p class="next_img_text1">푸쉬업</p>
<p class="next_img_text2">근력 | 초급</p>
</a>
</div>

<div class="next_imgs_div">
<a class="next_img_a" href="ex2.jsp">
<img class="next_img" src="eximg/무릎을 꿇은 자세.jpg">
<p class="next_img_text1">푸쉬업 - 무릎을 꿇은 자세</p>
<p class="next_img_text2">근력</p>
</a>
</div>
</div>
<!-- img box2 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex3.jsp">
<img class="next_img" src="eximg/메디슨볼.jpg">
<p class="next_img_text1">푸시업-메디슨볼</p>
<p class="next_img_text2">근력 | 고급</p>
</a>
</div>

<div class="next_imgs_div">
<a class="next_img_a" href="ex4.jsp">
<img class="next_img" src="eximg/한쪽팔 푸쉬업-메디슨.jpg">
<p class="next_img_text1">한쪽팔푸쉬업-메디슨볼</p>
<p class="next_img_text2">근력| 고급</p>
</a>
</div>
</div>
<!-- img box3 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex6.jsp">
<img class="next_img" src="eximg/한쪽팔푸쉬업.jpg">
<p class="next_img_text1">한쪽팔 푸쉬업</p>
<p class="next_img_text2">근력| 고급</p>
</a>
</div>

</div>


<!-- 팁 -->
<div class="tip_box">
<p style="padding-bottom:15px;">팁</p>
<p class="tip_text">메디슨 볼에서 손은 중심에 있어야 합니다.</p>
<p class="tip_text">공이 옆으로 굴러가지 않도록 합니다. </p>
<p class="tip_text">골반이 밑으로 쳐지거나 올라가지 않도록 하십시오.</p>
<p class="tip_text">동작하는 내내 코어에 단단히 힘을 단단히 주고 등은 곧게 편 상태를 유지합니다.</p>
</div>
</div>			
			
</div>
<jsp:include page="../community/community_footerinclude.jsp"></jsp:include>
</body>
</html>
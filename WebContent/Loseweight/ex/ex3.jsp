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
<p class="text1">푸시업 - 메디슨볼</p>
<p class="bluefont">난이도</p>
<p class="blackfont">중급</p>
<p class="bluefont">초점</p>
<p class="blackfont">근력</p>
<p class="bluefont">사용되는 근육</p>
<p class="blackfont">흉근, 어깨 근육, 삼두근</p>
<p class="bluefont">장비</p>
<p class="blackfont">메디슨볼</p>

<p class="bluefont_link">진행</p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex1.jsp">푸시업</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex4.jsp">한쪽 팔 푸시업 - 메디슨볼</a></p>
	</div>
<div class="videos">
<iframe src="https://prod-video-cms-amp-microsoft-com.akamaized.net/tenant/amp/entityid/AATCEN?blobrefkey=103&$blob=1" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
		</div>
		
			</div>
			
<div class="box2">

<div class="img">
<img class="img1" src="eximg/메디슨1.jpg" alt="dd">
<p class="img_text_1">1단계</p>
<p class="img_text_2">
메디슨 볼을 가슴 아래에 놓고 기본적인 팔굽혀펴기 자세를 취합니다. 
손을 바닥에 놓지 말고 메디슨 볼 위에 놓도록 합니다. 
발목에서 어깨까지 직선이 되도록 합니다. 이것이 시작 자세입니다.</p>
</div>

<div class="img">
<img class="img1" src="eximg/메디슨2.jpg" alt="dd">
<p class="img_text_1">2단계</p>
<p class="img_text_2">
가슴이 거의 공에 닿을 때까지 몸을 낮추고, 이때 팔꿈치는 가능한 한 몸 옆에 밀착시키도록 합니다. 
잠시 멈췄다가 다시 팔을 펴서 처음 자세로 돌아옵니다.</p>
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
<p class="next_img_text2">근력| 초급</p>
</a>
</div>
</div>
<!-- img box2 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex4.jsp">
<img class="next_img" src="eximg/한쪽팔 푸쉬업-메디슨.jpg">
<p class="next_img_text1">한쪽팔푸쉬업-메디슨볼</p>
<p class="next_img_text2">근력 | 고급</p>
</a>
</div>

<div class="next_imgs_div">
<a class="next_img_a" href="ex5.jsp">
<img class="next_img" src="eximg/클로즈그립1.jpg">
<p class="next_img_text1">푸쉬업-메디슨볼,클로즈그립</p>
<p class="next_img_text2">근력</p>
</a>
</div>
</div>
<!-- img box3 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex6.jsp">
<img class="next_img" src="eximg/한쪽팔푸쉬업.jpg">
<p class="next_img_text1">한쪽팔 푸쉬업</p>
<p class="next_img_text2">근력</p>
</a>
</div>

</div>


<!-- 팁 -->
<div class="tip_box">
<p style="padding-bottom:15px;">팁</p>
<p class="tip_text">동작을 실시하는 내내 등은 곧게 편 상태를 유지합니다.</p>
<p class="tip_text">동작하는 동안 코어에는 힘을 단단히 준 상태를 유지합니다. </p>
<p class="tip_text">푸시업 최고 지점에서는 팔꿈치를 완전히 폅니다.</p>
</div>
</div>			
			
</div>
<jsp:include page="../community/community_footerinclude.jsp"></jsp:include>
</body>
</html>
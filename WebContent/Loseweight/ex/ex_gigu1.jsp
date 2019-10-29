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
			<jsp:param name="boardname" value="기구운동"/>
</jsp:include>

<div class="main">

<div class="box">
<div class="textleft">
<p class="text1">풀업</p>
<p class="bluefont">난이도</p>
<p class="blackfont">중급</p>
<p class="bluefont">초점</p>
<p class="blackfont">근력</p>
<p class="bluefont">사용되는 근육</p>
<p class="blackfont">등, 이두근, 어깨, 복근</p>
<p class="bluefont">장비</p>
<p class="blackfont">풀업바</p>

<p class="bluefont_link">진행</p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex_gigu2.jsp">랫 풀다운</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex_gigu3.jsp">친업 - 밴드</a></p>
	</div>
<div class="videos">
<iframe src="https://prod-video-cms-amp-microsoft-com.akamaized.net/tenant/amp/entityid/AATiB0?blobrefkey=103&$blob=1" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
		</div>
		
			</div>
			
<div class="box2">

<div class="img">
<img class="img1" src="eximg/풀업1.jpg" alt="dd">
<p class="img_text_1">1단계</p>
<p class="img_text_2">
양팔을 완전히 뻗어 어깨너비로 벌리고 발을 바닥에 붙인 상태에서 풀업 바를 오버핸드 그립으로 잡습니다. 
이것이 시작 자세입니다.</p>
</div>

<div class="img">
<img class="img1" src="eximg/풀업2.jpg" alt="dd">
<p class="img_text_1">2단계</p>
<p class="img_text_2">
턱이 바 위로 올라갈 때까지 몸을 당겨 올립니다. 
머리는 중립 자세를 유지하고 시선은 앞을 보며, 
양팔꿈치가 완전히 접힐 때까지 당겨 올려 의식적으로 등을 수축시키도록 합니다. 
어깨와 팔이 완전히 펴져서 처음 자세로 돌아올 때까지 몸을 내립니다.</p>
</div>
</div>

<div class="box3">

<p class="next_text">진행 및 변형</p>
<!-- img box1 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex_gigu2.jsp">
<img class="next_img" src="eximg/랫풀다운.jpg">
<p class="next_img_text1">랫풀다운</p>
<p class="next_img_text2">근력 | 초급</p>
</a>
</div>

<div class="next_imgs_div">
<a class="next_img_a" href="ex_gigu3.jsp">
<img class="next_img" src="eximg/친업-밴드.jpg">
<p class="next_img_text1">친업밴드 </p>
<p class="next_img_text2">근력|고급</p>
</a>
</div>
</div>
<!-- img box2 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex_gigu4.jsp">
<img class="next_img" src="eximg/쿼터스쿼트바벨.jpg">
<p class="next_img_text1">쿼터스쿼트 - 바벨</p>
<p class="next_img_text2">근력 </p>
</a>
</div>

<div class="next_imgs_div">
<a class="next_img_a" href="ex_gigu5.jsp">
<img class="next_img" src="eximg/바벨스쿼트-상자.jpg">
<p class="next_img_text1">바벨스쿼드-상자</p>
<p class="next_img_text2">근력| 초급</p>
</a>
</div>
</div>
<!-- img box3 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex_gigu6.jsp">
<img class="next_img" src="eximg/백스쿼트바벨.jpg">
<p class="next_img_text1">백스쿼드-바벨</p>
<p class="next_img_text2">근력| 중급</p>
</a>
</div>

</div>


<!-- 팁 -->
<div class="tip_box">
<p style="padding-bottom:15px;">팁</p>
<p class="tip_text">최저 지점에 이르기 전에 동작을 멈추지 마십시오. 최저 지점에서 완전히 팔을 뻗은 상태로 매달립니다.
허리 힘으로 당기지 마십시오. 팔꿈치가 몸 뒤로 지나가게 합니다.</p>
<p class="tip_text">최고 지점에 이르기 전에 동작을 멈추지 마십시오. 가슴을 바까지 끌어 당겨서 동작을 마칩니다.</p>
<p class="tip_text">등 상부가 구부러지지 않도록 합니다. 가슴을 활짝 펴고 양쪽 어깨를 뒤로 젖힙니다.</p>
</div>
</div>			
			
</div>
<jsp:include page="../community/community_footerinclude.jsp"></jsp:include>
</body>
</html>
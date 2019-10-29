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
<p class="text1">쿼터스쿼트 - 바벨</p>
<p class="bluefont">난이도</p>
<p class="blackfont">초급</p>
<p class="bluefont">초점</p>
<p class="blackfont">근력</p>
<p class="bluefont">사용되는 근육</p>
<p class="blackfont">둔근, 대퇴사두근, 복근</p>
<p class="bluefont">장비</p>
<p class="blackfont">바벨, 스쿼트 랙</p>

<p class="bluefont_link">진행</p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex_gigu1.jsp">풀업</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex_gigu5.jsp">바벨스쿼드-상자</a></p>
	</div>
<div class="videos">
<iframe src="https://prod-video-cms-amp-microsoft-com.akamaized.net/tenant/amp/entityid/AATCeY?blobrefkey=103&$blob=1" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
		</div>
		
			</div>
			
<div class="box2">

<div class="img">
<img class="img1" src="eximg/쿼터스쿼트바벨1.jpg" alt="dd">
<p class="img_text_1">1단계</p>
<p class="img_text_2">
스쿼트 랙을 사용해, 바벨이 등 윗부분에 걸쳐지도록 오버핸드 
 그립으로 잡고 두 발은 어깨너비로 벌립니다.</p>
</div>

<div class="img">
<img class="img1" src="eximg/쿼터스쿼트바벨2.jpg" alt="dd">
<p class="img_text_1">2단계</p>
<p class="img_text_2">
엉덩이를 뒤로 빼고 무릎을 굽혀 스쿼트 자세로 앉습니다. 
무릎이 바닥과 45도 각도를 이룰 때까지 계속 몸을 낮춥니다. 
잠시 멈췄다가 코어에 힘을 주고 다시 밀어 올려 시작 자세로 돌아옵니다.</p>
</div>
</div>

<div class="box3">

<p class="next_text">진행 및 변형</p>
<!-- img box1 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex_gigu1.jsp">
<img class="next_img" src="eximg/풀업1.jpg">
<p class="next_img_text1">풀업</p>
<p class="next_img_text2">근력 | 초급</p>
</a>
</div>

<div class="next_imgs_div">
<a class="next_img_a" href="ex_gigu2.jsp">
<img class="next_img" src="eximg/랫풀다운.jpg">
<p class="next_img_text1">랫 풀다운 </p>
<p class="next_img_text2">근력|고급</p>
</a>
</div>
</div>
<!-- img box2 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex_gigu3.jsp">
<img class="next_img" src="eximg/친업-밴드.jpg">
<p class="next_img_text1">친업 - 밴드</p>
<p class="next_img_text2">근력 </p>
</a>
</div>

<div class="next_imgs_div">
<a class="next_img_a" href="ex_gigu5.jsp">
<img class="next_img" src="eximg/바벨스쿼트-상자.jpg">
<p class="next_img_text1">바벨스쿼트 - 상자</p>
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
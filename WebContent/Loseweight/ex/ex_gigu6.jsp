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
<p class="text1">백 스쿼트 - 바벨</p>
<p class="bluefont">난이도</p>
<p class="blackfont">중급</p>
<p class="bluefont">초점</p>
<p class="blackfont">근력</p>
<p class="bluefont">사용되는 근육</p>
<p class="blackfont">둔근, 대퇴사두근, 스파이널 이렉터</p>
<p class="bluefont">장비</p>
<p class="blackfont">바벨, 스쿼트 랙</p>

<p class="bluefont_link">진행</p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex_gigu1.jsp">풀업</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex_gigu2.jsp">랫 풀다운</a></p>
	</div>
<div class="videos">
<iframe src="https://prod-video-cms-amp-microsoft-com.akamaized.net/tenant/amp/entityid/AATTE8?blobrefkey=103&$blob=1" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
		</div>
		
			</div>
			
<div class="box2">

<div class="img">
<img class="img1" src="eximg/백스쿼트바벨1.jpg" alt="dd">
<p class="img_text_1">1단계</p>
<p class="img_text_2">
발끝이 약간 바깥쪽으로 향하도록 양발을 어깨 넓이로 벌리고 
서서 중량판을 끼운 바벨을 어깨 뒤에 걸치고 오버핸드 그립으로 잡습니다.</p>
</div>

<div class="img">
<img class="img1" src="eximg/백스쿼트바벨2.jpg" alt="dd">
<p class="img_text_1">2단계</p>
<p class="img_text_2">
골반을 뒤로 밀고 무릎을 굽히면서 스쿼트 자세로 몸을 낮춥니다. 
스쿼트 자세 최저점에서 잠시 멈췄다가 골반을 밀어올려 다시 시작 자세로 돌아옵니다.</p>
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
<a class="next_img_a" href="ex_gigu4.jsp">
<img class="next_img" src="eximg/쿼터스쿼트바벨.jpg">
<p class="next_img_text1">쿼터스쿼트 - 바벨</p>
<p class="next_img_text2">근력| 중급</p>
</a>
</div>
</div>
<!-- img box3 -->
<div class="next_imgs">
<div class="next_imgs_div">
<a class="next_img_a" href="ex_gigu5.jsp">
<img class="next_img" src="eximg/바벨스쿼트-상자.jpg">
<p class="next_img_text1">바벨스쿼트-상자</p>
<p class="next_img_text2">근력| 초급</p>
</a>
</div>

</div>


<!-- 팁 -->
<div class="tip_box">
<p style="padding-bottom:15px;">팁</p>
<p class="tip_text">몸통 부분은 단단히 힘을 준 상태를 유지합니다.</p>
<p class="tip_text">스쿼트 동작 중에 발뒤꿈치가 바닥에서 떨어지지 않도록 하십시오.</p>
</div>
</div>			
			
</div>
<jsp:include page="../community/community_footerinclude.jsp"></jsp:include>
</body>
</html>
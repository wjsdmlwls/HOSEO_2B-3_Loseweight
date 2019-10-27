<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link href="notice_list_css.css" rel="stylesheet" type="text/css">
<link href="../community/include.css" rel="stylesheet" type="text/css">
<title>운동방법</title>
<style>
body{
width:100%;
height:100%;
}
p{
margin:0 auto;
}
.main{
margin:0 auto;
width:1200px;
height:100%;
}
.box{
background-image:url('eximg/white-waves.png');
width:100%;
height:24%;
margin:0 auto;
position:relative;
}
.box:after{
	content:"";
	display:block;
	clear:both;
}
.textleft{
float:left;
height:700px;
width:38%;
padding-left:20px;
}
.videos{
float:left;
height:30%;
width:60%;
}

.videos iframe{
width:710px;
height:700px;
}

#vimeoWrap{
     position: relative;
    padding-bottom: 56.25%; /* 16/9 ratio */
    padding-top: 30px; /* IE6 workaround*/
    height: 0;
    overflow: hidden;
    margin: 0;
  }
#vimeoWrap iframe,
#vimeoWrap object,
#vimeoWrap embed {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

.text1{
    font-family: "segoe ui","malgun gothic","microsoft neogothic",applegothic,sans-serif;
    font-size: 40px;
    line-height: 1.5;
    color: #0075d5;
    border-bottom: 1px solid #ccc;
    max-height: 15.5rem;
    overflow: hidden;
    padding-bottom: .6rem;
    margin-bottom: 1.8rem; 
    width:400px;
}
.bluefont{
color: #0075d5;
    font-family: "segoe ui","malgun gothic bold","malgun gothic","microsoft neogothic bold",applegothic,sans-serif;
    font-size: 16px;
    line-height: 1.733;
    text-transform: uppercase;
    margin-left:30px;
}
.blackfont{
    font-family: "segoe ui","malgun gothic","microsoft neogothic",applegothic,sans-serif;
    font-size: 1.4rem;
    line-height: 1.429;
    margin-bottom: 0.9rem; 
    margin-left:30px;
}
.bluefont_link{
	color: #0075d5;
    font-family: "segoe ui","malgun gothic bold","malgun gothic","microsoft neogothic bold",applegothic,sans-serif;
    font-size: 16px;
     margin-top: 5rem; 
    line-height: 1.733;
    text-transform: uppercase;
    border-bottom:1px solid #ccc;
    padding-bottom:15px;
    width:400px;
}
.blackfont_link{
text-decoration:none;
font-size: 1.4rem;
color:black;
}
.blackfont_link:hover{
text-decoration:underline;
color:blue;
}
.blackfont_link_p{
padding-top:20px;
border-bottom:1px solid #ccc;
padding-bottom:20px;
width:400px;
}
.box2{
background:#fff;
width:100%;
height:590px;
margin:0 auto;
position:relative;
}
.box2:after{
	content:"";
	display:block;
	clear:both;
}
.img{
width:360px;
height:500px;
float:left;
padding-right:30px;
}
.img1{
width:350px;
height:400px;
padding-top:20px;

}
.img_text_1{
font-family: "segoe ui","malgun gothic bold","malgun gothic","microsoft neogothic bold",applegothic,sans-serif;
    font-size: 0.9rem;
    line-height: 1.538;
    text-transform: uppercase;
    border-bottom: .2rem solid #048eff;
    color: #0075d5;
    display: block;
    margin-bottom: .6rem;
    padding-bottom: .6rem;
 
    width:350px;
}
.img_text_2{

 font-size:14px;
 line-height:24px;
 width:350px;
}

.next_text{
    font-family: "segoe ui","malgun gothic","microsoft neogothic",applegothic,sans-serif;
    font-size: 1.2rem;
    line-height: 1.333;
    border-bottom: .1rem solid rgba(0,0,0,.2);
    color: #666;
	padding-top:20px;
	padding-bottom:10px;
}
.next_imgs{
float:left;
margin-top:20px;
margin-left:30px;
}

.next_img{

width:250px;
height:200px;
}

.next_img_text1{
font-size:20px;
padding-bottom:20px;
}

.next_img_text2{ 
color:#999;
font-size:14px;
padding-bottom:20px;
}

.next_img_a{
text-decoration:none;
color:black;
}

.next_img_a:hover{
text-decoration:none;
color:blue;
}

.box3{
background-image:url('eximg/white-waves.png');
width:100%;
height:28%;
margin:0 auto;
position:relative;
}
.box3:after{
	content:"";
	display:block;
	clear:both;
}

.next_imgs_div{
background:#eadbdb;
wdith:320px;
height:300px;
margin-bottom:20px;
}
.tip_box{
float:left;
width:300px;
height:700px;
margin-top:20px;
margin-left:20px;
}

.tip_text{
    font-family: "segoe ui","malgun gothic","microsoft neogothic",applegothic,sans-serif;
    font-size: 1.2rem;
    line-height: 1.333;
    color: #666;
    margin-bottom: 1.2rem;
}
</style>

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
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
			<jsp:param name="boardname" value="기구운동"/>
</jsp:include>

<div class="main">

<div class="box">
<div class="textleft">
<p class="text1">친업-밴드</p>
<p class="bluefont">난이도</p>
<p class="blackfont">고급</p>
<p class="bluefont">초점</p>
<p class="blackfont">근력</p>
<p class="bluefont">사용되는 근육</p>
<p class="blackfont">등 상부, 이두근, 어깨</p>
<p class="bluefont">장비</p>
<p class="blackfont">풀업바,스트레칭밴드</p>

<p class="bluefont_link">진행</p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex_gigu1.jsp">풀업</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="ex_gigu4.jsp">쿼터스쿼트-바벨</a></p>
	</div>
<div class="videos">
<iframe src="https://prod-video-cms-amp-microsoft-com.akamaized.net/tenant/amp/entityid/AAT8cH?blobrefkey=103&$blob=1" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
		</div>
		
			</div>
			
<div class="box2">

<div class="img">
<img class="img1" src="eximg/친업-밴드1.jpg" alt="dd">
<p class="img_text_1">1단계</p>
<p class="img_text_2">
풀업 바에 밴드를 감고 단단히 조입니다. 밴드의 반대편 끝을 발이나 무릎 밑에 끼웁니다. 
양팔을 최대한 뻗어 어깨너비보다 약간 넓게 놓고 풀업 바를 언더핸드 그립으로 잡습니다.</p>
</div>

<div class="img">
<img class="img1" src="eximg/친업-밴드2.jpg" alt="dd">
<p class="img_text_1">2단계</p>
<p class="img_text_2">
턱이 완전히 바 위로 올라갈 때까지 몸을 당겨 올립니다. 머리는 중립 자세를 유지하고 시선은 앞을 보며, 양팔꿈치가 완전히 접힐 때까지 당겨 올려 의식적으로 등을 수축시키도록 합니다. 
어깨와 팔이 완전히 펴져서 처음 자세로 돌아올 때까지 몸을 내립니다.</p>
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
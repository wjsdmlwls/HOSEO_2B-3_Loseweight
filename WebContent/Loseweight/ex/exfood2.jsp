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
background:#fff;
width:100%;
height:800px;
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
    font-size: 1.0rem;
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
font-size: 0.8rem;
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
height:900px;
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
background-image:url('white-waves.png');
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
<jsp:include page="../community/community_topinclude.jsp">
			<jsp:param name="tom" value="2" />
			<jsp:param name="toc" value="2" />
			<jsp:param name="imgs" value="food.png" />
			<jsp:param name="boardname" value="식단TIP" />
</jsp:include>

<div class="main">


<div class="box">
<div class="textleft">
<p class="text1">주부 다이어트 식단</p>
<p class="bluefont">초점</p>
<p class="blackfont">비교적 자유롭고 활동량이 적은 주부들을 위한 식단</p>
<p class="bluefont">메뉴</p>
<p class="blackfont">아침: 계란스크램블, 사과, 저지방우유, 호두&아몬드</p>
<p class="blackfont">점심: 일반식사</p>
<p class="blackfont">저녁: 닭가슴살, 야채&과일, 저지방우유, 호두&아몬드</p>

<p class="bluefont_link">각 식단별 종류</p>
<p class="blackfont_link_p"><a class="blackfont_link" href="exfood.jsp">하루 기본 식단</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="exfood3.jsp">직장인 식단</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="exfood4.jsp">고단백&저지방 식단</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="exfood5.jsp">청소년 식단</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="exfood6.jsp">성인 식단</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="exfood7.jsp">노년기 식단</a></p>
	</div>
<div class="videos">
<img src="ex_img/exfood2.jpg">
		</div>
		
			</div>
			
<div class="box2">

<div class="img">
<img class="img1" src="ex_img/ex_Pre.png" alt="주의사항">
<p class="img_text_1">다이어트 식단표 짜기 전, 알아둬야 할 7가지!</p>
<p class="img_text_2">
1. 다이어트 식단 구성할 때는 기본적으로 저염, 고단백, 저지방식 위주로! <br>
2. 식단에 6가지 식품군(곡류, 어육류, 채소, 지방, 우유, 과일) 골고루 배치해, 균형있게 섭취할 것<br>
3. 하루 한끼는 일반식으로 먹는 게 좋으며, 지방과 탄수화물, 나트륨은 줄이고, 단백질과 채소 위주의 식단을 짤 것<br>
4. 초기에는 단백질 음식을 조금씩 늘리고, 어느 정도 적응된 후에 고단백 저지방 식단으로 바꿔야 부담이 적음<br>
5. 다이어트 식단을 처음 짠다면, 다른 사람들의 다이어트 식단 참고할 것<br>
6. 여러 다이어트 식단을 찾아본 다음, 나에게 맞는 식단을 선택하고, 자신의 기호에 따라 빼고 더하면 식단표 짜기가 더 수월해짐<br>
7. 자신의 적정 체중을 알고 나면, 하루에 섭취해야 될 칼로리가 파악됨. 그런 다음 나에게 맞는 칼로리 양에 맞춰 식단 짤 것</p>
</div>
<div class="img">
<img class="img1" src="ex_img/ex_ex.jpg" alt="체중계">
<p class="img_text_1">적정체중계산법</p>
<p class="img_text_2">
-여자 : 표준체중 = 키(m) x 키(m) x 21 <br>
-남자 : 표준체중 = 키(m) x 키(m) x 22 <br>
* 하루에 필요한 칼로리 계산법 *<br>

-육체활동 없는 경우 =표준체중 x 25~30(kcal/일) <br>
-활동량 보통인 경우=표준체중x30~35(kcal/일)	<br>
-육체활동 많은 경우=표준체중 x 35~40(kcal/일)</p>
</div>
</div>
</div>
<jsp:include page="../community/community_footerinclude.jsp"></jsp:include>
</body>
</html>
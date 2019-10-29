<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="exfood.css" rel="stylesheet" type="text/css">
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
<jsp:include page="../community/community_topinclude.jsp">
			<jsp:param name="tom" value="2" />
			<jsp:param name="toc" value="2" />
			<jsp:param name="imgs" value="food.png" />
			<jsp:param name="boardname" value="식단TIP" />
</jsp:include>

<div class="main">


<div class="box">
<div class="textleft">
<p class="text1">직장인 다이어트 식단</p>
<p class="bluefont">초점</p>
<p class="blackfont">고염분/고열량 음식 섭취하는 직장인을 위한 마이너스 식단</p>
<p class="bluefont">메뉴</p>
<p class="blackfont">아침: 시리얼, 고구마, 푸른사과</p>
<p class="blackfont">점심: 일반식사/잡곡밥(저염식반찬)</p>
<p class="blackfont">저저녁: 닭가슴살,야채조금,달걀흰자</p>

<p class="bluefont_link">각 식단별 종류</p>
<p class="blackfont_link_p"><a class="blackfont_link" href="exfood.jsp">하루 기본의 식단</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="exfood2.jsp">주부의 식단</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="exfood4.jsp">고단백&저지방 식단</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="exfood5.jsp">청소년 식단</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="exfood6.jsp">성인 식단</a></p>
<p class="blackfont_link_p"><a class="blackfont_link" href="exfood7.jsp">노년기 식단</a></p>
	</div>
<div class="videos">
<img src="ex_img/exfood3.jpg">
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
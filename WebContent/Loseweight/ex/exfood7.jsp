<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB"%>
<%@ page import="board.board_DAO"%>
<%@ page import="board.board_DTO"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단조절</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link href="notice_list_css.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="exercise.css" rel="stylesheet" type="text/css">
<link href="../community/include.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="header">
		<%
			String id = null;
			if (session.getAttribute("id") != null) {
				id = (String) session.getAttribute("id");
			} else {
				id = "";
			}

			//로그인이 성공하면 아이디값으로 세션에 접속을함.
		%>
		<jsp:include page="../community/community_topinclude.jsp">
			<jsp:param name="tom" value="2" />
			<jsp:param name="toc" value="2" />
			<jsp:param name="imgs" value="food.png" />
			<jsp:param name="boardname" value="식단조절" />
		</jsp:include>
	</div>
	<div class="row">
		<div class="column">
			<div class="column1">
				<div id="exercise-summary" class="exercise-section">
					<h3 style="text-align: center;">노년기의 권장 식단</h3>
					<div id="metadata">
						<div class="exercise-metadata">
							<h4></h4>
							<p></p>
						</div>
						
						<div class="exercise-metadata">
<h4>※초점</h4>
<h6>노년기 권장 식단</h6>
</div>
<div class="exercise-metadata">
<h4>※식단시 주의 사항※</h4>
<h6>-노년기 남성의 평균 필요에너지량은 1일 2000kcal다. 전체적으로 양을 줄이되, 채소는 풍부하게 섭취하면 균형 잡힌 식단이 된다.</h6>
<h6>-노년기 여성의 평균 필요에너지량은 1일 1600kcal다. 칼로리 양이 300kcal 이상 달라지기 때문에, 식품군별 섭취량을 전반적으로 줄여야 한다.</h6>
</div>
<div class="exercise-metadata">
<h4>※이런식단은 피해라※</h4>
<h6>-노년기 남성은 명란젓, 오징어젓갈 등 젓갈류를 많이 먹고, 우유나 유제품 섭취가 줄어드는 경향이 있다. 젓갈은 되도록 피하고, 우유와 유제품류를 골고루 먹는 게 중요하다.<h6>
<h6>-노년기 여성은 변비가 많이 나타난다. 따라서 섬유소가 적은 식단은 피해야 한다. 시래기된장국, 취나물볶음 등 채소를 활용한 식단을 권장한다.</h6>
</div>
<hr>
							<h4>※각 식단별 종류</h4>
						</div>
						<div class="exercise-metadata1">
							<h6>
								<a href="exfood.jsp">하루 기본의 식단</a>
							</h6>
						</div>
						<div class="exercise-metadata1">
							<h6>
								<a href="exfood2.jsp">주부 식단</a>
							</h6>
						</div>
						<div class="exercise-metadata1">
							<h6>
								<a href="exfood3.jsp">직장인 식단</a>
							</h6>
						</div>
						<div class="exercise-metadata1">
							<h6>
								<a href="exfood4.jsp">고단백&저지방 식단</a>
							</h6>
						</div>
						<div class="exercise-metadata1">
							<h6>
								<a href="exfood5.jsp">청소년 식단</a>
							</h6>
						</div>
						<div class="exercise-metadata1">
							<h6>
								<a href="exfood6.jsp">성인 식단</a>
							</h6>
						</div>
					</div>
				</div>
			<div class="column2">
				<img src="ex_img/exfood7.jpg" alt="남성식단" width="620px" height="550px">
    			<img src="ex_img/exfood7_1.jpg" alt="여성식단"	 width="620px" height="550px"><br>
    			<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp노년기 남성 식단(19세~64세)&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp노년기 여성 식단(19세~64세)<p>
			</div>
		</div>
		<div class="column">
			<div class="exD">
				<div id="step-1" class="slide-view">
					<img alt="주의 사항"
						src="ex_img/ex_Pre.png"
						class="ex_Pre">
					<div class="step-notes">
						<h3>다이어트 식단표 짜기 전, 알아둬야 할 7가지!</h3>
						<p5>1. 다이어트 식단 구성할 때는 기본적으로 저염, 고단백, 저지방식 위주로!</p5>
						<br>
						<p5>2. 식단에 6가지 식품군(곡류, 어육류, 채소, 지방, 우유, 과일) 골고루 배치해, 균형있게 섭취할
						것</p5>
						<br>
						<p5>3. 하루 한끼는 일반식으로 먹는 게 좋으며, 지방과 탄수화물, 나트륨은 줄이고, 단백질과 채소 위주의
						식단을 짤 것</p5>
						<br>
						<p5>4. 초기에는 단백질 음식을 조금씩 늘리고, 어느 정도 적응된 후에 고단백 저지방 식단으로 바꿔야
						부담이 적음</p5>
						<br>
						<p5>5. 다이어트 식단을 처음 짠다면, 다른 사람들의 다이어트 식단 참고할 것</p5>
						<br>
						<p5>6. 여러 다이어트 식단을 찾아본 다음, 나에게 맞는 식단을 선택하고, 자신의 기호에 따라 빼고 더하면
						식단표 짜기가 더 수월해짐</p5>
						<br>
						<p5>7. 자신의 적정 체중을 알고 나면, 하루에 섭취해야 될 칼로리가 파악됨. 그런 다음 나에게 맞는
						칼로리 양에 맞춰 식단 짤 것</p5>
						<br>
					</div>
				</div>
				<div id="step-2" class="slide-view">
					<img alt="주의사항"
						src="ex_img/ex_ex.jpg"
						class="ex_dan">
					<div class="step-notes">
						<h3>* 적정체중계산법 *</h3>
						<br>
						<p5>-여자 : 표준체중 = 키(m) x 키(m) x 21</p5>
						<br>
						<p5>-남자 : 표준체중 = 키(m) x 키(m) x 22</p5>
						<br>
						<h3>* 하루에 필요한 칼로리 계산법 *</h3>
						<br>
						<p5>-육체활동 없는 경우 =표준체중 x 25~30(kcal/일)</p5>
						<br>
						<p5>-활동량 보통인 경우=표준체중x30~35(kcal/일)</p5>
						<br>
						<p5>-육체활동 많은 경우=표준체중 x 35~40(kcal/일)</p5>
						<br>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div class="footer">
		<p>Footer</p>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,user.UserDAO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	// 세션정보 가져오기
	try {
		String id = (String) session.getAttribute("id");

		String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
		String dbId="lw_admin";
		String dbPass="3whakstp";

		UserDAO db = new UserDAO();
		Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM lw_users WHERE lw_id = ?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="../css/style.css">

<script>
	function check() {

	}
	function sendIt() {
		if (document.getElementById("lw_passwd4").value != document
				.getElementById("lw_passwd3").value) { //비밀번호 불일치시 나오는 경고문
			alert("비밀번호가 일치하지 않습니다")
			return false;
		}
		if (document.getElementById("lw_passwd2").value == ""
				|| document.getElementById("lw_passwd2").value == null
				|| document.getElementById("lw_passwd3").value == ""
				|| document.getElementById("lw_passwd3").value == null
				|| document.getElementById("lw_passwd4").value == ""
				|| document.getElementById("lw_passwd4").value == null) { //비밀번호 불일치시 나오는 경고문
			alert("비밀번호를 입력하지 않으셨습니다.")
			return false;
		}

	}
	function email3(userinput) {
		var email3 = userinput.e_mail3.value;
		if (email3 == "0") {
			userinput.lw_e_mail2.value = "";
			userinput.lw_e_mail2.readOnly = false;
		} else {
			userinput.lw_e_mail2.value = email3;
			userinput.lw_e_mail2.readOnly = true;
		}
	}
</script>
</head>
<!-- stlye css -->
<script type="text/javascript" src="vcheck.js">
	
</script>
<script type="text/javascript">
	var openWin;
	function openzipcode() {
		// window.name = "해당페이지로 가져옴 이름"; 
		window.name = "user_info";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("../../zipfinder/zipSearch.jsp", "childForm",
				"width=580, height=500, resizable = no, scrollbars = yes");
	}
</script>
<!-- 주소 end -->
<style>
				.community{
				position: relative;
				}
			</style>
<body>
	<div class="div_body" >
		<jsp:include page="../community/community_topinclude.jsp" >
			<jsp:param name="tom" value="0"/>
			<jsp:param name="toc" value="0"/>
			<jsp:param name="imgs" value="mypage.png"/>
			<jsp:param name="boardname" value="회원정보"/>
		</jsp:include>
						<form class="mypage_post" name="vcheck1"style="margin-top:80px"action="user_pw_Update.jsp" onsubmit="return sendIt();">
							<table class="mypage_post_table" >
								<%
									while (rs.next()) {
								%>
								<thead>
									<tr>
										<th>아이디</th>
										<td><input class="mypage_post_tableinput" type="text"
											name="lw_id" value="<%=rs.getString("lw_id")%>" readonly></td>
									</tr>
								</thead>
								<tr>
									<th>이름</th>
									<td><input class="mypage_post_tableinput" type="text"
										name="lw_name" value="<%=rs.getString("lw_name")%>" readonly></td>
								</tr>
								<tr class="mypage_post_tablepasswd">
									<th>패스워드변경</th>
									<td><input class="mypage_post_tablepasswdinput"type="password" name="lw_passwd2" id="lw_passwd2"placeholder="기존 비밀번호"><br> 
										<input class="mypage_post_tablepasswdinput" type="password"name="lw_passwd3" id="lw_passwd3" placeholder="신규 비밀번호 "onkeyup="pw_m_alert_m()"><br>
										<input class="mypage_post_tablepasswdinput" type="password"name="lw_passwd4" id="lw_passwd4" placeholder="신규 비밀번호 확인 "onkeyup="pw_m_alert_m()">
										<button class="button salmon" type="submit" value="변경"onclick="sendIt();" style="">변경</button>
										<br><span id="alert_pw_m"><span style="color: blue;"></span></span>
									</td>
								</tr>
								</form>
								<form name="mypage2" action="user_Info_Action.jsp">
									<input style="display: none" type="text" name="lw_id"
										value="<%=rs.getString("lw_id")%>" readonly>
									<!-- 아래 정보 변경시 필요해서 보여줄 필요없어 숨김 -->
									<tr>
									<th>전화번호</th>
									<td><input class="mypage_post_tableaddrinput2" style="background: #fff"type="text"name="lw_phone" id="lw_phone"value="<%=rs.getString("lw_phone")%>" ></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td><input class="mypage_post_e_mail" type="text"style="background: #fff" name="lw_e_mail1"value="<%=rs.getString("lw_e_mail1")%>"><a>@</a> 
										<input class="mypage_post_e_mail" type="text" name="lw_e_mail2" value="<%=rs.getString("lw_e_mail2")%>"> 
										<select class="mypage_post_e_mailselect" name="e_mail3"onchange="email3(this.form)">
												<option value="naver.com">네이버</option>
												<option value="daum.com">다음</option>
												<option value="nate.com">네이트</option>
												<option value="gmail.com">구글</option>
												<option value="0" selected="selected">집적입력</option>
										</select></td>
									</tr>
									<tr>
										<th class="mypage_post_tablepasswd">주소</th>
										<td><input class="mypage_post_tableaddrinput" type="text"id="lw_zipcode" name="lw_zipcode"value="<%=rs.getString("lw_zipcode")%>"placeholder="우편번호test">
											<button class="button salmon button_addr" type="button"onclick="openzipcode()">주소검색</button> <br> 
											<input class="mypage_post_tableaddrinput2" type="text" id="lw_addr1" name="lw_addr1" placeholder="주소 test"value="<%=rs.getString("lw_addr1")%>"><br> 
											<input class="mypage_post_tableaddrinput2" type="text" id="lw_addr2"name="lw_addr2" value="<%=rs.getString("lw_addr2")%>"placeholder="상세주소를 입력해주세요"></td>
									</tr>
									<%
										}
									%>
								
							</table>
							<div class="mypage_form_button">
								<button class="button salmon" type="submit" value="변경">변경</button>
								</div>
						</form>
				</div>
				

		<%
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
		<jsp:include page="../community/community_footerinclude.jsp" ></jsp:include>	
</body>
</html>
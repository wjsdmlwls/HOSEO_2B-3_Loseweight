<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,user.UserDAO" %>
    
    <%
    // 세션정보 가져오기
    try {
    String id = (String) session.getAttribute("id");
    
    String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
	String dbId="jspid";
	String dbPass="jsppass";
	
    UserDAO db= new UserDAO();
    Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
 
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM lw_users WHERE lw_id = ?";
 
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);
    rs = pstmt.executeQuery();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
function check(){

}
function sendIt() {
	   if (document.getElementById("lw_passwd4").value != document.getElementById("lw_passwd3").value) 
	   {  //비밀번호 불일치시 나오는 경고문
		   alert("비밀번호가 일치하지 않습니다")   
		   return false;
  }
	  if (document.getElementById("lw_passwd2").value == ""||document.getElementById("lw_passwd2").value == null||
			  document.getElementById("lw_passwd3").value == ""||document.getElementById("lw_passwd3").value == null||
			  document.getElementById("lw_passwd4").value == ""||document.getElementById("lw_passwd4").value == null) 
	   {  //비밀번호 불일치시 나오는 경고문
		   alert("비밀번호를 입력하지 않으셨습니다.")   
		   return false;
 } 
	
}
function email3(userinput){
	   var email3 = userinput.e_mail3.value;
	   if(email3 =="0"){
		   userinput.lw_e_mail2.value="";
		   userinput.lw_e_mail2.readOnly= false;
	   }else{
		   userinput.lw_e_mail2.value= email3;
		   userinput.lw_e_mail2.readOnly= true;
	   }
}
</script>
</head>
<!-- stlye css -->
 <link rel="stylesheet" href="../css/style.css">
 <script type="text/javascript" src="vcheck.js">
 </script>
    <script type="text/javascript">
        var openWin;
        function openzipcode()
        {
            // window.name = "해당페이지로 가져옴 이름"; 
            window.name = "user_info";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("../../zipfinder/zipSearch.jsp",
                    "childForm", "width=580, height=500, resizable = no, scrollbars = yes");    
        }
   </script>
   <!-- 주소 end -->
<body>
	<div class="div_body">
		<div class="div_top"style="background: #a00; width: 100%; height: 120px"></div>
		<div  style=''>
		<div class="div_sidemenu"style='width:250px;position: absolute;'>
			<table class="sidemenu_mypage"style="margin:auto;text-align:center;border: 1px solid #ccc; border-spacing: 0;width:200px">
			<thead>
				<tr style="background:#f5c293;height:55px">
					<th colspan='2' style="color:#fff">마이페이지</th>
				</tr>
			</thead>
				<tr>
					<td>회원정보</td>
				</tr>
				<tr>
					<td>몸무게 일기</td>
				</tr>
				<tr>
					<td>회원탈퇴</td>
				</tr>
			</table>
		</div>
		<div class="div_sidecontents"style='position: relative;margin-left:250px;background: #aaa;'>
	<div class="mypage_form" style="margin-top:40px">
	 <%if(id == null) { 
	        response.sendRedirect("login.jsp");
	    }
	    else {
	    %> 
	    <div class="mypage_fullpost">
	    <form class="mypage_post"name="vcheck1" action="user_pw_Update.jsp" onsubmit="return sendIt();">
	    <div style="text-align:left;margin-left:20px"><h2>회원정보 수정</h2></div>
	        <table  class="mypage_post_table">
	            <%while(rs.next()) { %>
	            <thead>
	            <tr>
	                <th>아이디</th>
	                 <td><input class="mypage_post_tableinput"type="text" name="lw_id" value="<%=rs.getString("lw_id")%>"readonly></td>
	            </tr>
	            </thead>
	            <tr>
	                <th>이름</th>
	                <td><input class="mypage_post_tableinput" type="text" name="lw_name" value="<%=rs.getString("lw_name")%>"readonly></td>
	            </tr>
	            <tr>
	                <th>기존 패스워드</th>
	                <td>
	                <input class="mypage_post_tableinput" type="text" name="lw_passwd1" id="lw_passwd1" value="<%=rs.getString("lw_passwd")%>"readonly>
	                </td>
	            </tr>
	            <tr class="mypage_post_tablepasswd">
	                <th>패스워드변경</th>
	                <td>
	                <input class="mypage_post_tablepasswdinput" type="password" name="lw_passwd2"  id="lw_passwd2"placeholder="기존 비밀번호"><br>
	                <input class="mypage_post_tablepasswdinput" type="password" name="lw_passwd3" id="lw_passwd3" placeholder="신규 비밀번호 " onkeyup="pw_m_alert_m()"><button class="button salmon" type="submit" value="변경" onclick="sendIt();" style="margin-left:5px;">변경</button>
	                <input class="mypage_post_tablepasswdinput" type="password" name="lw_passwd4" id="lw_passwd4" placeholder="신규 비밀번호 확인 " onkeyup="pw_m_alert_m()"><br>
	                <span id="alert_pw_m"><span style="color:blue;"></span></span>
	                </td>
	            </tr>
	            </form>
	            <form name="mypage2" action="user_Info_Action.jsp">
	             <input style="display:none"type="text" name="lw_id" value="<%=rs.getString("lw_id")%>"readonly>
	             <!-- 아래 정보 변경시 필요해서 보여줄 필요없어 숨김 -->
	            <tr>
	                <th>이메일</th>
	                <td>
		                <input class="mypage_post_e_mail" type="text" style="background:#fff"name="lw_e_mail1" value="<%=rs.getString("lw_e_mail1")%>"><a>@</a>
		                <input class="mypage_post_e_mail" type="text" name="lw_e_mail2" value="<%=rs.getString("lw_e_mail2")%>">
		                <select class="mypage_post_e_mailselect" name="e_mail3" onchange="email3(this.form)">
														<option value="naver.com">네이버</option>
													    <option value="daum.com">다음</option>
													    <option value="nate.com">네이트</option>
													    <option value="gmail.com">구글</option>
													    <option value="0" selected="selected" >집적입력</option>
						</select>
					</td>
	            </tr>
	            <tr>
	                <th class="mypage_post_tablepasswd">주소</th>
	                <td>
	                <input class="mypage_post_tableaddrinput" type="text" id="lw_zipcode" name="lw_zipcode" value="<%=rs.getString("lw_zipcode")%>" placeholder="우편번호test"><button class="button salmon button_addr" type="button" onclick="openzipcode()">주소검색</button><br>
	                <input class="mypage_post_tableaddrinput2" type="text" id="lw_addr1" name="lw_addr1" placeholder="주소 test" value="<%=rs.getString("lw_addr1")%>" ><br>
	                <input class="mypage_post_tableaddrinput2" type="text" id="lw_addr2" name="lw_addr2"value="<%=rs.getString("lw_addr2")%>"placeholder="상세주소를 입력해주세요" >
	                </td>
	            </tr>
	            <%} %>
	        </table>
	        <input type="button" class="button white" style="float:right" value="회원탈퇴" onclick="location.href='user_delete.jsp'"></input>
	        <div class="mypage_form_button">
			<input type="button" class="button white" style="" value="메인화면" onclick="location.href='../lw_main.jsp'"></input>
	    	<button class="button salmon" type="submit" value="변경">변경</button> 
	    	</form>

	    </div>
	  
	  </div>
	  </div>
	  </div>
	 <%} %>
	
	<%
	    }
	catch(Exception e) {
			e.printStackTrace();
		}%>
	</div>
</body>
</html>
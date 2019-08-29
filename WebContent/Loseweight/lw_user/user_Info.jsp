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
	   if (document.getElementById("passwd4").value != document.getElementById("passwd3").value) 
	   {  //비밀번호 불일치시 나오는 경고문
		   alert("비밀번호가 일치하지 않습니다")   
		   return false;
  }
	  if (document.getElementById("passwd2").value == ""||document.getElementById("passwd2").value == null||
			  document.getElementById("passwd3").value == ""||document.getElementById("passwd3").value == null||
			  document.getElementById("passwd4").value == ""||document.getElementById("passwd4").value == null) 
	   {  //비밀번호 불일치시 나오는 경고문
		   alert("비밀번호를 입력하지 않으셨습니다.")   
		   return false;
 } 
	
}
function email3(userinput){
	   var email3 = userinput.e_mail3.value;
	   if(email3 =="0"){
		   userinput.e_mail2.value="";
		   userinput.e_mail2.readOnly= false;
	   }else{
		   userinput.e_mail2.value= email3;
		   userinput.e_mail2.readOnly= true;
	   }
}
</script>
</head>
<!-- stlye css -->
 <link rel="stylesheet" href="../css/style.css">

<!-- 주소 데이터 가져오는 스크립트  -->
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
	
	<div class="mypage_form" style="margin-top:40px">
	<div><a href="../lw_main.jsp"><img src="../img/logo/logo.png" alt="" /></a>
	</div>
	 <%if(id == null) { 
	        response.sendRedirect("login.jsp");
	    }
	    else {
	    %> 
	    <div class="mypage_fullpost">
	    <div><h1>회원정보 수정</h1></div>
	    <form class="mypage_post"name="mypage" action="user_pw_Update.jsp" onsubmit="return sendIt();">
	    
	    <!-- 
	     <div style="style=position: relative;float: left; text-align:center; width:150px;height:200px">
	    	<div style="background:#faafaf" >마이페이지</div>
	    	<div style="margin-top:30px;background:whitesmoke; width: 150px;"> 
		    	<table>
			    	<tr><th></th></tr>
			    	<tr><th></th></tr>
		    	</table>
	    	</div>
	    </div>
	     -->
	    
	        <table  class="mypage_post_table">
	            <%while(rs.next()) { %>
	            <thead>
	            <tr>
	                <th>아이디</th>
	                 <td><input class="mypage_post_tableinput"type="text" name="id" value="<%=rs.getString("lw_id")%>"readonly></td>
	            </tr>
	            </thead>
	            <tr>
	                <th>이름</th>
	                <td><input class="mypage_post_tableinput" type="text" name="name" value="<%=rs.getString("lw_name")%>"readonly></td>
	            </tr>
	            <tr>
	                <th>기존 패스워드</th>
	                <td>
	                <input class="mypage_post_tableinput" type="text" name="passwd1" id="passwd1" value="<%=rs.getString("lw_passwd")%>"readonly>
	                </td>
	            </tr>
	            <tr class="mypage_post_tablepasswd">
	                <th>패스워드변경</th>
	                <td>
	                <input class="mypage_post_tablepasswdinput" type="password" name="passwd2"  id="passwd2"placeholder="기존 비밀번호"><br>
	                <input class="mypage_post_tablepasswdinput" type="password" name="passwd3" id="passwd3" placeholder="신규 비밀번호 " ><button class="button salmon" type="submit" value="변경" onclick="sendIt();" style="margin-left:5px;">변경</button>
	                <input class="mypage_post_tablepasswdinput" type="password" name="passwd4" id="passwd4" placeholder="신규 비밀번호 확인 " ><br>
	                </td>
	            </tr>
	            </form>
	            <form name="mypage2" action="user_Info_Action.jsp">
	             <input style="display:none"type="text" name="id" value="<%=rs.getString("lw_id")%>"readonly>
	             <!-- 아래 정보 변경시 필요해서 보여줄 필요없어 숨김 -->
	            <tr>
	                <th>이메일</th>
	                <td>
		                <input class="mypage_post_e_mail" type="text" style="background:#fff"name="e_mail1" value="<%=rs.getString("lw_e_mail1")%>"><a>@</a>
		                <input class="mypage_post_e_mail" type="text" name="e_mail2" value="<%=rs.getString("lw_e_mail2")%>">
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
	                <input class="mypage_post_tableaddrinput" type="text" id="lw_zipcode" name="zipcode" value="<%=rs.getString("lw_zipcode")%>" placeholder="우편번호test"><button class="button salmon button_addr" type="button" onclick="openzipcode()">주소검색</button><br>
	                <input class="mypage_post_tableaddrinput2" type="text" id="lw_addr1" name="addr1" placeholder="주소 test" value="<%=rs.getString("lw_addr1")%>" ><br>
	                <input class="mypage_post_tableaddrinput2" type="text" id="lw_addr2" name="addr2"value="<%=rs.getString("lw_addr2")%>"placeholder="상세주소를 입력해주세요" >
	                </td>
	            </tr>
	            <%} %>
	        </table>
	        <input type="button" class="button white" style="float:right" value="회원탈퇴" onclick="location.href='user_delete.jsp'"></input>
	        <div class="mypage_form_button">
			<input type="button" class="button white" style="" value="메인화면" onclick="location.href='../lw_main.jsp'"></input>
	    	<button class="button salmon" type="submit" value="변경">변경</button> 
	    	</form>
	    	
	        <!-- 일단 디자인에 필요없어서 뺐음 
	        <input type="button" onclick="location.href='main.jsp'" value="돌아가기">
	        <input type="button" value="회원 탈퇴" onClick="my_delete()"> -->
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
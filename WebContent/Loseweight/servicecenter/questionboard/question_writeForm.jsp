<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,user.UserDAO"%>
   	<%@ page import="java.io.File" %>
    <%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
    <%
    // 세션정보 가져오기
    try {
    String id = (String) session.getAttribute("id");
    
    String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
	String dbId="lw_admin";
	String dbPass="3whakstp";
	
    UserDAO db= new UserDAO();
    Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
 
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM lw_users WHERE lw_id = ?";
 
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);
    rs = pstmt.executeQuery();
    
%>
<!-- 업로드 변수 초기화 -->
<%
	String uploadfile0 = null;
	String uploadfile1 = null;
%>
<html>
<head>
<!--slide-->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<!--slide end-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  textarea에넣는 스크립트 div로 넣으면 error -->
<script>
$(function() {
	$('#write').click(function() {
		var dbTxt = $('#copy_div').html();
		$('#content').text(dbTxt); //공백 제거
		});
	});
</script>
<!-- 이미지/업로드 창 띄우기  -->
<script type="text/javascript">
	var openWin;
	function openimgadd() {
		// window.name = "해당페이지로 가져옴 이름"; 
		window.name = "writeForm";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("imgadd.jsp", "childForm",
				"width=580, height=600, resizable = no, scrollbars = yes");
	}
	function openfileadd() {
		// window.name = "해당페이지로 가져옴 이름"; 
		window.name = "writeForm";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("uploadadd.jsp", "childForm",
				"width=580, height=500, resizable = no, scrollbars = yes");
	}
</script>
<!-- 파일업로드  -->
</head>
<!-- stlye css -->
<link rel="stylesheet" href="../../css/style.css">

<!-- form 두개 다른곳에 보내기  -->
	<script>
	function  sendProcess(f){
	        f.action="question_writePro.jsp";
	        f.submit();
	}
	</script>
<!-- form 두개 다른곳에 보내기  -->
<style>
.writeinput{
font-size: 14px;
    display: block;
    width: 40%;
    height: 42px;
    margin-bottom: 12px;
    padding: 16px 13px;
    color: #999999;
    border: 1px solid #d9d9d9;
    background: transparent;
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
 }
</style>
<!-- 주소 end -->
<body>
<% 
  int num = 0, ref = 1, re_step = 0, re_level = 0;
  String strV = "";
  try{
    if(request.getParameter("num")!=null){
	   num=Integer.parseInt(request.getParameter("num"));
	   ref=Integer.parseInt(request.getParameter("ref"));
	   re_step=Integer.parseInt(request.getParameter("re_step"));
	   re_level=Integer.parseInt(request.getParameter("re_level"));
    }
%>
	<div class="div_body">
		<jsp:include page="../../community/community_topinclude.jsp" >
			<jsp:param name="tom" value="4"/>
			<jsp:param name="toc" value="1"/>
			<jsp:param name="imgs" value="Service_center.png"/>
			<jsp:param name="boardname" value="문의하기"/>
		</jsp:include>
			<form method="post" name="writeform" style="margin-top: 5%;"onsubmit="return writeSave()">
						<input type="hidden" name="num" value="<%=num%>">
						<input type="hidden" name="ref" value="<%=ref%>">
						<input type="hidden" name="re_step" value="<%=re_step%>">
						<input type="hidden" name="re_level" value="<%=re_level%>">
						
						<table class="lw_board" style="margin:0 auto;">
						<%while(rs.next()) { %>
						   <tr>
						    <td  width="70"   align="center">이 름</td>
						    <td  width="330" align="left">
						       <input type="text" size="10" maxlength="10" class="writeinput"
						          name="writer" style="ime-mode:active;" value="<%=rs.getString("lw_id")%>" readonly></td><!--active:한글-->
						  </tr>
						  <tr>
						    <td  width="70" align="center" >제 목</td>
						    <td  width="330" align="left">
							<%
						      if(request.getParameter("num")==null) 
						    	 strV = "";
						      else
						    	 strV = "[답변]";
						    %>
						    <input type="text" size="40" style="float:left" maxlength="50" name="subject" class="writeinput"value="<%=strV%>" style="ime-mode:active;">
						    
						    <button class="button salmon button_addr" style="float:right;height: 42px;" type="button"onclick="openfileadd()">파일 업로드</button>
						    <button class="button salmon button_addr" style="float:right;height: 42px;margin-right: 10px;" type="button"onclick="openimgadd()">이미지 추가</button>
						    </td>	
						  </tr>
						  <tr>
						    <td  width="70"  align="center" >내 용</td>
						   <td  width="330" align="left"> <div contentEditable="true" id="copy_div" name="copy_div" class="contentsinput" style="font-size: 14px;display: block;width: 1000px;height: auto;min-height: 600px;margin-bottom: 12px;padding: 16px 13px;color: #999999;border: 1px solid #d9d9d9;background: transparent;-moz-border-radius: 2px;-webkit-border-radius: 2px;border-radius: 2px;" ></div><textarea name="content" id="content" style="height:500px; display:none;width:1000px; ime-mode:active; background:#fff; border:solid 1px;" ></textarea></td>
								  </tr>
								  <!--  값확인  -->
							<tr style="display:none;">
							<td>
							<% 
							String email1=rs.getString("lw_e_mail1");
							String email2=rs.getString("lw_e_mail2");
							String email=email1+"@"+email2;
							String members="1";
							out.println("newid값============"+members);
							%>
							<input type="password" size="8" maxlength="12"  name="passwd" style="ime-mode:inactive;"value="<%=rs.getString("lw_passwd")%>"> 
						 	<input type="text" size="40" maxlength="30" name="email" style="ime-mode:inactive;"value="<%=email%>" >
						 	<input type="text" size="40" maxlength="30" name="members" style="ime-mode:inactive;" value="<%=members %>" >
						 	<input type="text" size="40" maxlength="30" id="minicontent"name="minicontent" style="ime-mode:inactive;" >
						 	<input id="img0" name="img0"> <!-- 게시판에 보일 메인이미지 -->
						 	</td>
							</tr>
						  <tr>      
						    <td colspan=2 align="right"> 
						      <input type="submit" id="write" class="newbutton" value="글쓰기" onClick="sendProcess(this.form); writeSave();" >  
						      <input type="button"class="newbutton" value="목록보기" OnClick="window.location='question_list.jsp'">
						    </td>
						  </tr>
						  <tr style="display: none;"><!-- upload db에 보내는용도  -->
							  <td>
							  <div id="upload" style="border:solid;min-height: 100px;">
							   <input type="text" name="filepath0" id="filepath0" value="" style="border:none"><br>
							   <input type="text" name="filepath1" id="filepath1" value="" style="border:none"><br>
							 </div>
							  </td>
						  </tr>
						  <tr>
							  <Td colspan="5">
							  <h3 style="margin-left: 70;">파일 업로드</h3>
							  	  <div id="parah" style="border:solid;min-height:100px;margin-top:5px;margin:0 auto;margin-left:70px;width:1000px;text-align: left;padding: 10;">
							   <input type="text" name="filename0" id="filename0" value="" style="border:none;font-size: 23;"><br>
							   <input type="text" name="filename1" id="filename1" value="" style="border:none;font-size: 23;"><br>
								  </div>
							  </Td>
						  </tr>
						</table> 
						</form>  
						<!-- 파일업로드하는거임  -->
						 <%} %>  
						 <%
						  }catch(Exception e){}
						%>     
						 <%
						  }catch(Exception e){}
						%>    
		</div>
		<jsp:include page="../../community/community_footerinclude.jsp" ></jsp:include>				
</body>
</html>
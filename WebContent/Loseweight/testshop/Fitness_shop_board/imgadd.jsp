<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,user.UserDAO"%>
	<%@ include file="color.jspf"%>
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

<html>
<head>
<!--slide-->
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="../../js/bootstrap.bundle.min.js"></script>
<!--slide end-->
<!-- modal windows -->
<script>
	window.closeModal = function() {
		$('#myModal_l').modal('hide');
	}
</script>
<!-- modal windows -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 이미지 업로드 -->
<%
	request.setCharacterEncoding("utf-8");
		String realFolder = "";
		//이미지 변수
		String uploadimg1 = "";
		String uploadimg2 = "";
		String uploadimg3 = "";

		int maxSize = 1024 * 1024 * 5;
		String encType = "utf-8";
		String savefile = "img";
		ServletContext scontext = getServletContext();
		realFolder = scontext.getRealPath(savefile);
		try {
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
					new DefaultFileRenamePolicy());
			Enumeration<?> files = multi.getFileNames();
			String file1 = (String) files.nextElement();
			uploadimg1 = multi.getFilesystemName(file1);
			
			String file2 = (String) files.nextElement();
			uploadimg2 = multi.getFilesystemName(file2);
			
			String file3 = (String) files.nextElement();
			uploadimg3 = multi.getFilesystemName(file3);
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		String upimgpath1 = "http://localhost:8080/2019_JeonJSP/img/" + uploadimg1;
		String upimgtag1 = "<img src=" + upimgpath1 + ">";

		String upimgpath2 = "http://localhost:8080/2019_JeonJSP/img/" + uploadimg2;
		String upimgtag2 = "<img src=" + upimgpath2 + ">";

		String upimgpath3 = "http://localhost:8080/2019_JeonJSP/img/" + uploadimg3;
		String upimgtag3 = "<img src=" + upimgpath3 + ">";
%>
<!-- 파일업로드  -->
</head>
<!-- stlye css -->
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../lw_user/vcheck.js"></script>
<!-- img upload -->
<script src="../js/jquery.MultiFile.js"></script>
<script>
	$(function() { // wait for page to load
		$('input.afile3').MultiFile({
			max : 3, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
			accept : 'jpg|png|gif', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
			maxfile : 1024, //각 파일 최대 업로드 크기
			maxsize : 3024, //전체 파일 최대 업로드 크기
			STRING : { //Multi-lingual support : 메시지 수정 가능
				remove : "제거", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
				duplicate : "$file 은 이미 선택된 파일입니다.",
				denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
				selected : '$file 을 선택했습니다.',
				toomuch : "업로드할 수 있는 최대크기를 초과하였습니다.($size)",
				toomany : "업로드할 수 있는 최대 갯수는 $max개 입니다.",
				toobig : "$file 은 크기가 매우 큽니다. (max $size)"
			},
			list : "#afile3-list" //파일목록을 출력할 요소 지정가능

		//각각의 이벤트에 따라 스크립 처리를 할수있다.
		/*
		,onFileRemove: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileRemove - ' + value + '</li>')
		},
		afterFileRemove: function(element, value, master_element) {
		  $('#afile3-list').append('<li>afterFileRemove - ' + value + '</li>')
		},
		onFileAppend: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileAppend - ' + value + '</li>')
		},
		afterFileAppend: function(element, value, master_element) {
		  $('#afile3-list').append('<li>afterFileAppend - ' + value + '</li>')
		},
		onFileSelect: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileSelect - ' + value + '</li>')
		},
		afterFileSelect: function(element, value, master_element) {
		  $('#afile3-list').append('<li>afterFileSelect - ' + value + '</li>')
		},
		onFileInvalid: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileInvalid - ' + value + '</li>')
		},
		onFileDuplicate: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileDuplicate - ' + value + '</li>')
		},
		onFileTooMany: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileTooMany - ' + value + '</li>')
		},
		onFileTooBig: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileTooBig - ' + value + '</li>')
		},
		onFileTooMuch: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileTooMuch - ' + value + '</li>')
		}
		 */

		});
	});
</script>
<!-- 누르고 boardwrite에 보내기  -->
<script>
	function setParentText(){
		if (document.getElementById("img0").value!=""){
        	$(window.opener.document.getElementById("copy_div")).append('<img style="max-width:1000px"src="<%=upimgpath1%>">');
        	$(window.opener.document.getElementById("copy_div")).append('<img style="max-width:1000px"src="<%=upimgpath2%>">');
			window.close();
		} else {
			alert("파일을 업로드해주세요");
		}
	}
</script>
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

	<div class="div_body">
	<div style="width:100%;height: 50px;;background:#faafaf"><h4 style="padding-top: 10;color: white; padding-left: 10px;">이미지 업로드</h4>
	</div>
		<form method="post" name="writeform" style="margin-top: 80px;"
						    onsubmit="return writeSave()">
						
						<table class="lw_board" style="margin:0 auto;">
						<%while(rs.next()) { %>
						  <!-- 이미지업로드  -->
						  <tr>
							  <td>
							  <%if (uploadimg1!=""){ %>
							 <img style="width:250px;height:160px"src="<%=upimgpath1 %>"><br><input id="img0" name="img0" value="<%=uploadimg1 %>" style="border:none;display:none">
							  <img style="width:250px;height:160px"src="<%=upimgpath2 %>"><br><input id="img1" name="img1" value="<%=uploadimg2 %>" style="border:none;display:none">
							
							 <%} else{%><input id="img0" name="img0"value="" style="border:none">
							 <input id="img1" name="img1" value="<%=uploadimg2%>" style="border:none;">
							 <%} %>
						
							  </td>
						  </tr>
						  <tr>
						  <td style="display:none">
						  <%if (uploadimg1!=""){ %>
						  <input id="uploadimg1" value="<%=upimgpath1 %>"><input id="uploadimg2" value="<%=upimgpath2 %>"><br>
						  <%}else{ %> <input id="uploadimg1" value=""><br>
						  <% }%>
						  </td>
						  </tr>
						</table> 
						</form>  
						<!-- 파일업로드  -->
						<form method="post" enctype="multipart/form-data" style="margin:0 auto;width:500px;">
						<input type="file" class="afile3 with-preview" />
 						<div id="afile3-list" style="border:2px solid #c9c9c9;min-height:150px; margin-top:5px"></div>
 						<div style="margin-top:10px">
							  <input type="submit"class="newbutton" value="업로드">
							 <input type="button" style="float:right"class="newbutton" value="확인" onclick="setParentText()">
					    </div>
						</form> 
						<div style="margin-top:20px;margin-left:50px;">
						<h6>파일은 각각 최대 10MB, 총 2개까지 업로드 하실 수 있습니다.</h6>
						<h6>파일명이 한글, 숫자, 영문이 아닌 다른 언어일 경우 <br>파일이 업로드 되지 않거나 깨질 수가 있습니다.</h6>
						<h6>저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 파일은 <br>운영 원칙 및 관계 법률에 의해제재를 받을 수 있습니다.</h6>
						</div>
						 <%} %>  
						 <%
						  }catch(Exception e){}
						%>    
				</div>
</body>
</html>
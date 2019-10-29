<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,user.UserDAO"%>
	<%@ include file="color.jspf"%>
   	<%@ page import="java.io.File" %>
    <%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
    <%
    // 세션정보 가져오기
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection conn = null;
    try {
    String id = (String) session.getAttribute("id");
    
    String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
	String dbId="lw_admin";
	String dbPass="3whakstp";
	
    UserDAO db= new UserDAO();
    conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
 
    
    String sql = "SELECT * FROM lw_users WHERE lw_id = ?";
 
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);
    rs = pstmt.executeQuery();
%>

<html>
<head>
<!--slide-->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<!--slide end-->
<!-- modal windows -->
<script>
window.closeModal = function() {
   $( '#myModal_l' ).modal( 'hide' );
}
</script>
<!-- modal windows -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  textarea에넣는 스크립트 div로 넣으면 error -->
<!-- 이미지창 띄우기  -->
<!-- 파일업로드  -->
<%
 request.setCharacterEncoding("utf-8");
 String realFolder = "";
 String filename0 = "";
 String filename1 = "";
 int maxSize = 1024*1024*5;
 String encType = "utf-8";
 String savefile = "img";
 String uploadfile0 ="";
 String uploadfile1 ="";
 ServletContext scontext = getServletContext();
 realFolder = scontext.getRealPath(savefile);
	 try{MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	 		 Enumeration<?> files = multi.getFileNames();
	 		 
		     String file0 = (String)files.nextElement();
		     filename0 = multi.getFilesystemName(file0);
		     
	   		 String file1 = (String)files.nextElement();
	     	 filename1 = multi.getFilesystemName(file1);
	     	 
	     	 } catch(Exception e) {
	  e.printStackTrace();
	 }
	
	 String fullpath0 =  "http://106.10.32.22:8080/2019_JeonJSP/img/" + filename0;
	 uploadfile0 = filename0;
	 String fullpath1 =  "http://106.10.32.22:8080/2019_JeonJSP/img/" + filename1;
	 uploadfile1 = filename1;
%> 
<!-- 파일업로드  -->
<!-- 업로드 버튼생성  -->
<script>
var arrInput = new Array(0);
  var arrInputValue = new Array(0);
 
function addInput() {
	if (arrInput.length<2) { 
		  arrInput.push(arrInput.length);
		  arrInputValue.push("");
		  display();
		}
	else {
		alert("파일 2개까지 업로드 가능합니다;");
	}
}

function display() {
  document.getElementById('parah').innerHTML="";
  for (intI=0;intI<arrInput.length;intI++) {
    document.getElementById('parah').innerHTML+=createInput(arrInput[intI], arrInputValue[intI]);
  }
}
 
function saveValue(intId,strValue) {
  arrInputValue[intId]=strValue;
}  
 
function createInput(id,value) {
  return "<div id='Upload_file"+id+"'><input type='file' name='filename"+ id +"'id='filename"+ id +"'onChange='javascript:saveValue("+ id +",this.value)' value='"+ value +"'><input type='button' value='삭제' onclick='deleteInput();'/></div>";
}
 
function deleteInput() {
  if (arrInput.length > 0) { 
     arrInput.pop(); 
     arrInputValue.pop();
  }
  display(); 
}
$(function() {
	$("deleteInput").on("click", function() {
        $("p").unwrap(); // <p> 요소의 부모 요소를 삭제한다.
		$("p").remove();
	});
});
</script>
 <!-- 업로드 버튼생성  -->
</head>
<!-- stlye css -->
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../lw_user/vcheck.js"></script>
	<!-- 누르고 boardwrite에 보내기  -->
<script>
	function setParentText(){
		if(document.getElementById("filenames0").value=="null"){
			alert("파일을 업로드해주세요");
		}
		else if(document.getElementById("filenames0").value!=""){
        	window.opener.document.getElementById("filename0").value = document.getElementById("filenames0").value;
        	window.opener.document.getElementById("filepath0").value = document.getElementById("filepath0").value;
			if(document.getElementById("filenames1").value!=""){
	        	window.opener.document.getElementById("filename1").value = document.getElementById("filenames1").value;
	        	window.opener.document.getElementById("filepath1").value = document.getElementById("filepath1").value;
			}
			window.close();
		}
		if(document.getElementById("filenames0").value==""){
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
	<div style="width:100%;height: 50px;;background:#faafaf"><h4 style="padding-top: 10;color: white; padding-left: 10px;">파일 업로드</h4>
		<table class="lw_board" style="margin:0 auto; margin-top:50px">
						<%while(rs.next()) { %>
						  <tr style="display: none;"><!-- upload db에 보내는용도  -->
							  <td>
							  <div id="upload" style="border:solid;min-height: 100px;">
							   <input type="text" name="filename0" id="filenames0" value="<%=uploadfile0%>" style="border:none"><br>
							   <input type="text" name="filename1" id="filenames1" value="<%=uploadfile1%>" style="border:none"><br>
							   <%
							   		String filelink0="http://106.10.32.22:8080/"+request.getContextPath()+"/downloadAction?file="+uploadfile0;
									String filelink1="http://106.10.32.22:8080/"+request.getContextPath()+"/downloadAction?file="+uploadfile1;
								%>	<!-- 호스트 다르면 변경해라  --> 
							   <input type="text" name="filepath0" id="filepath0"value="<%=filelink0%>" style="border:none"><br>
							   <input type="text" name="filepath1" id="filepath1"value="<%=filelink1%>" style="border:none"><br>
							 </div>
							  </td>
						  </tr>
						</table> 
						</form>  
						<!-- 파일업로드하는거임  -->
						<form method="post" enctype="multipart/form-data" style="margin:0 auto;width:500px;">
						 <input type="button" class="newbutton" value="파일 추가" onclick="addInput();" />
							  <div id="parah" style="border:solid;min-height: 100px;margin-top:5px">
							  <%if(uploadfile0!=""){ %>
							   <div><input type="text" name="filename0" value="<%=uploadfile0%>" style="border:none"><input type='button' value='삭제' onclick='deleteInput();'readonly/></div><br>
							   <%} %>
							   <%if(uploadfile1!=""){ %>
							    <div><input type="text" name="filename1" value="<%=uploadfile1%>" style="border:none"><input type='button' value='삭제' onclick='deleteInput();'readonly/></div><br>
							    <%} %>
							 </div>
								<input style="float: left; margin-top: 5px;"type="submit"class="newbutton" value="업로드">
								<input style="float: right; margin-top: 5px;"type="button"class="newbutton" value="확인" onclick="setParentText()">
						</form>
						<div style="margin-top:100px;margin-left:50px;">
						<h6>파일은 각각 최대 10MB, 총 2개까지 업로드 하실 수 있습니다.</h6>
						<h6>파일명이 한글, 숫자, 영문이 아닌 다른 언어일 경우 <br>파일이 업로드 되지 않거나 깨질 수가 있습니다.</h6>
						<h6>저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 파일은 <br>운영 원칙 및 관계 법률에 의해제재를 받을 수 있습니다.</h6>
						</div>
						 <%} %>  
						 <%
						  }catch(Exception e){}finally {
					          if (rs != null) try { rs.close(); } catch(SQLException ex) {}
					          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
					          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
					      }	
						%>    
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
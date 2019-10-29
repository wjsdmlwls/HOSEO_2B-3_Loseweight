<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,user.UserDAO"%>
   	<%@ page import="java.io.File" %>
	<%@ page import = "questionboard.questionDAO" %>
	<%@ page import = "questionboard.questionDTO" %>
    <%@page import="java.sql.*" %>
    
<%@page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%request.setCharacterEncoding("utf-8");%>
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

<script type="text/javascript">
	var openWin;
	function openimgadd() {
		// window.name = "해당페이지로 가져옴 이름"; 
		window.name = "writeForm";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("imgadd.jsp", "childForm",
				"width=580, height=500, resizable = no, scrollbars = yes");
	}
</script>
<!-- modal windows -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  textarea에넣는 스크립트 div로 넣으면 error -->

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
		
	function deleteInput0() {
	  if (arrInput.length > 0) { 
	     arrInput.pop(); 
	     arrInputValue.pop();
	  }
	  display(); 
	}
	$(function() {
		$("deleteInput0").on("click", function() {
			$("#filelist0").unwrap(); // <p> 요소의 부모 요소를 삭제한다.
			$("#filelist0").remove();
		});
	});
	function deleteInput1() {
		  if (arrInput.length > 0) { 
		     arrInput.pop(); 
		     arrInputValue.pop();
		  }
		  display(); 
		}
		$(function() {
			$("deleteInput1").on("click", function() {
				$("#filelist1").unwrap(); // <p> 요소의 부모 요소를 삭제한다.
				$("#filelist1").remove();
			});
		});
</script> <!-- 업로드 버튼생성  -->

<!-- 파일업로드  -->
<%
	request.setCharacterEncoding("utf-8");
 String realFolder = "";
 String filename0 = "";
 String filename1 = "";
 int maxSize = 1024*1024*5;
 String encType = "utf-8";
 String savefile = "img";
 ServletContext scontext = getServletContext();
 realFolder = scontext.getRealPath(savefile);
	 try{MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	 		 Enumeration<?> files = multi.getFileNames();
	   		 String file0 = (String)files.nextElement();
	   		 String file1 = (String)files.nextElement();
	     	 filename0 = multi.getFilesystemName(file0);
	     	 filename1 = multi.getFilesystemName(file1);
	     	 } catch(Exception e) {
	  e.printStackTrace();
	 }
 String fullpath0 =  "http://localhost:8080/2019_JeonJSP/img/" + filename0;
 String uploadfile0 = filename1;
 String fullpath1 =  "http://localhost:8080/2019_JeonJSP/img/" + filename1;
 String uploadfile1 = filename0;
%>
<!-- 파일업로드  -->
</head>
<!-- stlye css -->
<link rel="stylesheet" href="../../css/style.css">

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
	int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  try{
      questionDAO dbPro = questionDAO.getInstance(); 
      questionDTO article =  dbPro.updateGetArticle(num);
%>
	<div class="div_body">
<jsp:include page="../../community/community_topinclude.jsp" >
			<jsp:param name="tom" value="4"/>
			<jsp:param name="toc" value="1"/>
			<jsp:param name="imgs" value="servicecenter.png"/>
			<jsp:param name="boardname" value="문의하기"/>
</jsp:include>

	<script type="text/javascript">
	$(function() {
	$('#write').click(function() {
		var dbTxt = $('#copy_div').html();
		$('#content').text(dbTxt); //공백 제거
		});
	});
	</script>
		<div style='width:1000px;margin:0 auto;margin-top: 5%;'>
			<div class="div_sidecontents" >
				<div class="mypage_form">
					<br>
					<form method="post" name="writeform" 
					action="question_updatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
					<table>
					  <tr>
					    <td align="left" width="200">
					       <input type="text" class="writeinput"name="writer" 
					         value="<%=article.getWriter()%>" style="ime-mode:active;width:200px">
						   <input type="hidden" name="num" value="<%=article.getNum()%>"></td>
						<td align="left">
					     	<input type="password"class="writeinput"
					               name="passwd" style="ime-mode:inactive;margin-left:10px;width:200px">
						 </td>
					  </tr>
					  <tr>
					    <td align="left"colspan="2">
					       <input type="text" class="writeinput" name="subject"
					        value="<%=article.getSubject()%>" style="ime-mode:active;width:413px;float:left">
					        <button class="button salmon button_addr" style="float:right;height: 42px;" type="button"onclick="openimgadd()">이미지 추가</button></td>	
					        </td>
					        
					  </tr>
					
					  <tr>
					    <td align="left" colspan="2">
					    <div contentEditable="true" id="copy_div" name="copy_div" class="contentsinput" style="	font-size: 14px;display: block;width: 1000px;height: auto;min-height: 600px;margin-bottom: 12px;padding: 16px 13px;color: #999999;border: 1px solid #d9d9d9;background: transparent;-moz-border-radius: 2px;-webkit-border-radius: 2px;border-radius: 2px;" ><%=article.getContent()%></div>
					     <textarea name="content" id="content"style="display:none;ime-mode:active;width:500px"></textarea></td>
					  </tr>
					  <tr>      
					   <td align="right" colspan="2"> 
					     <input type="submit" class="newbutton"value="글수정" id="write">  
					     <input type="button"class="newbutton" value="목록보기" 
					       onclick="document.location.href='question_list.jsp?pageNum=<%=pageNum%>'">
					   </td>
					 </tr>
					 <tr style="display: none;"> <!-- upload db에 보내는용도  -->
						 <td>
							  <div id="upload" style="border:solid;min-height: 100px;">
							   <input type="text" name="filename0" value="<%=uploadfile0%>" style="border:none"><br>
							   <input type="text" name="filename1" value="<%=uploadfile1%>" style="border:none"><br>
							   <%
							   		String filelink0="http://localhost:8080/"+request.getContextPath()+"/downloadAction?file="+uploadfile0;
									String filelink1="http://localhost:8080/"+request.getContextPath()+"/downloadAction?file="+uploadfile1;
								%>	<!-- 호스트 다르면 변경해라  -->
							   <input type="text" name="filepath0"value="<%=filelink0%>" style="border:none"><br>
							   <input type="text" name="filepath1" value="<%=filelink1%>" style="border:none"><br>
							 </div>
							</td>
					</tr>
					 </table>
					</form>
					<!-- 파일업로드하는거임  -->
					<form method="post" enctype="multipart/form-data" style="margin:0 auto;width:500px;">
					<input type="button" class="newbutton" value="파일 업로드" onclick="addInput();" />
					  		<input type='button' class="newbutton" value='삭제' onclick='deleteInput();'/>
					  		<div id="parah" style="border:solid;min-height: 100px;margin-top:5px;text-align: left;padding: 10;">
					  		<%if(uploadfile0==""){
					  			uploadfile0=article.getFilename0();
								uploadfile1=article.getFilename1();
					  		}%>
					  		<%if (uploadfile0!=null){ %>
					  		<script>
					  		arrInput.push(arrInput.length);
					  		</script>
							   <div id="filelist0"><input type="text" name="filename0" id="filename0"value="<%=uploadfile0%>" style="border:none"onchange="javascript:saveValue(0,this.value)"></div><br>
							   <%} %><%if (uploadfile1!=null){%>
							   <script>
						  		arrInput.push(arrInput.length);
						  		</script>
							    <div id="filelist1"><input type="text" name="filename1" value="<%=uploadfile1%>" style="border:none"onchange="javascript:saveValue(1,this.value)"></div><br>
							    <%} %>
							 </div>
							 <input type="submit"class="newbutton"style="float:right;margin-top:5px" value="업로드">
					</form>
						 <%
						  }catch(Exception e){}finally {
					          if (rs != null) try { rs.close(); } catch(SQLException ex) {}
					          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
					          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
					      }	
						%>     
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
	<jsp:include page="../../community/community_footerinclude.jsp" ></jsp:include>
</body>
</html>
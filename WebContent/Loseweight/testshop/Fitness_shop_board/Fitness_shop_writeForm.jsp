<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,user.UserDAO"%>
	<%@ include file="color.jspf"%>
   	<%@ page import="java.io.File" %>
    <%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%request.setCharacterEncoding("utf-8");%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<script src="../js/jquery.slim.min.js"></script>
<link rel="stylesheet" href="../../css/style.css">
<!--  textarea에넣는 스크립트 div로 넣으면 error -->
<script>
$(function() {
	$('#write').click(function() {
		var dbTxt = $('#copy_div').html();
		$('#content').text(dbTxt); //공백 제거
		});
	});
	/*숫자만 입력가능하게 만드는 스크립트 */
function fncCheckNumber(){
	var objEvent = event.srcElement;
	var numPattern = /([^0-9])/;
	numPattern = objEvent.value.match(numPattern);
	    
	if( numPattern != null ){ 
	objEvent.value="";
	alert("숫자만 입력할 수 있습니다.");
	objEvent.value="";
	objEvent.focus();
	return false;
	}
	}
	//숫자외 입력시 삭제 
	function SetNum(obj){
	 val=obj.value;
	 re=/[^0-9]/gi;
	 obj.value=val.replace(re,""); 
	}
	//체크박스 하나만 
	function oneCheckbox(a){
        var obj = document.getElementsByName("checkbox1");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != a){
                obj[i].checked = false;
            }
        }
    }
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
</script>
<!-- 파일업로드  -->
<!-- form 두개 다른곳에 보내기  -->
	<script>
	function  sendProcess(f){
	        f.action="bfboard_writePro.jsp";
	        f.submit();
	}
	</script>
<!-- form 두개 다른곳에 보내기  -->
<style>
.writeinput{
	font-size: 14px;
    display: block;
    width: 200px;
    height: 35px;
    padding: 16px 13px;
    color: #999999;
    border: 1px solid #d9d9d9;
    background: transparent;
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    margin-left: 15px;
    margin-top: 10;
    ime-mode:active;
 }
 .lw_fitshoptable tr th{
 border: solid #dedede 1px;
 background: #f4f5f7;
 width:120px;
 height:50px;
}
 .lw_fitshoptable tr td{
 border: solid #dedede 1px;
}
.addhead{
	margin-left:15px;
	font-size: 14px;
    font-weight: normal;
    text-decoration: none;
}
.fitshop_select{
	margin: 0 10 0 10;
    width: 80px;
    height: 30px;
}
.categoryfont{
	margin-left:15px;
	font-size: 14px;
    font-weight: normal;
    text-decoration: none;
}
.fitshop_checkbox{
margin-left:15px;
margin-right:15px;
}
</style>
<!-- 주소 end -->
<body>
<% 
  int num = 0;
  try{
    if(request.getParameter("num")!=null){
	   num=Integer.parseInt(request.getParameter("num"));
    }
%>
	<div class="div_body">
		<jsp:include page="../../community/community_topinclude.jsp" >
				<jsp:param name="tom" value="5"/>
				<jsp:param name="toc" value="not"/>
				<jsp:param name="imgs" value="shop.png"/>
				<jsp:param name="boardname" value="기구"/>
		</jsp:include>
						<form method="post" name="writeform" style="margin-top: 50px;"
						    onsubmit="return writeSave()">
						<input type="hidden" name="num" value="<%=num%>">
						<table class="lw_fitshoptable" style="margin:0 auto;">
						<%while(rs.next()) { %>
						   <tr>
						    <th  width="100"><a class="addhead">상품코드</a></th>
						    <td  width="330">
						       <input type="text" class="writeinput"
						          name="writer" style=""></td>
						    <th  width="100" ><a class="addhead">제품명</a></th>
						    <td  width="330" colspan="3" >
						       <input type="text"  class="writeinput"
						          name="writer" style="width:575px" ></td>
						  </tr>
						   <tr>
						    <th  width="100"><a class="addhead">소비자 가격</a></th>
						    <td  width="250">
						       <input type="text"class="writeinput"
						          name="writer" maxlength="9"style="" onKeyPress="SetNum(this);" onKeyUp="SetNum(this);" onKeyDown="fncCheckNumber();"></td>
						    <th  width="100" ><a class="addhead">판매가격</a></th>
						    <td  width="250" >
						       <input type="text" class="writeinput"
						          name="writer"maxlength="9" style="" onKeyPress="SetNum(this);" onKeyUp="SetNum(this);" onKeyDown="fncCheckNumber();"></td>
						    <th width="100" ><a class="addhead">배송비</a></th>
						    <td  width="250" >
						       <input type="text" class="writeinput"
						          name="writer"maxlength="9" style="" onKeyPress="SetNum(this);" onKeyUp="SetNum(this);" onKeyDown="fncCheckNumber();"></td>
						  </tr>
						   <tr>
						    <th  width="100"><a class="addhead">수량</a></th>
						    <td  width="330" >
						       <input type="text" maxlength="4" class="writeinput"
						          name="writer" style="width:100px" onKeyPress="SetNum(this);" onKeyUp="SetNum(this);" onKeyDown="fncCheckNumber();"></td>
						    <th  width="100"><a class="addhead">브랜드</a></th>
						    <td  width="330" colspan="3">
						       <input type="text"class="writeinput"
						          name="writer" style=""></td>
						  </tr>
						  <tr>
						  <th  width="100"><a class="addhead">카테고리</a></th>
						    <td colspan="6"><a class="categoryfont">1차 분류</a>
						       <select class="fitshop_select"name="job">
								    <option value="">-선택-</option>
								    <option value="학생">학생</option>
								    <option value="회사원">회사원</option>
								    <option value="기타">기타</option>
								</select><a class="categoryfont">2차 분류</a>
						       <select class="fitshop_select" name="job">
								    <option value="">-선택-</option>
								    <option value="학생">학생</option>
								    <option value="회사원">회사원</option>
								    <option value="기타">기타</option>
								</select><a class="categoryfont">3차 분류</a>
						       <select class="fitshop_select" name="job">
								    <option value="">-선택-</option>
								    <option value="학생">학생</option>
								    <option value="회사원">회사원</option>
								    <option value="기타">기타</option>
								</select>
							</td>
						  </tr>
						  <tr>
						   <th  width="70"  align="center" ><a class="addhead">내 용</a></th>
						   <td  width="330" colspan="6"><div contentEditable="true" id="copy_div"name="copy_div" class="contentsinput" style="font-size: 14px;display: block;width: 1000px;height: auto;min-height: 300px;max-height: 500px;overflow: auto;padding: 16px 13px;color: #999999;border: 1px solid #d9d9d9;background: transparent;-moz-border-radius: 2px;-webkit-border-radius: 2px;border-radius: 2px;" ></div><textarea name="content" id="content" style="height:500px; display:none;width:1000px; ime-mode:active; background:#fff; border:solid 1px;" ></textarea></td>
						  </tr>
						    <tr>
						    <th  width="100"><a class="addhead">상품노출</a></th>
						    <td  width="330" >
						        <select class="fitshop_select" name="job">
								    <option value="">-선택-</option>
								    <option value="0">미등록</option>
								    <option value="1">등록</option>
								</select></td>
						    <th  width="100"><a class="addhead">판매상태</a></th>
						    <td  width="330"colspan="3" >
						       <select class="fitshop_select" name="job">
								    <option value="">-선택-</option>
								    <option value="0">준비중</option>
								    <option value="1">판매중</option>
								    <option value="2">판매중지</option>
								</select>
								</td>
						  </tr>
						  <tr>
						    <th  width="100"><a class="addhead">이벤트</a></th>
						    <td  width="330" colspan="6">
							    <form name="sendForm" method="get">
								    <input type="checkbox" name="checkbox1" class="fitshop_checkbox" value="a1" onclick="oneCheckbox(this)"><img src="/2019_JeonJSP/Loseweight/img/shop/new_shop.png">
								    <input type="checkbox" name="checkbox1" class="fitshop_checkbox"value="a2" onclick="oneCheckbox(this)"><img src="/2019_JeonJSP/Loseweight/img/shop/freedelivery_shop.png">
								    <input type="checkbox" name="checkbox1" class="fitshop_checkbox"value="a3" onclick="oneCheckbox(this)"><img src="/2019_JeonJSP/Loseweight/img/shop/hit_shop.png">
								</form>
						    </td>
						  </tr>
						   <tr>
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
</body>
</html>
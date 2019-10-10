<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,user.UserDAO"%>
   	<%@ page import="java.io.File" %>
	<%@ page import = "Fitnesshop.Fitnesshop_DAO" %>
	<%@ page import = "Fitnesshop.Fitnesshop_DTO" %>
    <%@page import="java.sql.*" %>
    <% request.setCharacterEncoding("utf-8");%>
<%@page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
    <%
    	// 세션정보 가져오기
    	  PreparedStatement pstmt = null;
            ResultSet rs = null;
            Connection conn= null;
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
<script>
$(function() {
	$('#write').click(function() {
		var dbTxt = $('#copy_div').html();
		$('#product_contents').text(dbTxt); //공백 제거
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
	
	//select category 할때 1차 2차 3차 골라주기 
	function fitcategory1_change(){
		 
		var sporting_goods = ["2차 분류","부위별운동기구","웨이트기구","기타헬스용품"];
		var health_food  = ["2차 분류","보조식품","다이어트/미용음료"];
		 
		var selectItem = $("#categoryselect1").val();
		 
		var changeItem;
		  
		if(selectItem == "기구"){
		  changeItem = sporting_goods;
		}
		else if(selectItem == "식품"){
		  changeItem = health_food;
		}
			 
		$('#categoryselect2').empty();
		$('#categoryselect3').empty();
		for(var count = 0; count < changeItem.length; count++){                
		                var option = $("<option value="+changeItem[count]+">"+changeItem[count]+"</option>");
		                $('#categoryselect2').append(option);
		            }
		}
	function fitcategory2_change(){
		 
		var part_exercise = ["3차 분류","전신운동","체형관리","상체","하체"];
		var weight_exercise = ["3차 분류","덤벨","벤치프레스","바벨"];
		var Other_exercise = ["3차 분류","철봉","악력기","재활/보조운동","밴드"];
		var supplement_food = ["3차 분류","프로틴","식이섬유","다이어트 간식"];
		var diet_drink = ["3차 분류","다이어트 차","건강즙","식초/홍초"];
		var selectItem = $("#categoryselect2").val();
		 
		var changeItem;
		  
		if(selectItem == "부위별운동기구"){
		  changeItem = part_exercise;
		}
		else if(selectItem == "웨이트기구"){
		  changeItem = weight_exercise;
		}
		else if(selectItem == "기타헬스용품"){
		  changeItem =  Other_exercise;
		}
		else if(selectItem == "보조식품"){
			  changeItem = supplement_food;
			}
		else if(selectItem == "다이어트/미용음료"){
			 changeItem =  diet_drink;
		}
		 
		$('#categoryselect3').empty();
		 
		for(var count = 0; count < changeItem.length; count++){                
		                var option = $("<option value="+changeItem[count]+">"+changeItem[count]+"</option>");
		                $('#categoryselect3').append(option);
		            }
		 
		}


	
	// 자동 계산 (딜러 할인)
	function avg_price() {
	  cost = parseFloat(fitshopform.cost.value);
	  reduced_price = parseFloat(fitshopform.reduced_price.value);
	  fitshopform.selling_price.value = Math.round(cost -((cost * reduced_price) / 100));
	  selling_price = parseFloat(fitshopform.selling_price.value);
	  fitshopform.pointplus.value = Math.round(selling_price*0.015);
	}
	
	function admin_check(){	
		 var obj = document.fitshopform;
		 
		 if(obj.product_code.value==""){
			 alert("상품 코드를 입력 안하셨습니다.");
			 return false;
		 }else if(obj.product_name.value==""){
			 alert("제품명을 입력 안하셨습니다.");
			 return false;
		 }else if(obj.cost.value==0){
			 alert("소비자 가격을 입력을 안하셨습니다.");
			 return false;
		 }else if(obj.reduced_price.value==0){
			 alert("할인율을 입력 안하셨습니다.");
			 return false;
		 }else if(obj.quantity.value==""){
			 alert("수량을 입력 안하셨습니다.");
			 return false;
		 }else if(obj.brand.value==""){
			 alert("브랜드를 입력 안하셨습니다.");
			 return false;
		 }else if(obj.delivery_charge.value==""){
			 alert("배송비를 입력 안하셨습니다.");
			 return false;
		 }else if(obj.big_category.value==""||obj.middle_category.value==""||obj.small_category.value=="3차 분류"){
			 alert("카테고리를 모두 선택해주세요.");
			 return false;
		 }else if(obj.img0.value==""||obj.img0.value==null){
			 alert("썸네일 이미지를 선택해주세요.");
			 return false;
		 }else if(obj.exposure.value==""){
			 alert("상품노출를 선택해주세요.");
			 return false;
		 }else if(obj.salestatus.value==""){
			 alert("판매상태 를 선택해주세요.");
			 return false;	 
		 }else if(obj.passwd.value!=obj.passwdch.value){
			 alert("비밀번호를 확인해주세요");
			 return false;
		 }else{
			 alert("모든 항목이 입력되었습니다 상품등록이 완료되었습니다 ^^7");
			 return true;
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
	function openimgupload() {
		// window.name = "해당페이지로 가져옴 이름"; 
		window.name = "writeForm";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("imgupload.jsp", "childForm",
				"width=580, height=600, resizable = no, scrollbars = yes");
	}

	
</script>
<!-- 파일업로드  -->
<!-- form 두개 다른곳에 보내기  -->
	<script>
	function  sendProcess(f){
	        f.action="Fitness_shop_updatePro.jsp";
	        f.submit();
	}
	</script>
<!-- 파일업로드  -->
</head>
<!-- stlye css -->

<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/jquery.slim.min.js"></script>
<script src="../../js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../../css/style.css">

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
 white-space: nowrap;
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
.category{
	width: 150px;
    margin-left: 20px;
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
	int lw_salesnum = Integer.parseInt(request.getParameter("lw_salesnum"));
  String pageNum = request.getParameter("pageNum");
  try{
	  Fitnesshop_DAO dbPro = Fitnesshop_DAO.getInstance(); 
	  Fitnesshop_DTO article =  dbPro.updateGetArticle(lw_salesnum);
%>
		<div class="div_body">
		<jsp:include page="../../community/community_topinclude.jsp" >
				<jsp:param name="tom" value="5"/>
				<jsp:param name="toc" value="not"/>
				<jsp:param name="imgs" value="shop.png"/>
				<jsp:param name="boardname" value="기구"/>
		</jsp:include>
						<form method="post" method="get" name="fitshopform" style="margin-top: 50px;"
						    onsubmit="return admin_check();return writeSave();" action="Fitness_shop_updatePro.jsp">
					
						<table class="lw_fitshoptable" style="margin:0 auto;">
					
						   <tr>
						    <th  width="100"><a class="addhead">상품코드</a></th>
						      
						    <td  width="330">
						       <input type="text" class="writeinput"
						          name="product_code" style="" value="<%=article.getProduct_code()%>"></td>
						    <th  width="100" ><a class="addhead">제품명</a></th>
						    <td  width="330" colspan="3" >
						       <input type="text"  class="writeinput"
						          name="product_name" value="<%=article.getProduct_name()%>" style="width:655px" ></td>
						  </tr>
						   <tr>
						    <th  width="100"><a class="addhead">소비자 가격</a></th>
						    <td  width="250">
						       <input type="text"class="writeinput"
						          name="cost" value="<%=article.getCost()%>" maxlength="9"style="" onKeyPress="SetNum(this);" onKeyDown="fncCheckNumber();" onkeyup="avg_price();" value="0"></td>
						    <th  width="100" ><a class="addhead">할인율</a></th>
						    <td  width="250" >
						       <input type="text" class="writeinput" style="width: 50px;text-align: center;"
						          name="reduced_price" value="<%=article.getReduced_price()%>" maxlength="2" style="" onKeyPress="SetNum(this);"  onKeyDown="fncCheckNumber();" onkeyup="avg_price();" value="0"></td>
						    <th width="100" ><a class="addhead">판매가격</a></th>
						    <td  width="250" >
						       <input type="text" class="writeinput"
						          name="selling_price" maxlength="9" readonly></td>
						  </tr>
						  <tr>
						    <th  width="100"><a class="addhead">수량</a></th>
						    <td  width="330" >
						       <input type="text" maxlength="4" class="writeinput"
						          name="quantity" style="width:100px" onKeyPress="SetNum(this);" onKeyUp="SetNum(this);" onKeyDown="fncCheckNumber();" value="<%=article.getQuantity()%>"></td>
						    <th  width="100"><a class="addhead">브랜드</a></th>
						    <td  width="330">
						       <input type="text"class="writeinput"
						          name="brand" value="<%=article.getBrand()%>"></td>
						    <th width="100" ><a class="addhead">배송비</a></th>
						    <td  width="250" >
						       <input type="text" class="writeinput"
						          name="delivery_charge" value="<%=article.getDelivery_charge()%>" maxlength="9" style="" onKeyPress="SetNum(this);" onKeyUp="SetNum(this);" onKeyDown="fncCheckNumber();"></td>
						  </tr>
						  <tr>
						  <th  width="100"><a class="addhead">카테고리</a></th>
						    <td colspan="5">
						    	<select name="big_category" class="category"id="categoryselect1" onchange="fitcategory1_change()">
									<option>1차 분류</option>
									<option value="기구">기구</option>
									<option value="식품">식품</option>
								</select>
									 
								<select name="middle_category" class="category" id="categoryselect2" onchange="fitcategory2_change()">
								</select>
								<select name="small_category" class="category" id="categoryselect3">
								</select>
						    		
							</td>
						  </tr>
						  <tr>
						   <th  width="70"  align="center" ><a class="addhead">내 용</a></th>
						   <td  width="330" colspan="5"><div contentEditable="true" id="copy_div" name="copy_div" class="contentsinput" style="float:left; font-size: 14px;display: block;width:1135px;px;height: auto;min-height: 300px;max-height: 500px;overflow: auto;padding: 16px 13px;color: #999999;border: 1px solid #d9d9d9;background: transparent;-moz-border-radius: 2px;-webkit-border-radius: 2px;border-radius: 2px;" ></div><textarea name="product_contents" id="product_contents" style="height:500px; display:none;width:1000px; ime-mode:active; background:#fff; border:solid 1px;" ></textarea>
						   <button class="button salmon button_addr"  type="button"onclick="openimgadd()">이미지 추가</button>
						  </td>
							
						  </tr>
						  <tr>
							  <th  width="100"><a class="addhead">썸네일</a></th>
							  <td  width="100" colspan="4">
							  <input id="img0" name="img0" value="<%=article.getImg0()%>" style="width:100%; height: 48px;"readonly><!-- img첫번째로 올라오는것 --></td>
							  <td width="100">
							  <button class="button salmon button_addr" style="height: 47px;width: 100%;" type="button"onclick="openimgupload()">썸네일 추가</button>
							  </td>
						  </tr>
						    <tr>
						    <th  width="100"><a class="addhead">상품노출</a></th>
						    <td  width="330" >
						        <select class="fitshop_select" name="exposure">
								    <option value="">-선택-</option>
								    <option value="0">미등록</option>
								    <option value="1">등록</option>
								</select></td>
						    <th  width="100"><a class="addhead">판매상태</a></th>
						    <td  width="330"colspan="3" >
						       <select class="fitshop_select" name="salestatus">
								    <option value="">-선택-</option>
								    <option value="0">준비중</option>
								    <option value="1">판매중</option>
								    <option value="2">판매중지</option>
								</select>
								</td>
						  </tr>
						  <tr> 
				    <th  width="100"><a class="addhead">이벤트</a></th>
						    <td  width="330" colspan="3">
							    <div name="productevent">
								    <input type="checkbox" name="productevent" class="fitshop_checkbox" value="1" onclick="oneCheckbox(this)"><img src="/2019_JeonJSP/Loseweight/img/shop/new_shop.png">
								    <input type="checkbox" name="productevent" class="fitshop_checkbox" value="2" onclick="oneCheckbox(this)"><img src="/2019_JeonJSP/Loseweight/img/shop/freedelivery_shop.png">
								    <input type="checkbox" name="productevent" class="fitshop_checkbox" value="3" onclick="oneCheckbox(this)"><img src="/2019_JeonJSP/Loseweight/img/shop/hit_shop.png">
								</div>
						    </td><th  width="100"><a class="addhead">누적 LP 포인트</a></th>
						    <td  width="100">
							    <input id="pointplus" name="pointplus" style="width:100%; height: 48px;"readonly>
						    </td>
						  </tr>
						  <tr>
						  <th  width="100"><a class="addhead">옵션</a></th>
						  <th  width="100" colspan="2"><a class="addhead">옵션 정보 </a></th>
						  <th  width="100" colspan="2"><a class="addhead">추가 가격</a></th>
						  <th  width="100" colspan="1"><a class="addhead"></a></th>
						  </tr>
					
					
							  <tr>
							  <th  width="100"><a class="addhead">옵션 1</a></th>
							  <td  width="100" colspan="2"> <input type="text" class="writeinput"name="option1" value="<%=article.getOption1()%>"></td>
							  <td  width="100" colspan="2"> <input type="text" class="writeinput"name="option1price" value="<%=article.getOption1price()%>" maxlength="9"style="" onKeyPress="SetNum(this);" onKeyDown="fncCheckNumber();"></td>
							  <th  width="100" colspan="1"><a class="addhead"></a></th>
						  </tr>
						 <tr>
							  <th  width="100"><a class="addhead">옵션 2</a></th>
							  <td  width="100" colspan="2"><input type="text"class="writeinput"name="option2" value="<%=article.getOption2()%>"></td>
							  <td  width="100" colspan="2"><input type="text"class="writeinput"name="option2price" value="<%=article.getOption2price()%>"maxlength="9"style="" onKeyPress="SetNum(this);" onKeyDown="fncCheckNumber();"></td>
							  <th  width="100" colspan="1"><a class="addhead"></a></th>
						  </tr>
						   <tr>
							  <th  width="100"><a class="addhead">옵션 3</a></th>
							  <td  width="100" colspan="2"><input type="text"class="writeinput"name="option3" value="<%=article.getOption3()%>"></td>
							  <td  width="100" colspan="2"><input type="text"class="writeinput"name="option3price" value="<%=article.getOption2price()%>"maxlength="9"style="" onKeyPress="SetNum(this);" onKeyDown="fncCheckNumber();"></td>
							  <th  width="100" colspan="1"><a class="addhead"></a></th>
						  </tr> 
						  <tr> 
						    <td align="right" colspan="4"> 
						      					<input type="hidden" id="passwdch" name="passwdch" value="<%=article.getPasswd()%>">
						    비밀번호를 한번더 확인해주세요 <input type="text" id="passwdwd2" name="passwd">
					     <button type="submit" class="newbutton" id="write">글수정</button>  
					     <input type="button"class="newbutton"  value="목록보기" 
					       onclick="document.location.href='Fitness_shop_list.jsp?pageNum=<%=pageNum%>'">
					       <input type="hidden" name="lw_salesnum" value="<%=lw_salesnum%>">
					       <input type="hidden" name="pageNum" value="<%=pageNum%>">
					       <input type="hidden" name="lw_id" value="<%=rs.getString("lw_id")%>">
					        <input type="hidden" id="passwdwd" name="passwd2" value="<%=rs.getString("lw_passwd")%>">
						
					   </td>
						  </tr>
					</table>
			
						
						
					
					</form>
					
						 <%
						  }catch(Exception e){}finally {
					          if (rs != null) try { rs.close(); } catch(SQLException ex) {}
					          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
					          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
					      }	
						
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
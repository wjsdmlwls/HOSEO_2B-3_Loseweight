<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<style>

</style>
<script>
var arrInput = new Array(0);
  var arrInputValue = new Array(0);
 
function addInput() {
	if (arrInput.length<5) { 
  arrInput.push(arrInput.length);
  arrInputValue.push("");
  display();
	}
	else {
		alert("에반데?");
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
  return "<div id='Upload_img"+id+"'><input type='file' id='file"+ id +"'onChange='javascript:saveValue("+ id +",this.value)' value='"+ value +"'><input type='button' value='삭제' onclick='deleteInput();'/></div>";
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
<body>
<form method="post" action="test.jsp">
<input type="button" value="업로드" onclick="addInput();" />
<input type="button" value="삭제" onclick="deleteInput();"/>
<input type="submit" value="전송"/>
<div id="parah"></div>



</body>
</html>
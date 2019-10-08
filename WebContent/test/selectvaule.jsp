<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="utf-8">
<head>
  <meta charset="utf-8">
  <title>last demo</title>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<script language="javascript">
function setValues(){
   var sh = document.getElementById("selectHours");
   var tt = document.getElementById("textTime");   
   tt.value = sh.options[sh.selectedIndex].text;   
}
</script>
<body>
   <select id="selectHours" size="1" onChange="setValues();">
  <option value="1">test_1</option>
  <option value="2">test_2</option>
</select>
<input type="text" id="textTime">
</body>
</html>
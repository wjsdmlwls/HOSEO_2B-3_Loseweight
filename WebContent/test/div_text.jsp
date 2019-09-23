<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<script
src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
$(function() {
$('#btn').click(function() {
var dbTxt = $('#src').html();
dbTxt = dbTxt.replace(/<br>/g, '\n');
$('#trg textarea').text(dbTxt);
});
});
</script>
</head>

<body>
<button id="btn">버튼</button>
<div id="src" contentEditable="true">제<br>이<br>에<br>스<br>피<br><img scr""></div>
<div id="trg">
<textarea rows="10" cols="10"></textarea>
</div>
</body>

</html>
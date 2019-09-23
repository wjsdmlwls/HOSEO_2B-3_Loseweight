<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<script src="//code.jquery.com/jquery.min.js"></script> <!-- 제이쿼리 1.x 최신 버전 로드 -->
<script type="text/javascript">
 function getFile(){
   document.getElementById("upfile").click(); //type="file" CLICK
 }
 function sub(obj){
    var file = obj.value; //변수저장
    var fileName = file.split("\\"); // 첫번째\ - ESCAPE 처리, 두번째\ - (역슬러시)가 나올 경우 SPLIT
    document.getElementById("input_box").innerHTML = fileName[fileName.length-1]; //input_box 마지막 자식요소를 찾아서 삽입
  }
</script>



</head>

<body>
<div class="container">

  <div id="input_box"></div>

  <input type="file" id="upfile" value="upload" onchange="sub(this)"  />

  <input type="image" src="" class="sFile" id="yourBtn" onclick="getFile();" />

</div>



</body>

</html>
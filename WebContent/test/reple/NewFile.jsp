<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head><!--1. 아래 스크립트를 HEAD 부분에 복사해 넣으세요. 없으면 그냥 두세요--> 
<SCRIPT LANGUAGE="JavaScript"> 

<!---Edited by JASKO--> 
<!---Web Site : http://www.javascript.co.kr--> 

<!-- Begin 
var ie4 = (document.all) ? true : false; 
var ns4 = (document.layers) ? true : false; 
var ns6 = (document.getElementById && !document.all) ? true : false; 
function hidelayer(lay) { 
if (ie4) {document.all[lay].style.visibility = "hidden";} 
if (ns4) {document.layers[lay].visibility = "hide";} 
if (ns6) {document.getElementById([lay]).style.display = "none";} 
} 
function showlayer(lay) { 
if (ie4) {document.all[lay].style.visibility = "visible";} 
if (ns4) {document.layers[lay].visibility = "show";} 
if (ns6) {document.getElementById([lay]).style.display = "block";} 
} 
function writetolayer(lay,txt) { 
if (ie4) { 
document.all[lay].innerHTML = txt; 
} 
if (ns4) { 
document[lay].document.write(txt); 
document[lay].document.close(); 
} 
if (ns6) { 
over = document.getElementById([lay]); 
range = document.createRange(); 
range.setStartBefore(over); 
domfrag = range.createContextualFragment(txt); 
while (over.hasChildNodes()) { 
over.removeChild(over.lastChild); 
} 
over.appendChild(domfrag); 
   } 
} 
//  End --> 
</script> 

</HEAD> 

<!--2. BODY 태그내에 onload="" 혹은 onunload 부분이 있으면 복사해 넣으세요--> 

<BODY BGCOLOR="#FFFFFF"> 

<!--3. BODY 부분에 아래의 스크립트를 복사해 넣으세요--> 

<SPAN ID="newlayer" style="position:absolute;">레이어 텍스트</SPAN> 
<br><br><br> 
<a href="javascript:hidelayer('newlayer');">레이어 숨기기</a> | 
<a href="javascript:showlayer('newlayer');">레이어 보이기</a> | 
<a href="javascript:writetolayer('newlayer','레이어 텍스트 #1');">레이어 텍스트 #1</a> | 
<a href="javascript:writetolayer('newlayer','레이어 텍스트 #2');">레이어 텍스트 #2</a>  

</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head><!--1. �Ʒ� ��ũ��Ʈ�� HEAD �κп� ������ ��������. ������ �׳� �μ���--> 
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

<!--2. BODY �±׳��� onload="" Ȥ�� onunload �κ��� ������ ������ ��������--> 

<BODY BGCOLOR="#FFFFFF"> 

<!--3. BODY �κп� �Ʒ��� ��ũ��Ʈ�� ������ ��������--> 

<SPAN ID="newlayer" style="position:absolute;">���̾� �ؽ�Ʈ</SPAN> 
<br><br><br> 
<a href="javascript:hidelayer('newlayer');">���̾� �����</a> | 
<a href="javascript:showlayer('newlayer');">���̾� ���̱�</a> | 
<a href="javascript:writetolayer('newlayer','���̾� �ؽ�Ʈ #1');">���̾� �ؽ�Ʈ #1</a> | 
<a href="javascript:writetolayer('newlayer','���̾� �ؽ�Ʈ #2');">���̾� �ؽ�Ʈ #2</a>  

</html>
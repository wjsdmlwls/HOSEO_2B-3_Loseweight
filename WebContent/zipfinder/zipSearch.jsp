<%@ page import="java.sql.*" contentType="text/html;charset=utf-8"%>
<%@ page import="DBBean.jekimDB" %>
<Script>
function AutoInput(zip, address){
	zip1 = zip.substring(0,3);
	zip2 = zip.substring(4,7);
	opener.nform.zip1.value=zip1;
	opener.nform.zip2.value=zip2;
	opener.nform.address1.value=address;
	self.close();
} 
</Script>   

<head>
    <!-- jQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- bootstrap JS -->
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <!-- bootstrap CSS -->
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색 결과</title>
</head>
<style>
.button{
	color:#fff;
	line-height: 41px;
    width: 60px;
	border:none;
	outline:none;
	font-size:13px;
	font-weight:400;
	transition:all .1s linear;
	background:#1a69b2;
	cursor:"pointer";
}
.post{
	width:95%;
	margin-top:10px;
	background:1a69b2;
}
.zipbutton{
	margin-left:-3.5px;
}
.zipcode_input{
	width: 430px;
    background-color: #fff;
    border: medium none;
    border: 2px solid #1a69b2;
    color: #7d7d7d;
    font-size: 12px;
    font-weight: 500;
    height: 43px;
    margin-top:5px;
}
.zipcode_reslut_text{
	width: 95%;
    background-color: #fff;
    border: medium none;
    border: 2px solid #ccc;
    color: #7d7d7d;
    font-size: 12px;
    font-weight: 500;
    height: 43px;
    margin-top:5px;
}
.zipcode_reslut_form{
	margin-bottom:30px;
}


</style>
<center>
<form method="post" action="zipSearch.jsp">
	<table align="center" border=0>
	<tr>
	<td>
		<font size=2 color=#7b775f>
		<center><h3>주소검색</h3></center>
		<input class="zipcode_input" type="text" placehoder="동이나 읍/면의 이름" name="dong">
		<input class="button zipbutton" type="submit" value="검색">
		</font>
	</td>
	</tr>
	</table>
</form></center>
<table align=center border=0 id="example-table-1" class="table table-bordered table-hover text-center">
<%
	jekimDB usedb = new jekimDB();
	request.setCharacterEncoding("UTF-8");
	
	usedb.connect();
	String dong = request.getParameter("dong");
	
	String sql="select * from lw_zipcode where OLD_DONG like '%"+dong+"%' OR NEW_ADDR like '%"+dong+"%' OR NEW_ZIPCODE like '%"+dong+"%'OR OLD_ZIPCODE like '%"+dong+"%'  ";
	ResultSet rs= usedb.resultQuery(sql);
	
	if(rs.next()){
		do{
		String newzip=rs.getString("NEW_ZIPCODE");
		String newaddr=rs.getString("NEW_ADDR");
		String zip=rs.getString("OLD_ZIPCODE");
		String sido=rs.getString("OLD_SIDO");
		String gugun=rs.getString("OLD_GUGUN");
		String don=rs.getString("OLD_DONG");
		String ri=rs.getString("OLD_RI");
		String bunji=rs.getString("OLD_BUNJI");
		if(ri==null) ri=" ";
		if(bunji==null) bunji=" ";
		String address=sido+""+gugun+""+dong+""+ri+""+bunji;
		%>
		<tr>
			<td bgcolor="#fff"><center><font size=2>
			<a href="JavaScript:AutoInput('<%=zip %>','<%=address%>')" value="<%=newzip%>">
			<%=newzip%><br>(<%=zip %>)</a></font></center></td>
			<td bgcolor="#fff"><center><font size=2>
			<a href="JavaScript:AutoInput('<%=zip %>','<%=address%>')" value="<%=newaddr%>">
			<%=address%><font color="#fff">|</font><br><%=newaddr %></a></font></center></td>
			</tr>
		<%
			}while(rs.next());
		%>
		</table>
	<%
	}
	else
	{	
	 %>

</table>
<font size=2><center><br>찾고자하는 동이 존재하지 않습니다.<br>
<%
	}
%>
<br>
    <script>
        // 테이블의 Row 클릭시 값 가져오기
        $("#example-table-1 tr").click(function(){     
 
            var str = ""
            var tdArr = new Array();    // 배열 선언
            
            // 현재 클릭된 Row(<tr>)
            var tr = $(this);
            var td = tr.children();
            
            // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
            console.log("클릭한 Row의 모든 데이터 : "+tr.text());
            
            // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
            td.each(function(i){
                tdArr.push(td.eq(i).text());
            });
            
            console.log("배열에 담긴 값 : "+tdArr);
            
            // td.eq(index)를 통해 값을 가져올 수도 있다.
            var zipnumber1 = td.eq(0).text();
            var zipnumber2 = td.eq(1).text();
            //테이블 입력한 값에서 한번에 받아서 신주소와 구주소를 분리해야함 신주소만 가져옴
            var zipnumber1 = zipnumber1.substring(8,13);
            var zipnumber2 = zipnumber2.split("|");
            var zipnumber2 = zipnumber2[1]; 
            <!--end-->
            str +=    " * 클릭된 Row의 td값 = Zipnumber. : <font color='red'>" + zipnumber1 + "</font>" +
                    ", 나머지주소: <font color='red'>" + zipnumber2 + "</font>";       
            $("#ex1_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());        
            $("#ex1_Result2").html(str);
            $("#ex1_Result3").html(zip_code1);
            $("#ex1_Result4").html(zip_code2);
            document.getElementById("zip_code1").value=zipnumber1; 
            document.getElementById("zip_code2").value=zipnumber2;
           
        });
        function setParentText(){
        	window.opener.document.getElementById("lw_zipcode").value = document.getElementById("zip_code1").value
        	window.opener.document.getElementById("lw_addr1").value = document.getElementById("zip_code2").value
        	window.close();
        }
    </script>
    <center>
	    <div class="zipcode_reslut_form">
		     <div style='display:inline;'>
			     <div style='display:inline;float:center;' id="ex1_Result3" ><input class="zipcode_reslut_text" type="text" id="zip_code1" placeholder="zipnumber"></div><br>
			     <div style='display:inline;float:center; margin-left:5px' id="ex1_Result4" ><input class="zipcode_reslut_text" type="text" id="zip_code2" placeholder="나머지주소"></div> <br>
				 <input style='display:inline;float:center;' class="button post"type="button" value="확인" onclick="setParentText()">
			</div>
		</div>
	</center>
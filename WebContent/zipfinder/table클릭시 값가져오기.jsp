<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- jQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <!-- bootstrap JS -->
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    
    <!-- bootstrap CSS -->
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    
 
 
</head>
 
<body>
 
    
    <br><br>
 
    <div class="row">
        <table id="example-table-1" width="100%" class="table table-bordered table-hover text-center">
            <thead>
                <tr>
                    <th>No. </th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>이메일</th>
                </tr>
            </thead>
            <tbody>                
                <tr>
                    <td>1</td>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>hong@gmail.com</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>user02</td>
                    <td>김사부</td>
                    <td>kim@naver.com</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>user03</td>
                    <td>존</td>
                    <td>John@gmail.com</td>
                </tr>
            </tbody>
        </table>
        <div class="col-lg-12" id="ex1_Result1" ></div> 
        <div class="col-lg-12" id="ex1_Result2" ></div> 
    </div>
    <br><br>
    
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
            var no = td.eq(0).text();
            var userid = td.eq(1).text();
            var name = td.eq(2).text();
            var email = td.eq(3).text();
            
            
            str +=    " * 클릭된 Row의 td값 = No. : <font color='red'>" + no + "</font>" +
                    ", 아이디 : <font color='red'>" + userid + "</font>" +
                    ", 이름 : <font color='red'>" + name + "</font>" +
                    ", 이메일 : <font color='red'>" + email + "</font>";        
            
            $("#ex1_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());        
            $("#ex1_Result2").html(str);
        });
    
    
    </script>
 
 
</body>
</html>


출처: https://all-record.tistory.com/172 [세상의 모든 기록]
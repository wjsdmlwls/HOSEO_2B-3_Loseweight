<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="utf-8">
<head>
  <meta charset="utf-8">
  <title>last demo</title>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
    <button name="addStaff">정산담당자 추가</button>
    <br>
    <br>
    <table border="1" style="width:950px">
        <tbody>
            <tr name="trStaff">
                <td style="width:150px"><strong>정산담당자</strong></td>
                <td style="width:800px">
                    <input type="text" name="staff_name" placeholder="성명">
                    <input type="text" name="staff_contact" placeholder="연락처1">
                    <input type="text" name="staff_contact2" placeholder="연락처2">
                    <input type="text" name="staff_email" placeholder="이메일">
                    <select name="staff_use_yn">
                        <option value="Y">사용</option>
                        <option value="N">미사용</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><strong>메모</strong></td>
                <td>
                    <textarea style="width:800px" name="memo" rows="3" placeholder="메모를 남겨주세요."></textarea>
                </td>
            </tr>
        </tbody>
    </table>
    
   <button name="btn-add-row">정산담당자 추가</button>
  <div name="test">
   <div contentEditable="true" id="copy_div" name="copy_div" style="height:300px; width:400px; ime-mode:active; background:#fff; border:solid 1px;" >
   </div>
  </div>
<script>
    //추가 버튼
    $(document).on("click","button[name=addStaff]",function(){
         
        var addStaffText =  '<tr name="trStaff">'+
            '   <td><img class="logo" alt="logo" src="img/logo/logo.png"></td>'
            '</tr>';
             
        var trHtml = $( "tr[name=trStaff]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
         
        trHtml.after(addStaffText); //마지막 trStaff명 뒤에 붙인다.
         
    });
    $('#btn-delete-row').click(function() {
        $('#test > copy_div:last').append('<img class="logo" alt="logo" src="img/logo/logo.png">');
             //마지막 trStaff명 뒤에 붙인다.
    });
     
</script>
  
</body>
</html>
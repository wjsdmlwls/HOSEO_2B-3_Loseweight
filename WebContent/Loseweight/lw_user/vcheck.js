function phone_max(){
	var obj = document.vcheck;

	if(obj.lw_phone.value.lenght>12){
		alert("핸드폰 번호를 11자리로 입력해주세요");
		obj.lw_phone.value="";
		obj.lw_phone.focus();
		return false;
	}
	
}
function p_m_alert(){
	  var obj = document.vcheck1;
		
	  if(obj.lw_phone.value.length > 12){
	    document.getElementById("alert").innerHTML=('<span style="color:red;">11자리가 넘어갔습니다.</span>');
	    return;
	  }else{
	    document.getElementById("alert").innerHTML=('<span></span>');
	    return false;
	  }
	}

function email3(userinput){
	   var email3 = userinput.e_mail3.value;
	   if(email3 =="0"){
		   userinput.lw_e_mail2.value="";
		   userinput.lw_e_mail2.readOnly= false;
	   }else{
		   userinput.lw_e_mail2.value= email3;
		   userinput.lw_e_mail2.readOnly= true;
	   }
}

function sendIt() {
	   if (document.getElementById("passwd2").value != document.getElementById("passwd3").value) 
	   {  //비밀번호 불일치시 나오는 경고문
		   alert("비밀번호가 일치하지 않습니다")   
		   return false;
  }
	  if (document.getElementById("passwd2").value == ""||document.getElementById("passwd2").value == null||
			 document.getElementById("passwd3").value == ""||document.getElementById("passwd3").value == null) 
	   {  //비밀번호 불일치시 나오는 경고문
		   alert("비밀번호를 입력하지 않으셨습니다.")   
		   return false;
 } 
}
<!-- PW 입력 안했을경우나 비밀번호 확인이 틀릴경우 -->

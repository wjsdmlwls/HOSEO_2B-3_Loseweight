function phone_max(){
	var obj = document.vcheck;

	if(obj.lw_phone.value.lenght>12){
		alert("핸드폰 번호를 11자리로 입력해주세요");
		obj.lw_phone.value="";
		obj.lw_phone.focus();
		return false;
	}
	
}
//패스워드 중복 text
function ph_m_alert(){
	  var obj = document.vcheck1;
		
	  if(obj.lw_phone.value.length > 12){
	    document.getElementById("alert").innerHTML=('<span style="color:red;">11자리가 넘어갔습니다.</span>');
	    return;
	  }else{
	    document.getElementById("alert").innerHTML=('<span></span>');
	    return false;
	  }
	}
function pw_m_alert_f(){ //find
	  var obj = document.vcheck1;
		
	  if(obj.lw_passwd2.value != obj.lw_passwd3.value || obj.lw_passwd3==''){
	    document.getElementById("alert_pw_f").innerHTML=('<span style="color:red;font-size:12px;">비밀번호가 일치하지 않습니다..</span>');
	    return;
	  }else{
		  document.getElementById("alert_pw_f").innerHTML=('<span style="color:blue; font-size:12px;">비밀번호가 일치합니다..</span>');
	  }
	}

function pw_m_alert_m(){ //mypage
	  var obj = document.vcheck1;
		
	  if(obj.lw_passwd3.value != obj.lw_passwd4.value || obj.lw_passwd4==''){
	    document.getElementById("alert_pw_m").innerHTML=('<span style="color:red;font-size:12px;">비밀번호가 일치하지 않습니다..</span>');
	    return;
	  }else{
		  document.getElementById("alert_pw_m").innerHTML=('<span style="color:blue; font-size:12px;">비밀번호가 일치합니다..</span>');
	  }
	}
	function pw_m_alert_s(){
	  var obj = document.vcheck;
		
	  if(obj.lw_passwd.value != obj.lw_passwd2.value || obj.lw_passwd2==''){
	    document.getElementById("alert_pw_s").innerHTML=('<span style="color:red;font-size:12px;">비밀번호가 일치하지 않습니다..</span>');
	    return;
	  }else{
		  document.getElementById("alert_pw_s").innerHTML=('<span style="color:blue; font-size:12px;">비밀번호가 일치합니다..</span>');
	  }
	}
	function pw_m_alert_d(){    //delete passwd match
      var obj = document.vcheck1;
      if(obj.lw_passwd1.value != obj.lw_passwd2.value || obj.lw_passwd2==''){
        document.getElementById("alert_pw_d").innerHTML=('<span style="color:red;font-size:12px;">비밀번호가 일치하지 않습니다..</span>');
        return;
      }else{
          document.getElementById("alert_pw_d").innerHTML=('<span style="color:blue; font-size:12px;">비밀번호가 일치합니다..</span>');
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


	function sendIt_s() {
    	   if (document.a.passwd.value != document.a.passwd2.value) {  //비밀번호 불일치시 나오는 경고문
    	   	alert("비밀번호가 일치하지 않습니다")
    	   	document.a.lw_passwd.value = ""
    	   	document.a.lw_passwd2.value = ""
    	   	document.a.lw_passwd2.focus();
    	   	return false;
    	   }
    	}
			
<!-- PW 입력 안했을경우나 비밀번호 확인이 틀릴경우 -->

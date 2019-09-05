// 인라인 스크립트 유효성 검사

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
	    document.getElementById("alert_pw_s").innerHTML=('<span style="color:red;font-size:12px;float:left;">비밀번호가 일치하지 않습니다..</span><Br>');
	    return;
	  }else{
		  document.getElementById("alert_pw_s").innerHTML=('<span style="color:blue; font-size:12px;float:left;">비밀번호가 일치합니다..</span><Br>');
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


// submit 스크립트 유효성 검사
	
	function id_pw_name_phone(){
		 var obj = document.vcheck1;
		 
		if(obj.lw_name.value ==""||obj.lw_phone.value==""){
			alert("입력 안된 사항이 있습니다1111.");
			obj.lw_name.focus();
			return false;
			
		}else{ 
	return true;	
	}
}	
	function id_pw_id_e_mail(){
		 var obj = document.vcheck;
		 
		if(obj.lw_id.value ==""||obj.lw_e_mail1.value ==""||obj.lw_e_mail2.value==""){
			alert("입력 안된 사항이 있습니다1111.");
			obj.lw_id.focus();
			return false;
			
		}else{ 
	return true;	
	}
}
	
	function pw_action_pw(){
		 var obj = document.vcheck1;
		 if(obj.lw_passwd3.value==""||obj.lw_passwd2.value==""){
			alert("공백이 있습니다.");
			obj.lw_passwd2.focus();
			return false;
			
		}else if(obj.lw_passwd2.value != obj.lw_passwd3.value){
			alert("일치하지 않습니다.");
	return false;	
	}else{
		return true;
	}
}
	
	function user_info_pw_e_mail() {
		var obj = document.vcheck1;
		if(obj.lw_passwd1.value!=obj.lw_passwd2.value){
			alert("기존 비밀번호가 일치하지 않습니다.");
			obj.lw_passwd2.focus();
			return false;
		}else if(obj.lw_passwd2.value==""||obj.lw_passwd3.value==""||obj.lw_passwd4.value==""){
			alert("비밀번호 칸에 공백이 있습니다.");
			obj.lw_passwd3.focus();
			return false;
		}else if(obj.lw_passwd3.value!=obj.lw_passwd4.value){
			alert("신규 비밀번호가 맞지 않습니다.");
			obj.lw_passwd3.focus();
			obj.lw_passwd3.value="";
			obj.lw_passwd4.value="";
			return false;
		}else{
			return true;
		}
	}
		


<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	<title>로그인</title>
</head>
<!-- stlye css -->
<style>

</style>

<body>
	<div>
		<div >
				<a href="login(old).jsp"></a>
		</div>
		<div >
			<form action="loginAction.jsp" method="post" name="vcheck">  
				<h4>아이디</h4>
				<input  type="text" name="lw_id" placeholder="아이디">
				<h4 >비밀번호</h4>
				<input type="password" name="lw_passwd" placeholder="비밀번호">				
				<input type="text" name="lw_lp" value="0" style="display:none"> 
				<a href="./find_id_pw.jsp">아이디  비밀번호찾기</a>                     
				<div>
					<button type="submit">로그인</button>
				</div>
			</form>
			<div> 
			</div>
		</div>	
	</div>
</body>
</html>

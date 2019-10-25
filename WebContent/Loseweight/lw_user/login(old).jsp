<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	<title>로그인</title>
</head>
<!-- stlye css -->
<style type="text/css">
	.container{
		position: relative;
		overflow: hidden;
		width: 700px;
		height: 500px;
		margin:0 auto;
		margin-top:5%;
		background-color: #ffffff;
		-moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
		-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
		box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
	}
	.logo{
		width: 180px;
		height: 77px;
		margin-left: 80px;
		margin-top: 20px;
	}
	.login{
		float: left;
		width: 50%;
		height: 100%;
		margin-top: 50px;
	}
	.submit{
		margin-top: 40px;
		margin-left: 80px;
	    width: 200px;
	    height: 50px;
	    font-size: 20px;
	    cursor: pointer;
	    color: #fff;
		background: #ccc;
	}
	.login a{

	}
	.find{
		margin-top: 5px;
		font-size: 12px;
	}
	.find a{
		display: inline-block;
		text-decoration: none;
		color: #888;
		float: right;
		margin-top: 20px;
		margin-right: 30px;
	}

	/**버튼 호버 기능**/
	button{
		background:#1AAB8A;
		color:#fff;
		border:none;
		position:relative;
		height:60px;
		font-size:1.6em;
		padding:0 2em;
		cursor:pointer;
		transition:800ms ease all;
		outline:none;
	}
	button:hover{
		background:#fff;
		color:#ff7f00;
	}
	button:before,button:after{
		content:'';
		position:absolute;
		top:0;
		right:0;
		height:2px;
		width:0;
		background: #ff7f00;
		transition:400ms ease all;
	}
	button:after{
		right:inherit;
		top:inherit;
		left:0;
		bottom:0;
	}
	button:hover:before,button:hover:after{
		width:100%;
		transition:800ms ease all;
	}
	/**버튼 호버기능 끝**/
	.put input{
		margin-top: 40px;
		border: none;
		border-bottom: solid #ccc 1px;
		margin-left: 80px;
		width: 200px;
		box-shadow: 0px 1px 5px #aaaaaa;
    	height: 36px;
    	
    	font-size:14px;
	}
	
	.put input:focus {
		outline:none;
	}
	.half .png{
		width: 50%;
    	height: 500px;
    	box-shadow: 0px 0px 20px -5px rgba(0, 0, 0, 0.8);
	}
	</style>
 <link rel="stylesheet" href="../css/style.css">
<body>

	<div class="container">
		<div >
			<a href="login(old).jsp"></a>
		</div>
		<div class="login">
			<a href="#">
				<img class="logo" src="logo.png">
			</a>
			<form class="put" action="loginAction.jsp" method="post" name="vcheck">  
				<input  type="text" name="lw_id" placeholder="아이디"><br>
				<input type="password" name="lw_passwd" placeholder="비밀번호">				
				<input type="text" name="lw_lp" value="0" style="display:none">

				<div>
					<button class="submit" type="submit">로그인</button>
				</div>

				<div class="find">
					<a href="./find_id_pw.jsp">아이디 / 비밀번호찾기</a>                     
				</div>
			</form>
		</div>

		<div class="half">
			<img class="png" src="2.jpg">
		</div>

	</div>

</body>
</html>

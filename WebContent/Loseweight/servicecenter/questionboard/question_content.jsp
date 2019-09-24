<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.UserDAO"%>

<%@ page import="java.io.File" %>
<%@ page import = "questionboard.questionDAO" %>
<%@ page import = "questionboard.questionDTO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>

<%
	request.setCharacterEncoding("utf-8");
%>
     <%
     	String imgs =request.getParameter("abc"); //경로 
               	String name =request.getParameter("abd"); //파일이름
               
          		String directory = application.getRealPath("/img/");
          		String files[] = new File(directory).list();
     %>
<%!//댓글기능 date에도 사용 
    int pageSize = 10;
    SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
    <%
    	// 세션정보 가져오기
            try {
            String id = (String) session.getAttribute("id");
            String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
        	String dbId="lw_admin";
        	String dbPass="3whakstp";
        	
            UserDAO db= new UserDAO();
            Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
         
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String sql = "SELECT * FROM lw_users WHERE lw_id = ?";
         
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
    %>

<%
	//content load
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");

	int pageSize = 10;
	int currentPage = Integer.parseInt(pageNum);
   int startRow = (currentPage-1) * pageSize  ;
   int endRow = currentPage * pageSize;
   int count = 0;
   int number = 0;
 
   SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");

   try{
      questionDAO dbPro = questionDAO.getInstance(); 
      questionDTO article =  dbPro.getArticle(num);
      count = dbPro.getArticleCount(); 
	  int ref=article.getRef();
	  int re_step=article.getRe_step();
	  int re_level=article.getRe_level();
	  
		//조회수 중복 체크 부분
		Cookie[] cookieFromRequest= request.getCookies();
		String cookieValue = null;
		for(int i = 0; i<cookieFromRequest.length;i++){
	cookieValue = cookieFromRequest[0].getValue();
		}
	 	// 쿠키 세션 입력
		if (session.getAttribute(num+":cookie") == null) {
		 	session.setAttribute(num+":cookie", num + ":" + cookieValue);
		} else {
	session.setAttribute(num+":cookie ex", session.getAttribute(num+":cookie"));
	if (!session.getAttribute(num+":cookie").equals(num + ":" + cookieValue)) {
	 	session.setAttribute(num+":cookie", num + ":" + cookieValue);
	}
		}
	 	
		article.setNum(num);
		article = dbPro.getArticle(num);

	 	// 조회수 카운트
	 	if (!session.getAttribute(num+":cookie").equals(session.getAttribute(num+":cookie ex"))) {
	 		dbPro.updateBoardreadcount(num);	
		 	article.setReadcount(article.getReadcount() + 1);
	 	}
%>
<%
	//reply search
	jekimDB usedb = new jekimDB();
	usedb.connect();
	Statement stmt=null;
	Connection con=null;
	con=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	stmt=con.createStatement();
	
	String replylistsql1="select count(*) from questionboardre where num="+article.getNum()+"";
	ResultSet rs2 = stmt.executeQuery(replylistsql1);
	String replylistsql2="select * from questionboardre where num="+article.getNum()+"";
	ResultSet replylist = usedb.resultQuery(replylistsql2);
	
	
    number = count-(currentPage-1)*pageSize;
	if(rs2.next()){ rs2.getInt(1); } rs2.close();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--slide-->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<!--slide end-->
</head>

<script type="text/javascript">

//form 두개 사용 
$(function() {
	$(".replyedit").on("click", function() {
		$(this).parent().prev().children(".replyeditleft1").css({"display": "none","position":"absolute"});
		$(this).parent().prev().children(".replyeditleft2").css({"display": "block"});
		$(this).parent().prev().children(".replyeditleft2").attr('name','recontent2');
		$(this).parent().prev().children(".replyedit_submit").css({"display": "block"});
		$(this).parent().prev().children(".glenumname").attr('name','glenumpost');
		$(this).css({"display":"none"});
		$(this).next(".replydelete").css({"display":"none"});
		$(this).next().next(".replycancel").css({"display":"block"});
	});
	$(".replycancel").on("click", function() {
		$(this).parent().prev().children(".replyeditleft1").css({"display": "block","position":"relative"});
		$(this).parent().prev().children(".replyeditleft2").css({"display": "none"});
		$(this).parent().prev().children(".replyeditleft2").attr('name','');
		$(this).parent().prev().children(".replyedit_submit").css({"display": "none"});
		$(this).parent().prev().children(".glenumname").attr('name','');
		$(this).prev().prev(".replyedit").css({"display":"inline"});
		$(this).prev(".replydelete").css({"display":"inline"});
		$(this).css({"display":"none"});
	});
	$(".replydelete").on("click", function() {
		$(this).parent().prev().children(".glenumname").attr('name','glenumpost');
	});
	
});
function  sendProcess(f){
	f.action="question_replyedelete.jsp";
    f.submit();       
}
</script>
<!-- stlye css -->
<link rel="stylesheet" href="../../css/style.css">
<style>
tr.tableline td{
	border-bottom:1px solid #ddd;
}
.board_dir:link {text-decoration:none; color:#000;}
.board_dir:visited {text-decoration:none; color:#000;}
.board_dir:active {text-decoration:none; color:#000;}
.board_dir:hover {text-decoration:none; color:#000;}
</style>
<body>

	<div class="div_body">
		<jsp:include page="../../community/community_topinclude.jsp" >
			<jsp:param name="tom" value="4"/>
			<jsp:param name="toc" value="1"/>
			<jsp:param name="imgs" value="gogec_1.png"/>
		</jsp:include>
		<div style='width: 100%;'>
			
			<div class="div_sidecontents" >
				<div class="mypage_form">
				<div style="margin:0 auto;margin-top:5%;width:1000px">			
								<a href='list.jsp' class="board_dir"style="font-weight:bold;text-decoration:none"></a>
				</div>
					<table style="margin:0 auto;width:1000px;border-top:50px">  
					 <tr class="tableline" ><td style="border-color: #000;"colspan="5"></td></tr>
					<tr height="30">
					    <td align="left"  align="center" colspan="3">
						    <a style="font-size: 20px;font-weight: bold;"> <%=article.getSubject()%></a></td>
						    
					  </tr>
					  <tr height="30">
					    <td align="left"style="width:1;"><%=article.getWriter()%></td>
						<td style="width:1px;text-align:center;">|</td>
					    <td align="left"><%= sdf.format(article.getReg_date())%></td>
					    <td align="center" style="width:35px;">조회</td>
					    <td align="center" align="center"style="width:35px;">
						     <%=article.getReadcount()%></td>
					  </tr>
					  <tr class="tableline"><td colspan="5"></td></tr>
					  <tr>
					    <td align="left" colspan="3">
					           <pre style="height:auto;min-height: 500px; word-break: break-all; white-space: pre-wrap;"><%=article.getContent()%></pre></td>
					           
					  </tr> <% if(article.getFilename0()!=null){%>
					  <tr class="tableline">
						  <td colspan="5">
						  <div id="upload" style="border:solid 1px;min-height: 100px;">
						  <% if(article.getFilename0()!=null){%>
							   <a href="<%=article.getFilepath0()%>" style="border:none" type="text/html"target="_blank"download><%=article.getFilename0()%></a><br>
							      <% if(article.getFilename1()!=null){%>
							  		 <a href="<%=article.getFilepath1()%>" style="border:none" type="text/html"download><%=article.getFilename1()%></a><br>
							  	 
							<%}
						  }
						  }%>
						 </div>
						  </td>
					  </tr>
					  <tr height="30">      
					    <td colspan="4" align="right" > 
						  <input type="button" value="글수정" class="newbutton"
					       onclick="document.location.href='question_updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
						   &nbsp;&nbsp;
						  <input type="button" value="글삭제" class="newbutton"
 					       onclick="document.location.href='question_deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
						   &nbsp;&nbsp;
					      <input type="button" value="답글쓰기" class="newbutton"
					       onclick="document.location.href='question_writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
						   &nbsp;&nbsp;
					       <input type="button" value="글목록" class="newbutton"
					       onclick="document.location.href='question_list.jsp?pageNum=<%=pageNum%>'">
					    </td>
					  </tr>
					</table>    
				</div>
			</div>
		</div>
	<div style="margin-top:30px;">
		<form action = "question_reply.jsp" method="post" name="replyform">
		<div style="display:none">
			<input name="lw_id" value="<%=id%>">
			<input name="num" value="<%=article.getNum()%>">
		</div>
			<textarea name="recontent" id="recontent" cols="100" rows="3" ></textarea>
			<input type="submit" style="margin-top: -50;height: 59;"class="newbutton" value="댓글 등록">
		</form>
		</div>
	</div>
	<div style="padding-bottom:60px;">
		<form method="post" action="question_replyedit.jsp" onsubmit="return writeSave()">
			<table class="lw_board" style="margin:0 auto;width:1000px"> 
			    <tr height="40"> 
			      <td align="center"  width="100"  ></td> 
			      <td align="center"  width="700" ></td> 
			      <td align="center"  width="250" ></td>
			    </tr>
			
	<%if(replylist.next()){
		do{
		String num2=replylist.getString("num");
		String glenum2=replylist.getString("glenum");
		String lw_id=replylist.getString("lw_id");
		String recontent=replylist.getString("recontent");
		Timestamp reg_date=replylist.getTimestamp("reg_date");
		%>
		
		 <tr height="50" style="border-top: 1pt solid gray">
			    <td  width="50" > <input style="border:none" name="lw_id" value="<%=lw_id%>"readonly></td>
			    <td  width="250" align="left">
			    <input type="text" class="replyeditleft1"style="border: none;display:block;"name="recontent" id="reply<%=glenum2%>_1" value="<%=recontent%>"readonly>
			    
			     <input type="text" class="replyeditleft2" style="display:none;float:left;" id="reply<%=glenum2%>_2" value="<%=recontent%>">
			    <button class="replyedit_submit" style="display:none" onclick="replyedit()">등록</button>
			     <input type="hidden"class="glenumname" value="<%=glenum2%>">
				</td>
				
				<td id="replybtn<%=num2%>_1"><%if (id!=null){
						if(id.toString().equals(lw_id)){%>
						<input type="button" class="replyedit"value="수정">
						<input type="submit" class="replydelete" onClick="sendProcess(this.form); writeSave();"value="삭제">
						<input type="button" class="replycancel" value="수정취소"style="display:none;">
						<%
						}}%></td>
			    <td width="150"><%= sdf.format(reg_date)%></td>
			  </tr>
			  <tr class="tableline"><td colspan="6"></td></tr>
			  
		<%}while(replylist.next());
		}else{%>
		 <tr class="tableline">
			  <td colspan="6">
			  <h4 style="padding: 200;">댓글이 없습니다</h4>
			  </td></tr>
			  
		<%}%>	
	</table>
	
	</form>
	<script>
	function replyedit(){
	var recontent2 = document.getElementsByName("recontent2");
	var glenumpost = document.getElementsByName("glenumpost").value();
	

	var form = document.createElement("form");
        form.setAttribute("charset", "utf-8");
        form.setAttribute("method", "get"); // Get 또는 Post 입력
        form.setAttribute("action", "question_replyedit.jsp");
        
        hiddenField = document.createElement("input");
    	hiddenField.setAttribute("type", "hidden");
    	hiddenField.setAttribute("name", "recontent2");
    	hiddenField.setAttribute("value", recontent2);
    	form.appendChild(hiddenField);
    	
    	hiddenField = document.createElement("input");
    	hiddenField.setAttribute("type", "hidden");
    	hiddenField.setAttribute("name", "glenumpost");
    	hiddenField.setAttribute("value", glenumpost);
    	form.appendChild(hiddenField);
    	
    	document.body.appendChild(form); 
    	form.submit();
	}
    	</script>
	</div>
	<% 
	}catch(Exception e){} 
					 %>
	 <%
		  }catch(Exception e){}
				%>    
						
</body>
</html>
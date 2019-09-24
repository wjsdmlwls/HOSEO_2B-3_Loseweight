<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,user.UserDAO"%>
<%@ page import="java.io.File" %>
<%@ page import = "board.board_DAO" %>
<%@ page import = "board.board_DTO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("utf-8");
%>
     <%
     	String imgs =request.getParameter("abc"); //경로 
               	String name =request.getParameter("abd"); //파일이름
               
          		String directory = application.getRealPath("/img/");
          		String files[] = new File(directory).list();
     %>

    <%
    	// 세션정보 가져오기
            try {
            String id = (String) session.getAttribute("id");
            
            String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
        	String dbId="jspid";
        	String dbPass="jsppass";
        	
            UserDAO db= new UserDAO();
            Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
         
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String sql = "SELECT * FROM lw_users WHERE lw_id = ?";
         
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
    %>

<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
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
<%
	int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");

   SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");

   try{
      board_DAO dbPro = board_DAO.getInstance(); 
      board_DTO article =  dbPro.getArticle(num);
  
	  int ref=article.getRef();
	  int re_step=article.getRe_step();
	  int re_level=article.getRe_level();
%>
	<div class="div_body">
		<jsp:include page="../community_topinclude.jsp" >
			<jsp:param name="tom" value="3"/>
			<jsp:param name="toc" value="0"/>
		</jsp:include>
		
		<div style='width: 100%;'>
			
			<div class="div_sidecontents" >
				<div class="mypage_form">
				<div style="margin:0 auto;margin-top:50px;width:1000px">			
								<a href='list.jsp' class="board_dir"style="font-weight:bold;text-decoration:none"><h2>회원후기</h2></a>
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
					           <pre style="height:auto;min-height: 500px;"><%=article.getContent()%></pre></td>
					           
					  </tr> <% if(article.getFilename0()!=null){%>
					  <tr class="tableline">
						  <td colspan="5">
						  <div id="upload" style="border:solid 1px;min-height: 100px;">
						  <% if(article.getFilename0()!=null){%>
							   <a href="<%=article.getFilepath0()%>" style="border:none" type="text/html"target="_blank"download><%=article.getFilename0()%></a><br>
							     <% if(article.getFilename1()!=null){%>
							  		 <a href="<%=article.getFilepath1()%>" style="border:none" type="text/html"download><%=article.getFilename1()%></a><br>
							  		 
							   <%}}
							     }else{%>
							   <%} %>
						 </div>
						  </td>
					  </tr>
					  <tr height="30">      
					    <td colspan="4" align="right" > 
						  <input type="button" value="글수정" class="newbutton"
					       onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
						   &nbsp;&nbsp;
						  <input type="button" value="글삭제" class="newbutton"
 					       onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
						   &nbsp;&nbsp;
					      <input type="button" value="답글쓰기" class="newbutton"
					       onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
						   &nbsp;&nbsp;
					       <input type="button" value="글목록" class="newbutton"
					       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
					    </td>
					  </tr>
					</table>    
					
					<%
					 }catch(Exception e){} 
					 %>
											 <%
						  }catch(Exception e){}
						%>    
											
					
						
				</div>
			</div>
		</div>
	</div>

</body>
</html>
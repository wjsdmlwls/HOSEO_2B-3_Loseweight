<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import = "Noticeboard.NoticeDAO" %>
<%@ page import = "Noticeboard.NoticeDTO" %>
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
    
<%!int pageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");%>

<%
	request.setCharacterEncoding("UTF-8");
	String listsearch = ""; 
    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage-1) * pageSize  ;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
    List<NoticeDTO> articleList = null; 
    
    listsearch = request.getParameter("listsearch");
	if(listsearch==null){
		listsearch ="";
	}
    NoticeDAO dbPro = NoticeDAO.getInstance();
    count = dbPro.getArticleCount(); 

	String searchcol=request.getParameter("searchcol"); //검색 조건 
	if(searchcol==""||searchcol==null){
		searchcol ="subject";
	}
%>
<%
	jekimDB usedb = new jekimDB();
	usedb.connect();
	Statement stmt=null;
	Connection con=null;
	String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
	String dbId="lw_admin";
	String dbPass="3whakstp";
	con=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	stmt=con.createStatement();
	String listsql1="select count(*) from noticeboard where "+searchcol+"  like '%"+listsearch+"%'";
	ResultSet rs = stmt.executeQuery(listsql1);
	String listsql2="select * from noticeboard where "+searchcol+"  like '%"+listsearch+"%' order by ref desc, re_step asc limit "+startRow+","+pageSize+"";
	ResultSet listsearchresult = usedb.resultQuery(listsql2);
	number = count-(currentPage-1)*pageSize;
if(rs.next()){ count = rs.getInt(1); } rs.close();
%>	
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>



<link href="../../css/style.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<style>
tr.headtableline td{
	border-bottom:1px solid #000;
}
tr.tableline td{
	border-bottom:1px solid #ddd;
}
.pageselect {
margin:15;
margin-left:70px;
}
.pageselect a{
color:000;
font-size:18px;
}
</style>

<title>게시판</title>
</head>

<body>
<%
	String id= null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}else{
		id="";
	}	
	
	//로그인이 성공하면 아이디값으로 세션에 접속을함.
%>
<div class="div_body" >
		<jsp:include page="../../community/community_topinclude.jsp" >
			<jsp:param name="tom" value="4"/>
			<jsp:param name="toc" value="0"/>
			<jsp:param name="imgs" value="gogec_1.png"/>
		</jsp:include>
		<div style='margin: 0 auto; width: 1120px;margin-top: 5%;'>
		
			<table class="lw_board"> 
			    <tr height="40"> 
			      <td align="center"  width="50"  >번 호</td> 
			      <td align="center"  width="650" >제   목</td> 
			      <td align="center"  width="150" >작성자</td>
			      <td align="center"  width="150" >작성일</td> 
			      <td align="center"  width="100" >조 회</td> 
			    </tr>
			    <tr class="headtableline"><td colspan="6"></td></tr>
			
	<%
					if(listsearchresult.next()){
								do{
								String num=listsearchresult.getString("num");
								String subject=listsearchresult.getString("subject");
								String writer=listsearchresult.getString("writer");
								String email=listsearchresult.getString("email");
								Timestamp reg_date=listsearchresult.getTimestamp("reg_date");
								int readcount=listsearchresult.getInt("readcount");
								int re_level=listsearchresult.getInt("re_level");
								int members=listsearchresult.getInt("members");
								//댓글
								int replycount=0;
											NoticeDAO dbPro1 = NoticeDAO.getInstance();
											NoticeDTO article =  dbPro.getArticle(Integer.parseInt(num));
										   	String replylistsql1="select count(*) from Noticeboardre where num="+article.getNum()+"";
										   	ResultSet rs2 = stmt.executeQuery(replylistsql1);
										if(rs2.next()){ replycount = rs2.getInt(1); } rs.close();
				%>
		 <tr height="50" style="border-top: 1pt solid gray">
			    <td  width="50" > <%=number--%></td>
			    <td  width="250" align="left">
			<%
				int wid=0; 
				if(re_level>0){
				   wid=5*(re_level);
			%>
				  <img src="images/level.png" width="<%=wid%>" height="16">
				  <img src="images/re.png">
			<%  }else{%>
				  <img src="images/level.png" width="<%=wid%>" height="16">
				  
			<%  }%>
			           
			     <a href="notice_content.jsp?num=<%=num%>&pageNum=<%=currentPage%>" id="boardlink<%=num%>" style="font-size: 20; font-weight: bold;margin-left: 13;">
			           <%=subject%></a><a style="margin-left:10px">[<%=replycount%>]</a><hr style="margin-top:8">
			           <a href="mailto:<%=email%>" style="margin-left: 10;">
				        작성자:<%=writer%>
				       <% if(members>=1){%>
				         <img src="images/pig.png" border="0"  height="16"><%}%>
				        </a>
				        <a style="margin-left: 10;">작성일:<%= sdf.format(reg_date)%></a>
				        <a style="margin-left: 10;">조회수:<%=readcount%></a>
				
			          
				
			<% if(readcount>=20){%>
			         <img src="images/hot.png" border="0"  height="16"><%}%> </td>
			  </tr>
			  <tr class="tableline"><td colspan="6"></td></tr>
		<%
			}while(listsearchresult.next());
		%>
	<%
	}else{
			%>
			  
			  <tr class="tableline">
			  <td colspan="6">
			  <h4 style="padding: 200;"><%=listsearch %>에 대한 검색 결과가 없습니다</h4>
			  </td></tr>
			
			<%}%>
	</table>
	<div class="pageselect">
	<%
	    if (count > 0) {
	        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage =1;
			
			if(currentPage % 10 != 0)
	           startPage = (int)(currentPage/10)*10 + 1;
			else
	           startPage = ((int)(currentPage/10)-1)*10 + 1;
	
			int pageBlock = 10;
	        int endPage = startPage + pageBlock - 1;
	        if (endPage > pageCount) endPage = pageCount;
	        
	        if (startPage > 10) { %>
	          <a href="notice_list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
	<%      }
	        
	        for (int i = startPage ; i <= endPage ; i++) {  %>
	        	<%if(i == Integer.parseInt(pageNum)){%>
	           <a href="notice_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="num<%=i %>"style="font-weight: bold;">[<%= i %>]</a>
		          <% }
		           else{%>
	           <a href="notice_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="num<%=i %>">[<%= i %>]</a>
	<%      }}
	        	
	        
	        
	        if (endPage < pageCount) {  %>
	        <a href="notice_list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
	<%	
	        }
	        
	    }
	%><%if(id.toString().equals("admin")){%><a href="notice_writeForm.jsp"><input style="text-align: center;margin-top: -5px;float:right;"class="newbutton"value="글쓰기"></a></div>
	<%}else{
		%>
	<% }%>
		<form method="post" action="notice_list.jsp">
		<div style="margin:0 auto;margin-top:10px;">
		<SELECT style="height: 42px;width: 95;"name='searchcol'> <!-- 검색 컬럼 -->
	        <OPTION value='subject'>제목</OPTION>
	        <OPTION value='writer'>작성자</OPTION>
	        <OPTION value='content'>내용</OPTION>
	    </SELECT>
		<input style="width: 250;height:42px"name="listsearch" type="text">
		<input style="font-size: 12px;  line-height: 40px; width: 100px; cursor: pointer; letter-spacing: 2px; text-transform: uppercase; color: #263238; border: 1px solid #263238; background: transparent;" type="submit"  value="검색"><Br>
</div>
	</form>
	</div>

</div>
					
</body>
</html>
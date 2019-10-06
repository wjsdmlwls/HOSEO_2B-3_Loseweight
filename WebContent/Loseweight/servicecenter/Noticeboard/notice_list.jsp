<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import = "Noticeboard.NoticeDAO" %>
<%@ page import = "Noticeboard.NoticeDTO" %>
<%@ page import = "java.sql.*"%>
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
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<link href="notice_list_css.css" rel="stylesheet" type="text/css">
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
<jsp:include page="../../community/community_topinclude.jsp" >
		<jsp:param name="tom" value="4"/>
		<jsp:param name="toc" value="0"/>
		<jsp:param name="imgs" value="Service_center.png"/>
			<jsp:param name="boardname" value="공지사항"/>
</jsp:include>
	
			<div style='margin: 0 auto; width: 100%; margin-top: 5%;'>
			<table class="notice_table"> 
			    <tr class="tr1"> 	
			      <td align="center" width="100">번호</td> 
			      <td align="center" width="650">제목</td> 
			      <td align="center" width="150">작성자</td>
			      <td align="center" width="150">작성일</td> 
			      <td align="center" width="100">조 회</td>		   
			    </tr>

			
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
		 <tr class="list_tr">
			<td width="100px;" ><center><%=number--%></center></td>
			 
		
			<%
				int wid=0; 
				if(re_level>0){
				   wid=10*(re_level);
			%>   
			 <td class="td_subject" width="630px;"><img src="images/re.png" style="margin-left:<%=wid%>px;"><a class="a_subject" href="notice_content.jsp?num=<%=num%>&pageNum=<%=currentPage%>" id="boardlink<%=num%> ">
			           <%=subject%><a style="margin-left:5px;">[<%=replycount%>]</a></a></td>
		   
			<%}else{%>	
			<td class="td_subject" width="630px;"><a class="a_subject" href="notice_content.jsp?num=<%=num%>&pageNum=<%=currentPage%>" id="boardlink<%=num%> ">
			           <%=subject%> <% if(readcount>=20){%><img src="images/hot.png" height="16"><%}%> <a style="margin-left:5px;">[<%=replycount%>]</a></a></td>
			<% }%>		
				   
			           <td width="150" class="td_id">
			           <a class="a_email" href="mailto:<%=email%>"><center><%=writer%></center></a>
				        </td>
				       <td width="150"><center><%= sdf.format(reg_date)%></center></td>
				       <td width="100"><center><%=readcount%></center></td>
			  </tr>

	<%}while(listsearchresult.next());%>
	<%}else{%>

			  <h4 style="padding: 200;"><%=listsearch %>에 대한 검색 결과가 없습니다</h4></td></tr>
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
	          <a href="notice_list.jsp?pageNum=<%= startPage - 10 %>"><img class="page_next_pre_img" src="images/btn_pre.gif"></a>
			<%}
	        
	        for (int i = startPage ; i <= endPage ; i++) {  %>
	        	<%if(i == Integer.parseInt(pageNum)){%>
	        
	           <a href="notice_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="num<%=i %>">
	             <div class="pageselect_num"><%= i %></div><a href="notice_list.jsp?pageNum=<%= startPage + 10 %>"></a></a></center>
		          <%}else{%>
	           <a href="notice_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="num<%=i %>"> <div class="pageselect_num"><%= i %></div></a>
	<%}}if(endPage < pageCount){%>
	        <a href="notice_list.jsp?pageNum=<%= startPage + 10 %>"><img class="page_next_pre_img" src="images/btn_next.gif"></a>
	<%	
	        }       
	    }
	%>
	</div>
	</div>
		<form method="post" action="notice_list.jsp">		
		<div style="margin:0 auto;margin-top:10px;width: 1200px;text-align:center;">
		<select class="search_list" name="searchcol"> <!-- 검색 컬럼 -->
	        <option value="subject">제목</option>
	        <option value="writer">작성자</option>
	        <option value="content">내용</option>
	    </select>
		<input class="search_input" name="listsearch" type="text">
		<input type="image" src="images/search.gif">
		<a href="notice_writeForm.jsp" style="float: right;">
		<input class="write_btn" value="글쓰기"></a></div>
		</form>

<jsp:include page="../../community/community_footerinclude.jsp" ></jsp:include>				
</body>
</html>
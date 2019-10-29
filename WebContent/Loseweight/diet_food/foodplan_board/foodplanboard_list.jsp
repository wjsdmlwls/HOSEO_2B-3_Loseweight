<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import = "foodplanboard.foodplanDAO" %>
<%@ page import = "foodplanboard.foodplanDTO" %>
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
    List<foodplanDTO> articleList = null; 
    
    listsearch = request.getParameter("listsearch");
	if(listsearch==null){
		listsearch ="";
	}
    foodplanDAO dbPro = foodplanDAO.getInstance();
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
String listsql1="select count(*) from foodplan_board where "+searchcol+"  like '%"+listsearch+"%'";
ResultSet rs = stmt.executeQuery(listsql1);
String listsql2="select * from foodplan_board where "+searchcol+"  like '%"+listsearch+"%' order by ref desc, re_step asc limit "+startRow+","+pageSize+"";
ResultSet listsearchresult = usedb.resultQuery(listsql2);
number = count-(currentPage-1)*pageSize;
if(rs.next()){ count = rs.getInt(1); } rs.close();
%>	
<html>
<head>
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
			<jsp:param name="tom" value="2"/>
			<jsp:param name="toc" value="0"/>
			<jsp:param name="imgs" value="food.png"/>
			<jsp:param name="boardname" value="식단TIP"/>
</jsp:include>
		
			<div style='margin: 0 auto; width: 100%; margin-top: 5%;'>
			<table class="notice_table"> 
			    <tr class="tr1"> 	
			     <td><h4>다이어트(식단)</h4></td>
			     <td></td>
			    </tr>

			
	<%
					if(listsearchresult.next()){
								do{
								String num=listsearchresult.getString("num");
								String subject=listsearchresult.getString("subject");
								String writer=listsearchresult.getString("writer");
								String email=listsearchresult.getString("email");
								String content=listsearchresult.getString("content");
								String img0=listsearchresult.getString("img0");
								Timestamp reg_date=listsearchresult.getTimestamp("reg_date");
								int readcount=listsearchresult.getInt("readcount");
								int re_level=listsearchresult.getInt("re_level");
								int members=listsearchresult.getInt("members");
								//댓글
								int replycount=0;
								foodplanDAO dbPro1 = foodplanDAO.getInstance();
											foodplanDTO article =  dbPro.getArticle(Integer.parseInt(num));
										   	String replylistsql1="select count(*) from foodplan_boardre where num="+article.getNum()+"";
										   	ResultSet rs2 = stmt.executeQuery(replylistsql1);
										if(rs2.next()){ replycount = rs2.getInt(1); } rs.close();
										content=content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
				%>
		 <tr class="list_tr">
			<td width="250" rowspan="2" style="border-bottom: 1px solid #d4d4d4;"><center><img style="width:220px;height:120px;"src="<%=img0%>"/></center></td>
			 
		
			<%
				int wid=0; 
				if(re_level>0){
				   wid=10*(re_level);
			%>   
			 <td class="td_subject" width="900"><img src="images/re.png" style="margin-left:<%=wid%>px;"><a class="a_subject" href="foodplanboard_content.jsp?num=<%=num%>&pageNum=<%=currentPage%>" id="boardlink<%=num%> ">
			           <%=subject%><a style="margin-left:5px;"></a></a></td>
		   
			<%}else{%>	
			<td class="td_subject" width="900"><a class="a_subject" href="foodplanboard_content.jsp?num=<%=num%>&pageNum=<%=currentPage%>" id="boardlink<%=num%> ">
			           <%=subject%><a style="margin-left:5px;"></a></a></td>
			<% }%>		
			
			  </tr>
			  <tr style="border-bottom: 1px solid #d4d4d4;"><td style="max-width: 900;max-height: 50;">
			  <pre class="content_preview">
			  <%=content %>
			  </pre>
			  <pre class="foodplanboard_status" style="float:left"><img src="/2019_JeonJSP/Loseweight/img/board/ico_eye.gif"><%=readcount%></pre>
			  <pre class="foodplanboard_status" style="padding-left: 10;"><img src="/2019_JeonJSP/Loseweight/img/board/ico_balloon.gif"><%=replycount%></pre></td></tr>

	<%}while(listsearchresult.next());%>
	<%}else{%>

			<Tr><td colspan=15><h4 style="padding: 300;"><%=listsearch %>게시글이 없습니다 첫 게시글을 작성해주세요^^</h4></td></Tr>
			<%}%>
	</table>
	<%if(id==null||id==""){%>
	<%}else{%>
	<div style="width: 1200px;margin: 10px auto;height: 50px;">
		<a href="foodplanboard_writeForm.jsp" style="float: right;">
		<input class="write_btn" value="글쓰기"></a></div>
	<%} %>
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
	          <a href="foodplanboard_list.jsp?pageNum=<%= startPage - 10 %>"><img class="page_next_pre_img" src="images/btn_pre.gif"></a>
			<%}
	        
	        for (int i = startPage ; i <= endPage ; i++) {  %>
	        	<%if(i == Integer.parseInt(pageNum)){%>
	        
	           <a href="foodplanboard_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="num<%=i %>">
	             <div class="pageselect_num"><%= i %></div><a href="foodplanboard_list.jsp?pageNum=<%= startPage + 10 %>"></a></a></center>
		          <%}else{%>
	           <a href="foodplanboard_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="num<%=i %>"> <div class="pageselect_num"><%= i %></div></a>
	<%}}if(endPage < pageCount){%>
	        <a href="foodplanboard_list.jsp?pageNum=<%= startPage + 10 %>"><img class="page_next_pre_img" src="images/btn_next.gif"></a>
	<%	
	        }       
	    }
	%>
	
		<form method="post" action="foodplanboard_list.jsp">		
			<div style="margin: 0 auto;margin-top: 10px;width: 415px;border: solid 2px #6f4e37;">
				<SELECT class="search_list"name='searchcol'> <!-- 검색 컬럼 -->
			        <OPTION value='subject'>제목</OPTION>
			        <OPTION value='writer'>작성자</OPTION>
			        <OPTION value='content'>내용</OPTION>
			    </SELECT>
				<input class="search_input" name="listsearch" type="text">
				<div style="width: 50px;height: 50px;float: right;">
					<input style="width: 35px;height: 35px;margin-top: 7px;"type="image" type="submit" src="../../img/search/search.png">
				</div>
			</div>	
		</form>
		</div>
		</div>
		
	<jsp:include page="../../community/community_footerinclude.jsp"></jsp:include>	
</body>
</html>
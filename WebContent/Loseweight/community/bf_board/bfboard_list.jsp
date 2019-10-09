<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import = "BFboard.BF_DAO" %>
<%@ page import = "BFboard.BF_DTO" %>
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%!int pageSize = 9;
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
    List<BF_DTO> articleList = null; 
    
    listsearch = request.getParameter("listsearch");
	if(listsearch==null){
		listsearch ="";
	}
    BF_DAO dbPro = BF_DAO.getInstance();
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
	
	String listsql1="select count(*) from bf_board where "+searchcol+"  like '%"+listsearch+"%'";
	ResultSet rs = stmt.executeQuery(listsql1);
	
	String listsql2="select * from bf_board where "+searchcol+"  like '%"+listsearch+"%' order by ref desc, re_step asc limit "+startRow+","+pageSize+"";
	ResultSet listsearchresult = usedb.resultQuery(listsql2);
	number = count-(currentPage-1)*pageSize;
	if(rs.next()){ count = rs.getInt(1); } rs.close();
%>	

<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<link href="bfboard_listcss.css" rel="stylesheet" type="text/css">

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
<jsp:include page="../community_topinclude.jsp" >
			<jsp:param name="tom" value="3"/>
			<jsp:param name="toc" value="1"/>
			<jsp:param name="imgs" value="community.png"/>
			<jsp:param name="boardname" value="BE & AT"/>
</jsp:include>

<div class="search_bar">
	<form method="post" action="bfboard_list.jsp">
		<div style="margin:0 auto; margin-top:10px;">
		<SELECT class="search_list" name='searchcol'> <!-- 검색 컬럼 -->
	        <OPTION value='subject'>제목</OPTION>
	        <OPTION value='writer'>작성자</OPTION>
	        <OPTION value='content'>내용</OPTION>
	    </SELECT>
		<input class="search_input" name="listsearch" type="text">
		<input type="image" type="submit" src="images/search.gif">
		</div>
	</form>
</div>
		<div id="img_border_main">
		<ul class="shop_board_ul">
	
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
								String img0=listsearchresult.getString("img0");
								int replycount=0;
							BF_DAO dbPro1 = BF_DAO.getInstance();
							BF_DTO article =  dbPro.getArticle(Integer.parseInt(num));
								   	String replylistsql1="select count(*) from bf_boardre where num="+article.getNum()+"";
								   	ResultSet rs2 = stmt.executeQuery(replylistsql1);
								if(rs2.next()){ replycount = rs2.getInt(1); } rs.close();
				%>
				
			    <li class="shop_board_li"  OnClick="location.href ='bfboard_content.jsp?num=<%=num%>&pageNum=<%=currentPage%>'">
			    			   
			    <%if (img0!=null){%>
			    <div class="shopboard_img" style="background-image:url('<%=img0%>');"><div class="img_background"></div></div>
			    <%}else{%>
			    
			     <div class="shopboard_img" style="background-image:url('../../img/board/board_null_img.png');"></div>
			    	<%}%>
			   
			      <p class="img_subject" href="bfboard_content.jsp?num=<%=num%>&pageNum=<%=currentPage%>" id="boardlink<%=num%>">
			           <%=subject%></p>
			            <a class="img_writer" href="mailto:<%=email%>">			          
				       <p><%=writer%></a>&nbsp;<%= sdf.format(reg_date)%></p>
			          
				        
				        
				       
				
			<% if(readcount>=20){%>
			         <img src="images/hot.png" border="0"  height="16"><%}%> 
			  </li>
			  
			
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
			
			
			
			
			<%}
	%>
	
			</ul>
			</div>
			
	<div class="bottom_img">
	<%
	    if (count > 0) {
	        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage =1;
			
			if(currentPage % 9 != 0)
	           startPage = (int)(currentPage/9)*9 + 1;
			else
	           startPage = ((int)(currentPage/9)-1)*9 + 1;
	
			int pageBlock = 9; 
	        int endPage = startPage + pageBlock - 1;
	        if (endPage > pageCount) endPage = pageCount;
	        
	        if (startPage > 9) { %>
	          <a href="bfboard_list.jsp?pageNum=<%= startPage - 9 %>"><img class="page_next_pre_img" src="images/btn_pre.gif"></a>
	<%      }
	        
	        for (int i = startPage ; i <= endPage ; i++) {  %>
	        	<%if(i == Integer.parseInt(pageNum)){%>
	           <a href="bfboard_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="num<%=i %>"><div class="pageselect_num"><%= i %></div></a>
		          <% }
		           else{%>
	           <a href="bfboard_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="num<%=i %>"><div class="pageselect_num"><%= i %></div></a>
	<%      }}
	        	
	        
	        
	        if (endPage < pageCount) {  %>
	        <a href="bfboard_list.jsp?pageNum=<%= startPage + 9 %>"><img class="page_next_pre_img" src="images/btn_next.gif"></a>
	<%	
	        }
	        
	    }
	
	%>
	
	<%if(id==null||id==""){%>
	
	
	<%}else{%>
	<a href="bfboard_writeForm.jsp"><input id="bottom_write_button" class="write_btn" value="글쓰기"></a>
	<%} %>

	</div>				
	<jsp:include page="../community_footerinclude.jsp" ></jsp:include>	
</body>
</html>
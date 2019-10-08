<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBBean.jekimDB" %>    
<%@ page import = "Fitnesshop.Fitnesshop_DAO" %>
<%@ page import = "Fitnesshop.Fitnesshop_DTO" %>
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
    List<Fitnesshop_DTO> articleList = null; 
    
    listsearch = request.getParameter("listsearch");
	if(listsearch==null){
		listsearch ="";
	}
	Fitnesshop_DAO dbPro = Fitnesshop_DAO.getInstance();
    count = dbPro.getArticleCount(); 

	String searchcol=request.getParameter("searchcol"); //검색 조건 
	if(searchcol==""||searchcol==null){
		searchcol ="product_name";
	}

	jekimDB usedb = new jekimDB();
	usedb.connect();
	
	Statement stmt=null;
	Connection con=null;
	String jdbcUrl="jdbc:mysql://localhost:3306/loseweight_db";
	String dbId="lw_admin";
	String dbPass="3whakstp";
	con=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	stmt=con.createStatement();
	
	String listsql1="select count(*) from Fitness_shop where "+searchcol+"  like '%"+listsearch+"%'";
	ResultSet rs = stmt.executeQuery(listsql1);
	
	String listsql2="select * from Fitness_shop where "+searchcol+"  like '%"+listsearch+"%' limit "+startRow+","+pageSize+"";
	ResultSet listsearchresult = usedb.resultQuery(listsql2);
	number = count-(currentPage-1)*pageSize;
	if(rs.next()){ count = rs.getInt(1); } rs.close();
%>	

<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<link href="Fitness_shop_listcss.css" rel="stylesheet" type="text/css">
<style>

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
	<jsp:include page="../../community/community_topinclude.jsp" >
				<jsp:param name="tom" value="5"/>
				<jsp:param name="toc" value="not"/>
				<jsp:param name="imgs" value="shop.png"/>
				<jsp:param name="boardname" value="기구"/>
</jsp:include>

<div class="search_bar">
	<form method="post" action="Fitness_shop_list.jsp">
		<div style="margin:0 auto; margin-top:10px;">
		<SELECT class="search_list" name='searchcol'> <!-- 검색 컬럼 -->
	        <OPTION value='subject'>상품이름</OPTION>
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
								String lw_salesnum=listsearchresult.getString("lw_salesnum");
								String subject=listsearchresult.getString("product_name");											
								String product_code=listsearchresult.getString("product_code");
								int cost=listsearchresult.getInt("cost");
								int quantity=listsearchresult.getInt("quantity");
								Timestamp write_date=listsearchresult.getTimestamp("write_date");								
								String img0=listsearchresult.getString("img0");
								int replycount=0;
								Fitnesshop_DAO dbPro1 = Fitnesshop_DAO.getInstance();
								Fitnesshop_DTO article =  dbPro.getArticle(Integer.parseInt(lw_salesnum));
								   	String replylistsql1="select count(*) from Fitness_shop_re where lw_salesnum="+article.getLw_salesnum()+"";
								   	ResultSet rs2 = stmt.executeQuery(replylistsql1);
								if(rs2.next()){ replycount = rs2.getInt(1); } rs.close();
				%>	
			    <li class="shop_board_li" OnClick="location.href ='Fitness_shop_content.jsp?lw_salesnum=<%=lw_salesnum%>&pageNum=<%=currentPage%>'">
			    <div class="shopboard_img" style="background-image:url('<%=img0%>');">
			    	<div class="img_background"></div>
			    </div>
			  	<div class="nameTxt"><%=product_name%></div>
			  	<div class="ExTxt"><%=product_contents %></div>
			  	<div class="flex">
			  		<p class="bfcoin">
			  			<strong><%=cost%></strong>
			  		</p>
			  		<p class="afcoin">
			  			<strong><%=selling_price%></strong>
			  		</p>
			  	</div>
			  	<div class="icon">
			  		<%if(productevent==1){%>
			  		<img src="/2019_JeonJSP/Loseweight/img/shop/freedelivery_shop.png">
			  		<%}else if(productevent==2){ %>
			  		<img src="/2019_JeonJSP/Loseweight/img/shop/hit_shop.png">
			  		<%}else{ %>
			  		<img src="/2019_JeonJSP/Loseweight/img/shop/new_shop.png">
			  		<%} %>
			  	
			  	</div>
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
	          <a href="Fitness_shop_list.jsp?pageNum=<%= startPage - 9 %>"><img class="page_next_pre_img" src="images/btn_pre.gif"></a>
	<%      }
	        
	        for (int i = startPage ; i <= endPage ; i++) {  %>
	        	<%if(i == Integer.parseInt(pageNum)){%>
	           <a href="Fitness_shop_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="lw_salesnum<%=i %>"><div class="pageselect_num"><%= i %></div></a>
		          <% }
		           else{%>
	           <a href="Fitness_shop_list.jsp?pageNum=<%= i %>&searchcol=<%=searchcol %>&listsearch=<%=listsearch %>" id="lw_salesnum<%=i %>"><div class="pageselect_num"><%= i %></div></a>
	<%      }}
	        	
	        
	        
	        if (endPage < pageCount) {  %>
	        <a href="Fitness_shop_list.jsp?pageNum=<%= startPage + 9 %>"><img class="page_next_pre_img" src="images/btn_next.gif"></a>
	<%	
	        }
	        
	    }
	
	%>
	
	<%if(id==null||id==""){%>

	<%}else if(id.equals("admin")){%>
	<a href="Fitness_shop_writeForm.jsp"><input id="bottom_write_button" class="write_btn" value="상품등록"></a>
	<%} %>

	</div>					
</body>
</html>
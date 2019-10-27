<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page import="DBBean.jekimDB" %>
<%
String unionSql = "select * from(select board, board_num from quick_blist where id = '"+session.getAttribute("id")+"' order by reg_date desc limit 0,1) as a union all select * from(select board, board_num from quick_blist where id = '"+session.getAttribute("id")+"' ORDER BY readcount desc limit 0,1) as b";
// System.out.println(unionSql);

ResultSet rsRecent = stmt.executeQuery(unionSql);//stmt는 해당 페이지에 선언 되어 있지 않지만, board_content,bfboard_content에 이미 선언이 되어 있어서  include된 quick.jsp에서 실행에 문제는 없음.
String recentTargetBoard = null; //db에 저장된 기록 에서 최근에 사용자가 클릭한 게시판의 종류
String mostTargetBoard = null; //사용자가 가장 많이 클릭한 게시판의 종류
int recentBoardNum = 0; //최근에 클릭한 게시물의 번호
int mostBoardNum = 0; //가장 많이 클릭한 게시물의 번호
//a, b
int ii = 0;// while문 돌때 몇번 째 돌 았는지 체크 하기 위한 변수 
//총 row 는 2개만 밖에 나올 수가 없음.
while(rsRecent.next()){
	if(ii == 0){// 가장 최근 AS a s
		recentTargetBoard = rsRecent.getString("board");
		recentBoardNum = rsRecent.getInt("board_num");
		++ii;
	}else{// 가장 많이 클릭 AS b
		mostTargetBoard = rsRecent.getString("board");
		mostBoardNum = rsRecent.getInt("board_num");
	}
}
rsRecent.close();//db close

if(session.getAttribute("id") != null){//로그인이 된 상태
%>

<link rel="stylesheet" href="/2019_JeonJSP/Loseweight/quick/quick.css">
<!-- css link -->

<div class="qucik_body">
<table class="quick_btable" >
	<tr>
		<th><p class="quick_p">나의 관심 글</p></th>
	</tr>
	<%
	if(mostTargetBoard == null){
	%>
	<tr>
		<td>
			<div class="quick_box" align="center">
				<p class="quick_p">내용이 없습니다.</p>
			</div>
		</td>
	</tr>
	<% 	
	}else{
	//1. 가장 많이 방문한 게시글의 정보 가져오기
	String mostBoardSql = "select * from " + mostTargetBoard + " where num = " + mostBoardNum;
	System.out.println(mostBoardSql);
	ResultSet mostRs = stmt.executeQuery(mostBoardSql);
	//조건 board일때는 글, bf_board일때는 사진
	if(mostRs.next()){
		do{ 
			String mostSubject = mostRs.getString("subject").length() > 10 ? mostRs.getString("subject").substring(0,10) + " ..." : mostRs.getString("subject");
			String mostImg = mostRs.getString("img0") == null ? "/2019_JeonJSP/Loseweight/img/board/board_null_img.png" : mostRs.getString("img0");
			int mostNum = mostRs.getInt("num");
			//가져온 정보에서 게시판이 bf_board 면, /2019_JeonJSP/Loseweight/community/bf_board/bfboard_content.jsp
			//board 면, /2019_JeonJSP/Loseweight/community/board/board_content.jsp
			// alink 할때 href 
			String mostBoardUrl = mostTargetBoard.indexOf("bf_board") != -1 ? "/2019_JeonJSP/Loseweight/community/bf_board/bfboard_content.jsp" : "/2019_JeonJSP/Loseweight/community/board/board_content.jsp";
			String mostLink = mostTargetBoard.indexOf("bf_board") != -1 ?  "<a href='"+ mostBoardUrl +"?num=" + mostNum + "&pageNum=1'class='quick_a'><img src='" + mostImg +"' class='quick_img'></a>" : "<a href='"+ mostBoardUrl +"?num=" + mostNum + "&pageNum=1' class='quick_a'>" + mostSubject +"</a>";
	%>
	<tr>
		<td>
			<div class="quick_box" align="center">
					<p class="quick_p"><%=mostLink%></p>
			</div>
		</td>
	</tr>
	<tr>
		<th class="quick_hr">&nbsp;</th>
	</tr>
		<%}while(mostRs.next());%> 
	<%}else{%>
	<tr>
		<td>
			<div class="quick_box" align="center">
				<p class="quick_p">내용이 없습니다.</p>
			</div>
		</td>
	</tr>
	<%}
	mostRs.close();
	}
	%>
	<tr>
		<th><p class="quick_p">최근본 글</p><th>
	</tr>
	<%
	if(recentTargetBoard == null){%>
	<tr>
		<td>
			<div class="quick_box" align="center" >
				<p class="quick_p">내용이 없습니다.</p>
			</div>
		</td>
	</tr>
	<%	
	}else{
	//2. 최근 방문 글
	String recentBoardSql = "SELECT * FROM " + recentTargetBoard + " WHERE num = " + recentBoardNum;
 	System.out.println(recentBoardSql+"==");
	ResultSet recentRs = stmt.executeQuery(recentBoardSql);
	/* stmt가 오류가 나는 이유
	이 페이지는 board_list.jsp , bfboard_list.jsp에서 import된 페이지 인데, 저 두 페이지에 stmt가 선언이 되 있어서 이 쪽 페이지에서는 선언을 안한 건데
	이클립스는 저 위 두페이지에서 선언을 했는지 안했는지는 실행하기전에는 모르니까 에러 처리 되는거고, 실제 실행 되면 오류가 안나니까 페이지는 잘나오는거임. */
	if(recentRs.next()){
		do{ 
			String recentSubject = recentRs.getString("subject").length() > 10 ? recentRs.getString("subject").substring(0,10) + " ..." : recentRs.getString("subject");
			String recentImg = recentRs.getString("img0") == null ? "/2019_JeonJSP/Loseweight/img/board/board_null_img.png" : recentRs.getString("img0");
			int recentNum = recentRs.getInt("num");
			String recentBoardUrl = recentTargetBoard.indexOf("bf_board") != -1 ? "/2019_JeonJSP/Loseweight/community/bf_board/bfboard_content.jsp" : "/2019_JeonJSP/Loseweight/community/board/board_content.jsp";
			String recentLink = recentTargetBoard.indexOf("bf_board") != -1 ? "<a href='"+ recentBoardUrl +"?num=" + recentNum + "&pageNum=1' class='quick_a'><img src='" + recentImg +"' class='quick_img'></a>" : "<a href='"+ recentBoardUrl +"?num=" + recentNum + "&pageNum=1' class='quick_a'>" + recentSubject +"</a>" ;
	%>
	<tr>
		<td>
			<div class="quick_box" align="center">
				<p class="quick_p"><%=recentLink%></p>
			</div>
		</td>
	</tr>
		<%}while(recentRs.next());%> 
	<%}else{%>
	<tr>
		<td>
			<div class="quick_box" align="center" >
				<p class="quick_p">내용이 없습니다.</p>
			</div>
		</td>
	</tr>
	<%} recentRs.close();}%>
</table>
<div>
	<p id="quick_p">	
	<a><img src="/2019_JeonJSP/Loseweight/quick/top.png"
	onClick="javascript:document.body.scrollTop = 0;"></a></p>
</div>
</div>
<%
}else{//비로그인 상태
%>
<div class="qucik_body">

	<table class="quick_btable">
		<tr>
			<th><p>나의 관심 글</p></th>
		</tr>
		<tr>
			<td>
				<div class="quick_box" align="center" >
					로그인이 
					필요 합니다.
				</div>
			</td>
		</tr>
		<tr>
			<th>
				<hr width="100%">
			</th>
		</tr>
		<tr>
			<th><p>최근 본 글</p><th>
		</tr>
		<tr>
			<td>
				<div class="quick_box" align="center" >
					로그인이 
					필요 합니다.
				</div>
			</td>
		</tr>
	</table>
	<div>
	<p id="quick_p">	
	<a><img src="/2019_JeonJSP/Loseweight/quick/top.png"
	onClick="javascript:document.body.scrollTop = 0;"></a></p>
	</div>
</div>
<%}%>

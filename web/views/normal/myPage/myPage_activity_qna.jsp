<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.et.board.model.vo.*"%>
<%
ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ET_Planner</title>
<link rel="icon" href="/et/image/common/logo.png">

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- font 영어 -->
<link href="https://fonts.googleapis.com/css?family=Ubuntu:700&amp;subset=latin-ext" rel="stylesheet">
<!-- font 한글 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700" rel="stylesheet">


	<!-- Semantic UI -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	

<style>
	.container1 {
		margin-left : 50px;
		width : 90%;
		border-bottom: 1px solid rgb(200,200,200);
	  	height: 300px;
	}
	/* 프로필  */
	.div-img-profile {
		width : 240px;
		height : 240px;
		border : 1px solid gray;
		background : rgba(42,90,133,0.5);;
		border-radius : 50%;
		float :left;
		text-align : center;
	}
	.img-profile {
		width : 240px;
		height : 240px;
		border-radius : 50%;
	}
	
	.div-txt-profile{
		float : left;
		margin : 50px 0 30px 40px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	.div-name{
		font-size : 36px;
		font-weight : 600;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.div-point{
		font-size : 20px;
		font-weight : 800;
		margin-bottom : 1px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	 .div-profileTxt{
		font-size : 15px;
		font-weight : 700;
		font-family: 'Nanum Gothic', sans-serif;
		margin-bottom : 10px;
	 }
	.btn-profile{
		margin-top : 35px;
		font-family: 'Nanum Gothic', sans-serif;
		width : 100px;
		height : 30px;
		border-radius : 7px;
		font-weight:700;
	}
	
	/* 우측 메뉴  */
	.div-menu{
		float : right;
		margin-top : 40px;
	}
	
	.div-menu  li {
		list-style : none;
		font-size : 20px;
		margin: 10px 0;
		font-weight : 300;
		font-size : 20px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.this-page {
		font-weight : 800;
	}
	
	.div-menu a, .div-menu li{
		color : black;
	}
	.div-menu li:hover, .div-menu a:hover {
		text-decoration : none;
		color : rgb(254, 200, 0);
	}
	
	/* 하단 활동내역 보기  */
	.container2{
		width : 93%;
		margin-left : 40px;
	}
	/* 틀 잡기  */	
	.cont2-flex{
		display : flex;
		flex-wrap : wrap;
		width : 100%;
	}
	.con2-left{
		width : 47%;
		margin : 1%;
	}
	.con2-left-inner {
		width : 100%;
		border : 1px solid lightgray;
		border-radius : 7px;
		margin-left : 3%;
	}
	.con2-right{
		width : 47%;
		margin : 1%;
	}
	.con2-qna{
		width : 99%;
		margin-left : 10%;
	}
	
	/* 나의 Q&A / 스크랩 Q&A */
	.qna{
		margin : 30px 0;
	}
	
	.description{
		font-size: 15px;
		width: 90%;
		height: 50px;
	}
	#redBlue-avel{
		font-size: 15px;
	}

</style>
</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file = "/views/common/normal/header.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다면 include path를 수정해야합니다-->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin:120px 0;">
			 <div class = "container1"> <!-- 위에 자기내용  -->
    				<div class = "div-img-profile">
    					<img src = "<%=loginUser.getA_change_Name() %>" class = "img-profile">
    				</div>
    				<div class = "div-txt-profile">
    					<div class = "div-name"><%=loginUser.getM_name() %></div>
    					<div class = "div-point"><%=loginUser.getM_point() %> <i class="euro sign icon"></i></div>
    					<div class = "div-profileTxt"><%=loginUser.getM_profile() %> </div>
    					<button class = "btn-profile" onclick = "editProfile();"> 프로필 수정 </button>
    				</div>
    				<div class = "div-menu">
    					<ul>
    						<li><a onclick = "goMyPlan();" > > 내 플랜보기 </a> </li>
    						<li><a href = "/et/views/normal/myPage/myPage_activity_history.jsp"  class = "this-page"> > 나의 활동내역 </a></li>
    						<li><a href = "/et/views/normal/myPage/myPage_pointHistory.jsp"> > 포인트 히스토리 </a></li>
    						<li><a href = "/et/views/normal/myPage/user_update.jsp"> > 회원정보 수정 </a></li>
    					</ul>
    				</div>
    			</div>
    			<br>
     		<br clear = "both">
        	<!-- QnA리스트 테이블 -->
			<table class="ui celled padded table" id="listArea">
				<thead>
					<tr>
						<th class="single line">글 번호</th>
						<th>제목</th>
						<th>좋아요,스크랩,신고 수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<!-- 리스트 목록 -->
				<tbody>
					<% for(Board b : list){ %>
					<tr>
						<input type="hidden" value="<%= b.getbNo()%>">
						<td><%= b.getbNo() %></td>
						<td><%= b.getBtitle() %></td>
						<td><%= b.getbWriter() %></td>
						<td><%= b.getbNo() %></td>
						<td><%= b.getbDate() %></td>
					</tr>
					<% } %>
				</tbody>
				<!-- 페이징버튼 -->
				<tfoot>
				<tr>
				<th colspan="5">
					<div class="ui right floated pagination menu">
						<a class="item"
							onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=1'"> << </a>

						<%if (currentPage <= 1) {%>
						<button disabled> < </button>
						<%} else {%>
						<a class="item"
							onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage - 1%>'"> < </a>
						<%}%>
						
						
						<%
							for (int p = startPage; p <= endPage; p++) {
								if (p == currentPage) {
						%>
								<a class="item" disabled><%=p%></a>
						<%} else {%>
								<a class="item"
							onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=p%>'"> <%=p%> </a>
						<%}%>

						<%}%>


						<%if (currentPage >= maxPage) {%>
							<a class="item" disabled>></a>
						<%} else {%>
						<a class="item"
							onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage + 1%>'">></a>
						<%}%>

						<a class="item"
							onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=maxPage%>'">>></a>
							
						</div>
					</th>
				</tr>
				
				</tfoot>
			</table>	
			
		<script>
			$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"none"});
			}).click(function(){
				var num = parseInt( $(this).parent().children("input").val() );
				
				location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num ;
			});
		});
		</script>
        	
        	
        	
        		
		</div>
	</div>
	<div style="height: 50px;"></div>
	<br><br>
	
	<script>
	    function goMyPlan(){
		    	var mno = <%=loginUser.getM_no()%>;
		    	location.href = "<%=request.getContextPath()%>/selectPlanList.pl?mno="+mno;
	    }
		function editProfile() {
			window.open("views/normal/myPage/myPage_profile_edit.jsp", "프로필 수정", "width=500, height=520, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
		}
	</script>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>
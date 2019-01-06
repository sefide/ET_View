<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

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

<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

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
		<div class="twelve wide column" style="margin-top: 120px;">
			<div class="container1">
				<!-- 위에 자기내용  -->
				<div class="div-img-profile">
					<img src="<%=loginUser.getA_change_Name()%>" class="img-profile">
				</div>
				<div class="div-txt-profile">
					<div class="div-name"><%=loginUser.getM_name()%></div>
					<div class="div-point"><%=loginUser.getM_point()%>
						<i class="euro sign icon"></i>
					</div>
					<div class="div-profileTxt"><%=loginUser.getM_profile()%></div>
					<button class="btn-profile" onclick="editProfile();">프로필 수정</button>
				</div>
				<div class="div-menu">
					<ul>
						<li><a onclick="goMyPlan();"> > 내 플랜보기 </a></li>
						<li><a href="/et/views/normal/myPage/myPage_activity_history.jsp" class="this-page"> > 나의 활동내역 </a></li>
						<li><a href="<%=request.getContextPath()%>/pointList.po" > > 포인트 히스토리 </a></li>
						<li><a href="/et/views/normal/myPage/user_update.jsp"> > 회원정보 수정 </a></li>
					</ul>
				</div>
			</div>
			<br> 
			<br clear="both">
			
			<%if(loginUser != null) {%>
			
			<div class="container2">
				<div class="cont2-flex">
					<!-- 좌측 -->
					<div class="con2-left">
						<div class="con2-left-inner ">
							<table class="ui single line table">
								<thead>
									<tr>
										<th><input type="checkbox" id="qnaCheckBoxReader"></th>
										<th>제목</th>
										<th>내용</th>
										<th>좋아요수</th>
										<th>스크랩수</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody id="myQnaTbody">
								</tbody>
								<tfoot>
									<th colspan="6">
										<div align="right">
										<button class="ui brown basic mini button">삭제하기</button>
									</div>
									</th>
								</tfoot>
							</table>
						</div>
						<br> 
						<br>
					</div>
					

					<!-- 우측  -->
					<div class="con2-right">
						<div class="con2-qna">
							<table class="ui single line table">
								<thead>
									<tr>
										<th><input type="checkbox" id="qnaCheckBoxReader"></th>
										<th>제목</th>
										<th>내용</th>
										<th>좋아요수</th>
										<th>스크랩수</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody id="myQnaTbody">
								</tbody>
								<tfoot>
									<th colspan="6">
										<div align="right">
										<button class="ui brown basic mini button">삭제하기</button>
									</div>
									</th>
								</tfoot>
							</table>
						</div>
	
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<%}else{
		request.setAttribute("msg", "잘못된 접근입니다. 다시 로그인해주세요");//활동내역 페이지에서 띄우자
		request.getRequestDispatcher("views/normal/member/user_login.jsp").forward(request, response);	
	}
	%>
	<script>
		
		var currentPage = 1;
		function ajax(data){
			currentPage = data;
			
			$.ajax({
				url:"<%=request.getContextPath()%>/qnalist.bo",
				data:{currentPage:currentPage},
				type:"get",
				success:function(data){
					console.log(data);
					console.log(data.QnaList);
					console.log(data.Qnapi);
					
					$tableBody = $("#myQnaTbody");
					$tableBody.html('');
					
					//테이블 리스트 구현
					for(var key in data.QnaList){
						$tr = $("<tr onclick=\"location.href='/et/selectOne.bo?num="+data.QnaList[key].bNo+"'\">");
						var $checkTd = $("<td>");
						var $check = $("<input type='checkbox' class='qnaCheck'>");
						var $titleTd = $("<td>").text(data.QnaList[key].btitle);
						var $contentTd = $("<td>").text(data.QnaList[key].bContent);
						var $likeTd = $("<td>").text(data.QnaList[key].bLike);
						var $scrapTd = $("<td>").text(data.QnaList[key].bScrap);
						var $dateTd = $("<td>").text(data.QnaList[key].bDate);
						$checkTd.append($check);
						$tr.append($checkTd);
						$tr.append($titleTd);
						$tr.append($contentTd);
						$tr.append($likeTd);
						$tr.append($scrapTd);
						$tr.append($dateTd);
						$tableBody.append($tr);
					}
					
					//페이징 처리
					$trPage = $("<tr>");
					$tdPage = $("<td colspan='5'>");
					$centerDiv = $("<div align='center'>");
					$paginationDiv = $("<div class='ui pagination menu'>");
				}
			});
		}
	</script>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>
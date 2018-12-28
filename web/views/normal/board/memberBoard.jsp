<%@page import="com.kh.et.company.model.vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.et.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	 Board b = (Board) request.getAttribute("b"); 

	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
/* 	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();   */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<!-- Semantic UI -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<title>ET_Planner</title>
<link rel="icon" href="/views/image/common/logo.png">
<style>
.column {
	height: 100%;
}

#container {
	display: flex;
}

#box-left {
	flex: 1;
}

#box-center {
	flex: 3;
	text-align: center;
}

#box-right {
	flex: 1;
	text-align: right;
}

.allcontentDiv {
	height: 400px;
	overflow-y: auto;
	border-bottom: 1px solid #808080;
	/* #f2f2f2 */
}
.selectBoardList{
	height: 700px;
	overflow-y: auto;
	border-bottom: 1px solid #808080;
}
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file="/views/common/normal/header.jsp"%>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px;">



			<!-- 상단 공지사항  -->
			<div class="ui segment" style="margin-top: 40px;">
				<div class="ui two column very relaxed grid">
					<div class="column">
						<h1 class="ui header">
							<img src="/et/image/common/logo.png" class="ui circular image">
							ET Planner 공지사항
						</h1>

					</div>
					<div class="column">
						<p>*비방과 욕설은 금물!</p>
						<p>*좋아요와 스크랩은 환영!</p>
					</div>
				</div>
			</div>
			<br>
			<!-- 내가 (본인이 ) 글쓰는 부분 -->
			<div class="ui segment">
				<div id="container">
					<div id='box-left'>
						<img class="ui small circular image"
							src="/et/image/common/logo.png">
					</div>
					<div id='box-center'>

						<div align="left">
							제목 &nbsp;&nbsp;<input type="text" id="title" size="110">
						</div>
						<br>
						<div class="ui form">
							<div class="field">
							
								<textarea rows="2" cols="10" style="height: 100px;" id="content"></textarea>
							</div>
							<div class="ui list" style="text-align: right;">
								<button class="ui right yellow button" id="addBoard">등록하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- 글 목록 --> 
			<!-- 내가 방금 작성한 글 내용이 나올 div -->
			<div class="allcontentDiv"></div>
			<!-- 조회한 글 목록 (페이징 처리가 된 글) 이 나올 영역-->
			<div class="selectBoardList">
				
			</div>
			
			<script>
				//로딩 될 때 마다 페이징
				
		 		$(function(){
					
					location.href="<%=request.getContextPath()%>/select.bo";
					
					<% for(Board board : list){ %>
						console.log(board); 
					<% } %>
					
					
				
				}); 
				
				
				
				
				
				
				
				
				//등록 버튼 눌렀을때 생기는 일
				$("#addBoard").click(
								function() {

									var title = $("#title").val();
									var content = $("#content").val();

									$.ajax({
												url : "/et/insert.bo",
												data : {
													title : title,
													content : content
												},

												success : function(data) {
													console.log(data);

													//태그를 한줄로 만들어서 append 하기.								
													var editButton = "<div class='BoardList2'><div class='right menu'><button class='ui yellow basic button' style='margin-bottom: 5px;'>수정하기</button></div></div>";

													var idArea = "<div class='ui segment'><div id='container'><div id='box-left'><label><h2>"
															+ "회원아이디"
															+ "</h2></label><br>";
													var countArea = "<div class='ui labeled button' tabindex='0' style='margin-top: 10px;'><div class='ui basic red button'><i class='heart icon'></i> 좋아요 수</div>"
															+ "<a class='ui basic red left pointing label'>"
															+ "56"
															+ "</a></div><br>"
															+ "<div class='ui labeled button' tabindex='0' style='margin-top: 10px;'><div class='ui basic blue button'><i class='bookmark  icon'></i> 스크랩 수</div>"
															+ "<a class='ui basic left pointing blue label'>"
															+ "87"
															+ "</a></div><br><div class='ui labeled button' tabindex='0' style='margin-top: 10px;'>"
															+ "<div class='ui basic black button'><i class='exclamation triangle icon'></i> 신고 수</div>"
															+ "<a class='ui basic left pointing black label'>"
															+ "7"
															+ "</a></div><div style='margin-top: 10px;'>";

													var likeArea = "<div class='ui small red button'><span><i class='heart icon'></i> </span></div>"
															+ "<div class='ui small blue button'><span><i class='bookmark  icon'></i> </span></div>"
															+ "<div class='ui small black button'><span><i class='exclamation triangle icon'></i> </span></div>";

													var cancelArea = "<div class='ui small red button' style='visibility: hidden;'><span><i class='empty heart icon'></i></span></div>"
															+ "<div class='ui small blue button' style='visibility: hidden;''><span><i class='empty bookmark  icon'></i> </span></div>"
															+ "<div class='ui small black button' style='visibility: hidden;'><span><i class='empty exclamation triangle icon'></i> </span></div></div></div>";

													var titleArea = "<div id='box-center'><div class='ui form'><div style='text-align: left;'><span> 제목 </span><label style='background-color: red;'>"
															+ title
															+ "</label></div>";

													var contentArea = "<div class='field'><textarea rows='2' cols='10'>"
															+ content
															+ "</textarea></div>";

													var repidArear = "<div class='ui list' style='text-align: left;'><div class='item' style=''><div class='content'><a class='header'><span style='color: blue;'>"
															+ "내아이디"
															+ "</span></a>";

													var repcontentArea = "<div class='ui form'><div class='field'><div><input type='text' size='100px;' placeholder='댓글을 입력해주세요'>";

													var submitButton = "<div class='ui right yellow button'>입력</div></div></div></div></div></div></div></div></div></div></div></div>";

													var allcontentArea = editButton
															+ idArea
															+ countArea
															+ likeArea
															+ cancelArea
															+ titleArea
															+ contentArea
															+ repidArear
															+ repcontentArea
															+ submitButton;
																																															
													$(".allcontentDiv").append(allcontentArea);

												},
												error : function(request,
														status, error) {
													alert("code:"
															+ request.status
															+ "\n"
															+ "message:"
															+ request.responseText
															+ "\n" + "error:"
															+ error);
												}
											});
								});
			
			<%-- 	
				$(function(){
					$("#listArea td").mouseenter(function(){
						$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
					}).mouseout(function(){
						$(this).parent().css({"background":"black"});
					}).click(function(){
						var num = $(this).parent().children("input").val();
						
						location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num;
					});
				}); --%>
				
				
				</script>





		</div>
		<div class="two wide column"></div>
	</div>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>
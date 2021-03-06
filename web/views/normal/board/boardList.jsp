<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.et.board.model.vo.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
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

<title>ET_Planner QnA</title>
<link rel="icon" href="/views/image/common/logo.png">
<style>
.column {
	height: 100%;
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

			<!-- 내용 넣기 -->

			<!-- 공지사항 -->
			<div class="ui segment" style="margin-top: 40px;">
				<div class="ui two column very relaxed grid">
					<div class="column">
						<h1 class="ui header">
							<img src="/et/image/common/logo.png" class="ui circular image" style ="border : 1px solid gray">
							ET Planner 공지사항
						</h1>

					</div>
					<div class="column">
						<p>*여행 관련 질문을 마음껏 해주세요. </p>
						<p>*비방과 욕설은 금물이예요. </p>
						<p>*좋아요와 스크랩은 환영해요. </p>
					</div>
				</div>
			</div>
			
			<!-- 등록버튼 -->
			<%-- <% if(loginUser != null){%> --%>
			<div class="ui list" >
			<b style = "font-size : 37px;">Q&A</b>
				<!-- <button class="ui right yellow button" onclick="location.href='views/normal/board/boardInsertForm.jsp'"> 글 등록하기</button> -->
				<!-- 글 등록하기 onclick이벤트로 수정(글작성 포인트 제한) -->
				 <button style="float: right;" class="ui right yellow button" onclick="goBoardInsert();"> 글 등록하기</button> 
			</div>
			<div clear = "both" style = "margin_bottom : -30px;"></div>
			<%-- <%}else{
				
			} %> --%>

			<!-- 리스트 테이블 -->
			<table class="ui yellow table" id="listArea">
				<thead>
					<tr>
						<th class="single line">글 번호</th>
						<th>제목</th>
						<th>작성자</th>
						<!-- <th>좋아요 수</th>  -->
						<th>작성일</th>

					</tr>
				</thead>
				<!-- 리스트 -->
				<tbody>
					<% for(HashMap<String, Object> hmap : list){ 
					Board b = (Board)hmap.get("b");
					int rnum = (Integer)hmap.get("rnum");
					%>
					<tr>
						<input type="hidden" value="<%= b.getbNo()%>">
						<td><%=rnum %></td>
						<td><%= b.getBtitle() %></td>
						<td><%= b.getbWriter() %></td>
						<!-- <td><%= b.getbLike() %></td>  -->
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
							onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage - 1%>'"></a>
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
				$(this).parent().css({"background":"#fbbd08", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"none"});
			}).click(function(){
				var num = parseInt( $(this).parent().children("input").val() );
				
				
				location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num ;
			});
		});
	</script>
			


		</div>
		<div class="two wide column"></div>
	</div>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
	<script>
	//포인트 제한
	
		function goBoardInsert() {
			<%if(loginUser != null){%>
				var point = <%=loginUser.getM_point()%>;
				if(point>=5){
					location.href="views/normal/board/boardInsertForm.jsp";
				}else{
					alert("포인트가 부족합니다!(글 작성시 5point필요!)")
				}
			<%}else{%>
				alert("회원만 작성하실 수 있습니다!");
			<%}%>
		} 
	</script>
</body>
</html>
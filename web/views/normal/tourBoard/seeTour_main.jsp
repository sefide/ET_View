<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.et.tourBoard.model.vo.*, com.kh.et.common.NumberExec"%>
<% 
 	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list");
	PageInfo pi=(PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	NumberExec Ne = new NumberExec(); 
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
<!-- 드롭다운 -->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">


<title>ET_Planner</title>
<link rel="icon" href="/views/image/common/logo.png">

<style>
.column {
	height: 100%;
}

/* 상단 투어 검색 */
.div-search-area {
	width: 95%;
	display: inline-block;
	vertical-align: middle;
	/* background: red; */
	padding-left: 250px;
	padding-top: 10px;
}

.div-dropdown {
	/* background: yellow;  */
	width: 300px;
	display: inline-block;
	margin: 10px 20px 10px 35px;
	display: inline-block;
	vertical-align: middle;
}

.div-search-text {
	padding-top: 15px;
	font-size: 27px;
	font-weight: 700;
	font-family: 'Ubuntu', sans-serif;
	margin-top: 10px;
	margin-bottom: 1px;
	text-align: center;
	font-size: 27px;
}

/* 하단 투어 보기 */
.container2 {
	width: 95%;
	margin-top: 30px;
	margin-left: 40px;
	/* background: blue; */
}

.div-tour-list {
	margin-left: 5px;
	/* background: red; */
}

.div-tour-img {
	/* background: yellow; */
	width: 330px;
	height: 280px;
	display: inline-block;
	margin: 5px 35px 10px 0;
}

.div-tour-title {
	margin-top: 5px;
	font-size: 24px;
	font-weight: 500;
	font-family: 'Ubuntu', sans-serif;
	display: block;
}

.card{
	width:210px;
	height: 330px;
	display: inline-block;
	margin-bottom: 20px;
}
.card-deck{
	display: flex;
}
.div-card-tour{
	display: inline-block;
}
#cardOne{
	display:inline-block;
	margin-bottom: 20px;
	margin-left : 50px;
}

.pagingArea > button{
	border : 1px solid white;
    background : white;
}
.card:hover{
	cursor:pointer;
}
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file = "/views/common/normal/header.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px;">

			<!-- 내용시작 -->

			<!-- 상단 검색 창 -->

			<div class="div-search-text">나라 및 도시 검색</div>
			<div class="div-search-area">
				<form class="ui form">

					<div class="div-dropdown">
						<div class="field">
							<label>나라 선택</label> <select class="ui fluid dropdown">
								<option value="">프랑스</option>
								<option value="">독일</option>
								<option value="">영국</option>
								<option value="">네덜란드</option>
								<option value="">이탈리아</option>
								<option value="">체코</option>
								<option value="">그리스</option>
								<option value="">헝가리</option>
								<option value="">오스트리아</option>
								<option value="">크로아티아</option>
								<option value="">덴마크</option>
								<option value="">스위스</option>
								<option value="">터키</option>
								<option value="">포르투갈</option>
								<option value="">스페인</option>
							</select>
						</div>
						<div class="field">
							<label>도시 선택</label> <select class="ui fluid dropdown">
								<option value="">파리</option>
								<option value="">리옹</option>
								<option value="">니스</option>
								<option value="">뮌헨</option>
								<option value="">베를린</option>
								<option value="">뉘른베르크</option>
								<option value="">프랑크푸르트</option>
								<option value="">런던</option>
								<option value="">옥스포드</option>
								<option value="">암스테르담</option>
								<option value="">밀라노</option>
								<option value="">베네치아</option>
								<option value="">피렌체</option>
								<option value="">로마</option>
								<option value="">프라하</option>
								<option value="">아테네</option>
								<option value="">부다페스트</option>
								<option value="">빈</option>
								<option value="">잘츠부르크</option>
								<option value="">자그레브</option>
								<option value="">코펜하겐</option>
								<option value="">오덴세</option>
								<option value="">인터라켄</option>
								<option value="">취리히</option>
								<option value="">이스탄불</option>
								<option value="">앙카라</option>
								<option value="">리스본</option>
								<option value="">바르셀로나</option>
								<option value="">마드리드</option>
							</select>
						</div>

					</div>
					
				</form>
				<button class="ui yellow basic button"
						onclick="location.href ='seeTour_detail.jsp'"  style="margin-left: 35px;" >검색하기</button>
			</div>
			<hr>
			<!-- 하단 투어 리스트  -->
			<br> <br>
			<div class="ui mt-20">

				<div class="card-deck">
				<div class="div-card-tour">
			<div class="ui huge header">TourList</div>
			<hr>
				<%for(int i=0; i <list.size(); i++){ 
          			HashMap<String,Object> hmap = list.get(i);
              	%>
						<div class="card" width="200px" height="330px" id="cardOne" onclick="seeDetail(<%=hmap.get("tno")%>);">
						 <input type="hidden" value="<%=hmap.get("tno")%>">
							<img class="card-img-top" src="/et/tourUpload/<%=hmap.get("changeName")%>" 
							 width="200px" height="200px">
							<div class="card-body">
								<h5 class="card-title"> <%= hmap.get("title") %></h5>
								<p class="card-text"><%= Ne.commaMoney((int)hmap.get("price")) %></p>
								<p class="card-text">
									<small class="text-muted"><%=hmap.get("concept") %> </small>
								</p>
							</div>
						</div>
						<%} %>
					</div>
				</div>
				<br><br>
             <div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/memberSeeTour.tbo?currentPage=1'"><<</button>
			<%if(currentPage <= 1){%>
			<button disabled><</button>
			<% }else{%>
			<button onclick="location.href='<%=request.getContextPath()%>/memberSeeTour.tbo?currentPage=<%=currentPage -1%>'"><</button>
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
					<button disabled><%= p %></button>
			<%		}else{ %>
					<button onclick="location.href='<%= request.getContextPath()%>/memberSeeTour.tbo?currentPage=<%= p %>'"><%= p %></button>
			<%		}%>
				
			<% } %>
			
			
			<%if(currentPage >= maxPage){ %>
			<button disable>></button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath()%>/memberSeeTour.tbo?currentPage=<%=currentPage + 1%>'">></button>
			<%} %>
			
			<button onclick="location.href='<%=request.getContextPath()%>/memberSeeTour.tbo?currentPage=<%=maxPage%>'">>></button>
            </div>
			</div>
			<br>

	<script>
		function goTourDetail() {
			window.open("seeTour_detail.jsp", "상세 여행 정보 ", "width=500, height=520, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
		}
		
		function seeDetail(num) {
			location.href="<%=request.getContextPath()%>/detailSeeTour.tbo?num="+num;
		}
	</script>





		</div>
		<div class="two wide column"></div>
	</div>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>
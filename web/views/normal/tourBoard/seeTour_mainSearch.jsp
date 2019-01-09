<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.et.tourBoard.model.vo.*, com.kh.et.common.NumberExec"%>
<% 
 	ArrayList<HashMap<String,Object>> list2 = (ArrayList<HashMap<String, Object>>)request.getAttribute("list2");
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
form {
	width : 63%;
	display : inline-block;
}
.btn-search{
	width : 20%;
	display : inline-block;
	padding-top : 55px;
	vertical-align: middle;
}
.div-search-area {
	width: 95%;
	display: inline-block;
	vertical-align: middle;
}

.div-dropdown {
	/* background: yellow;  */
	width: 100%;
	display :flex;
	flex-wrap : wrap;
	margin: 10px 0px 10px 0px;
	vertical-align: middle;
}
#div-dropdown-inner{
	width: 48%;
	margin : 1%;
}
.div-search-text {
	padding-top: 22px;
	font-size: 20px;
	font-weight: 700;
	font-family: 'Ubuntu', sans-serif;
	margin-top: 10px;
	margin-bottom: 1px;
}

/* 하단 투어 보기 */
.container2 {
	width: 95%;
	margin-top: 30px;
	margin-left: 40px;
}

.div-tour-list {
	margin-left: 5px;
}

.div-tour-img {
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
	width:22%;
	height: 350px;
	display: inline-block;
	margin-bottom: 20px;
}
.card-deck{
	display: flex;
}
.div-card-tour{
	display: inline-block;
	margin-top : 5px;
}
#cardOne{
	display:inline-block;
	margin-bottom: 20px;
	margin-left : 1%;
}

.pagingArea > button{
	border : 1px solid white;
    background : white;
}
.card:hover{
	cursor:pointer;
}

#tour-price{
	color :  #ee685a;
	font-weight : 800;
	font-size : 15px;
}
.header-txt{
    font-size: 2em;
    font-weight : 700;
    width : 100%;
}
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file = "/views/common/normal/header.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px; margin-bottom : 150px;">

			<!-- 내용시작 -->

			<!-- 상단 검색 창 -->

			<div class="div-search-text">나라 및 도시 검색 <i class="search icon"></i></div>
			<div class="div-search-area">
				<form class="ui form">

					<div class="div-dropdown">
						<div class="field" id = "div-dropdown-inner">
							<label>나라 선택</label> <select class="ui fluid dropdown" name="nation" id ="sel-nation">
								<option value="프랑스">프랑스</option>
								<option value="독일">독일</option>
								<option value="영국">영국</option>
								<option value="네덜란드">네덜란드</option>
								<option value="이탈리아">이탈리아</option>
								<option value="체코">체코</option>
								<option value="그리스">그리스</option>
								<option value="헝가리">헝가리</option>
								<option value="오스트리아">오스트리아</option>
								<option value="크로아티아">크로아티아</option>
								<option value="덴마크">덴마크</option>
								<option value="스위스">스위스</option>
								<option value="터키">터키</option>
								<option value="포르투갈">포르투갈</option>
								<option value="스페인">스페인</option>
							</select>
						</div>
						<div class="field" id = "div-dropdown-inner">
							<label>도시 선택</label> <select class="ui fluid dropdown" name="city" id ="sel-city">
								<option value="1">파리</option>
								<option value="2">리옹</option>
								<option value="3">니스</option>
							</select>
						</div>

					</div>
					
				</form>
				<div class = "btn-search">
					<button class="ui yellow basic button" onclick="GoSearchPage();" >검색하기</button>
				</div>
			</div>
			<hr>
			<!-- 하단 투어 리스트  -->
			<br> <br>
			<div class="ui mt-20" style = "margin-bottom : 100px;">

			<div class="card-deck">
				<%if(list2.size() > 0) {%>
				<div class="header-txt"><%=list2.get(0).get("country") %>, <%=list2.get(0).get("city") %>의 투어 </div> <br>
				<%} else { %>
				<div class="header-txt">검색하신 도시의 투어정보가 없습니다.  </div><br>
				<%} %>
				<hr width = "100%">
				<div></div>
				<div class="div-card-tour">
					
					<%for(int i=0; i <list2.size(); i++){ 
	          			HashMap<String,Object> hmap = list2.get(i);%>
						<div class="card" id="cardOne" onclick="seeDetail(<%=hmap.get("tno")%>);">
						 <input type="hidden" value="<%=hmap.get("tno")%>">
							<img class="card-img-top" src="/et/tourUpload/<%=hmap.get("changeName")%>" height="200px">
							<div class="card-body">
								<h5 class="card-title">(<%=hmap.get("country") %>-<%=hmap.get("city") %>)<%= hmap.get("title") %></h5>
								<p class="card-text" id = "tour-price"><%= Ne.commaMoney((int)hmap.get("price")) %>원</p>
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
			<button onclick="location.href='<%=request.getContextPath()%>/searchSeeTour.tbo?currentPage=1'"><<</button>
			<%if(currentPage <= 1){%>
			<button disabled><</button>
			<% }else{%>
			<button onclick="location.href='<%=request.getContextPath()%>/searchSeeTour.tbo?currentPage=<%=currentPage -1%>'"><</button>
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
					<button disabled><%= p %></button>
			<%		}else{ %>
					<button onclick="location.href='<%= request.getContextPath()%>/searchSeeTour.tbo?currentPage=<%= p %>'"><%= p %></button>
			<%		}%>
				
			<% } %>
			
			
			<%if(currentPage >= maxPage){ %>
			<button disable>></button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath()%>/searchSeeTour.tbo?currentPage=<%=currentPage + 1%>'">></button>
			<%} %>
			
			<button onclick="location.href='<%=request.getContextPath()%>/searchSeeTour.tbo?currentPage=<%=maxPage%>'">>></button>
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
		
		function GoSearchPage() {
			var city = $("#sel-city").find(":selected").val()
			location.href="<%=request.getContextPath()%>/searchSeeTour.tbo?city="+city;
		}
	</script>
	  	<script>
   	
   	$("#sel-nation").change(function(){
		var selNation = $("#sel-nation").find(":selected").val();
		$("#sel-city").html("");
		switch(selNation) {
		  case '프랑스':
			$("#sel-city").html("<option value='1'>파리</option><option value='2'>리옹</option><option value='3'>니스</option>");
		    break;
		  case '영국':
			$("#sel-city").html("<option value='8'>런던</option><option value='9'>옥스포드</option>");
		    break;
		  case '독일':
			  $("#sel-city").html("<option value='4'>뮌헨</option><option value='5'>베를린</option><option value='6'>뉘른베르크</option><option value='7'>프랑크푸르트</option>");
			    break;
		  case '이탈리아':
			  $("#sel-city").html("<option value='10'>밀라노</option><option value='11'>베네치아</option><option value='12'>피렌체</option><option value='13'>로마</option>");
			    break;
		  case '체코':
			  $("#sel-city").html("<option value='14'>프라하</option>");
			    break;
		  case '그리스':
			  $("#sel-city").html("<option value='15'>아테네</option>");
			    break;
		  case '헝가리':
			  $("#sel-city").html("<option value='16'>부다페스트</option>");
			    break;
		  case '오스트리아':
			  $("#sel-city").html("<option value='17'>빈</option><option value='18'>잘츠부르크</option>");
			    break;
		  case '크로아티아':
			  $("#sel-city").html("<option value='19'>자그레브</option>");
			    break;
		  case '덴마크':
			  $("#sel-city").html("<option value='20'>코펜하겐</option><option value='21'>오덴세</option>");
			    break;
		  case '스위스':
			  $("#sel-city").html("<option value='22'>베른/인터라켄</option><option value='23'>취리히</option>");
			    break;
		  case '터키':
			  $("#sel-city").html("<option value='24'>이스탄불</option><option value='25'>앙카라</option>");
			    break;
		  case '포르투갈':
			  $("#sel-city").html("<option value='26'>리스본</option>");
			    break;
		  case '스페인':
			  $("#sel-city").html("<option value='27'>바르셀로나</option><option value='28'>마드리드</option>");
			    break;
		  case '네덜란드':
			  $("#sel-city").html("<option value='29'>암스테르담</option>");
			    break;
		  default:
		    // code block
		}
	});
   	</script>




		</div>
		<div class="two wide column"></div>
	</div>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>
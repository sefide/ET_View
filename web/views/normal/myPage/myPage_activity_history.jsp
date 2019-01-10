<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.et.board.model.vo.Board, java.util.*, com.kh.et.member.model.vo.News, com.kh.et.plan.model.vo.*,  com.kh.et.common.NumberExec"%>
<% 
	String msg = (String) request.getAttribute("msg");

	HashMap<String, Board> QnAlist = (HashMap<String, Board>)request.getAttribute("QnAlist"); 
	ArrayList<News> NewsList = (ArrayList<News>)request.getAttribute("NewsList");
	Board board = (Board)request.getAttribute("board"); 
	
	
	HashMap<String, Object> scrapPlan = (HashMap<String, Object>)request.getAttribute("scrapPlan");
	HashMap<String, City> scrapPlanCityMap = null;	
	ArrayList<Plan> scrapPlanList = null;
	if(scrapPlan != null){
		scrapPlanList = (ArrayList<Plan>)scrapPlan.get("scrapPlan"); 
		scrapPlanCityMap = (HashMap<String, City>)scrapPlan.get("scrapPlanCity");
	}
	
	NumberExec NE = new NumberExec();
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
<!-- <!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script> 
	
<!-- googleMap -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDoMpIr7wrKdZrGsBCW1zoNesmP8fhCdH0" type="text/javascript"></script>

<style>
.container1 {
	margin-left: 50px;
	width: 90%;
	border-bottom: 1px solid rgb(200, 200, 200);
	height: 300px;
}
/* 프로필  */
.div-img-profile {
	width: 240px;
	height: 240px;
	border: 1px solid gray;
	background: rgba(42, 90, 133, 0.5);;
	border-radius: 50%;
	float: left;
	text-align: center;
}

.img-profile {
	width: 240px;
	height: 240px;
	border-radius: 50%;
}

.div-txt-profile {
	float: left;
	margin: 50px 0 30px 40px;
	font-family: 'Nanum Gothic', sans-serif;
}

.div-name {
	font-size: 36px;
	font-weight: 600;
	font-family: 'Nanum Gothic', sans-serif;
}

.div-point {
	font-size: 20px;
	font-weight: 800;
	margin-bottom: 1px;
	font-family: 'Nanum Gothic', sans-serif;
}

.div-profileTxt {
	font-size: 15px;
	font-weight: 700;
	font-family: 'Nanum Gothic', sans-serif;
	margin-bottom: 10px;
}

.btn-profile {
	margin-top: 35px;
	font-family: 'Nanum Gothic', sans-serif;
	width: 100px;
	height: 30px;
	border-radius: 7px;
	font-weight: 700;
}

/* 우측 메뉴  */
.div-menu {
	float: right;
	margin-top: 40px;
}

.div-menu  li {
	list-style: none;
	font-size: 20px;
	margin: 10px 0;
	font-weight: 300;
	font-size: 20px;
	font-family: 'Nanum Gothic', sans-serif;
}

.this-page {
	font-weight: 800;
}

.div-menu a, .div-menu li {
	color: black;
}

.div-menu li:hover, .div-menu a:hover {
	text-decoration: none;
	font-weight: 600;
	color: rgb(254, 200, 0);
	cursor: pointer;
}

/* 하단 활동내역 보기  */
.container2 {
	width: 93%;
	margin-left: 80px;
}
/* 틀 잡기  */
.cont2-flex {
	display: flex;
	flex-wrap: wrap;
	width: 100%;
}

.con2-left {
	width: 34%;
	margin: 1%;
}

.con2-left-inner {
	width: 94%;
	border: 1px solid lightgray;
	border-radius: 7px;
	margin-left: 3%;
}

.con2-right {
	width: 60%;
	margin: 1%;
}

.con2-qna {
	width: 99%;
	margin-left: 10%;
}

/* 새 소식 */
.news {
	font-size: 30px;
	font-family: 'Nanum Gothic', sans-serif;
	padding-top: 15px;
}

#news-content {
	margin-left: 10%;
	font-family: 'Nanum Gothic', sans-serif;
}

/* 나의 Q&A / 스크랩 Q&A */
.description {
	font-size: 15px;
	width: 90%;
	height: 50px;
}

#redBlue-avel {
	font-size: 15px;
}

#plus1 {
	margin-left: 305px;
}

.plus {
	color: black;
	text-decoration: none;
	font-size: 15px;
}

.plus2 {
	color: black;
	text-decoration: none;
	font-size: 18px;;
}

.plus:hover, .plus2:hover {
	cursor: pointer;
}

/* 내가 스크랩한 플랜 보기  */
.container3 {
	width: 93%;
	margin-left: 3%;
}

.div-myPage-title {
	margin-top: 20px;
	font-size: 30px;
	font-weight: 600;
	font-family: 'Nanum Gothic', sans-serif;
	display: inline-block;
	width: 250px;
}

.plan-list-inner {
	width: 95%;
	display: flex;
	flex-wrap: wrap;
	margin: 0 1%;
}

.planBox {
	width: 30%;
	margin: 4% 1.5%;
	height: 480px;
	display: flex;
	flex-wrap: wrap;
}

.onlyMap {
	width: 100%;
	margin: 4% 1.5%;
	height: 400px;
	display: flex;
	flex-wrap: wrap;
}

.planMap {
	width: 100%;
	height: 380px;
	display: inline-block;
}

.div-plan-title {
	font-size: 30px;
	font-weight: 700;
	font-family: 'Nanum Gothic', sans-serif;
	display: inline-block;
	cursor: pointer;
	margin: 3px 0;
}

.div-plan-title:hover {
	color: rgb(237, 197, 58);
}

.div-plan-cities {
	margin-top: 10px;
	margin-bottom:5px;
	font-size: 17px;
	font-weight: 500;
	font-family: 'Nanum Gothic', sans-serif;
	color: rgb(60, 60, 60);
	display: block;
	width: 100%;
}

.div-plan-writer {
	width: 24%;
	height: 30px;
	color: rgba(255, 255, 255, 0.8);
	font-size: 18px;
	font-family: 'Nanum Gothic', sans-serif;
	background: rgba(42, 90, 133, 0.5);
	border-radius: 5px;
	text-align: center;
}

.div-writer {
	width: 70%;
	margin-left: 1%;
	font-size: 19px;
	font-weight: 500;
	font-family: 'Nanum Gothic', sans-serif;
	color: rgb(60, 60, 60);
}

.div-plan-list {
	margin-left: 10px;
	display: flex;
	flex-wrap: wrap;
	width: 99%;
}

.div-plan-map {
	width: 240px;
	height: 280px;
	display: inline-block;
	margin: 5px 12px 30px 10px;
}

.plan-map {
	width: 240px;
	height: 240px;
}

.div-plan-title {
	font-size: 20px;
	font-weight: 600;
	font-family: 'Ubuntu', sans-serif;
	color: #2A5A85;
	display: inline-block;
	cursor: pointer;
}

.div-plan-like {
	width: 80px;
	height: 30px;
	color: red;
	font-size: 15px;
	font-family: 'Ubuntu', sans-serif;
	text-align: center;
	float: left;
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
						<li><a onclick="goMyActivity();" class="this-page"> > 나의 활동내역 </a></li>
						<li><a href="<%=request.getContextPath()%>/pointList.po" > > 포인트 히스토리 </a></li>
						<li><a href="/et/views/normal/myPage/user_update.jsp"> > 회원정보 수정 </a></li>
					</ul>
				</div>
			</div>
			<br> 
			<br clear="both">
			<div class="container2">
				<div class="cont2-flex">
					<!-- 좌측 -->
					<div class="con2-left">
						<div class="con2-left-inner ">
							<div align="center" class="news">
								<b>My News</b>
							</div>
							<%
							if (NewsList != null) {
								 for (int i = 0; i < NewsList.size(); i++) { 
									if(i < 3){ %>
									<div class="ui relaxed divided list" id="news-content">
										<div class="item">
											<i class="big yellow bell icon"></i>
											<div class="content">
												<div class="description">
													<b>'<%=NewsList.get(i).getName()%>'님이 회원님의 "<%=NewsList.get(i).getTitle()%>" 을(를) 
														<%=NewsList.get(i).getType()%>하셨습니다.
													</b> 
													
												</div>
											</div>
										</div>
									</div>
									<br>
							<%		}
								 } 
							}
							%>
						</div>
						<br> 
						<br>
					</div>
					

					<!-- 우측  -->
					<div class="con2-right">
						<!-- 나의 Q&A -->
						<div class="con2-qna">
							<div class="myQnA-content" style='display: inline; float: left; width: 500px'>
								<div class="QnA">
									<b style="font-size: 25px;">나의 Q&A</b> <span id="plus1"><i class="chevron circle right icon"></i><a class="plus" onclick="QnAPlus();">더 보기</a></span>
								</div>
								<%
									if (QnAlist != null && QnAlist.get("my") != null) {
								%>
								<div class="column">
									<div class="ui raised segment">
										<a class="ui red ribbon label" id="redBlue-avel">제목</a> <span><%=QnAlist.get("my").getBtitle()%></span>
										<p></p>
										<a class="ui blue ribbon label" id="redBlue-avel">내용</a> <span><%=NE.lengthsplit(QnAlist.get("my").getbContent(), 33)%></span>
										<p></p>
									</div>
								</div>
								<%
									}
								%>
							</div>
						</div>
						<!-- 스크랩 Q&A -->
						<div class="con2-qna">
							<div class="scrapQnA-content" style='display: inline; float: left; width: 500px; height: 100px;'>
								<br><br>
								<div class="QnA">
									<b style="font-size: 25px;">내가 스크랩한 Q&A</b>
								</div>
								<%
									if (QnAlist != null && QnAlist.get("you") != null) {
								%>
								<div class="column">
									<div class="ui raised segment">
										<a class="ui red ribbon label" id="redBlue-avel">제목</a> <span><%=QnAlist.get("you").getBtitle()%></span>
										<p></p>
										<a class="ui blue ribbon label" id="redBlue-avel">내용</a> <span><%=NE.lengthsplit(QnAlist.get("you").getbContent(), 33)%></span>
										<p></p>
									</div>
								</div>
								<%
									}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br clear = "both">
			
			<!-- 스크랩한 최근 플랜 3개 보기 -->
			<div class="container3">
			<i class="calendar alternate outline big icon"></i>
	        		<div class = "div-myPage-title"> 내가 스크랩한 플랜 </div>
	        		<span><i class="chevron circle right icon"></i><a class="plus2" onclick="PlanPlus();">더 보기</a></span>
				<div class="plan-list-inner" id="plan-list-inner">
					<div class="div-plan-list">
						<% if(scrapPlan != null){						
							scrapPlanList = (ArrayList<Plan>)scrapPlan.get("scrapPlan"); //planDao에서 플랜정보를 담은 리스트				
       					for(int i = 0; i < scrapPlanList.size(); i++){        						
       						Plan p = scrapPlanList.get(i);

       						%>
						<div class="planBox map">
						<div class="onlyMap">
							<div class="div-plan-writer">작성자</div>
							<div class="div-writer">
								<%=scrapPlanList.get(i).getpName()%>
							</div>
							<div class="div-plan-title" onclick="goPlanDetail(<%=scrapPlanList.get(i).getpNo()%>);">
							<%=p.getpTitle()%>
							</div>
							<div id="plan-map<%=i%>" class="planMap" readonly></div>
						</div>		
							<div class="div-plan-cities">
								<%=NE.lengthsplit(p.getpCites(),26)%>
							</div>
							<div class="ui labeled button" tabindex="0">
								<div class="ui yellow button">
									<i class="heart icon"></i> 좋아요
								</div>
								<a class="ui basic yellow left pointing label"> <%=p.getpLike() %>
								</a>
							</div>
						</div>
						<%}
       					}%>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<script>
	    function goMyPlan(){
		    	var mno = <%=loginUser.getM_no()%>;
		    	location.href = "<%=request.getContextPath()%>/selectPlanList.pl?mno="+ mno;
		}
		function editProfile() {
			window.open("views/normal/myPage/myPage_profile_edit.jsp","프로필 수정","width=500, height=520, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		}
		
		function QnAPlus(){
			location.href = "/et/views/normal/myPage/myPage_activity_qna.jsp?mno="+<%=loginUser.getM_no()%>;
		}
		
		function PlanPlus(){
			var mno = <%=loginUser.getM_no()%>;
			location.href = "<%=request.getContextPath()%>/allscrapplan.pl?mno="+mno;  	
		}
		
		function goMyActivity(){
    		var mno = <%=loginUser.getM_no()%>;
    		location.href = "<%=request.getContextPath()%>/qnaplan.bo?mno="+mno;
    }
		
		
		
		var map;
		var flightPlanCoordinatesArr = [];
		var flightPlanCoordinates = [];
		var path = {};
 	    
		$(function(){
	 			<% 
	 			if(msg != null){ %>
	 			alert("<%=msg%>");
	 			<%} %>
	 		
				<%
				if(scrapPlanCityMap != null && scrapPlanList != null){
				String[] planCityArr = null;
				System.out.println("jsp scrapPlanList 사이즈 : " + scrapPlanList.size());
				
				for (int i = 0; i < scrapPlanList.size(); i++){
					planCityArr =  (scrapPlanList.get(i).getpCites()).split(", "); // 이건 String
					for(String cityNo : planCityArr){
						%>
						path = {lat : <%=scrapPlanCityMap.get(cityNo).getCtLat()%>, lng : <%=scrapPlanCityMap.get(cityNo).getCtLng()%>};				
						flightPlanCoordinates.push(path); 
					<% }%> 
					flightPlanCoordinatesArr.push(flightPlanCoordinates); 
					flightPlanCoordinates = [];
				<% }%>
				
				<%for(int i = 0; i < scrapPlanList.size();  i++){ %>
		    		
				    var map<%=i%> = new google.maps.Map(document.getElementById('plan-map<%=i%>'), { 
				          zoom: 4.5,
				          center: new google.maps.LatLng(47.778744, 7.397438),
				          mapTypeId: google.maps.MapTypeId.ROADMAP,
				          disableDefaultUI: true,
				          styles: [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"administrative.country","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative.country","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative.province","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative.province","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative.locality","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative.locality","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"administrative.locality","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative.neighborhood","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"administrative.neighborhood","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"all","stylers":[{"hue":"#FFBB00"},{"saturation":43.400000000000006},{"lightness":37.599999999999994},{"gamma":1}]},{"featureType":"landscape","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.landcover","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.landcover","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.terrain","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.terrain","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"poi","elementType":"all","stylers":[{"hue":"#00FF6A"},{"saturation":-1.0989010989011234},{"lightness":11.200000000000017},{"gamma":1}]},{"featureType":"poi.business","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"road","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"all","stylers":[{"hue":"#FFC200"},{"saturation":-61.8},{"lightness":45.599999999999994},{"gamma":1}]},{"featureType":"road.highway.controlled_access","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"road.arterial","elementType":"all","stylers":[{"hue":"#FF0300"},{"saturation":-100},{"lightness":51.19999999999999},{"gamma":1}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"road.local","elementType":"all","stylers":[{"hue":"#FF0300"},{"saturation":-100},{"lightness":52},{"gamma":1}]},{"featureType":"transit","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"transit","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"water","elementType":"all","stylers":[{"hue":"#0078FF"},{"saturation":-13.200000000000003},{"lightness":2.4000000000000057},{"gamma":1}]}]
				    });
				    
				    var lineSymbol = {
				            path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
				            scale: 4,
				            strokeColor: '#EDC53A'
			        };
				    
				   	poly<%=i%> = new google.maps.Polyline({
				    		path : flightPlanCoordinatesArr[<%=i%>],
				        strokeColor: '#2A5A85',
				        strokeOpacity: 1.0,
				        strokeWeight: 3
				    });
			        poly<%=i%>.setMap(map<%=i%>);
			        
			       
			        for (var j = 0; j < flightPlanCoordinatesArr[<%=i%>].length; j++) {
			        marker<%=i%> = new google.maps.Marker({
			            position: flightPlanCoordinatesArr[<%=i%>][j],
			            icon : lineSymbol,
			            map: map<%=i%>
			          });
			        console.log("marker"+j);
			        }
			    <%}%>
		       <%}else{
		    	   System.out.println("else다!!!" ); 
		       }%>
		       });
		
	</script>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>
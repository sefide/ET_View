<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.et.plan.model.vo.*, java.util.*, com.kh.et.member.model.vo.*"%>
<%
	ArrayList<City> cityList = (ArrayList<City>)request.getAttribute("cityList");
	Member loginUser = (Member)request.getSession().getAttribute("loginUser"); 
	
	HashMap<String, Object> planMap = (HashMap<String, Object>)request.getAttribute("planMap"); 
	Plan plan = (Plan)planMap.get("plan");
	ArrayList<PlanDetail> DetailList = (ArrayList<PlanDetail>)planMap.get("planDetailList");
	
	String msg = (String)request.getAttribute("msg");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Semantic UI -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	
	<!-- 글꼴  -->
	<link href="https://fonts.googleapis.com/css?family=Ubuntu:700&amp;subset=latin-ext" rel="stylesheet">
	<title>ET_Planner</title>
	<link rel="icon" href="/et/image/common/logo.png">
	
	<!-- googleMap -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDoMpIr7wrKdZrGsBCW1zoNesmP8fhCdH0" type="text/javascript"></script>
 	
 	<!-- css 불러오기  -->
 	<link href = "/et/views/css/create_plan.css" type = "text/css" rel= "stylesheet">

	
<style>
	body{
		margin:0px;
	}
	
	/* 좌측 일정 - 나라추가  */
	#cityroute{
		width : 100%;
		display : flex;
		flex-wrap: wrap;
		padding : 0 15px;
	}
	
	.div-flex{
		display : flex;
		flex-wrap : wrap;
		width : 100%;
		overflow-x : hidden;
	}
	.bar1{
		width : 35px;
		border-right : 3px solid black; 
		height : 8px;
	}
	
	.bar2{
		width : 35px;
		border-right : 3px solid black; 
		height : 10px;
	}
	.cityblock{
		width : 99%;
		position : relative;
	}
	
	.div-day{
		width : 22%;
	}
	.div-day-circle{
		width : 65px;
 		height : 65px;
		background : white;
		border-radius : 100px;
		border : 3px solid black; 
		cursor: pointer;
		padding-top : 20px;
		padding-left : 6.5px;
	}
	#a-day {
		width : 50px;
	}
	
	select{
		/* -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none; */
		border-radius: 0px;
		background : white;
		border : none;
		font-size : 15px;
	}

	.txt-city{
		float:left; 
		width : 130px;
		margin-top : 15px;
	}
	.div-city{
		width : 50%;
		padding-top : 7px;
		margin : 0 1%;
	}
	.font-city-name{
		font-weight : 700;
		font-family: 'Nanum Gothic', sans-serif;
		font-size : 20px;
	}
	
	.btns-city{
		width : 25%;
		padding-top : 7px;
	}
	#icon-city1, #icon-city2 {
		font-size: 2em;
		margin-top : 15px;
	}
	
	/* 우측 상세히  */
	/* 지도  */
	
	#map-canvas{
		width : 90%;
		height : 850px;
	}
	
	.plan-map{
		width: 75%;
		position: absolute;
	}
	
	#win-title {
		font-weight : 800;
		font-family: 'Nanum Gothic', sans-serif;
	}
	#win-photo{
		width : 80px;
		height : 70px;
		float:left;
		margin-right : 10px;
	}
	#wininfo{
		font-weight : 500;
		font-size : 15px;
		font-family: 'Nanum Gothic', sans-serif;
		margin-top : -20px;
		color : #808080;
	}
	
	#win-info-div{
		width : 330px;
	}
	
	#win-btn{
		float : right ;
	}
	
	.search{
		position: absolute;
		float : right;
		margin-top: 20px;
		right : 2%;
	}
	.input-city{
		width : 250px;
	}
	#cityroute-overflow{
		height : 700px;
		overflow-y : auto;
		border-bottom : 1px solid #808080;
		/* #f2f2f2 */
	}
	
	
	/* 팝  */
	#detailPop{
		position : absolute;
		top : 2%;
		width : 1100px;
		height : 840px;
		overflow-y : auto;
		/* height : 100%; */
		background : rgba(250, 250, 250, 0.9);
		z-index : 1000 !important;
		visibility : hidden; 
		/* display : none; */
	} 
	
	
	.trans-pop{
		position : absolute;
		visibility : hidden;
		width : 800px;
		height : 270px;
		background : rgb(171, 199, 244);
		border-radius : 7px;
		/* border : 3px solid white; */
		top : 100px;
		left : 80px;
		z-index : 2000 !important;	
	}
	/* 여행지 정보 팝업  */
	.p-pop-top{
		text-align : center;
		border-bottom : 1px solid lightgray;
		margin-top : 10px;
	}
	.p-t-name{
		font-weight : 700;
		font-size : 20px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.p-t-price{
		font-weight : 700;
		font-size : 18px;
		font-family: 'Nanum Gothic', sans-serif;
		margin-top : 3%;
		color : rgb(237,197,58);
	}
	.p-t-concept{
		font-weight : 500;
		font-size : 18px;
		font-family: 'Nanum Gothic', sans-serif;
		margin-left : 3%;
		/* <label class ='p-t-concept'>"+ tourConcept+ " </label> */
	}
	
	table {
		/* border : 1px solid lightgray; */
		width: 80%;
	    margin-left: 1.5%;
	    height: 120px;
	    border-radius: 7px;
	}
	caption, colgroup, small, .btn-xs{
		display : none;
	}
	thead > tr {
		height: 35px;
   		font-size: 15px;
   		font-family: 'Nanum Gothic', sans-serif;
   		/* background : white; */
   		border-bottom : 1px solid lightgray;
	}
	tbody {
		font-size: 15px;
		font-family: 'Nanum Gothic', sans-serif;
		text-align : center;
	}
	th{
		background :rgba(171, 199, 244, 0.7);
	}
	
	td {
		border : 1px solid #E1E0E0;
	}
	
	.top10img {
		width : 200px;
		height : 200px;
		border-radius : 5px;
	}
	
	.top10ol li{
		float :left;
		margin : 1%;
	}
	.top10ol h5, .top10ol h5:hover{
		color : black;
		font-size : 14px;
	}
</style>
</head>
<body>
	<div class ="trans-pop">
		<div style = "float : right "> <i class="close icon" id = "icon-close"></i></div>
		<br clear = "both">
		<font id = "trans-pop-txt"> 파리에서 프랑크푸르트 가는 방법 </font>
		<div class = "trans-flex">
			<div class ="trans-in">
				<div class = "tr-circle" onclick = "selTrans(1);">
					<i class="plane icon" id = "icon-trans"></i>
				</div>
				<a class = "trans-txt">비행기 </a>
				<a class ="trans-txt-num">30%</a>
			</div>
			<div class ="trans-in">
				<div class = "tr-circle" onclick = "selTrans(2);">
					<i class="train icon" id = "icon-trans"></i>
				</div>
				<a class = "trans-txt">기차 </a>
				<a class ="trans-txt-num">30%</a>
			</div>
			<div class ="trans-in">
				<div class = "tr-circle" onclick = "selTrans(3);">
					<i class="ship icon" id = "icon-trans"></i>
				</div>
				<a class = "trans-txt">선박 </a>
				<a class ="trans-txt-num">30%</a>
			</div>
			<div class ="trans-in">
				<div class = "tr-circle" onclick = "selTrans(4);">
					<i class="bus icon" id = "icon-trans"></i>
				</div>
				<a class = "trans-txt">버스 </a>
				<a class ="trans-txt-num">30%</a>
			</div>
			<div class ="trans-in">
				<div class = "tr-circle" onclick = "selTrans(5);">
					<i class="rocket icon" id = "icon-trans"></i>
				</div>
				<a class = "trans-txt">기타 </a>
				<a class ="trans-txt-num">30%</a>
			</div>
			
		</div>
	</div>
	
	<form id = "updatePlanForm" action = "<%=request.getContextPath()%>/updatePlan.pl?pno=<%=plan.getpNo()%>" method = "post">
	<div class="header">
		<img src="/et/image/common/logo.png" class = "header-top-img" onclick = "returnMain();">
		<div class ="div-title">
		<font class = "txt-title"><%=plan.getpTitle()%></font>
		<i class="pencil alternate icon" id = "editTitle" onclick = "editTitle();"></i></div>
		<div class="ui input" id = "input-title">
		  <input class = "input-title" type="text" placeholder="나만의 여행제목을 정해주세요.." name = "title" value = "<%=plan.getpTitle()%>">
		  <div id = "btn-save-title" onclick = "saveTitle();"> > </div>
		</div> 
		<!-- <span style=position:absolute;top:15px;left:12px;width:300px;height:48px;font-size:16px;>
			<span style="color: rgb(211, 84, 0); font-size: large;">플랜짜기</span>
		</span> -->
		
		<button class = "btn-save" onclick = "return save();"> 수정완료 </button>
		<button class = "btn-return" onclick = "return returnMain();"> 돌아가기</button>
	</div>
	<div class = "plan-table-calendar">
			<input type = "hidden" name = "writerNo" 
			<%if(loginUser != null) { %>
			value = "<%= loginUser.getM_no()%>"/>
			<% } else {%>
			value = "NoneUser"/>
			 <% } %>
			<font class ="txt-date-start">여행 시작날짜를 입력해주세요 :)</font><br>
			<input type ="date" class = "input-date" id = "input-date-start" name = "startDate" /> -
			<input type ="date" class = "input-date" id = "input-date-end" name = "endDate" readonly/>
			<hr>
			<div id = "cityroute-overflow">
			<div id = "cityroute">
				<!-- 입력된 도시가 없습니다.  -->
			</div>
			</div>
	</div>
	</form>
	
	<div class = "plan-table-map">
		<div id ="detailPop">
			 <i class="window close outline icon" id = "closePop" onclick = "closePop();"></i>
			<div id = "borderPop">
			 <div class = "p-pop-top">
				 <div class = "p-city-name"> </div> <br>
				 <div class = "p-info-div"> 
			     	<img class = "p-info-img" src = "" alt = "city" id = "img-city-detail">
			     	<br><label class ="p-info-txt"> 도시 소개  </label>
			 	</div>
			 	<br><br>
			 </div>
			 <div class ="p-weather-div"> 
			 	<div class ="p-title"><i class="angle right icon"></i> 월 평균 기온 </div>
			 	<div class ="p-flex" id ="weather-div"> 

			 	</div>
			 </div>
			 
			 <div class ="p-tour-div">
			 	<div class ="p-title"><i class="angle right icon"></i> 관련 투어  </div>
				<div class ="p-flex" id = "p-tour-detail"> 
			 		
			 	</div>
			 </div>
			 
			 <div class = "p-place-div">
			 <div class ="p-title"><i class="angle right icon"></i> 관광명소  </div>
			 	<div class ="p-flex p-place"> 
			 	
			 	</div>
			 </div>
			 
			</div>
			<br><br>
		</div>
			
			
	    <!-- 지도 위치  -->
 	 	<!-- <iframe class = "plan-map"  id = "gg-map" src=".." width="100%" height="850px" style="border:none;"></iframe>  -->
 		<div id="map-canvas" class = "plan-map"></div>
 		<!-- style="width: 1000px; height: 700px" -->
		<div class="ui search">
		  <div class="ui icon input">
		    <input class="prompt" type="text" placeholder="Search countries..." id = "input-city">
		    <i class="search icon"></i>
		  </div>
		  <div class="results"></div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js">
	
	var content = [
		  { title: '파리' },
		  { title: 'United Arab Emirates' },
		  { title: 'Afghanistan' },
		  { title: 'Antigua' },
		  { title: 'Anguilla' },
		  { title: 'Albania' },
		  { title: 'Armenia' },
		  { title: 'Netherlands Antilles' },
		  { title: 'Angola' },
		  { title: 'Argentina' },
		  { title: 'American Samoa' },
		  { title: 'Austria' },
		  { title: 'Australia' },
		  { title: 'Aruba' },
		  { title: 'Aland Islands' },
		  { title: 'Azerbaijan' },
		  { title: 'Bosnia' },
		  { title: 'Barbados' },
		  { title: 'Bangladesh' },
		  { title: 'Belgium' },
		  { title: 'Burkina Faso' },
		  { title: 'Bulgaria' },
		  { title: 'Bahrain' },
		  { title: 'Burundi' }
		  // etc
		];
	
	 $('.ui.search').search({ source: content });
	</script>
	

	<!-- Semantic UI -->
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<script> 
		function commaMoney(price) {
			price = price + "";
			var prlen = price.length;
			
			if(prlen > 4 && prlen < 7){
				return price.slice(0, prlen-3) + "," + price.slice(prlen-3);
			}
			if(prlen > 6) {
				return price.slice(0, prlen-6) + "," + price.slice(prlen-6,prlen-3) + "," + price.slice(prlen-3);
			} else {
				return price;
			}
		}
		
		var days = 0;
		var travelStartDate; 
		$(document).ready(function() {
			<% 
 			if(msg != null){ %>
 			alert("<%=msg%>");
 			<%} %>
 			var dayYear ='<%=(plan.getpStartDate().toString()).substring(0,4)%>';
 			var dayMonth = '<%=(plan.getpStartDate().toString()).substring(5,7)%>';
 			var dayDay = '<%=(plan.getpStartDate().toString()).substring(8,10)%>';

 			var startDate = new Date(dayYear, dayMonth-1, dayDay);
		    
			// 시작 날짜 설정 (오늘)
		    var sday = startDate.getDate();
		    var smonth = startDate.getMonth() + 1;
		    var syear = startDate.getFullYear();
			
		    if (smonth < 10) smonth = "0" + smonth;
		    if (sday < 10) sday = "0" + sday;
	
		    var today = syear + "-" + smonth + "-" + sday;    
		    
		    $("#input-date-start").attr("value", today);
		    
		    dayYear ='<%=(plan.getpEndDate().toString()).substring(0,4)%>';
 			dayMonth = '<%=(plan.getpEndDate().toString()).substring(5,7)%>';
 			dayDay = '<%=(plan.getpEndDate().toString()).substring(8,10)%>';
 			
			// 끝 날짜 설정 
		    	var endDate = new Date(dayYear, dayMonth-1, dayDay); 
			
			var eday = endDate.getDate();
		    var emonth = endDate.getMonth() + 1;
		    var eyear = endDate.getFullYear();
	
		    if (emonth < 10) emonth = "0" + emonth;
		    if (eday < 10) eday = "0" + eday;
	
		    var end = eyear + "-" + emonth + "-" + eday; 
		    	
		  
		    $("#input-date-end").val(end);
		    travelStartDate = $("#input-date-start").val();
		});
	
		$("#trans").click(function() {
	        $(".trans-pop").css("visibility", "visible");
	    });
		
		$("#icon-close").click(function(){
			  $(".trans-pop").css("visibility", "hidden");
		});
		
		function selTrans(num){
			switch(num){
				case 1: $("#trans option:eq(0)").prop("selected", true); break;
				case 2: $("#trans option:eq(1)").prop("selected", true); break;
				case 3: $("#trans option:eq(2)").prop("selected", true); break;
				case 4: $("#trans option:eq(3)").prop("selected", true); break;
				case 5: $("#trans option:eq(4)").prop("selected", true); break;
			}
		}

			
		function save(){
			if($("#cityblock1").length > 0){	
				$("#updatePlanForm").submit();
				return true;
			}else{ 
				alert("플랜을 더 작성해주세요. ");
				return false;
			 }
		}
		
		function returnMain(){
			<% if(loginUser != null) { %>
			var mno = <%=loginUser.getM_no()%>;
			location.href = "<%=request.getContextPath()%>/selectPlanList.pl?mno="+mno;
			<% } %>
			return false;
		}
		
		function editTitle() {
			$("#input-title").css("visibility", "visible");
			$(".div-title").css("visibility", "hidden");
		}
		
		function saveTitle() {
			var title = $(".input-title").val();
			if(title != ""){
				$(".txt-title").text(title);
			}
			$("#input-title").css("visibility", "hidden");
			$(".div-title").css("visibility", "visible");
		}
		
		function cityDetail() {
			$("#detailPop").css("visibility", "visible"); 
			/* $("#detailPop").css("display", "block"); */
		   /*  	window.open("detail_city.jsp", "도시 정보창 ", "width=1000, height=700, toolbar=no, menubar=no, location = no, resizable=no, left=400, top=0" ); */  
		}
		
		$(".tr-circle").mouseover(function(){
			$(this).css("background", "teal");
		}).mouseout(function() {
			$(this).css("background","white");
			
		});
		
		$(".p-w").mouseenter(function(){
			$(this).css("background", "teal");
		}).mouseout(function() {
			$(this).css("background","skyblue");
			
		});
		function closePop() {
			$("#detailPop").css("visibility", "hidden");
		}
		
		
		$("#input-date-start").change(function(){
			travelStartDate = $("#input-date-start").val();
			setTravelDate();
		}); 
		
		var nightMoment = 0;
		function focNight(obj){
			nightMoment = $(obj).find(":selected").val();
			
			$(obj).blur();
		}
		
		function selNight(obj){
		    days = days + Number($(obj).find(":selected").val()); 
		    days = days - nightMoment;
			setTravelDate();
		}

		<%String[] cityArr = plan.getpCites().split(", ");%>  /* 도시이름 */

		/* 지도 스크립트 */
		var locations = []; 
		var cityName = "";
		var cityInfo = "";
		var cities = [];
		var exCities = {};
		var exCitiesorder;
		<%for(int i = 0; i < cityList.size(); i++) { %> // 이름, 설명, 위도, 경도, 번호 
			cities = ['<%=cityList.get(i).getCtName()%>', '<%=cityList.get(i).getCtInfo()%>',<%=cityList.get(i).getCtLat()%>,<%=cityList.get(i).getCtLng()%>, <%=cityList.get(i).getCtNo()%>];
			locations.push(cities); 
			
			<%for(int j = 0; j < DetailList.size()+1; j++){ %>
			var isExist = (cities.indexOf('<%=cityArr[j]%>') !== -1);
			exCitiesorder = {};
			if(isExist == true){
				exCitiesorder = <%=i%>;
				exCities['<%=j%>'] = exCitiesorder;
			}

			
			<%}%>
		<% }%> 
		
		function cityDetail(city) {
			$("#detailPop").css("visibility", "visible"); 
			var cityName = locations[city][0];
			var cityNum = locations[city][4];
			$.ajax({
				url : "cityDetail.pl",
				data : {cityName : cityName, cityNum : cityNum},
				contentType : 'application/json; charset=UTF-8',
				type : "get",
				success : function(data){ 
					$("#p-tour-detail").html("");
					$("#weather-div").html("");
					$(".p-place").html("");
					
					var resultStr; 
					var tourOne;
					var tourWeather;
					var tourPlace;
					
					for(var key in data){
						tourOne = data[key];
						var tourName;
						var tourConcept;
						var tourPrice;
						var tourPhoto;
						
						for(var i in tourOne){
							if(i == 't'){
								tourName = tourOne[i].tTitle;
								tourConcept = tourOne[i].tConcept;
								tourPrice = tourOne[i].tPrice;
								tourPrice = commaMoney(tourPrice);

								resultStr = "<div class ='p-t'><div><img class ='p-t-img' src = '/et/tourUpload/"+tourPhoto+"' alt = 'tour'></div><label class ='p-t-name'>["+ tourName+ "] </label><div class ='p-t-price'><label >"+ tourPrice+ "원</label></div></div>";
								$("#p-tour-detail").append(resultStr);
							} else if(i == 'a'){
								tourPhoto = tourOne[i].changeName;
							} else if(i == 'w'){
								tourWeather = "<table>" + tourOne[i] + "</table>";
							} else { // (i == 'p')
								tourPlace = "<ol class = 'top10ol'>" + tourOne[i] + "</ol>";
							}
						}
						
					}
					
					$("#weather-div").append(tourWeather);
					$(".p-place").append(tourPlace);
					
					var topStr = " 여행을 가기 전 알아둬야 할 점 ! ";
					$(".p-city-name").html("<i class='plane icon'></i>" + locations[city][0] + topStr);
					$("#img-city-detail").attr("src", "image/city/"+ cityName	+".jpg");
					$(".p-info-txt").html("&quot;  " + locations[city][1]  + "  &quot;");
					$("thead th").eq(0).html("");
					
				},
				error : function(data){
					console.log("서버 전송 실패");
					console.log(data);
				}
			});
		}
    
        // 맵 정보 설정
        var map = new google.maps.Map(document.getElementById('map-canvas'), { 
          zoom: 6,
          center: new google.maps.LatLng(47.778744, 7.397438),
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          styles: [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"administrative.country","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative.country","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative.province","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative.province","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative.locality","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative.locality","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"administrative.locality","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative.neighborhood","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"administrative.neighborhood","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"all","stylers":[{"hue":"#FFBB00"},{"saturation":43.400000000000006},{"lightness":37.599999999999994},{"gamma":1}]},{"featureType":"landscape","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.landcover","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.landcover","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.terrain","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.terrain","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"poi","elementType":"all","stylers":[{"hue":"#00FF6A"},{"saturation":-1.0989010989011234},{"lightness":11.200000000000017},{"gamma":1}]},{"featureType":"poi.business","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"road","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"all","stylers":[{"hue":"#FFC200"},{"saturation":-61.8},{"lightness":45.599999999999994},{"gamma":1}]},{"featureType":"road.highway.controlled_access","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"road.arterial","elementType":"all","stylers":[{"hue":"#FF0300"},{"saturation":-100},{"lightness":51.19999999999999},{"gamma":1}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"road.local","elementType":"all","stylers":[{"hue":"#FF0300"},{"saturation":-100},{"lightness":52},{"gamma":1}]},{"featureType":"transit","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"transit","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"water","elementType":"all","stylers":[{"hue":"#0078FF"},{"saturation":-13.200000000000003},{"lightness":2.4000000000000057},{"gamma":1}]}]
        });

        
        // 맵 띄우기
        var infowindow = new google.maps.InfoWindow();
        
        // 마커 정보 설정
        var marker, i;
       	
        // 29개의 도시 마커 생성 
        for (i = 0; i < locations.length; i++) { // 마커 찍기 
            marker = new google.maps.Marker({
            position: new google.maps.LatLng(locations[i][2], locations[i][3]),
            map: map,
            animation: google.maps.Animation.DROP
          });
            
        
         // 마커 클릭 시 
		google.maps.event.addListener(marker, 'click', (function(marker, i) {
		     return function() {
		      var cityName = "<h2 id ='win-title'>" + locations[i][0] + "</h2>";
		 	  var cityPhoto = "<img src = '/et/image/city/"+i+".jpg' alt = 'city' id = 'win-photo'>"
		      var cityInfo = "<div id = 'win-info-div'><font id = 'wininfo'>" + locations[i][1] + "<font></div> <br>";
		      var plusBtn = "<div id = 'win-btn'><button class='ui basic button' onclick = 'addCity("+i +");'>추가하기 </button></div><br>";
		      //<span><i class='plus square outline icon' id = 'win-plus-icon' onclick = 'addCity("+i +");'></i><span>
		
		      infowindow.setContent(cityName + cityPhoto + cityInfo + plusBtn);
		      infowindow.open(map, marker);
		     		}
		   	})(marker, i));
		
		 }
        
        
        var countCity = 0;
        var flightPlanCoordinates = [];
        var path = {};
        // 선 정보 설정 
        var poly = new google.maps.Polyline({
            path: flightPlanCoordinates,
            strokeColor: '#2A5A85',
            strokeOpacity: 1.0,
            strokeWeight: 5
        });
  		
        // 플랜에서 이미 정해져 있던 도시 초기화 
        <%for(int i = 0; i < DetailList.size()+2; i++){
        		if(i > 1){%> // 2~
				// 이동 수단 수정 0 ~
				<%-- console.log("<%=DetailList.get(i-2).getPdTrasnfer()%>");  --%>
				$("#cityblock"+(countCity-1)).find("#trans").val("<%=DetailList.get(i-2).getPdTrasnfer()%>");
			<%}
			long diffDays = 0;
			java.util.Date cityStart;
			java.util.Date cityEnd;%>
			// 체류기간 수정 
			<%if (i < DetailList.size()+1){%> // 0 ~ 도시 다 추가하고 
				addCity(exCities[<%=i%>]);  
				<% if (i < DetailList.size()) {%> // 0 ~ 디테일 만큼 추가하고 
				<% // 체류기간 계산 
				cityStart = ((PlanDetail)DetailList.get(i)).getPdStartDate();
				cityEnd = ((PlanDetail)DetailList.get(i)).getPdEndDate();
	       		
	        		} else {
				//  마지막 도시는 직접 추가하자. 
				cityStart = ((PlanDetail)DetailList.get(i-1)).getPdEndDate();
				cityEnd = plan.getpEndDate();
				
				} 
				long diff = cityEnd.getTime() - cityStart.getTime();
				diffDays = diff / (24 * 60 * 60 * 1000) ;
				%>

				$("#cityblock"+(countCity-1)).find("#selectNight").val(<%=diffDays%>);
				days = days + <%=diffDays%>; 
			    days--;
				setTravelDate();
			<%}%>
			
        		
        <%} %>
        
        function addCity(i){
        		var cityblockhead = "<div id ='cityblock" +countCity+ "' class= 'cityblock'> <input type = 'hidden' name = 'cityNo' value = '"+locations[i][4] +"'> <input type = 'hidden' name = 'cityName' value = '"+locations[i][0] +"'> <div class ='bar2'></div>";
        		var citytrans = "<div width = '100%; overflow-x:hidden'> <div class = 'div-trans'> <select class='ui dropdown' id ='trans' name = 'transform'>  <option value='비행기'>비행기 </option>  <option value='기차'>기차 </option>  <option value='선박'>선박 </option>  <option value='버스'>버스 </option>  <option value='기타'>기타  </option> </select> </div> </div> <div class ='bar2'></div>";
        		var citydays = "<div class = 'div-flex'> <div class ='div-day'><div class = 'div-day-circle'>	<select class ='nights' id = 'selectNight' name = 'selectNight' onfocus = 'focNight(this)' onchange = 'selNight(this)'> <option value='1'>1박 </option>  <option value='2'>2박  </option>  <option value='3'>3박  </option>  <option value='4'>4박 </option> <option value='5'>5박  </option> <option value='6'>6박 </option></option><option value='7'>7박 </option><option value='8'>8박 </option><option value='9'>9박 </option><option value='10'>10박 </option></select> </div> </div> <div class = 'div-city'> <div class = 'txt-city'> <span class = 'font-city-name'>"+ locations[i][0] +"</span> </div>	</div> 	<div class ='btns-city' id = 'why'> <i class='info circle icon'  id= 'icon-city1' onclick ='cityDetail("+i+");'></i> <i class='window close icon'  id= 'icon-city2' onclick = 'deleteCity(this);'> </i> </div> </div>";
        		var cityblockfoot = "";
        		
        		// 새로운 도시 div 추가 
        		var content = "";
        		if(countCity == 0){
        			cityblockfoot = "<div class ='bar2'></div> </div>";  // countCity == 0
        			content = cityblockhead + citydays + cityblockfoot;
        		}
        		else {
        			cityblockfoot = "<div class ='bar1'></div> </div>";  // countCity != 0
        			content =  cityblockhead + citytrans + citydays + cityblockfoot;
        		}
			$("#cityroute").append(content);
			
			// city 마지막 인덱스 +1
			countCity++;
			days++;
			
			// 날짜 설정 
			setTravelDate();
			
			poly.setMap(null);
			path = {lat : locations[i][2], lng : locations[i][3]};
            flightPlanCoordinates.push(path);
            
            poly.setPath(flightPlanCoordinates); 
            
            // 선 그리기 
            poly.setMap(map);
		}
        
        
        // 추가한 도시 삭제 
        function deleteCity(obj){ 
	        	// 1. 해당 도시의 인덱스를 가져와서 : deleteCountCity 바뀐 div의 아이디 값의 숫자를 뽑아와야 한다. 
	        	// 2. 해당 인덱스의 도시 div를 삭제한다. 
	        	// 3. 마지막 인덱스의 값을 줄인 후 다른 도시들을 번호 배열을 수정하고 (id 변경)
        		// 4. 해당 도시의 위도, 경도 정보를 지우고
        		// 5. 이를 다시 그려준다. 
        		var parentId = $(obj).parent().parent().parent().attr('id');
	        var delIndex = parentId.substring(9,parentId.length); // 1.
	        
	        var night_sel = $(obj).parent().parent().find("#selectNight").find(":selected").val(); // 박수 가져오기 
    			
	        $("#cityblock" + delIndex).remove(); // 2.
        		
    	        // 3.
    	        countCity--; 
    			days = days - night_sel;  
    			
    			setTravelDate();
    			
    	       	for(var i = 0; i <= countCity; i++){
    	       	 	$("#cityroute").children().eq(i).attr("id", "cityblock"+i);
    	       	}	
    	       
    	       	// 4.
        		flightPlanCoordinates.splice(delIndex, 1); // 해당 도시의 위도, 경도를 삭제하고 알아서 정렬해주는 splice 메소드 
        		
        		poly.setMap(null);
        		/* 
        		for(var i = 0; i < flightPlanCoordinates.length; i++){
        			console.log(flightPlanCoordinates[i].lat + ", " +flightPlanCoordinates[i].lng + "/ ");
        		}*/
            poly.setPath(flightPlanCoordinates);
        		poly.setMap(map);
        		
        		// 도시 마지막 인덱스는 존재할 수 없다. 
        		if(countCity < 0) {
        			alert("에러 발생 _countCity_OutOfIndex");
        		}
        }
        
     	// 여행 기간 지정 
        function setTravelDate(){ 
	   	 	/* // 입력한 날짜를 받아서 넣고 ! 
		    var startDate = new Date(travelStartDate);
		    
			// 끝 날짜 설정 
		    	var endDate = new Date(); 
		    	endDate.setDate(startDate.getDate() + days);
		    console.log("끝날짜 " + endDate.getDate());
		    // 시작 날짜 설정 (사용자가 지정한 날짜 )
		    var sday = startDate.getDate();
		    var smonth = startDate.getMonth() + 1;
		    var syear = startDate.getFullYear();
		
		    if (smonth < 10) smonth = "0" + smonth;
		    if (sday < 10) sday = "0" + sday;
		    var start = syear + "-" + smonth + "-" + sday;    
				    
		    // 종료 날짜 지정 (자동 지정 )
		    	var eday = endDate.getDate();
		    var emonth = endDate.getMonth() + 1;
		    var eyear = endDate.getFullYear();
		
		    if (emonth < 10) emonth = "0" + emonth;
		    if (eday < 10) eday = "0" + eday;
		
		    var end = eyear + "-" + emonth + "-" + eday; 
	    	
	    		$("#input-date-end").val(end);  */
        		var y = $("#input-date-start").val().substring(0,4);
	   	 	var m = $("#input-date-start").val().substring(5,7);
	   	 	var d = $("#input-date-start").val().substring(8,10);
		    var startDate = new Date(y,m-1,d);
		    
		   	// 종료 날짜 정보 설정 
		    	var endDate = new Date(startDate); 
		    endDate.setDate(startDate.getDate() + days);
		    console.log("끝날짜 " + endDate.getDate());
		    
		    // 종료 날짜 지정 (자동 지정 )
		    	var eday = endDate.getDate();
		    var emonth = endDate.getMonth() + 1;
		    var eyear = endDate.getFullYear();
		
		    if (emonth < 10) emonth = "0" + emonth;
		    if (eday < 10) eday = "0" + eday;
		
		    var end = eyear + "-" + emonth + "-" + eday; 
	    	
	    		$("#input-date-end").val(end); 
    	  }
    
      </script>
      
	
</body>
</html>
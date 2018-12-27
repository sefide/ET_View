<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.et.plan.model.vo.*, java.util.*"%>
<%
	ArrayList<City> cityList = (ArrayList<City>)request.getAttribute("cityList");
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
	<script src = "" type="text/javascript"></script>
	
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
		padding-left : 10px;
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
	/* .nights{
		color : rgba(50,50,50);
		 #FFC23C
		font-size : 15px;
		font-weight : 600;
	} */
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
	#win-info{
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
		margin-top: 20px;
		margin-left : 20px;
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
	
</style>
</head>
<body>
	<div class="header">
		<img src="/et/image/common/logo.png" class = "header-top-img" onclick = "returnMain();">
		<div class ="div-title">
		<font class = "txt-title" name = "title">Plan 1</font>
		<i class="pencil alternate icon" id = "editTitle" onclick = "editTitle();"></i></div>
		<div class="ui input" id = "input-title">
		  <input class = "input-title" type="text" placeholder="나만의 여행제목을 정해주세요.." >
		  <button id = "btn-save-title" onclick = "saveTitle();"> > </button>
		</div> 
		<!-- <span style=position:absolute;top:15px;left:12px;width:300px;height:48px;font-size:16px;>
			<span style="color: rgb(211, 84, 0); font-size: large;">플랜짜기</span>
		</span> -->
		
		<button class = "btn-save" onclick = "save();"> 저장하기</button>
		<button class = "btn-return" onclick = "returnMain();"> 돌아가기</button>
	</div>
	
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
	
	<div class = "plan-table-calendar">
		<form>
			<font class ="txt-date-start">여행 시작날짜를 입력해주세요 :)</font><br>
			<input type ="date" class = "input-date" id = "input-date-start" name = "startDate" /> -
			<input type ="date" class = "input-date" id = "input-date-end" name = "endDate" disabled/>
			<hr>
			<div id = "cityroute-overflow">
			<div id = "cityroute">
				<!-- 입력된 도시가 없습니다.  -->
			</div>
			</div>
			
			<%-- <div id='calendar-div'>
			<%@include file = "calendar_plan.jsp" %>
			</div> --%>
		</form>
		
	</div>
	
	<div class = "plan-table-map">
			<div id ="detailPop">
				 <i class="window close outline icon" id = "closePop" onclick = "closePop();"></i>
				<div id = "borderPop">
				 
				 <div class = "p-city-name">파리 여행을 가기 전 알아둬야 할 점 ! </div> <br>
				 <div class = "p-info-div"> 
			     	<img class = "p-info-img" src = "/et/image/city/paris.jpg" alt = "paris">
			     	<label class ="p-info-txt"> 간단 소개내용  </label>
			     	
				 </div>
				 <br>
				 <div class ="p-weather-div"> 
				 	<div class ="p-title"> 월 평균 기온 </div>
				 	<div class ="p-flex" id ="weather-div"> 
				 		<div class ="p-w">1월 </div>
				 		<div class ="p-w">2월 </div>
				 		<div class ="p-w">3월 </div>
				 		<div class ="p-w">4월 </div>
				 		<div class ="p-w">5월 </div>
				 		<div class ="p-w">6월 </div>
				 		<div class ="p-w">7월 </div>
				 		<div class ="p-w">8월 </div>
				 		<div class ="p-w">9월 </div>
				 		<div class ="p-w">10월 </div>
				 		<div class ="p-w">11월 </div>
				 		<div class ="p-w">12월 </div>
				 	</div>
				 </div>
				 <div class = "p-place-div">
				 <div class ="p-title"> 인기명소  </div>
				 	<div class ="p-flex"> 
				 		<div class ="p-p">
				 			<div><img class ="p-p-img" src ="/et/image/city/paris.jpg"></div>
				 			<div><label class ="p-p-name">관광지명 </label></div>
				 		</div>
				 		<div class ="p-p">
				 			<div><img class ="p-p-img"></div>
				 			<div><label class ="p-p-name">관광지명 </label></div>
				 		</div>
				 		<div class ="p-p">
				 			<div><img class ="p-p-img"></div>
				 			<div><label class ="p-p-name">관광지명 </label></div>
				 		</div>
				 		<div class ="p-p">
				 			<div><img class ="p-p-img"></div>
				 			<div><label class ="p-p-name">관광지명 </label></div>
				 		</div>
				 		<div class ="p-p">
				 			<div><img class ="p-p-img"></div>
				 			<div><label class ="p-p-name">관광지명 </label></div>
				 		</div>
				 		<div class ="p-p">
				 			<div><img class ="p-p-img"></div>
				 			<div><label class ="p-p-name">관광지명 </label></div>
				 		</div>
				 	</div>
				 </div>
				 <div class ="p-tour-div">
				 	<div class ="p-title"> 관련 투어  </div>
					<div class ="p-flex"> 
				 		<div class ="p-t">
				 			<div><img class ="p-t-img"></div>
				 			<label class ="p-t-name">투어명 </label>
				 			<label class ="p-t-price">가격 </label>
				 		</div>
				 		<div class ="p-t">
				 			<div><img class ="p-t-img"></div>
				 			<label class ="p-t-name">투어명 </label>
				 			<label class ="p-t-price">가격 </label>
				 		</div>
				 		<div class ="p-t">
				 			<div><img class ="p-t-img"></div>
				 			<label class ="p-t-name">투어명 </label>
				 			<label class ="p-t-price">가격 </label>
				 		</div>
				 		<div class ="p-t">
				 			<div><img src ="/et/image/city/paris.jpg" class ="p-t-img"></div>
				 			<label class ="p-t-name">투어명 </label>
				 			<label class ="p-t-price">가격 </label>
				 		</div>
				 		
				 	</div>
				 </div>
				 
				</div>
			</div>
			
	    <!-- 지도 위치  -->
 	 	<!-- <iframe class = "plan-map"  id = "gg-map" src=".." width="100%" height="850px" style="border:none;"></iframe>  -->
 		<div id="map-canvas" class = "plan-map"></div>
 		<!-- style="width: 1000px; height: 700px" -->
		<div class="ui search">
		  <div class="ui icon input input-city">
		    <input class="prompt input-city" type="text" placeholder="Search countries...">
		    <i class="search icon"></i>
		  </div>
		  <div class="results"></div>
		</div>
	</div>
	

	<!-- Semantic UI -->
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<script> 
		var days = 0;
		
		$(document).ready(function() {
		    var startDate = new Date();
		    
			// 시작 날짜 설정 (오늘)
		    var sday = startDate.getDate();
		    var smonth = startDate.getMonth() + 1;
		    var syear = startDate.getFullYear();
	
		    if (smonth < 10) smonth = "0" + smonth;
		    if (sday < 10) sday = "0" + sday;
	
		    var today = syear + "-" + smonth + "-" + sday;    
		    
			// 끝 날짜 설정 
		    	var endDate = new Date(); 
			
		    	endDate.setDate(startDate.getDate() + days);
		    	
		    	var eday = endDate.getDate();
		    var emonth = endDate.getMonth() + 1;
		    var eyear = endDate.getFullYear();
	
		    if (emonth < 10) emonth = "0" + emonth;
		    if (eday < 10) eday = "0" + eday;
	
		    var end = eyear + "-" + emonth + "-" + eday; 
		    	
		    $("#input-date-start").attr("value", today);
		    $("#input-date-end").attr("value", today);
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

			
		function save(){}
		function returnMain(){
			location.href = "/et/index.jsp";
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
			alert("why");
			/* $("#detailPop").css("visibility", "visible"); */
			$("#detailPop").css("display", "block");
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
			$("#detailPop").css("display", "none");
		}
		
		var travelStartDate;
		$("#input-date-start").change(function(){
			travelStartDate = $("#input-date-start").attr("value");
			console.log(travelStartDate);
			
			console.log($("#input-date-end").attr("value"));
		}); 
		
		
	
	
	<!--  지도 스크립트 -->

	var locations = []; 
	var cityName = "";
	var cityInfo = "";
	var cities = [];
	
	 <%for(int i = 0; i < cityList.size(); i++) { %> // 이름, 설명, 위도, 경도
		cities = ['<%=cityList.get(i).getCtName()%>', '<%=cityList.get(i).getCtInfo()%>',<%=cityList.get(i).getCtLat()%>,<%=cityList.get(i).getCtLng()%>];
		locations.push(cities); 
	<% }%> 
       
    
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
       
        for (i = 0; i < locations.length; i++) { // 마커 찍기 
            marker = new google.maps.Marker({
            position: new google.maps.LatLng(locations[i][2], locations[i][3]),
            map: map,
            animation: google.maps.Animation.DROP
          });
            
    
       google.maps.event.addListener(marker, 'click', (function(marker, i) {// 마커 선택 시 
            return function() {
	            var cityName = "<h2 id ='win-title'>" + locations[i][0] + "</h2>";
	       	    var cityPhoto = "<img src = '/et/image/city/"+i+".jpg' alt = 'city' id = 'win-photo'>"
	            var cityInfo = "<div id = 'win-info-div'><font id = 'win-info'>" + locations[i][1] + "<font></div> <br>";
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
        
        function addCity(i){
        		var cityblockhead = "<div id ='cityblock" +countCity+ "' class= 'cityblock'> <input type = 'hidden' name = 'city' value = '"+i+"'> <div class ='bar2'></div>";
        		var citytrans = "<div width = '100%; overflow-x:hidden'> <div class = 'div-trans'> <select class='ui dropdown' id ='trans' name = 'transform'>  <option value='plane'>비행기 </option>  <option value='train'>기차 </option>  <option value='ship'>항구 </option>  <option value='bus'>버스 </option>  <option value='etc'>기타  </option> </select> </div> </div> <div class ='bar2'></div>";
        		var citydays = "<div class = 'div-flex'> <div class ='div-day'><div class = 'div-day-circle'>	<select class ='nights' > <option value='one'>1박 </option>  <option value='two'>2박  </option>  <option value='three'>3박  </option>  <option value='four'>4박 </option> <option value='five'>5박  </option> </select> </div> </div> <div class = 'div-city'> <div class = 'txt-city'> <span class = 'font-city-name'>"+ locations[i][0] +"</span> </div>	</div> 	<div class ='btns-city' id = 'why'> <i class='info circle icon'  id= 'icon-city1' onclick ='cityDetail();'></i> <i class='window close icon'  id= 'icon-city2' onclick = 'deleteCity("+countCity + ");'> </i> </div> </div>";
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
        
        function setTravelDate(){
        	 	console.log(travelStartDate);
 		    var startDate = new Date();
 		    startDate.setDate(travelStartDate);
 		    
 			// 끝 날짜 설정 
 		    	var endDate = new Date(); 
 		    	endDate.setDate(startDate.getDate() + days);
 		    	
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
 		    	
 		    $("#input-date-start").attr("value", start);
 		    $("#input-date-end").attr("value", end); 
        }
        
        // 추가한 도시 삭
        function deleteCity(deleteCountCity){ 
        	
	        	// 1. 해당 도시의 인덱스를 가져와서 : deleteCountCity
	        	// 2. 해당 인덱스의 도시 div를 삭제한다. 
	        	// 3. 마지막 인덱스의 값을 줄인 후 다른 도시들을 번호 배열을 수정하고 (id 변경)
        		// 4. 해당 도시의 위도, 경도 정보를 지우고
        		// 5. 이를 다시 그려준다. 
        		$(this).parent().parent().css("background", "red");
        		var divid = $(this).attr("id");
	        var delIndex = deleteCountCity; // 1.
	        console.log("삭제할 아이디  - " + divid);
    			console.log("삭제할 번호 - " + delIndex);
    			
    			$("#cityblock" + delIndex).remove(); // 2.
        		
    	        // 3.
    	        countCity--; 
    			days--;
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
        
     
      </script>
      
    
	
	      
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js">
	$('.ui.search').search({
	    source: content
	 });
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
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.et.plan.model.vo.*, java.util.*"%>
<% 
	HashMap<String, Object> planMap = (HashMap<String, Object>)request.getAttribute("planMap"); 
	Plan plan = (Plan)planMap.get("plan");
	ArrayList<PlanDetail> DetailList = (ArrayList<PlanDetail>)planMap.get("planDetailList");
	HashMap<String,City> cityMap = (HashMap<String,City>)request.getAttribute("cityMap");
	
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<!-- Semantic UI -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<!-- 글꼴  -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Ubuntu" rel="stylesheet">
	
	<!-- googleMap -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDoMpIr7wrKdZrGsBCW1zoNesmP8fhCdH0" type="text/javascript"></script>
	
	<title>ET_Planner</title>
	<link rel="icon" href="/views/image/common/logo.png">

	
<style>
	.div-flex {
    		width : 100%;
    		display : flex;
    		flex-wrap : wrap;
    }
    .div-left {
    		width : 58%;
    }
    .div-right {
    		width : 38%;
    }
    .div-plan-top {
    		width : 100%;
    		display : flex;
    		flex-wrap : wrap;
    }
    #plan-title{
    		width : 86%;
    		font-size : 25px;
    		font-weight : 800;
    		font-family: 'Nanum Gothic', sans-serif;
    }
    
    #plan-btns {
    		width : 12%;
    }
    #seeInfo, #setting{
    		font-size : 24px;
    }
    
    #map-canvas{
    		width : 97%;
    		margin : 1% 1% 1% 0;
    		height : 600px;
    }
    
    /* 팝업창  */
    .div-absolute{
        	position : absolute;
        	background : rgba(253,253,253,0.9);
        	width : 300px;
        	height : 115px;
        	border-radius : 7px;
        	z-index : 1000;
        	left : 50%;
        	top : 60px;
        visibility : hidden;
    }
    .plan-infoBox{
    		margin : auto;
    		border : 1px solid gray;
    		width : 95%;
    		height : 90%;
    		border-radius : 7px;
    		padding : 3%;
    }
    .txt{
    		font-size : 18px;
    		font-family: 'Nanum Gothic', sans-serif;
    		color : gray;
    }
    
    #selectSetting{
    	 	position : absolute;
    	 	visibility : hidden;
 	 	top : 60px;
 	 	font-size : 20px;
 	 	z-index : 1000;
 	 	background : white;
 	 	border : 3px solid white;
    }
    .settingBtn{
    		border : 1px solid lightgray;
    		border-radius : 7px;
    		color : gray;
    		cursor : pointer;
    }
    
    .fc-event,
	.fc-agenda .fc-event-time,
	.fc-event a {
		border-style: solid; 
		border-color: rgb(42,90,133) !important;    /* default BORDER color (probably the same as background-color) */
		background-color: rgb(42,90,133) !important; /* default BACKGROUND color */
		color: #fff;            /* default TEXT color */
	}
	
	.fc-header .fc-state-disabled span {
	border-color: #fff #fff #f0f0f0 !important; /* inner border */
	background: black !important;
	}
    
</style>

</head>
<body>
	<!-- navigation -->
	<%@ include file = "/views/common/normal/header.jsp" %>
    

    <div class="ui grid">
        <div class = "one wide column"></div>
        <div class = "fourteen wide column" style="margin-top:110px;">
        
        <div class = "div-flex">
	        	<div class = "div-left">
	        		<div class ="div-plan-top">
	        			<div class = "" id= "plan-title"><%=plan.getpTitle() %> </div> 
	        			<div class = "" id = "plan-btns">
	        				<i class="info icon" id = "seeInfo" >
	        				<div id ="selectSetting">
	        					<button class = "settingBtn" id = "Update"> 수정하기 </button>
	        					<button class = "settingBtn" id = "Delete"> 삭제하기 </button>
	        				</div>
	        				</i>
	        				<i class="cog icon" id = "setting" ></i>
	        			</div>
	        			<div class ="div-absolute" >
			        <div class ="plan-infoBox">
				        	<div class = "txt"> 첫 작성날짜 : <%=plan.getpDate().toString() %></div>
				        	<div class = "txt"> 공개/비공개 : <% if(plan.getpPrivate().equals("Y")) { %> 공개 <%} else { %> 비공개 <%} %></div>
				        	<div class = "txt"> 여행도시 개수 : <%=plan.getpCites().split(", ").length %>개 도시 </div>
				    </div>
			        </div>
	        		</div>
	        		<div id = "map-canvas"></div>
	        	</div>
	        	 
	        <div class = "div-right"> 
		        <div class = "calendar" style="margin-top:50px;">
		        		<%-- <%@ include file = "/views/normal/plan/calendar_plan.jsp" %> --%>
		        		<div id='calendar'></div>
		        </div>
		        <div class = "div-plan-info">
		        		<div>좋아요, 스크랩개수 </div>
		        </div>
	        </div>
        </div>
        
        
        
        </div>
        <div class = "one wide column"></div>
   	</div>
   	
   	<!-- footer -->
   	<script>
   		var toggle1 = 0;
   		$("#setting").click(function() {
			if(toggle1 == 0){
				$("#selectSetting").css("visibility", "visible");
				toggle1 = 1;
   			}else {
   				$("#selectSetting").css("visibility", "hidden");
   				toggle1 = 0;
   			}
		});
   		$("#Delete").click(function() {
			location.href = "<%=request.getContextPath()%>/deletePlan.pl?pno="+<%=plan.getpNo()%>;
			$("#selectSetting").css("visibility", "hidden");
			toggle1 = 0;
		});
   		$("#Update").click(function() {
   			location.href = "<%=request.getContextPath()%>/selectPlanForUpdate.pl?pno="+<%=plan.getpNo()%>;
   			$("#selectSetting").css("visibility", "hidden");
   			toggle1 = 0;
   		});
   		
   		var toggle2 = 0;
   		$("#seeInfo").click(function() {
   			if(toggle2 == 0){
   				$(".div-absolute").css("visibility", "visible");
   				toggle2 = 1;
   			}else {
	   			$(".div-absolute").css("visibility", "hidden");
	   			toggle2 = 0;
   			}
   		});
   		
   		var flightPlanCoordinates = [];
        var path = {};
   		/* 지도  */
   		// 맵 정보 설정
        var map = new google.maps.Map(document.getElementById('map-canvas'), { 
          zoom: 5,
          center: new google.maps.LatLng(47.778744, 7.397438),
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          styles: [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"administrative.country","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative.country","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative.province","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative.province","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative.locality","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative.locality","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"administrative.locality","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative.neighborhood","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"administrative.neighborhood","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"all","stylers":[{"hue":"#FFBB00"},{"saturation":43.400000000000006},{"lightness":37.599999999999994},{"gamma":1}]},{"featureType":"landscape","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.landcover","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.landcover","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.terrain","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.terrain","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"poi","elementType":"all","stylers":[{"hue":"#00FF6A"},{"saturation":-1.0989010989011234},{"lightness":11.200000000000017},{"gamma":1}]},{"featureType":"poi.business","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"road","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"all","stylers":[{"hue":"#FFC200"},{"saturation":-61.8},{"lightness":45.599999999999994},{"gamma":1}]},{"featureType":"road.highway.controlled_access","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"road.arterial","elementType":"all","stylers":[{"hue":"#FF0300"},{"saturation":-100},{"lightness":51.19999999999999},{"gamma":1}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"road.local","elementType":"all","stylers":[{"hue":"#FF0300"},{"saturation":-100},{"lightness":52},{"gamma":1}]},{"featureType":"transit","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"transit","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"water","elementType":"all","stylers":[{"hue":"#0078FF"},{"saturation":-13.200000000000003},{"lightness":2.4000000000000057},{"gamma":1}]}]
        });
   		
   		
		<%
        String[] planCityArr = null;
		planCityArr =  (plan.getpCites()).split(", "); // 이건 String
		for(String cityNo : planCityArr){
			%> path = {lat : <%=cityMap.get(cityNo).getCtLat()%>, lng : <%=cityMap.get(cityNo).getCtLng()%>};
			flightPlanCoordinates.push(path); 
		<%}%>
        
       /*  // 맵 띄우기
        var infowindow = new google.maps.InfoWindow(); */
	    		    
	    var lineSymbol = {
	            path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
	            scale: 4,
	            strokeColor: '#EDC53A'
       	};
	    		    
	   	poly = new google.maps.Polyline({
	    		path : flightPlanCoordinates,
	        strokeColor: '#2A5A85',
	        strokeOpacity: 1.0,
	        strokeWeight: 5
	    });
        poly.setMap(map);
        
        for(var i = 0; i <<%=planCityArr.length%>; i++){
        		marker = new google.maps.Marker({
                position: flightPlanCoordinates[i],
                icon : lineSymbol,
                map: map
              });
            
        }
        
        $(document).ready(function() {
			<% 
 			if(msg != null){ %>
 			alert("<%=msg%>");
 			<%} %>
 		});
        
   	
   	</script>
   
   	<!-- 달력 -->
   	<link rel='stylesheet' type='text/css' href='http://www.blueb.co.kr/data/201010/IJ12872423858253/theme.css' />
   	
	<link rel='stylesheet' type='text/css'
	href='http://www.blueb.co.kr/data/201010/IJ12872423858253/fullcalendar.css' />
	<script type='text/javascript'
		src='http://www.blueb.co.kr/data/201010/IJ12872423858253/jquery.js'></script>
	<script type='text/javascript'
		src='http://www.blueb.co.kr/data/201010/IJ12872423858253/jquery-ui-custom.js'></script>
	<script type='text/javascript'
		src='http://www.blueb.co.kr/data/201010/IJ12872423858253/fullcalendar.min.js'></script>
	<script>
	var jb = jQuery.noConflict();
	
	jb(document).ready(function() {
		var y ='<%=(plan.getpStartDate().toString()).substring(0,4)%>';
		var m = '<%=(plan.getpStartDate().toString()).substring(5,7)%>';
		var d = '<%=(plan.getpStartDate().toString()).substring(8,10)%>';
		var date = new Date(y, m-1, d);
		
		/* var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear(); */
		var event = [];
		var eventInfo = {};
		var sy, sm, sd;
		var ey, em, ed;
		var title;
		<%
		java.util.Date cityStart;
		java.util.Date cityEnd;
		String[] cityArr = plan.getpCites().split(", ");
		for(int i = 0; i < cityArr.length; i++){ // 0 ~ 여행 도시 개수 
			if(i < cityArr.length-1){ // 0 ~ 플랜디테일 사이즈 개수 
			    cityStart = ((PlanDetail)DetailList.get(i)).getPdStartDate();
			    cityEnd = ((PlanDetail)DetailList.get(i)).getPdEndDate(); %>
				sy = <%=cityStart.toString().substring(0,4)%>;
				sm = <%=cityStart.toString().substring(5,7)%>;
				sd = <%=cityStart.toString().substring(8,10)%>;
				ey = <%=cityEnd.toString().substring(0,4)%>;
				em = <%=cityEnd.toString().substring(5,7)%>;
				ed = <%=cityEnd.toString().substring(8,10)%>; 
				console.log(sy + ", " + sm + ", " + sd + "/ " + ey + ", " + em + ", " + ed);
 			<%} else { 
				cityStart = ((PlanDetail)DetailList.get(i-1)).getPdEndDate();
				cityEnd = plan.getpEndDate(); %>
				sy = <%=cityStart.toString().substring(0,4)%>;
				sm = <%=cityStart.toString().substring(5,7)%>;
				sd = <%=cityStart.toString().substring(8,10)%>;
				ey = <%=cityEnd.toString().substring(0,4)%>;
				em = <%=cityEnd.toString().substring(5,7)%>;
				ed = <%=cityEnd.toString().substring(8,10)%>; 
				console.log(sy + ", " + sm + ", " + sd + "/ " + ey + ", " + em + ", " + ed);
			 <% } %>
			 title = '<%=cityArr[i]%>';
			 eventInfo = {title : title, start : new Date(sy,sm-1,sd), end : new Date(ey,em-1,ed)};
			 event.push(eventInfo);
			 console.log(eventInfo);
		<%}%>
		
		
			/* {
				title: 'Long Event',
				start: new Date(y, m, d-5),
				end: new Date(y, m, d-2)
			}]; */
		jb('#calendar').fullCalendar({
			theme: true,
			header : {
				/* left : 'title', */
				/* center : 'agendaDay,agendaWeek,month', */
				left : '',
				center : 'title',
				right : 'prev, next'
			},
			editable: false,
			events: event
		});
		
/* 		events.push
 */		
	});

</script>
	
</body>
</html>

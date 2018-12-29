<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.et.plan.model.vo.*, java.util.*"%>
<% 
	HashMap<String, Object> planMap = (HashMap<String, Object>)request.getAttribute("planMap"); 
	Plan plan = (Plan)planMap.get("plan");
	ArrayList<PlanDetail> DetailList = (ArrayList<PlanDetail>)planMap.get("planDetailList");
	HashMap<String,City> cityMap = (HashMap<String,City>)request.getAttribute("cityMap");
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
    		width : 88%;
    		font-size : 25px;
    		font-weight : 800;
    		font-family: 'Nanum Gothic', sans-serif;
    }
    #plan-btns {
    		width : 10%;
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
	        				<i class="info icon" id = "seeInfo" ></i>
	        				<i class="cog icon" id = "setting"  onclick = "goSetting();"></i>
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
		        		<%@ include file = "/views/normal/plan/calendar_plan.jsp" %>
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
   		function goSetting(){
   			location.href = "<%=request.getContextPath()%>/selectPlanForUpdate.pl?pno="+<%=plan.getpNo()%>;
   		}
   		
   		$("#seeInfo").toggle(function() {
   			$(".div-absolute").css("visibility", "visible");
   		}, function() {
   		  $(".div-absolute").css("visibility", "hidden");
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
        
   	
   	</script>
</body>
</html>


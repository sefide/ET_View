<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.et.board.model.vo.*, com.kh.et.plan.model.vo.*, com.kh.et.tourBoard.model.vo.*"%>

<%
	String msg = (String) request.getAttribute("msg");

	HashMap<String, Object> bestplanMap = (HashMap<String, Object>) request.getAttribute("bestplanMap");	
	HashMap<String, City> cityMap = null;	
	ArrayList<Plan> planList = null;
	if (bestplanMap != null) {
		cityMap = (HashMap<String, City>) bestplanMap.get("bestCityMap");
	}
	
	HashMap<String, Object> normalPlanMap = (HashMap<String, Object>) request.getAttribute("normalPlanMap");	
	HashMap<String, City> nCityMap = null;	
	ArrayList<Plan> nPlanList = null;
	if (normalPlanMap != null) {
		nCityMap = (HashMap<String, City>) normalPlanMap.get("normalCityMap");
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<!-- 버튼 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- googleMap -->
 	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDoMpIr7wrKdZrGsBCW1zoNesmP8fhCdH0" type="text/javascript"></script>


<title>ET_Planner</title>
<link rel="icon" href="/views/image/common/logo.png">

<style>
/* 인기플랜  */
.div-plan-list {
	margin-left: 10px;
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
	color : #2A5A85 ;
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
	<%@ include file="/views/common/normal/header.jsp"%>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px;">

			<!-- 내용 넣기 -->


			<!-- 인기플랜이 보여지는 div -->
			<div >
				<div class="ui mt-20">

					<div class="ui huge header" style="margin-top: 15px;">인기 플랜 보기</div>
					<div>
						<div class="div-plan-list" >
							<% if(bestplanMap!= null){								
        					planList = (ArrayList<Plan>)bestplanMap.get("planList");       					
        					for(int i = 0; i < planList.size(); i++){        						
        						Plan p = planList.get(i);

        						%>
        						<!-- System.out.println("view에서 보여지는 p"+p); -->
							<div class ="div-plan-map"> 
        					    <div id ="plan-map<%=i%>" class ="plan-map"></div>
        						
        						<div class = "div-plan-title" onclick = "goPlanDetail(<%=planList.get(i).getpNo()%>);"> <%=p.getpTitle()%> </div>
        						<br>
								<div class="ui labeled button" tabindex="0" >
									<div class="ui yellow button">
										<i class="heart icon"></i> 좋아요
									</div>
									<a class="ui basic yellow left pointing label"> <%=p.getpLike() %> </a>
								</div>
        					</div>
        					<%}
        				}%>
        				 
							
						</div>
					</div>
				</div>
			</div>
			<script>
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
					if(cityMap != null && planList != null){
					String[] planCityArr = null;
					
					
					for (int i = 0; i < planList.size(); i++){
						planCityArr =  (planList.get(i).getpCites()).split(", "); // 이건 String
						for(String cityNo : planCityArr){
							%>
							path = {lat : <%=cityMap.get(cityNo).getCtLat()%>, lng : <%=cityMap.get(cityNo).getCtLng()%>};				
							flightPlanCoordinates.push(path); 
						<% }%> 
						flightPlanCoordinatesArr.push(flightPlanCoordinates); 
						flightPlanCoordinates = [];
					<% }%>
					
					<%for(int i = 0; i < planList.size();  i++){ %>
			    		
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
			       <%}%>
					 });
		 			
			 function goPlanDetail(pno){
				 
				 location.href = "<%=request.getContextPath()%>/selectPlanDetail.pl?pno="+pno ;
			   }
			
			</script>
			
			
			
			
			
			
			
			<br><br>
			

			<br>
			<!-- 플랜 검색 div -->
			<!-- <div>
				<div class="row">
					<div class="col-md-6">
						<!-- <h2>Custom search field</h2> 
						<div id="custom-search-input">
							<div class="input-group col-md-12" id="div-search-plan">
								<input type="text" class="form-control input-lg"
									placeholder="여행플랜검색" /> <span class="input-group-btn">
									<button class="btn btn-info btn-lg" type="button">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>  -->


			<hr>
			
			<!-- 모든 플랜 보기 -->
			<div>
				<div class="ui mt-20">
					<div class="ui huge header" > 모든 플랜 보기</div>
					<div>
						<div class="div-plan-list" ">
							<% if(normalPlanMap!= null){								
								nPlanList = (ArrayList<Plan>)normalPlanMap.get("nPlanList");        						
        					
        					for(int i = 0; i < nPlanList.size(); i++){        						
        						Plan p = nPlanList.get(i);
        						%>
        						<!-- System.out.println("view에서 보여지는 p"+p); -->
							<div class ="div-plan-map"> 
        					    <div id ="plan-map1<%=i%>" class ="plan-map"></div>  
        						<div class = "div-plan-title"><%=p.getpTitle() %></div>
        						<br>
        						<div class = "div-plan-like"> 
        							<i class = "icon heart"><%=p.getpLike() %></i>
        						</div>
        					
        					</div>
        					<%}
        				}%>							
						</div>					
					</div>
				</div>
			</div>	
			
			<script>
			var map;
			var flightPlanCoordinatesArr = [];
			var flightPlanCoordinates = [];
			var path = {};
			
			$(function () {
				<%				
				if(nCityMap != null && nPlanList != null){
				String[] planCityArr1 = null;
				
				
				for (int i = 0; i < nPlanList.size(); i++){
					planCityArr1 =  (nPlanList.get(i).getpCites()).split(", "); // 이건 String
					for(String cityNo : planCityArr1){
						%>
						path = {lat : <%=nCityMap.get(cityNo).getCtLat()%>, lng : <%=nCityMap.get(cityNo).getCtLng()%>};				
						flightPlanCoordinates.push(path); 
					<% }%> 
					flightPlanCoordinatesArr.push(flightPlanCoordinates); 
					flightPlanCoordinates = [];
				<% }%>
				
				<%for(int i = 0; i < nPlanList.size();  i++){ %>
		    		// 해당하는 플랜의 도시 배열을 뽑아서 배열값을 나눈 다음에
		    		// 여행하는 도시의 번호를 가져와서 도시리스트에서 위도, 경도를 구한다.
		    		// 위도 경도 값을 해당하는 플랜의 도시 순서대로 PATH를 넣는다. 
				    var map<%=i%> = new google.maps.Map(document.getElementById('plan-map1<%=i%>'), { 
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
			
			












			<!-- --------------->
		</div>
		<div class="two wide column"></div>
	</div>

	<!-- Semantic UI -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>



	<%@ include file="/views/common/normal/footer.jsp"%>



	<
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.et.board.model.vo.*, com.kh.et.plan.model.vo.*, com.kh.et.tourBoard.model.vo.*, com.kh.et.common.*"%>

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
	
	com.kh.et.board.model.vo.PageInfo pi = (com.kh.et.board.model.vo.PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int limit = pi.getLimit();
    System.out.println("s : " + startPage+", e : " + endPage);
    
    NumberExec Ne = new NumberExec();
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
	width : 100%;
	display : flex;
	flex-wrap : wrap;
}

.div-plan-map {
	width : 30%;
	height: 430px;
	display: inline-block;
	margin: 1.4%;
	cursor : pointer;
}

.plan-map {
	width: 95%;
	height: 330px;
}

.div-plan-title {
	font-size: 25px;
	font-weight: 600;
	font-family: 'Ubuntu', sans-serif;
	color : #2A5A85 ;
	display: inline-block;
	cursor: pointer;
	text-align :center;
	width : 95%;
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

.pagingArea button {
	background : white;
	border : none;
}

#famous-plan-div{
	border : 1px solid rgb(237,197,58);
	border-radius : 7px;
	padding-bottom : 20px;
}
#bottom-contents{
	padding-top : 20px;
	border-top : 1px solid lightgray;
}
.div-interest{
	width : 95%;
	font-size : 16px;
	margin-top : 5px;
	text-align : right;
}
.div-plan-cities{
	width : 95%;
	color : gray;
	text-align : center;
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
			<div>
				<div class="ui mt-20" style="margin-top: 50px;">

					<div class="ui huge header"><a class="ui yellow label">HOT</a> &nbsp; 인기 플랜 TOP 3</div>
					<div>
						<div class="div-plan-list" id = "famous-plan-div">
							<% if(bestplanMap!= null){								
        					planList = (ArrayList<Plan>)bestplanMap.get("planList");       					
        					for(int i = 0; i < planList.size(); i++){        						
        						Plan p = planList.get(i);

        						%>
        						<!-- System.out.println("view에서 보여지는 p"+p); -->
							<div class ="div-plan-map"> 
        							<div class = "div-plan-title" onclick = "return goPlanDetail(<%=planList.get(i).getpNo()%>);"> 
        							<a class="ui large circular label" style = "color :white; background : #2A5A85; margin-bottom : 1%;"><%=i+1 %></a>  <%=p.getpTitle()%> </div>
        					   	 	
        					   	 	<div id ="plan-map<%=i%>" class ="plan-map"></div>
        					   	 	<div class = "div-plan-cities">
        					    			<%=Ne.lengthsplit(p.getpCites(), 24)%>
        					   		</div>
								<div class="ui labeled button" tabindex="0" style="width: 95%; height: 30px; margin-top: 5px; text-align : center; " >
									 &nbsp;  &nbsp; &nbsp;  &nbsp;<div class="ui basic red button" style="font-size: ;">
										<i class="heart icon"></i> 좋아요
									</div> 
									<a class="ui basic left pointing red label"> <%=p.getpLike() %> </a> &nbsp;  &nbsp;
									<div class="ui basic blue button">
										<i class="fork icon"></i> 스크랩
									</div>
									<a class="ui basic left pointing blue label"> <%= p.getScrap() %> </a>
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
			
			</script>
			
			
			<br><br>
			

			<br>
			<!-- 플랜 검색 div -->
			<!-- <div>
				<div class="row">
					<div class="col-md-6">
						<h2>Custom search field</h2> 
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
			</div> -->


			<!-- 모든 플랜 보기 -->
			<div id = "bottom-contents">
				<div class="ui mt-20" style = "margin-bottom : 80px;">
					<div class="ui huge header" style = "padding : 1%;"> 모든 플랜 보기 
						<div style = "float : right; font-weight : 400; font-size : 18px;">최신순</div>
					</div>
					<div>
						<div class="div-plan-list" style = "margin-bottom : 80px;">
							<% if(normalPlanMap!= null){								
								nPlanList = (ArrayList<Plan>)normalPlanMap.get("nPlanList");        						
        					
        					for(int i = 0; i < nPlanList.size(); i++){        						
        						Plan p = nPlanList.get(i);
        						%>
        						<!-- System.out.println("view에서 보여지는 p"+p); -->
							<div class ="div-plan-map" onclick = "goPlanDetail(<%=nPlanList.get(i).getpNo()%>);"> 
								<div class = "div-plan-title" > " <%=p.getpTitle() %> "</div>
	        					    <div id ="Rplan-map<%=i%>" class ="plan-map"></div>  
	        					    <div class = "div-plan-cities">
	        					    		  <%=Ne.lengthsplit(p.getpCites(), 24)%>
	        					    </div>
	        					    <div class = "div-interest">
	        					    		<i class="red heart icon"></i><span style="color: red;"> 좋아요 </span> <%=p.getpLike() %> &nbsp; &nbsp; &nbsp;
									<i class="blue fork icon"></i><span style="color: #2185d0;"> 스크랩 </span> <%= p.getScrap() %> 
	        					    </div>
        					    
        						</div>
        							
        						<script>
				        		
				        		$(function() {        			
				        			var pno = <%= p.getpNo() %>;       		
				        			 console.log(pno);
				        			 $.ajax({
				                         url : "/et/countScrapCnt.pl",
				                         data : {
				                            pno:pno
				                         },
				                         type : "post",
				                         success : function(data) {
				                            console.log(data.scrap);
				                            var cnt = data.scrap;
				                            $("#scrapCnt").text(cnt);
				                         },
				                         error:function(){                       	
				                         }
				        			 });
				        			 
				                    });
								
								</script>
        					<%}%>
        					</div>
        				<% }%>						
					</div>
					
					<div class ="pagingArea" align = "center">
						<button onclick = "location.href='<%=request.getContextPath()%>/selectallPlan.pl?currentPage=1'"> << </button>
						
						<% if (currentPage <= 1) { %>
						<button disabled> < </button>
						<% } else { %>
						<button onclick="location.href = '<%=request.getContextPath()%>/selectallPlan.pl?currentPage=<%=currentPage-1%>'"> < </button>
						<% } %>
						
						<% for (int p = startPage; p <= endPage; p++){
							    if(p == currentPage){	
						%>
								<button disabled> <%= p %></button>
						<%      }else {%>
								<button onclick ="location.href = '<%=request.getContextPath()%>/selectallPlan.pl?currentPage=<%=p %>'"><%=p %> </button>
						<%      } %>
						
						<% } %>
						
						<% if(currentPage >= maxPage) {  // 현재 페이지가 마지막 페이지인 경우 %>
						<button disabled> > </button>
						<% } else {%>
						<button onclick="location.href = '<%=request.getContextPath()%>/selectallPlan.pl?currentPage=<%=currentPage + 1%>'"> > </button>
						<% } %>
						
						<button onclick = "location.href = '<%=request.getContextPath()%>/selectallPlan.pl?currentPage=<%=maxPage %>'"> >> </button>
					</div>
					
				</div>
			</div>	
		
			
			
			
			
			
			
			<script>
			var Rmap;
			var RflightPlanCoordinatesArr = [];
			var RflightPlanCoordinates = [];
			var Rpath = {};
			
			$(function () {
				<%				
				if(nCityMap != null && nPlanList != null){
				String[] planCityArr1 = null;
				
				for (int i = 0; i < nPlanList.size(); i++){
					planCityArr1 =  (nPlanList.get(i).getpCites()).split(", "); // 이건 String
					for(String cityNo : planCityArr1){
						%>
						Rpath = {lat : <%=nCityMap.get(cityNo).getCtLat()%>, lng : <%=nCityMap.get(cityNo).getCtLng()%>};				
						RflightPlanCoordinates.push(Rpath); 
					<% }%> 
					RflightPlanCoordinatesArr.push(RflightPlanCoordinates); 
					RflightPlanCoordinates = [];
				<% }%>
				
				<%for(int i = 0; i < nPlanList.size();  i++){ 
				%>
				    var Rmap<%=i%> = new google.maps.Map(document.getElementById('Rplan-map<%=i%>'), { 
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
				    		path : RflightPlanCoordinatesArr[<%=i%>],
				        strokeColor: '#2A5A85',
				        strokeOpacity: 1.0,
				        strokeWeight: 3
				    });
			        poly<%=i%>.setMap(Rmap<%=i%>);
			        
			       
			        for (var j = 0; j < RflightPlanCoordinatesArr[<%=i%>].length; j++) {
			        marker<%=i%> = new google.maps.Marker({
			            position: RflightPlanCoordinatesArr[<%=i%>][j],
			            icon : lineSymbol,
			            map: Rmap<%=i%>
			          });
			        console.log("marker"+j);
			        }
			    <%}%>
		       <%}else{
		       }%>
			});
			
			
			
			function goPlanDetail(pno){
				<% 
				if(loginUser != null ){
					for(int i=0; i<planList.size();i++){
						int BestPlanNum = planList.get(i).getpNo();%>
						if(<%=BestPlanNum%> == pno){
							if(<%=loginUser.getM_point()%>>=15){
								var tr = window.confirm("해당플랜은 인기플랜입니다!상세보기를 하시면 15포인트가 차감됩니다.보시겠습니까??");
								if(tr == true){
									location.href = "<%=request.getContextPath()%>/seePlanDetail.pl?pno="+pno ;
									return true;
								}else{
									return false;
								}
							}else{
								alert("포인트 부족!!(인기플랜보기 15포인트 필요!)")
							}
						 }else if(<%=BestPlanNum%> != pno){
							 location.href = "<%=request.getContextPath()%>/seePlanDetail.pl?pno="+pno ;
						 }
					<% }%>
				 
				<% }else{%>
					 alert("회원만 볼수 있습니당");
				<% }%>
				 
			   }
			
			$(".div-plan-map").mouseenter(function(){
				$(this).find(".div-plan-title").css("color", "rgb(237,197,58)");
			}).mouseleave(function(){
				$(this).find(".div-plan-title").css("color", "#2A5A85");
			});
			
			</script>
			
	
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
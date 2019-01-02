<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<!-- googleMap -->
 		
	<title>ET_Planner</title>
	<link rel="icon" href="/views/image/common/logo.png">
	

<style>
	.container1 {
		margin-left : 50px;
		width : 90%;
		border-bottom: 1px solid rgb(200,200,200);
	  	height: 300px;
	}
	/* 프로필  */
	.div-img-profile {
		width : 240px;
		height : 240px;
		border : 1px solid gray;
		background : rgba(42,90,133,0.5);;
		border-radius : 50%;
		float :left;
		text-align : center;
	}
	.img-profile {
		width : 190px;
		height : 190px;
		margin : 15% 0;
	}
	
	.div-txt-profile{
		float : left;
		margin : 50px 0 30px 40px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	.div-name{
		font-size : 36px;
		font-weight : 600;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.div-point{
		font-size : 20px;
		font-weight : 800;
		margin-bottom : 1px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	 .div-profileTxt{
		font-size : 15px;
		font-weight : 700;
		font-family: 'Nanum Gothic', sans-serif;
		margin-bottom : 10px;
	 }
	.btn-profile{
		margin-top : 35px;
		font-family: 'Nanum Gothic', sans-serif;
		width : 100px;
		height : 30px;
		border-radius : 7px;
		font-weight:700;
	}
	
	/* 우측 메뉴  */
	.div-menu{
		float : right;
		margin-top : 40px;
	}
	
	.div-menu  li {
		list-style : none;
		font-size : 20px;
		margin: 10px 0;
		font-weight : 300;
		font-size : 20px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.this-page {
		font-weight : 800;
	}
	
	.div-menu a, .div-menu li{
		color : black;
	}
	.div-menu li:hover, .div-menu a:hover {
		text-decoration : none;
		color : rgb(254, 200, 0);
	}
	
	/* 하단 활동내역 보기  */
	.container2{
		width : 93%;
		margin-left : 40px;
	}
	
	/* 스크랩한 플랜보기  */
	.div-myPage-title{
		margin-top : 20px;
		font-size : 30px;
		font-weight : 600;
		font-family: 'Nanum Gothic', sans-serif;
		display : inline-block;
		width : 250px;
	}
	
	.plan-list-inner {
		width : 100%;
		display : flex;
		flex-wrap: wrap;
	}
	
	.planBox{
		width : 30%;
		margin : 4% 1.5%;
		height : 480px;
		display : flex;
		flex-wrap : wrap;
	}
	
	.planMap{
		width : 100%;
		height : 380px;
		display :inline-block;
		border : 1px solid gray;
	}
	
	.div-plan-title{
		font-size : 30px;
		font-weight : 700;
		font-family: 'Nanum Gothic', sans-serif;
		display : inline-block;
		cursor : pointer;
		margin : 3px 0;
	}

	.div-plan-title:hover{
		color : rgb(237,197,58);
	}
	
	.div-plan-cities{
		margin-top : 5px;
		font-size : 19px;
		font-weight : 500;
		font-family: 'Nanum Gothic', sans-serif;
		color : rgb(60,60,60);
	}
	
	.div-plan-writer{
		width : 24%;
		height : 30px;
		color : rgba(255,255,255,0.8);
		font-size : 18px;
		font-family: 'Nanum Gothic', sans-serif;
		background : rgba(42,90,133,0.5);
		border-radius : 5px;
		text-align : center;
	}
	
	.div-writer{
		width : 70%;
		margin-left : 1%;
		font-size : 19px;
		font-weight : 500;
		font-family: 'Nanum Gothic', sans-serif;
		color : rgb(60,60,60);
	}
	
	
</style>
</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file = "/views/common/normal/header.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다면 include path를 수정해야합니다-->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top:120px;">
			 <div class = "container1"> <!-- 위에 자기내용  -->
    				<div class = "div-img-profile">
    					<img src = "<%=loginUser.getA_change_Name() %>" class = "img-profile">
    				</div>
    				<div class = "div-txt-profile">
    					<div class = "div-name"><%=loginUser.getM_name() %></div>
    					<div class = "div-point"><%=loginUser.getM_point() %> <i class="euro sign icon"></i></div>
    					<div class = "div-profileTxt"><%=loginUser.getM_profile() %> </div>
    					<button class = "btn-profile" onclick = "editProfile();"> 프로필 수정 </button>
    				</div>
    				<div class = "div-menu">
    					<ul>
    						<li><a onclick = "goMyPlan();" > > 내 플랜보기 </a> </li>
    						<li><a href = "/et/views/normal/myPage/myPage_activity_history.jsp"  class = "this-page"> > 나의 활동내역 </a></li>
    						<li><a href = "/et/views/normal/myPage/myPage_pointHistory.jsp"> > 포인트 히스토리 </a></li>
    						<li><a href = "/et/views/normal/myPage/user_update.jsp"> > 회원정보 수정 </a></li>
    					</ul>
    				</div>
    				
    			</div>
    			
    			<br>
     		<br clear = "both">
        		<div class = "container2">
        		<i class="calendar alternate outline big icon"></i>
	        		<div class = "div-myPage-title"> 내가 스크랩한 플랜 </div>
	        		<br><br>
	        		
        			<div class = "plan-list-inner" id = "plan-list-inner">
        				<div class ="planBox map">
    						<div class = "div-plan-writer" > 작성자 </div > <div class ="div-writer"> 아이디 얍얍 </div>
    						<div class = "div-plan-title"> 플랜 제목입니다. </div>
        					<div id = "planMap0" class ="planMap" readonly></div>
        					<div class = "div-plan-cities"> 여행도시,여행도시, 여행도시, 여행도시, 여행도시, 여행도시 </div>
   					</div>
   					
        				
        				
        			</div>
        		
        		</div>
		</div>
		<div class="two wide column"></div>
	</div>
	<div style="height: 50px;"></div>
	<br><br>
	
	<script>
	    function goMyPlan(){
		    	var mno = <%=loginUser.getM_no()%>;
		    	location.href = "<%=request.getContextPath()%>/selectPlanList.pl?mno="+mno;
	    }
		function editProfile() {
			window.open("views/normal/myPage/myPage_profile_edit.jsp", "프로필 수정", "width=500, height=520, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
		}
		
		 $(function(){
	    		
<%-- 	    		<%for(int i = 0; i <  planList.size(); i++){%>
	        		// 새로운 도시 div 추가 
	        		var mapContent = "<div class ='planBox map"+<%=i%>+"'><div id = 'planMap"+<%=i%>+"' class ='planMap' readonly></div>";
	        		var mapInfoContent = "<div class = 'div-plan-title' onclick = 'goPlanDetail("+<%=planList.get(i).getpNo()%>+");'><%= planList.get(i).getpTitle() %> </div><div class = 'div-plan-private' onclick = 'setPrivate();'> <%if(planList.get(i).getpPrivate().equals("Y")) {%>공개 <%}else {%> 비공개 <%}%></div><div class = 'div-plan-cities'><%=planList.get(i).getpCites()%> </div></div>";
	        		var content = mapContent + mapInfoContent;
				 $("#plan-list-inner").prepend(content);
				
	    		<%}%>
	    		
	    		// 플랜 별 도시 위도 경도를 찍는다. 
	    		<%
	    		String[] planCityArr = null;
	    		for (int i = 0; i < planList.size(); i++){
	    			planCityArr =  (planList.get(i).getpCites()).split(", "); // 이건 String
	    			for(String cityNo : planCityArr){
	    				%> path = {lat : <%=cityMap.get(cityNo).getCtLat()%>, lng : <%=cityMap.get(cityNo).getCtLng()%>};
	    				flightPlanCoordinates.push(path); 
	    			<% }%> 
	    			flightPlanCoordinatesArr.push(flightPlanCoordinates); 
	    			flightPlanCoordinates = [];
	    		<% } %>
	    		
	    		<%for(int i = 0; i < planList.size();  i++){ %>
	    			/* 해당하는 플랜의 도시 배열을 뽑아서 배열값을 나눈 다음에
		    		여행하는 도시의 번호를 가져와서 도시리스트에서 위도, 경도를 구한다.
		    		위도 경도 값을 해당하는 플랜의 도시 순서대로 PATH를 넣는다.  */
	    		    var map<%=i%> = new google.maps.Map(document.getElementById('planMap'+<%=i%>), { 
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

 		        <%}%> --%>
	    		
	    });
	</script>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>
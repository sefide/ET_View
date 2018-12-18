<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
 
	
<style>
	body{
	margin:0px;
	}
	
	/* header */
	.header {
		width:100%;
		height:60px;
		background : rgba(241, 196, 15, 0.32);
		/* background-color: white;
		border-bottom: 3px solid rgba(241, 196, 15, 0.32);	 */	
	}
	
	.header-top-img{
		width : 50px;
		margin: 3px;
	}
	
	.txt-title{
		margin: 0 10px 10px 10px;
		font-weight : 600;
		font-size : 35px;
		color : black;
		font-family: 'Ubuntu', sans-serif;
		line-height: 2.5em; 
	}
	#editTitle{
		font-size: 1.3em;
	}
	
	.btn-save, .btn-return{
		font-size: 14px; 
		/* color: rgb(0, 1, 255);  */
		color : white;
		background : rgb(42,90,133); 
		float:right; 
		text-align: center; 
		line-height: 2.5em; 
		border-radius: 8px; 
		width : 90px;
		margin-top:8px;
	}
	.btn-save {
		margin-right:50px; 
	}
	.btn-return{
		margin-right:30px; 
	}
	
	/* 하단 */
	.plan-table-calendar{
		float : left;
		width : 25%;
		background: rgb(255, 255, 255);
	    border-radius: 9px;
	    	height: 850px;
	    	padding-top : 20px;
	}
	.plan-table-map{
		float: left;
	    width: 75%;
	    overflow: hidden;
	    background: rgb(53, 86, 155);
	   
	}
	
	/* 좌측 일정 상세히  */
	.input-date-first{
		width : 150px;
		border-radius : 5px;
		height : 35px;
		border : 1px dashed black;
		margin : 5px 10px 5px 10px;
		text-align : center;
	}
	.txt-date-first{
		margin-left : 10px;
		font-size : 15px;
	}
	
	/* 좌측 일정 - 나라추 */
	.bar{
		width : 29px;
		border-right : 3px solid black; 
		height : 7px;
		
	}
	.citybock{
		position : relative;
	}
	
	.div-day{
		float : left;
		width : 53px;
		height : 53px;
		padding-left : 7px;
		background : white;
		padding-top : 13px;
		border-radius : 100px;
		border : 3px solid black; 
		cursor: pointer
	}
	.a-day > font{
		color : #FFC23C;
		font-size : 10px;
		font-weight : 600;
	}
	.div-city{
		float:left;
		width : 215px;
		padding-left : 10px;
		padding-top : 7px;
	}
	.btns-city{
		float: left;
	    padding-right: 5px;
	    width: 60px;
	    height : 30px;
	}
	.icon-city {
		font-size: 1.5em;
	}
	
	/* 우측 상세히  */
	.plan-map{
		width: 75%;
		position: absolute;
	}
	.search{
		position: absolute;
		margin-top: 20px;
		/* float:right; */
		margin-left : 20px;
	}
	.input-city{
		width : 250px;
	} 
	
</style>
</head>
<body>
	<div class="header">
		<img src="/et/image/common/logo.png" class = "header-top-img" onclick = "goHome();">
	    <span class = "txt-title">Plan 1</span>
		<i class="pencil alternate icon" id = "editTitle" onclick = "editTitle();"></i>
		<div class="ui input">
		  <input class = "input-title" type="text" placeholder="나만의 여행제목을 정해주세요..">
		</div> 
		<!-- <span style=position:absolute;top:15px;left:12px;width:300px;height:48px;font-size:16px;>
			<span style="color: rgb(211, 84, 0); font-size: large;">플랜짜기</span>
		</span> -->
		
		<button class = "btn-save" onclick = "save();"> 저장하기</button>
		<button class = "btn-return" onclick = "returnMain();"> 돌아가기</button>
	</div>
	
	<div class = "plan-table-calendar">
		<form>
			<font class ="txt-date-first">여행 시작날짜를 입력해주세요 :)</font>
			<input type ="date" class = "input-date-first" name = "dateFirst"/>
			<!-- <div id="cityroute" style="position:relative;text-align:center;width:100%;margin-left:0px;padding-left:0px;padding-top:0px;overflow-x:hidden;overflow-y:auto;height:480px;background:#ffffff">
				<br/><br/><br/><font style="font-size:9pt" color="#c0c0c0"><b>입력된 도시가 없습니다.</b></font>
			</div> -->
			<div id = "cityroute">
				<div id ="cityblock01" class= "citybock">
					<div class ="bar"></div>
					<div width = "100%; overflow-x:hidden">
						<div class = "div-day">
							<a class ="a-day" onclick = ""><font class ="nights">1 
							<i class="angle down icon"></i></font></a>
						</div>
						<div class = "div-city">
							<div style ="float:left; width : 148px">
								<div><font class = "font-city-name">나라이름 </font></div>
							</div>
							<div class ="btns-city">
								<i class="info circle icon icon-city" onclick =""></i>
								<i class="window close icon icon-cityn" onclick = ""> </i>
							</div>
						</div>
					</div>
					<div class ="bar"></div>
				</div>
			</div>
			<div id = "map-canvas"></div>
			
		</form>
		
	</div>
	
	<div class = "plan-table-map">
	<iframe class = "plan-map"  id = "gg-map" src=".." width="100%" height="850px" style="border:none;"></iframe>
		<div class="ui search">
		  <div class="ui icon input input-city">
		    <input class="prompt input-city" type="text" placeholder="Search countries...">
		    <i class="search icon"></i>
		  </div>
		  <div class="results"></div>
		</div>
	</div>
	
	 <script type="text/javascript">
	 $(function() {
		 
		 map = new google.maps.Map(document.getElementById('gg-map'));
		 console.log(map);
		 poly = new google.maps.Polyline({
	          strokeColor: '#000000',
	          strokeOpacity: 1.0,
	          strokeWeight: 3
	        });
	        poly.setMap(map);

	        // Add a listener for the click event
	        map.addListener('click', addLatLng);
	 });
	 
	 // Handles click events on a map, and adds a new point to the Polyline.
     function addLatLng(event) {
       var path = poly.getPath();

       // Because path is an MVCArray, we can simply append a new coordinate
       // and it will automatically appear.
       path.push(event.latLng);

       // Add a new marker at the new plotted point on the polyline.
       var marker = new google.maps.Marker({
         position: event.latLng,
         title: '#' + path.getLength(),
         map: map
       });
     }
  </script>



	<!-- Semantic UI -->
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<script> 
		function save(){}
		function returnMain(){}
		
		function editTitle() {}
	</script>
	
	      
	<!-- <script>
	$('.ui.search')
	  .search({
	    source: content
	  })
	 ;
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
	</script> -->
</body>
</html>
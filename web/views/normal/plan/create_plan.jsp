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
	.citybock{
		width : 99%;
		position : relative;
		/* margin-left : 1px; */
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
	.plan-map{
		width: 75%;
		position: absolute;
	}
	.search{
		position: absolute;
		margin-top: 20px;
		margin-left : 20px;
	}
	.input-city{
		width : 250px;
	}
	
	
	/* 도시 상세정보보기  */
	#detailPop{
		position : absolute;
		width : 1050px;
		/* height : 100%; */
		background : rgba(250, 250, 250, 0.9);
		z-index : 100;
		/* visibility : hidden; */
		/* display : none; */
	} 
	
	#borderPop{
		position : relative;
		top : 20px;
		left : 20px;
		border : 1px solid lightgray;
		width : 1000px;
		/* height : 90%; */
		border-radius : 5px;
		padding : 13px;
	}
	
	#closePop {
		font-size : 1.8em;
		margin-right : 100px;
		/* margin-left : 18px;
		margin-top : 18px; */
		
	}
	
	/* pop 안에 내용  */
	/* 간단 소개  */
	.p-city-name{
		font-weight : 700;
		font-size : 22px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	.p-info-img{
		width : 600px;
		height : 390px;
		border-radius : 7px;
		border : 1px solid white;
	}
	.p-info-txt{
		font-weight : 500;
		font-size : 15px;
		color : gray;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	/* 날씨  */
	.p-flex{
		display : flex;
		flex-wrap : wrap;
		width : 100%;
	}
	.p-title{
		font-weight : 500;
		font-size : 18px;
		font-family: 'Nanum Gothic', sans-serif;
		margin : 4% 0 1% 0;
	}
	.p-w{
		width : 16%;
		height : 44px;
		border: 1px solid white;
		background : skyblue;
		cursor : pointer;
		border-radius : 7px;
		padding-top : 10px; 
		text-align : center;
		/* display : table-cell;
		vertical-align : middle; */
		color : white;
	}
	
	.p-p {
		width : 23%;
		margin: 0 1% 1% 1%;
		height : 250px;
		/* border: 1px solid skyblue; */
		text-align : center;
	}
	
	 .p-t {
		width : 23%;
		margin: 0 1% 1% 1%;
		height : 270px;
		/* border: 1px solid skyblue; */
		
	}
	
	.p-p-img{
		width : 100%;
		height : 200px;
		border-radius : 10px;
		margin-bottom : 10px;
	}
	
	.p-p-name{
		font-weight : 700;
		font-size : 18px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.p-t-img{
		width : 100%;
		height : 200px;
		border-radius : 10px;
		margin-bottom : 10px;
	}
	
	.p-t-name{
		font-weight : 700;
		font-size : 18px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.p-t-price{
		font-weight : 800;
		font-size : 18px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	/* 이동수단 팝업  */
	#icon-close{
		margin : 5px 3px 0 0;
		font-size : 20px;
	}
	
	#trans-pop-txt{
		margin-left : 30px;
		font-weight : 700;
		font-size : 18px;
		font-family: 'Nanum Gothic', sans-serif;
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
		z-index : 200;
	}
	
	.trans-flex{
		width : 100%;
		display : flex;
		flex-wrap : wrap;
		
	}
	
	.trans-in{
		width : 18%;
		line-height : 7.5em;
		margin : 2% 1% 0 1%;
		text-align : center;
		
	}
	
	.tr-circle {
		border : 3px solid rgb(171, 199, 244);
		background : white;
		border-radius : 50%;
		width : 130px;
		height : 130px;
		margin-bottom : -20px;
		cursor : pointer;
	}
	
	#icon-trans{
		font-size : 70px;
		margin-left : 9px;
		margin-top : 10px;
	}
	
	.trans-txt{
		font-weight : 500;
		font-size : 18px;
		font-family: 'Nanum Gothic', sans-serif;
		color : white;
		/* margin-left : 20px; */
	}
	
	.trans-txt{
		color : white;
	}
	.trans-txt-num{
		font-weight : 500;
		font-size : 18px;
		font-family: 'Nanum Gothic', sans-serif;
		color : rgb(85, 124, 186);
	}
	.trans-txt-num:hover{
		color : rgb(85, 124, 186);
	}
</style>
</head>
<body>
	<div class="header">
		<img src="/et/image/common/logo.png" class = "header-top-img" onclick = "returnMain();">
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
			<hr>
			<div id = "cityroute">
				<div id ="cityblock01" class= "citybock">
					<div class ="bar1"></div>
					<div class = "div-flex">
						<div class ="div-day">
							<div class = "div-day-circle">
								<select class ="nights">
								    <option value="one">1박 </option>
								    <option value="two">2박  </option>
								    <option value="three">3박  </option>
								    <option value="four">4박 </option>
								    <option value="five">5박  </option>
							    </select> 
							</div>
						</div>
						<div class = "div-city">
							<div class = "txt-city">
								<span class = "font-city-name">파리  </span>
							</div>
						</div>
						<div class ="btns-city">
							<i class="info circle icon"  id= "icon-city1" onclick ="cityInfo();"></i>
							<i class="window close icon"  id= "icon-city2" onclick = ""> </i>
						</div>
					</div>
					<div class ="bar2"></div>
				</div>
				<br>
				<div id ="cityblock02" class= "citybock">
					<div class ="bar2"></div>
					<div width = "100%; overflow-x:hidden">
						<div class = "div-trans">
							<select class="ui dropdown" id ="trans" name = "transform">
						      <option value="plane">비행기 </option>
						      <option value="train">기차 </option>
						      <option value="ship">항구 </option>
						      <option value="bus">버스 </option>
						      <option value="etc">기타  </option>
						    </select>
						</div>
					</div>
					
					<div class ="bar2"></div>
					<div class = "div-flex">
						<div class ="div-day">
							<div class = "div-day-circle">
								<select class ="nights">
								    <option value="one">1박 </option>
								    <option value="two">2박  </option>
								    <option value="three">3박  </option>
								    <option value="four">4박 </option>
								    <option value="five">5박  </option>
							    </select>  
							</div>
						</div>
						<div class = "div-city">
							<div class = "txt-city">
								<span class = "font-city-name">프랑크프루트  </span>
							</div>
						</div>
						<div class ="btns-city">
							<i class="info circle icon"  id= "icon-city1" onclick ="cityInfo();"></i>
							<i class="window close icon"  id= "icon-city2" onclick = ""> </i>
						</div>
					</div>
					<div class ="bar2"></div>
				</div>
			</div>
			
			<!-- <div id = "map-canvas"></div> -->
			
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
				 			<div><img class ="p-p-img" src ="/et/image/city/bar.jpg"></div>
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
				 			<div><img src ="/et/image/city/bar.jpg" class ="p-t-img"></div>
				 			<label class ="p-t-name">투어명 </label>
				 			<label class ="p-t-price">가격 </label>
				 		</div>
				 		
				 	</div>
				 </div>
				 
				</div>
			</div>
	
<!-- 	<iframe class = "plan-map"  src="https://snazzymaps.com/embed/117433" width="100%" height="850px" style="border:none;"></iframe>
 -->	 <iframe class = "plan-map"  id = "gg-map" src=".." width="100%" height="850px" style="border:none;"></iframe> 
		<div class="ui search">
		  <div class="ui icon input input-city">
		    <input class="prompt input-city" type="text" placeholder="Search countries...">
		    <i class="search icon"></i>
		  </div>
		  <div class="results"></div>
		</div>
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



	<!-- Semantic UI -->
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<script> 
		$("#trans").click(function() {
	        $(".trans-pop").css("visibility", "visible");
	    });
		
		$("#icon-close").click(function(){
			  $(".trans-pop").css("visibility", "hidden");
		});
		
		function selTrans(num){
			console.log(num);
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
		
		function editTitle() {}
		
		function cityInfo() {
			/* $("#detailPop").css("visibility", "visible"); */
			$("#detailPop").css("display", "block");
		   /*  	window.open("detail_city.jsp", "도시 정보창 ", "width=1000, height=700, toolbar=no, menubar=no, location = no, resizable=no, left=400, top=0" ); */  
		}
		
		$(".p-w").mouseenter(function(){
			$(this).css("background", "teal");
		}).mouseout(function() {
			$(this).css("background","skyblue");
			
		});
		function closePop() {
			$("#detailPop").css("display", "none");
		}
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
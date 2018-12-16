<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	}
	.div-name{
		font-size : 36px;
		font-weight : 600;
		font-family: 'Ubuntu', sans-serif;
	}
	
	.div-point{
		font-size : 20px;
		font-weight : 500;
		font-family: 'Ubuntu', sans-serif;
		margin-bottom : 1px;
	}
	 .div-profileTxt{
		font-size : 18px;
		font-weight : 300;
		font-family: 'Ubuntu', sans-serif;
		margin-bottom : 10px;
	 }
	.btn-profile{
		margin-top : 35px;
		font-family: 'Ubuntu', sans-serif;
		width : 100px;
		height : 30px;
		border-radius : 7px;
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
	}
	
	.this-page {
		font-weight : 500;
	}
	
	.div-menu a{
		color : black;
	}
	.div-menu a:hover {
		text-decoration : none;
		color : rgb(254, 200, 0);
	}
	
	/* 하단 플랜보기  */
	.container2{
		width : 93%;
		margin-left : 40px;
	}
	.div-myPage-title{
		margin-top : 20px;
		font-size : 30px;
		font-weight : 600;
		font-family: 'Ubuntu', sans-serif;
		display : inline-block;
		width : 170px;
	}
	
	.div-plan-list{
		margin-left : 15px;
	}
	
	.div-plan-map{
		width : 380px;
		height : 420px;
		display :inline-block;
		margin : 5px 10px 30px 0;
		
	}
	
	.div-plan-title{
		font-size : 28px;
		font-weight : 500;
		font-family: 'Ubuntu', sans-serif;
		display : inline-block;
	}
	
	.div-plan-private{
		width : 80px;
		height : 30px;
		color : rgba(255,255,255,0.8);
		font-size : 18px;
		font-family: 'Ubuntu', sans-serif;
		background : rgba(42,90,133,0.5);
		border-radius : 5px;
		text-align : center;
		float:right;
		cursor : pointer;
	}
	
	.div-plan-add{
		font-weight : 600;
		color : white;
		font-size : 40px;
		text-align : center;
		width : 380px;
		height : 380px;
		border : 2px dashed white;
		background : rgba(200,200,200,0.4);
		border-radius : 10px;
		display : inline-block;
	}
	</style>
</head>
<body>
	<%@ include file = "/views/common/header.jsp" %>
	
	<div class="ui grid">
        <div class = "two wide column"></div>
        
        <div class = "twelve wide column" style="margin-top:120px;">
            <!-- 내용 넣기 -->
            <div class = "container1"> <!-- 위에 자기내용  -->
    				<div class = "div-img-profile">
    					<img src = "/et/image/common/logo_c.png" class = "img-profile">
    				</div>
    				<div class = "div-txt-profile">
    					<div class = "div-name">heedi kim</div>
    					<div class = "div-point">20 유로 </div>
    					<div class = "div-profileTxt">안녕하세요. 행복한 유럽여행을 꿈꾸고 있습니다. </div>
    					<button class = "btn-profile"> 프로필 수정 </button>
    				</div>
    				<div class = "div-menu">
    					<ul>
    						<li><a href = "/et/views/myPage_main.jsp" class = "this-page"> > 내 플랜보기 </a> </li>
    						<li><a href = "#"> > 나의 활동내역 </a></li>
    						<li><a href = "/et/views/myPage_pointHistory.jsp"> > 포인트 히스토리 </a></li>
    						<li><a href = "#"> > 회원정보 수정 </a></li>
    					</ul>
    				</div>
    				
    			</div>
    			
    			<br>
     		<br clear = "both">
        		<div class = "container2">
        		
        		<i class="calendar alternate outline big icon"></i>
        		<div class = "div-myPage-title"> 내 플랜보기 </div>
        		<br><br>
        			<div> <!-- 뒤에 지도  등   -->
        				<div class = "div-plan-list">  
        					<div class ="div-plan-map"> 
        					    <iframe class = "plan-map" src="https://snazzymaps.com/embed/120714" width="380px" height="380px" style="border:none;"></iframe>
        						<div class = "div-plan-title"> 플랜 제목 </div>
        						<div class = "div-plan-private" onclick = "setPrivate();"> 공개 </div>
        					</div>
        					<div class ="div-plan-map"> 
        					    <iframe class = "plan-map" src="https://snazzymaps.com/embed/120714" width="380px" height="380px" style="border:none;"></iframe>
        						<div class = "div-plan-title"> 플랜 제목 </div>
        						<div class = "div-plan-private" onclick = "setPrivate();"> 공개 </div>
        					</div> 
        					
        					<div class ="div-plan-map"> 
        					    <iframe class = "plan-map" src="https://snazzymaps.com/embed/120714" width="380px" height="380px" style="border:none;"></iframe>
        						<div class = "div-plan-title"> 플랜 제목 </div>
        						<div class = "div-plan-private" onclick = "setPrivate();"> 비공개 </div>
        					</div>
        					
        					<div class ="div-plan-map"> 
	        					<div class ="div-plan-add" onclick = "addPlanMemory();"> 
	        						플랜 저장공간 추가 
	        					    <div class="ui dimmer">
								    <div class="content">
								    	  <i class="calendar plus outline inverted icon"></i>
								    	  <br>
								      <h4 class="ui icon inverted header" id = "header-city">
								         플랜 저장공간을 늘리려면 200포인트가 필요합니당. <br>
								         추가를 원하시면 클릭해주세요.
								      </h4>
								    </div>
								</div>
							</div>
        					</div>
        					
        				</div>
        			</div>
        		</div>
        </div>
        <div class = "two wide column"></div>
   	</div>
   	
   	<!-- Semantic UI -->
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
   	<script>

	    $('.div-plan-add').dimmer({
			on : 'hover'
		});
	    
	    function addPlanMemory(){
	    		alert("저장공간 늘리기");
	    	
	    }
	    
	    function setPrivate() {
	    		alert("플랜 공개/비공개 설정 바꾸기 ");
	    }
   	
   	</script>
	
	
	<%@ include file = "/views/common/footer.jsp" %>
	
	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDoMpIr7wrKdZrGsBCW1zoNesmP8fhCdH0&callback=initMap">
    </script>
</body>
</html>
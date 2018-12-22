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
		font-family: 'Nanum Gothic', sans-serif;
	}
	.div-name{
		font-size : 36px;
		font-weight : 600;
		font-family: 'Ubuntu', sans-serif;
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
		font-family: 'Nanum Gothic', sans-serif;
		display : inline-block;
		width : 170px;
	}
	
	/* .plan-list-outer{
		width : 100%;
		text-align : center;
		padding: 0 1% 0 1%;
		border : 1px solid orangered;
	}
	.plan-list-inner {
		width : 99%;
		border : 1px solid black;
		display : flex;
		flex-wrap: wrap;
	} */
	
	.plan-list-inner {
		width : 100%;
		/* border : 1px solid black; */
		display : flex;
		flex-wrap: wrap;
	}
	
	.planBox{
		width : 30%;
		margin : 2% 1.5%;
		/* border : 1px solid skyblue; */
		height : 480px;
	}
	
	.plan-map{
		width : 100%;
		height : 420px;
		display :inline-block;
		
	}
	
	.div-plan-title{
		font-size : 26px;
		font-weight : 700;
		font-family: 'Nanum Gothic', sans-serif;
		display : inline-block;
	}
	
	.div-plan-private{
		width : 80px;
		height : 30px;
		color : rgba(255,255,255,0.8);
		font-size : 18px;
		font-family: 'Nanum Gothic', sans-serif;
		background : rgba(42,90,133,0.5);
		border-radius : 5px;
		text-align : center;
		float:right;
		cursor : pointer;
	}
	
	.plan-add-inner{
		padding-top : 35%;
		text-align : center;
		font-weight : 600;
		color : white;
		font-size : 25px;
		height : 420px;
		border : 1px solid rgba(42,90,133,0.5);
		background : white;
		transition : 0.7s;
	}
	
	#icon-plan-add{
		color : rgba(42,90,133,0.5);
	}
	
	.plan-add-inner:hover{
		background : rgb(255,255,255);
		color : rgba(42,90,133,0.5);
		
	}
	
	.txt-add{
	font-family: 'Nanum Gothic', sans-serif;
	}
	
	
	
	
	</style>
</head>
<body>
	<%@ include file = "/views/common/normal/header.jsp" %>
	
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
    					<button class = "btn-profile" onclick = "editProfile();"> 프로필 수정 </button>
    				</div>
    				<div class = "div-menu">
    					<ul>
    						<li><a href = "#" class = "this-page"> > 내 플랜보기 </a> </li>
    						<li><a href = "/et/views/normal/myPage/myPage_activity_history.jsp"> > 나의 활동내역 </a></li>
    						<li><a href = "/et/views/normal/myPage/myPage_pointHistory.jsp"> > 포인트 히스토리 </a></li>
    						<li><a href = "/et/views/normal/myPage/user_update.jsp"> > 회원정보 수정 </a></li>
    					</ul>
    				</div>
    				
    			</div>
    			
    			<br>
     		<br clear = "both">
        		<div class = "container2">
        		
	        		<i class="calendar alternate outline big icon"></i>
	        		<div class = "div-myPage-title"> 내 플랜보기 </div>
	        		<br><br>
	        		
        			<div class = "plan-list-inner">
        				<div class ="planBox map01">
							<iframe class = "plan-map" src="" width="380px" height="380px" style="border:none;"></iframe>
    						<div class = "div-plan-title"> 플랜 제목 </div>
    						<div class = "div-plan-private" onclick = "setPrivate();"> 공개 </div>
   						</div>
        				<div class ="planBox map02">
						<iframe class = "plan-map" src="" width="380px" height="380px" style="border:none;"></iframe>
    						<div class = "div-plan-title"> 플랜 제목 </div>
    						<div class = "div-plan-private" onclick = "setPrivate();"> 공개 </div>
					</div>
        				<div class ="planBox map03 plan-add-outer">
        					<div class ="plan-add-inner" onclick = "addPlanMemory();"> 
     						 <i class="plus big icon" id = "icon-plan-add"></i>
     						<div class ="txt-add">플랜 저장공간을 더 늘리고 싶다면 <br>클릭해주세욥 !! </div>
						</div>
        				</div>
        				<div class ="planBox map04"></div>
        				<div class ="planBox map05"></div>
        				<div class ="planBox map04"></div>
        			</div>
	        		
	    			
        		</div>
        </div>
        <div class = "two wide column"></div>
   	</div>
   	
   	<!-- Semantic UI -->
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
   	<script>

	   /*  $('.div-plan-add').dimmer({
			on : 'hover'
		});
	   */
	    function editProfile() {
	    	window.open("myPage_profile_edit.jsp", "프로필 수정", "width=500, height=520, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	    }
	    
	    function addPlanMemory(){
	    		alert("저장공간 늘리기");
	    	
	    }
	    
	    function setPrivate() {
	    	alert("비공개/ 공개 설정");

	    }
   		
	  
   	</script>
	
	
	<%@ include file = "/views/common/normal/footer.jsp" %>
	
	
</body>
</html>
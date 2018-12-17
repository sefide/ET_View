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
	
	<script>
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
	</script>
	
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
		padding-bottom: -10px;
	}
	
	.header-top-brand {
		color : black;
   	 	font-size : 33px;
   	 	font-weight : 600;
  	 	font-family: 'Ubuntu', sans-serif;
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
	}
	.plan-table-map{
		float: left;
	    width: 75%;
	    overflow: hidden;
	    background: rgb(53, 86, 155);
	   
	}
	
	/* 좌측 일정 상세히  */
	.txt-title{
		margin: 10px;
		font-weight : 600;
		font-size : 35px;
	}
	
	.input-title{
	
	}
	
	/* 우측 상세히  */
	.plan-map{
		width: 100%;
		position: absolute;
	}
	.search{
		position: absolute;
		margin: 30px;
	}
	.input-city{
		width : 250px;
	}
</style>
</head>
<body>
<div class="header">
	<img src="/et/image/common/logo.png" class = "header-top-img" onclick = "goHome();">
    <a class="header-top-brand" id ="txt_brand" onclick = "goHome();">ET Planner</a>
	<span style=position:absolute;top:15px;left:12px;width:300px;height:48px;font-size:16px;>
		<span style="color: rgb(211, 84, 0); font-size: large;">플랜짜기</span>
	</span>
	
	<button class = "btn-save" onclick = "save();"> 저장하기</button>
	<button class = "btn-return" onclick = "returnMain();"> 돌아가기</button>
</div>

<div class = "plan-table-calendar">
	<span class = "txt-title">Plan 1</span>
	<i class="pencil alternate icon" onclick = ""></i>
	<!-- <div class="ui input">
	  <input class = "input-title" type="text" placeholder="나만의 여행제목을 정해주세요..">
	</div> -->
	<h1>여행 일정</h1>
</div>

<div class = "plan-table-map">
	<iframe class = "plan-map" src="https://snazzymaps.com/embed/120714" width="100%" height="850px" style="border:none;"></iframe>
	<div class="ui search">
	  <div class="ui icon input  input-city">
	    <input class="prompt input-city" type="text" placeholder="Search countries...">
	    <i class="search icon"></i>
	  </div>
	  <div class="results"></div>
	</div>
</div>


	<!-- Semantic UI -->
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<script> 
		function save(){}
		function returnMain(){}
		
		
	</script>
	
	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDoMpIr7wrKdZrGsBCW1zoNesmP8fhCdH0&callback=initMap">
    </script>
</body>
</html>
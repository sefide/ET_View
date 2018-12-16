<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{
	margin:0px;
	}
	
	/* header */
	.header {
		width:100%;
		height:60px;
		background-color: rgba(241, 196, 15, 0.32);		
	}
	
	.btn-save, .btn-return{
		font-size: 15px; 
		/* color: rgb(0, 1, 255);  */
		color : white;
		background : rgb(42,90,133); 
		float:right; 
		text-align: center; 
		line-height: 2.5em; 
		border-radius: 4px; 
		width : 100px;
	}
	.btn-save {
		margin-right:50px; 
		margin-top:6px;
	}
	.btn-return{
		margin-right:30px; 
		margin-top:6px;
	}
	
	/* 하 */
	.plan-table{
		float : left;
		width : 25%;
		background: rgb(255, 255, 255);
	    border-radius: 9px;
	    	height: 850px;
	}
	.plan-map{
		float: left;
	    width: 75%;
	    overflow: hidden;
	    background: rgb(53, 86, 155);
	    height: 850px;
	}
	/* 좌측 일정 상세히  */
	
</style>
</head>
<body>
<div class="header">
	<span style=position:absolute;top:15px;left:12px;width:300px;height:48px;font-size:16px;>
		<span style="color: rgb(211, 84, 0); font-size: large;">플랜짜기</span>
	</span>
	
	<button class = "btn-save" onclick = "save();"> 저장하기</button>
	<button class = "btn-return" onclick = "return();"> 돌아가기</button>
</div>

<div class = "plan-table">
	<h1>여행 일정</h1>
</div>

<div class = "plan-map"></div>



	<script> 
		function save(){}
		function return(){}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ET_Planner</title>
<link rel="icon" href="/et/image/common/logo.png">

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Ubuntu" rel="stylesheet">

<style>
	iframe{
		margin-left : 30%;
	}
	
	.header-top-img{
		width : 50px;
	}
	
	.header-top-brand {
		color : black;
    	 	font-size : 28px;
    	 	font-weight : bold;
  		font-family: 'Ubuntu', sans-serif;
	}
	.txt-warning{
		color : rgb(120,120,120);
    	 	font-size : 15px;
		font-family: 'Nanum Gothic', sans-serif;
		margin-left : 15px;
	}

</style>
</head>
<body>
	<div>
		<img src="/et/image/common/logo.png" class = "header-top-img" onclick = "goHome();">
	    <a class="header-top-brand" id ="txt_brand" onclick = "goHome();">ET Planner for Travel Agency</a>
	   <p class ="txt-warning"> 본 서비스는 행복한 유럽여행을 꿈꾸는 사람들을 위한 공간입니다. <br>
	   장난이 섞인 문의글을 남기거나 불법적인 도용, 악의적인 비방의 의도가 담긴 문의글을 제출 시 법적인 조치를 취하겠습니다. </p>    
    </div>
    <br><br>
    <div>
		<iframe src="https://docs.google.com/forms/d/e/1FAIpQLScmf5XZUxxcQuriVpPfad6mbnwhhs_MR3MZQnKvHJRR5JYd3g/viewform?embedded=true" width="640" height="1212" frameborder="0" marginheight="0" marginwidth="0">로드 중...</iframe>
	</div>
</body>
</html>
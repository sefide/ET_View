<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script>
	$(function() {
		$("#a_header:first").css("color","rgb(20, 91, 137)");
	});
</script>
<style>
	@media screen and (max-width : 780px) {
		.txt_header_brand{
			font-size:18px;
		}
	
	}
	
	.img_logo {
		float :left;
		width : 45px;
		margin-top : 0px;
	}
	
	nav{
		background: rgb(254, 200, 0);
	}
	
	.ul_header{
		list-style : none;
	}
	
	#a_header{
		display : inline;
		text-decoration : none;
		color : white;
		/* float:left; */
		margin : 3% 0; 
		font-weight : 600;
	}
	
	#a_header:hover {
		color : rgb(20, 91, 137);
	}

	
	#txt_header_brand{
		color : rgb(20, 91, 137);
		font-weight : 600;
	}

</style>
</head>
<body>
	<nav class = "header navbar navbar-expand-lg navbar-light">
		<img src ="../image/common/logo.png" alt ="logo" class = "img_logo">
		<a class="navbar-brand txt_header_brand" id = "txt_header_brand" href="#">ET Planner For Travel Agency</a>
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	    </button>
		
		<div class = "header_menu collapse navbar-collapse " id="navbarTogglerDemo02">
			<ul class = "navbar-nav mr-auto mt-2 mt-lg-0 ul_header">
				<li class="nav-item"><a href = "#" class = "nav-link a_header" id = "a_header">메인페이지 </a></li>
				<li class="nav-item"><a href = "#" class = "nav-link a_header" id = "a_header">등급결제 </a> </li>
				<li class="nav-item"><a href = "#" class = "nav-link a_header" id = "a_header">게시물 만들기  </a></li>
				<li class="nav-item"><a href = "#" class = "nav-link a_header" id = "a_header">로그아웃  </a></li>
			</ul>
		</div>
	</nav>
</body>
</html>
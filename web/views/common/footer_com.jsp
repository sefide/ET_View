`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	
	<style>
	@media screen and (max-width : 780px) {
         footer {
         	display : none;
         }
    }

	footer {
		height : 75px; 
		background-color : rgba(228, 228, 228, 0.589);
		border-top : 0.1px solid rgba(190, 188, 190, 1);
		position: fixed;
		  left: 0;
		  bottom: 0;
		  width: 100%;
	}
	
	.not_hover_stl{  /* a태 */
		color : gray;
		float:left;
	}
	
	.not_hover_stl:hover {
		color: gray;
	}
	
	.foot-a{
		text-decoration : none;
		margin : 2px 15px;
		font-size : 12px;
		color:gray;
	}

	
	.first {
		margin-left : 13%;
	}
	
	.left-container {
		height: 30px;
	}
	
	</style>
</head>
<body>
	<div class = "left-container"></div>
	<!-- footer 시작 -->
	<footer> 
		<div>
			<a class = "foot-a first not_hover_stl" style ="font-weight:bold; color : gray;">ET Planner for Company</a>
			<a class = "foot-a not_hover_stl" href="#">제휴 관련문의</a> <p class = "not_hover_stl"> | <p>
		    <a class = "foot-a not_hover_stl" id = "customer_center" href="#"> 고객센터</a>  <p class = "not_hover_stl"> |  <p>
		    <a class = "foot-a not_hover_stl" href="#">이용약관 </a>
		    
		</div>
		<br>
		<p class = "foot-a first"> Copyright ETs Company. All rights reserved.  </p>
    </footer>
    <!-- footer 끝 -->
    
    <script>
    $("#customer_center").click(function () {
    		alert("고객센터 080-1234-1234로 연락바랍니다.");
    });
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Semantic UI -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<title>ET_Planner</title>
<link rel="icon" href="/views/image/common/logo.png">
<style>
.column {
	height: 100%;
}
.div-card-tour{
		width : 90%;
		margin-left : 20px;
		margin-top: 10px;
	}

#div-my-tour {
	padding: 20px 30px;
	border: 1px solid lightgray;
	border-radius: 10px;
	width: 90%;
	margin: 0 0 20px 20px;
}

.div_tour_left {
	display: inline-block;
	width: 60%;
	/* border : 1px solid black; */
}

.span-tour-title {
	font-weight: 800;
	margin-top: 5px;
	font-size: 16px;
	font-family: 'Nanum Gothic', sans-serif;
}

.span-tour-ex {
	font-family: 'Nanum Gothic', sans-serif;
}

.div_tour_right {
	display: inline-block;
	width: 30%;
	float: right;
	pardding-left: 15px;
}

	.div-tour-btn{
		display:inline-block;
		width : 200px;
		margin-left: 2%; 
	}
	.div-tour-paging{
		display:inline-block;
		width : 150px;
		margin-left: 40%;	
	}
	#div-text {
	padding-top: 15px;
	font-size: 27px;
	font-weight: 700;
	font-family: 'Ubuntu', sans-serif;
	margin-top: 10px;
	margin-bottom: 1px;
	text-align: center;
	font-size: 27px;
}
.span-
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file="/views/common/normal/header.jsp"%>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px;">

			<!-- 내용 넣기 -->
			<div class="ui mt-20"> 
    			<br>
                <div class="ui header title" id ="div-text">투어 상세보기 </div>
                <br>
                
                <div id = "div-my-tour">
	                <div class = "div_tour_left">
		                <div class = "span-tour-title"> 투어명 </div> 
						<span class = "span-tour-ex"> 투어명 예시</span> <br>
		                	<div class = "span-tour-title"> 투어컨셉 </div> 
						<span class = "span-tour-ex"> 투어컨셉 예시</span> <br>
						<div class = "span-tour-title"> 설명 </div> 
						<span class = "span-tour-ex"> 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 예시</span> <br>
						<div class = "span-tour-title"> 가격 </div> 
						<span class = "span-tour-ex"> 투어가격 예시</span><br>
	                	</div>
	                	
	                	<div class = "div_tour_right">
						<div  class = "span-tour-title"> 투어기간 </div> 
						<span class = "span-tour-ex"> 2018.12.4 ~ 2019.08.14</span>
						<div  class = "span-tour-title"> 연결링크 </div>
						<a href = "www.naver.com">www.naver.com</a>
						<div  class = "span-tour-title"> 대표사진  </div>
						<span class = "span-tour-ex"> 사진명 tour.jpg </span>
	                </div>
                </div>
                             
                <div class = "div-tour-btn">
					<button class="ui yellow button" onclick="location.href ='seeTour_main.jsp'">되돌아가기 </button>
				</div>
            </div>

















		</div>
		<div class="two wide column"></div>
	</div>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>
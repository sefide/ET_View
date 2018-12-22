<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<!-- 버튼 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>ET_Planner</title>
<link rel="icon" href="/views/image/common/logo.png">

<style>
.container1 {
	margin-left: 50px;
	width: 90%;
	border-bottom: 1px solid rgb(200, 200, 200);
	height: 380px;
}
/* 프로필  */
.div-img-profile {
	width: 240px;
	height: 350px;
	border: 1px solid gray;
	background: rgba(42, 90, 133, 0.5);
	border-radius: 50%;
	float: left;
	text-align: center;
}

.img-profile {
	width: 190px;
	height: 190px;
	margin: 15% 0;
}

.div-txt-profile {
	float: left;
	margin: 50px 0 30px 40px;
}

.div-name {
	font-size: 36px;
	font-weight: 600;
	font-family: 'Ubuntu', sans-serif;
}

.div-point {
	font-size: 20px;
	font-weight: 500;
	font-family: 'Ubuntu', sans-serif;
	margin-bottom: 1px;
}

.div-profileTxt {
	font-size: 18px;
	font-weight: 300;
	font-family: 'Ubuntu', sans-serif;
	margin-bottom: 10px;
}

.btn-profile {
	margin-top: 35px;
	font-family: 'Ubuntu', sans-serif;
	width: 100px;
	height: 30px;
	border-radius: 7px;
}

/* 하단 플랜보기  */
.container2 {
	width: 93%;
	margin-left: 40px;
}

.div-myPage-title {
	margin-top: 20px;
	font-size: 30px;
	font-weight: 600;
	font-family: 'Ubuntu', sans-serif;
	display: inline-block;
	width: 170px;
}

.div-plan-list {
	margin-left: 5px;
}

.div-best-plan-map {
	float: left;
}

.div-plan-map {
	/* width: 380px; */
	height: 420px;
	display: inline-block;
	margin: 5px 10px 10px 0px;
}

.div-plan-title {
	font-size: 28px;
	font-weight: 500;
	font-family: 'Ubuntu', sans-serif;
	display: block;
}

.div-plan-private {
	width: 80px;
	height: 30px;
	color: rgba(255, 255, 255, 0.8);
	font-size: 18px;
	font-family: 'Ubuntu', sans-serif;
	background: rgba(42, 90, 133, 0.5);
	border-radius: 5px;
	text-align: center;
	float: right;
	cursor: pointer;
}

.div-plan-add {
	font-weight: 600;
	color: white;
	font-size: 40px;
	text-align: center;
	width: 380px;
	height: 380px;
	border: 2px dashed white;
	background: rgba(200, 200, 200, 0.4);
	border-radius: 10px;
	display: inline-block;
}
/* 검색창 */
.container3 {
	float: left; width : 93%;
	margin-left: 40px;
	width: 93%;
}


#custom-search-input {
	padding: 3px;
	border: solid 1px #E4E4E4;
	border-radius: 6px;
	background-color: #fff;
}

#custom-search-input input {
	border: 0;
	box-shadow: none;
}

#custom-search-input button {
	margin: 2px 0 0 0;
	background: none;
	box-shadow: none;
	border: 0;
	color: #666666;
	padding: 0 8px 0 10px;
	border-left: solid 1px #ccc;
}

#custom-search-input button:hover {
	border: 0;
	box-shadow: none;
	border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search {
	font-size: 23px;
}

/* 좋아요 */
.div-plan-like {
	/* width: 80px;
	height: 30px; */
	color: red;
	font-size: 18px;
	font-family: 'Ubuntu', sans-serif;
	border-radius: 5px;
	text-align: center;
	float: left;
	cursor: pointer;
}

.div-like{
	font-size: 18px;
	font-family: 'Ubuntu', sans-serif;
	width: 100px;
	height: 75px;
	
}
.ui yellow button{
	float: right;
}
</style>
</head>
<body>
	<%@ include file = "/views/common/normal/header.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px;">

			<!-- 내용 넣기 -->
			<div class="container1">
				<!-- 위에 자기내용  -->
				<div class="div-txt-profile">
					<div class="div-best-plan-map">
						<iframe class="plan-map" src=""
							width="300px" height="300px" style="border-color: yellow ;"></iframe>
					</div>
				</div>
				
				<div class="div-txt-profile">
					<div class="div-name">
					<i class="thumbs up outline icon"></i>이번주 Best 플랜</div>
					<div class="div-point">플랜제목</div>
					<div class="div-profileTxt">여행목록</div>
					
					<div>
					<div class="div-like">
						<div>좋아요 수 </div>
						<div class="div-plan-like">
							<i class="icon heart">34</i>
						</div>
					</div>
					<div class="div-like">
						<div>스크랩 수 </div>
						<div class="div-plan-like">
							<i class="cut icon">14</i>
						</div>
					</div>	
					</div>
					<button class="ui yellow button" onclick="location.href ='seePlan_detail.jsp'">보러가기</button>			
				</div>
				
				
			
			</div>
			
			<br>
			<div class="container3">
				<div class="row">
					<div class="col-md-6">
						<!-- <h2>Custom search field</h2> -->
						<div id="custom-search-input">
							<div class="input-group col-md-12" id="div-search-plan">
								<input type="text" class="form-control input-lg"
									placeholder="여행플랜검색" /> <span class="input-group-btn">
									<button class="btn btn-info btn-lg" type="button">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>

			<br> <br clear="both">

			<div class="container2">

				<!-- <i class="calendar alternate outline big icon"></i> -->
				<!-- <div class="div-myPage-title">내 플랜보기</div> -->
				<br>
				<div>
					<!-- 뒤에 지도  등   -->
					<div class="div-plan-list">
						<div class="div-plan-map">
							<iframe class="plan-map"
								src="" width="200px"
								height="200px" style="border-color: yellow ;"></iframe>
							<div class="div-plan-title">플랜 제목</div>
						</div>
						
						<div class="div-plan-map">
							<iframe class="plan-map"
								src="" width="200px"
								height="200px" style="border-color: yellow ;"></iframe>
							<div class="div-plan-title">플랜 제목</div>

						</div>

						<div class="div-plan-map">
							<iframe class="plan-map"
								src="" width="200px"
								height="200px" style="border-color: yellow ;"></iframe>
							<div class="div-plan-title">플랜 제목</div>
						</div>
						<div class="div-plan-map">
							<iframe class="plan-map"
								src="" width="200px"
								height="200px" style="border-color: yellow ;"></iframe>
							<div class="div-plan-title">플랜 제목</div>
						</div>
						<div class="div-plan-map">
							<iframe class="plan-map"
								src="" width="200px"
								height="200px" style="border-color: yellow ;"></iframe>
							<div class="div-plan-title">플랜 제목</div>
						</div>
						<div class="div-plan-map">
							<iframe class="plan-map"
								src="" width="200px"
								height="200px" style="border-color: yellow ;"></iframe>
							<div class="div-plan-title">플랜 제목</div>
						</div>


					</div>
					
				</div>
			</div>
		</div>
		<div class="two wide column"></div>
	</div>

	<!-- Semantic UI -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>



	<%@ include file="/views/common/normal/footer.jsp"%>


		
	</script>
</body>
</html>
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

/* 상단 투어 검색 */
.div-search-area{
	width: 95%;
	display: inline-block;
	vertical-align: middle;
	/* background: red; */
}

.div-dropdown{
	/* background: yellow; */
	width: 300px;	
	display: inline-block;
	margin: 10px 20px 10px 35px;
	display: inline-block;
	vertical-align: middle;
	
}

.div-search-text {
	
	font-size: 27px;
	font-weight: 700;
	font-family: 'Ubuntu', sans-serif;
	margin-top: 10px;
	margin-bottom: 1px;
	text-align: center;
}

/* 하단 투어 보기 */
.container2 {
	width: 95%;
	margin-top: 30px;
	margin-left: 40px;
	/* background: blue; */
}

.div-tour-list {
	margin-left: 5px;
	/* background: red; */
}

.div-tour-img {
	background: yellow;
	width: 330px;
	height: 280px;
	display: inline-block;
	margin: 5px 35px 10px 0;
}

.div-tour-title {
	margin-top: 5px;
	font-size: 24px;
	font-weight: 500;
	font-family: 'Ubuntu', sans-serif;
	display: block;
}
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file="/views/common/header.jsp"%>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px;">

			<!-- 내용시작 -->

			<!-- 상단 검색 창 -->
		
				<div class="div-search-area">
				<form class="ui form">
				<div class="div-search-text">나라 및 도시 검색</div>
					<div class="div-dropdown">
						<div class="field">
							<label>도시 선택</label> 
							<select class="ui fluid dropdown">
								<option value="">State</option>
								<option value="AL">Alabama</option>
								<option value="AK">Alaska</option>
								<option value="AZ">Arizona</option>
							</select>
						</div>
					</div>
					<div class = "div-dropdown">
						<div class="field">
							<label>나라 선택</label>
							<div class="ui fluid search selection dropdown">
								<input name="country" > 
								<i class="dropdown icon"></i>
								<div class="default text">나라를 선택해 주세요</div>
								<div class="menu">
								 	<input type="hidden" name="country">
									<div class="item" data-value="nl">
										<i class="nl flag"></i>Netherlands
									</div>
									<div class="item" data-value="nc">
										<i class="nc flag"></i>New Caledonia
									</div>
									<div class="item" data-value="pg">
										<i class="pg flag"></i>New Guinea
									</div>

								</div>
							</div>
						</div>						
					</div>
					
					<button class="ui yellow basic button" style="margin: auto;">검색하기</button>
				</form>	
			</div>
			<hr>
			<!-- 하단 투어 리스트  -->
			<br>
			<br>
			<div class="ui mt-20">
				<div class="ui huge header">BEST 투어!</div>

				<div class="div-card-tour">

					<div class="card-deck">
						<div class="card" id="card-size">
							<img class="card-img-top" src="/et/image/city/bar.jpg"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">[도시이름]투어명</h5>
								<p class="card-text">69,900원</p>
								<p class="card-text">
									<small class="text-muted">투어컨셉 </small>
								</p>
							</div>
						</div>
						<div class="card" id="card-size">
							<img class="card-img-top" src="/et/image/city/bar.jpg"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">[도시이름]투어명</h5>
								<p class="card-text">69,900원</p>
								<p class="card-text">
									<small class="text-muted">투어컨셉 </small>
								</p>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="/et/image/city/bar.jpg"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">[도시이름]투어명</h5>
								<p class="card-text">69,900원</p>
								<p class="card-text">
									<small class="text-muted">투어컨셉 </small>
								</p>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="/et/image/city/bar.jpg"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">[도시이름]투어명</h5>
								<p class="card-text">69,900원</p>
								<p class="card-text">
									<small class="text-muted">투어컨셉 </small>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<hr>
			<div class="ui mt-20">
				<div class="ui huge header">투어 엿보기</div>

				<div class="div-card-tour">

					<div class="card-deck">
						<div class="card" id="card-size">
							<img class="card-img-top" src="/et/image/city/bar.jpg"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">[도시이름]투어명</h5>
								<p class="card-text">69,900원</p>
								<p class="card-text">
									<small class="text-muted">투어컨셉 </small>
								</p>
							</div>
						</div>
						<div class="card" id="card-size">
							<img class="card-img-top" src="/et/image/city/bar.jpg"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">[도시이름]투어명</h5>
								<p class="card-text">69,900원</p>
								<p class="card-text">
									<small class="text-muted">투어컨셉 </small>
								</p>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="/et/image/city/bar.jpg"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">[도시이름]투어명</h5>
								<p class="card-text">69,900원</p>
								<p class="card-text">
									<small class="text-muted">투어컨셉 </small>
								</p>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="/et/image/city/bar.jpg"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">[도시이름]투어명</h5>
								<p class="card-text">69,900원</p>
								<p class="card-text">
									<small class="text-muted">투어컨셉 </small>
								</p>
							</div>
						</div>
					</div>
				</div>

			</div>



		</div>
		<div class="two wide column"></div>
	</div>

	<!-- footer -->
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
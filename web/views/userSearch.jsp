<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ET_Planner</title>
<link rel="icon" href="../image/common/logo.png">
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Ubuntu:700&amp;subset=latin-ext" rel="stylesheet">

<!-- Semantic UI -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.js"></script>

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
<style>
.question {
	width: 70%;
}

.answer {
	width: 70%;
}

.userSearch {
	width: 350px;
	height: 350px;
	margin: 0 auto;
	float: left;
}

#usercontent {
	width: 350px;
	height: 300px;
}

.idContent {
	margin-left: 55px;
}

.pwdContent {
	margin-left: 50px;
	margin-top: 30px;
}

.active item {
	width: 15px;
}

.main {
	margin-left: 22%;
	margin-top: 40px;
}

.mainlogo {
	text-align: center;
	margin-top: 60px;
	font-family: 'Ubuntu', sans-serif;
}

#logo {
	color: black;
	font-size: 25px;
	text-decoration: none;
}
#joinGo{
	margin-top: 340px;
	margin-left: 550px;
	
}
</style>

</head>
<body>
	<!-- 메인로고 -->
	<div class="mainlogo">
		<a href="http://127.0.0.1:8002/et/" id="logo" title="메인페이지로 이동" style="font-size : 45px;"> 
		<image src="../image/common/logo.png" style="width: 65px; height: 65px;" alt="메인로고">&nbsp;ET Planner</image>
		</a>
	</div>

	<form>
		<!-- 아이디 찾기 -->
		<div class="main">
			<div class="userSearch">
				<div class="ui top attached tabular menu" id="one">
					<div class="active item" style="background-color: whitesmoke;">아이디 찾기</div>
				</div>
				<div class="ui bottom attached active tab segment" id="usercontent"
					style="background-color: whitesmoke;">

					<div class="idContent">
						<div class="ui form">
							<div class="field">
								<label>아이디 질문 찾기</label>
								<div class="ui form">
									<div class="question">
										<select>
											<option value="">질문을 선택해주세요</option>
											<option value="나의 보물 1호는?">나의 보물 1호는?</option>
											<option value="어렸을 때 별명은?">어렸을 때 별명은?</option>
											<option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
											<option value="내가 졸업한 초등학교의 이름은?">내가 졸업한 초등학교의 이름은?</option>
											<option value="내가 태어난 곳은?">내가 태어난 곳은?</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="ui form">
							<div class="field">
								<label>답안</label>
								<div class="answer">
									<input type="text" placeholder="내용을 입력해주세요">
								</div>
							</div>
						</div>
						<br> 
						<a href="http://www.naver.com"><button class="ui button" style="width: 70%;">아이디 찾기</button></a> 
						<br>
						<br> 
						<a href="#"><button class="ui yellow button" style="width: 70%; color: black;">찾은 아이디</button></a>
					</div>
				</div>
			</div>

			<!-- 가운데 여백 주기 div -->
			<div class="userSearch" style="width: 50px; height: 20px;"></div>

			<!-- 비밀번호 찾기 -->
			<div class="userSearch">
				<div class="ui top attached tabular menu">
					<div class="active item" style="background-color: whitesmoke;">비밀번호 찾기</div>
				</div>
				<div class="ui bottom attached active tab segment" id="usercontent" style="background-color: whitesmoke;">

					<div class="pwdContent">
						<br>
						<div class="ui form">
							<div class="field">
								<label>아이디</label>
								<div class="answer">
									<input type="text" placeholder="내용을 입력해주세요">
								</div>
							</div>
						</div>
						<div>
						<br> 
						<a href="http://www.naver.com"><button class="ui button" style="width: 70%;">임시 비밀번호 발급받기</button></a>
						</div>
						<br>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
	</form>
	<!-- 회원가입 하러가기 버튼 -->
	<div id="joinGo">
	<a href="http://www.naver.com"><button class="ui button" style="width:200px; height:35px; background-color: deepskyblue;">ET로 회원가입 하기</button></a> 
	</div>
	
	


	<%-- <!-- footer -->
	<%@ include file= "common/footer.jsp" %> --%>
</body>
</html>
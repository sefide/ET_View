myPage_<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ET_Planner</title>
<link rel="icon" href="/et/image/common/logo.png">
<!-- font 영어 -->
<link href="https://fonts.googleapis.com/css?family=Ubuntu:700&amp;subset=latin-ext" rel="stylesheet">
<!-- font 한글 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700" rel="stylesheet">

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
.main {
	position: absolute;
	left: 420px;
	top: 110px;
	font-family: 'Nanum Gothic', sans-serif;
}
.mainlogo {
	text-align:center;
	margin-top: 20px;
	font-family: 'Ubuntu', sans-serif;
}
#logo {
	color: black;
	font-size: 25px;
	text-decoration: none;
}

#joinForm {
	width: 430px;
	height: 480px;
}

.content{
	margin-left: 30px;
}
</style>
</head>

<body>
	<div class="mainlogo">
		<a href="http://127.0.0.1:8002/et/" id="logo" title="메인페이지로 이동" style="font-size: 43px;"> 
			<image src="/et/image/common/logo.png"style="width: 60px; height: 60px;" alt="메인로고">&nbsp;ET Planner</image>
		</a>
	</div>

	<div class="main">
		<div align="center" class="ui piled segment" id="joinForm">
			<h4 class="ui header" style="font-weight: 500; font-size: 30px; font-family: 'Nanum Gothic', sans-serif;">회원 정보 수정</h4>
			<div class="content">
				<div align="left" class="font">
					<label style="font-weight: 600;">아이디</label>
				</div>
				<div align="left">
					<div class="ui transparent input">
						<input type="text" placeholder="ex)aerin1234">
					</div>
				</div>
				<br>
				<div align="left" class="font">
					<label style="font-weight: 600;">비밀번호</label>
				</div>
				<div align="left">
					<div class="ui transparent input">
						<input type="text" placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<br>
				<div align="left" class="font">
					<label style="font-weight: 600;">수정할 비밀번호</label>
				</div>
				<div align="left">
					<div class="ui transparent input">
						<input type="text" placeholder="수정할 비밀번호를 입력하세요">
					</div>
				</div>
				<br>
				<div align="left" class="font">
					<label style="font-weight: 600;">수정할 비밀번호 확인</label>
				</div>
				<div align="left">
					<div class="ui transparent input">
						<input type="text" placeholder="수정할 비밀번호를 입력하세요">
					</div>
				</div>
				<br>
				<div align="left" class="font">
					<label style="font-weight: 600;">이메일</label>
				</div>
				<div align="left">
					<div class="ui transparent input">
						<input type="text" placeholder="이메일을 입력해주세요">
					</div>
				</div>
				<br>
				<div align="left" class="font">
					<label style="font-weight: 600;">이름</label>
				</div>
				<div align="left">
					<div class="ui transparent input">
						<input type="text" placeholder="이름을 입력해주세요">
					</div>&nbsp;&nbsp;
					<button class="ui secondary button" style="width: 85px; height: 35px; font-size: 12px;">수정하기</button>
					&nbsp;&nbsp;&nbsp;
					<button class="ui secondary button" style="width: 80px; height: 35px; font-size: 12px;">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
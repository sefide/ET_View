<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ET_Planner</title>
<link rel="icon" href="../image/common/logo.png">
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
.userSearch {
	width: 350px;
	height: 370px;
	margin: 0 auto;
	float: left;
	font-family:'Nanum Gothic', sans-serif;"
}
.idContent {
	font-family:'Nanum Gothic', sans-serif;"
}
.answer{
	width: 70%;
}
.font{
	margin-left: 50px;
}
.pTag{
	text-align: center;
	font-size: 11px;
}
.pTag2{
	text-align: center;
	margin-left:140px;
	font-size: 11px;
}
</style>
<body>
	<form>
		<!-- 아이디 찾기 -->
		<div class="main">
			<div class="userSearch">
				<div class="ui top attached tabular menu" id="one">
					<div class="active item" style="background-color: whitesmoke;">비밀번호 찾기</div>
				</div>
				<div class="ui bottom attached active tab segment" id="usercontent" style="background-color: whitesmoke;">
					<div class="idContent" align="center">
						<br>
						<div class="ui form">
							<div class="field">
								<div align="left" class="font"><label style="font-weight: 600;">ID</label></div>
								<div class="answer">
									<input type="text" placeholder="ID를 입력해주세요">
								</div>
							</div>
						</div>
						<br>
						<a href="#"><button class="ui yellow button" 
							style="width: 70%; color: black; font-family: 'Nanum Gothic', sans-serif;">임시 비밀번호 발급받기</button></a>
						<br><br>
						<div class="pTag">회원가입시 입력한 이메일로 임시 비밀번호가</div>
						<div class="pTag2">발급되었습니다.</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
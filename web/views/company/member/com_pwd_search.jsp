<%@ page language="java" contentType="text/html; charset=UTF-8"
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
/* 메인로고 */
.mainlogo {
	text-align:center;
	margin-top: 40px;
	font-family: 'Ubuntu', sans-serif;
}
#logo {
	color: black;
	font-size: 25px;
	text-decoration: none;
}
.main {
	width:30%;
	margin : 50px auto 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
}
.nav{
	width: 100%;
	height: 50px;
	background-color: #FFCC00;
}
/* 컨텐츠 박스 내용 */
#one{
	width: 76%;
	margin-left: 12%;
	font-size: 17px;
}
.userSearch{
	width: 90%;
	margin : 25px auto 0 auto;
}
#usercontent {
	width: 350px;
	height: 300px;
	margin: 0 auto;
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
.font{
	font-size: 20px;
}
#font{
	font-size: 15px;
}

</style>
</head>
<body>
<!-- <div class="nav"></div> -->
<br>
<%@ include file="/views/common/header_com.jsp"%>
	<!-- 메인로고 -->
	<div class="mainlogo">
		<a href="/et/" id="logo" title="메인페이지로 이동" style="font-size: 43px;"> 
			<br><image src="/et/image/common/logo.png"style="width: 60px; height: 60px;" alt="메인로고">&nbsp;ET Planner For Travel Agency</image>
		</a>
	</div>
	<form>
		<!-- 비밀번호 찾기 -->
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
									<input type="text" class="font" placeholder="ID를 입력해주세요">
								</div>
							</div>
						</div>
						<br>
						<a href="#"><button class="ui yellow button" id="font"
							style="width: 70%; color: black; font-family: 'Nanum Gothic', sans-serif;">임시 비밀번호 발급받기</button></a>
						<br><br>
						<div class="pTag">회원가입시 입력한 이메일로 임시 비밀번호가</div>
						<div class="pTag2">발급되었습니다.</div><br><br>
						<a href="http://127.0.0.1:8002/et/views/manager_login.jsp" style="color: black; text-decoration:none; font-size: 17px;">로그인</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
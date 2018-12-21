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
.main {
	width:30%;
	margin : 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
}
.mainlogo {
	width:70%;
	margin : 0 auto;
	text-align:center;
	font-family: 'Ubuntu', sans-serif;
}
table{
	width: 50%;
}
#logo {
	color: black;
	font-size: 25px;
	text-decoration: none;
}

#joinForm {
	width: 430px;
	height: 550px;
}
.pwdQuestion{
	width: 200px;
}
.content{
	margin-left: 30px;
}

</style>
</head>

<body>
<form>
	<table>
		<tr>
			<td>
				<div class="mainlogo">
					<a href="/et/" id="logo" title="메인페이지로 이동" style="font-size: 43px;"> <image src="/et/image/common/logo.png"
							style=" height: 60px;" alt="메인로고">&nbsp;ET Planner</image>
					</a>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="main">
					<div align="center" class="ui piled segment" id="joinForm">
						<h4 class="ui header" style="font-weight: 500; font-size: 30px; font-family: 'Nanum Gothic', sans-serif;">회 원 가 입</h4>
						<div class="content">
							<div align="left" class="font">
								<label style="font-weight: 600;">아이디</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="text" placeholder="아이디를 입력해주세요"><button class="ui button" style="width: 85px; height: 30px; font-size: 12px;">중복확인</button>
								</div>
							</div>
							<div align="left" class="font">
								<label style="font-weight: 600;">비밀번호</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="text" placeholder="비밀번호를 입력하세요">
								</div>
							</div>
							<div align="left" class="font">
								<label style="font-weight: 600;">비밀번호 확인</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="text" placeholder="비밀번호를 입력하세요">
								</div>
							</div>
							<div align="left" class="font">
								<label style="font-weight: 600;">비밀번호 찾기 질문</label>
							</div>
							<div align="left" class="ui form">
								<div class="field">
									<div class="ui form">
										<div class="pwdQuestion">
											<select>
												<option value="">질문을 선택해주세요</option>
												<option value="어렸을 적 꿈은?">어렸을 적 꿈은?</option>
												<option value="가장 좋아하는 꽃은?">가장 좋아하는 꽃은?</option>
												<option value="어머니 성함은?">어머니 성함은?</option>
												<option value="내가 좋아하는 연예인은?">내가 좋아하는 연예인은?</option>
												<option value="가장 좋아하는 동물은?">가장 좋아하는 동물은?</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<br>
							<div align="left" class="font">
								<label style="font-weight: 600;">질문의 답</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="text" placeholder="답을 입력해주세요">
								</div>
							</div>
							<div align="left" class="font">
								<label style="font-weight: 600;">이메일</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="text" placeholder="이메일을 입력해주세요"><button class="ui button" style="width: 97px; height: 30px; font-size: 12px;">이메일인증</button>
								</div>
							</div>
							<div align="left" class="font">
								<label style="font-weight: 600;">이름</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="text" placeholder="이름을 입력해주세요">
									<a href="#"><button class="ui blue right labeled icon button" style="width: 130px; height: 35px; font-size: 13px; color:white;">
									  <i class="right arrow icon"></i>가입하기
									</button></a>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
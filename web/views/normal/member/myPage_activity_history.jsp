<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ET_Planner</title>
<link rel="icon" href="/et/image/common/logo.png">
<!-- font 영어 -->
<link
	href="https://fonts.googleapis.com/css?family=Ubuntu:700&amp;subset=latin-ext"
	rel="stylesheet">
<!-- font 한글 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700"
	rel="stylesheet">

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
/* 프로필  */
.div-img-profile {
	width: 240px;
	height: 240px;
	border: 1px solid gray;
	background: rgba(42, 90, 133, 0.5);;
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
/* 우측 메뉴  */
.div-menu {
	float: right;
	margin-top: 40px;
}

.div-menu  li {
	list-style: none;
	font-size: 20px;
	margin: 10px 0;
	font-weight: 300;
	font-size: 20px;
}

.this-page {
	font-weight: 500;
}

.div-menu a {
	color: black;
}

.div-menu a:hover {
	text-decoration: none;
	color: rgb(254, 200, 0);
}
/* 새 소식 */
.news{
	float: left;
}
</style>
</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file="/views/common/header.jsp"%>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다면 include path를 수정해야합니다-->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px;">
			<div class="container1">
				<!-- 위에 자기내용  -->
				<div class="div-img-profile">
					<img src="/et/image/common/logo_c.png" class="img-profile">
				</div>
				<div class="div-txt-profile">
					<div class="div-name">aerin lee</div>
					<div class="div-point">100 €</div>
					<div class="div-profileTxt">안녕하세요. 귀여운 애디니 입니다.</div>
					<button class="btn-profile">프로필 수정</button>
				</div>
				<div class="div-menu">
					<ul>
						<li><a href="/et/views/normal/member/myPage_main.jsp" class="this-page">
								> 내 플랜보기 </a></li>
						<li><a href="#"> > 나의 활동내역 </a></li>
						<li><a href="/et/views/normal/member/myPage_pointHistory.jsp"> > 포인트
								히스토리 </a></li>
						<li><a href="/et/views/normal/member/user_update.jsp"> > 회원정보 수정 </a></li>
					</ul>
				</div>

			</div>
			<!-- 좌측 하단 새 소식 -->
			<div class="container2">
				<div class="news">새 소식</div>
			</div>
			
			

		</div>
		<div class="two wide column"></div>
	</div>

	<!-- footer -->
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ET_Planner</title>
<link rel="icon" href="/et/image/common/logo.png">

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
	font-family:'Nanum Gothic', sans-serif;
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
	margin-right: 50px;
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
	margin-left: 170px;
	font-size: 30px;
	font-family:'Nanum Gothic', sans-serif;
	padding-top: 50px;
}
#news-content{
	margin-left: 90px;
	font-family:'Nanum Gothic', sans-serif;
}
.container2{
	width : 80%;
	margin-left : 25%;
}

<!-- 나의 Q&A / 스크랩 Q&A -->
.description{
	font-size: 15px;
	width: 90%;
	height: 50px;
}
#redBlue-avel{
	font-size: 15px;
}

</style>
</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file = "/views/common/normal/header.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다면 include path를 수정해야합니다-->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top:120px; margin-left: 30px;">
			<div class="container1">
				<!-- 위에 자기내용  -->
				<div class="div-img-profile">
					<img src="/et/image/common/logo_c.png" class="img-profile">
				</div>
				<div class="div-txt-profile">
					<div class="div-name">aerin lee</div>
					<div class="div-point">100<i class="euro sign icon"></i>
					</div>
					<div class="div-profileTxt">안녕하세요. 귀여운 애디니 입니다.</div>
					<button class="btn-profile">프로필 수정</button>
				</div>
				<div class="div-menu">
					<ul>
						<li><a href="/et/views/normal/myPage/myPage_main.jsp"> > 내 플랜보기 </a></li>
						<li><a href="#"> > 나의 활동내역 </a></li>
						<li><a href="/et/views/normal/myPage/myPage_pointHistory.jsp" class = "this-page"> > 포인트 히스토리 </a></li>
						<li><a href="/et/views/normal/myPage/user_update.jsp"> > 회원정보 수정 </a></li>
					</ul>
				</div>
			</div>
			<table>
				<tr>
				<!-- 좌측 하단 새 소식 -->
					<div style='display:inline; min-width:1000px;'>
					<td rowspan="2">
						<div class="container2" style='display:inline; float:left; width:400px'>
							<div class="news"><b>새 소식</b></div>
							<div class="ui relaxed divided list" id="news-content">
							  <div class="item">
							    <i class="big bell outline icon"></i>
							    <div class="content">		      
							      <div class="description"><b>아진님, 애린님이 회원님의 
							      	<br>"이동수단~" 게시물을 좋아합니다.</b>
							      </div>
							    </div>
							  </div>
							</div>
							<br>
							<div class="ui relaxed divided list" id="news-content">
							  <div class="item">
							    <i class="big bell outline icon"></i>
							    <div class="content">		      
							      <div class="description"><b>병현님이 회원님의 "파리는~"
							      <br>게시물을 스크랩했습니다.</b></div>
							    </div>
							  </div>
							</div>
						</div>
					</td>
					<td><div></div></td>
					<td>
						<div>
							<!-- 나의 Q&A -->	
							<div class="myQnA-content" style='display:inline; float:left; width:500px'>
								<div class="QnA"><b style="font-size: 25px;">나의 Q&A</b></div>
								  <div class="column">
								    <div class="ui raised segment">
								      <a class="ui red ribbon label" id="redBlue-avel">제목</a>
								      <span>안녕하세요</span>
								      <p></p>
								      <a class="ui blue ribbon label" id="redBlue-avel">내용</a>제 이름은 애리닝이에오
								      <p></p>
								    </div>
								  </div>
							</div>
						</div>	
					</td>		
				</tr>
				<tr>
					<td><div style="width: 250px;"></div></td>
					<td>
					<!-- 스크랩 Q&A -->
						<br>
						<div class="scrapQnA-content" style='display:inline; float:left; width:500px; height: 100px;'>
							<div class="QnA"><b style="font-size: 25px;">스크랩 Q&A</b></div>
								<div class="column" >
									<div class="ui raised segment">
										<a class="ui red ribbon label" id="redBlue-avel">제목</a>
									    <span>안녕하세요</span>
									    <p></p>
									    <a class="ui blue ribbon label" id="redBlue-avel">내용</a>
									    <sapn><p>제 이름은 애리닝이에오</p></sapn>
									</div>
								</div>
						</div>
					</td>	
					<td><div></div></td>
				</tr>	
			</table>
			</div>
		<div class="two wide column"></div>
	</div>
	<div style="height: 50px;"></div>
	<br><br>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>
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

#container {
	display: flex;
}

#box-left {
	flex: 1;
}

#box-center {
	flex: 3;
	text-align: center;
}

#box-right {
	flex: 1;
	text-align: right;
}
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file = "/views/common/normal/header.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px;">

			<!-- 내용 넣기 -->

			<!-- 상단 공지사항  -->
			<div class="ui segment" style="margin-top: 40px;">
				<div class="ui two column very relaxed grid">
					<div class="column">
						<h1 class="ui header">
							<img src="/et/image/common/logo.png" class="ui circular image">
							ET Planner 공지사항
						</h1>

					</div>
					<div class="column">
						<p>*비방과 욕설은 금물!</p>
						<p>*좋아요와 스크랩은 환영!</p>
					</div>
				</div>
			</div>
			<br>
			<!-- 중간 회원이 글쓰는 부분 -->

			<div class="ui segment" >
				<div id="container">
					<div id='box-left'>
						<img class="ui small circular image" src="/et/image/common/logo.png">
					</div>
					<div id='box-center'>
						<div class="ui form">
							<div class="field">
								<textarea rows="2" cols="10">QnA내용</textarea>
							</div>
								<div class="ui list" style="text-align: left;">
									
									<div class="content">
									<img class="ui avatar image" src="/et/image/common/logo.png">
										<a class="header"> <span style="color: yellow; ">내아이디</span> </a>
										<div class="ui form">
											<div class="field">
												<div>
												<input type="text" size="100px;" placeholder="댓글을 입력해주세요">
												 <div class="ui right yellow button">입력 </div>
												</div>
											</div>
										</div>
									</div>
								
									</div>
								
								</div>
							</div>
						</div>
					</div>


			<!-- 글 목록 -->
			<div class="ui secondary pointing menu">
				<div class="right menu">
					<button class="ui yellow basic button" style="margin-bottom: 5px;">수정하기</button>
				</div>
			</div>
			<div class="ui segment">
				<div id="container">
					<div id='box-left'>
						<label><h2>회원아이디</h2></label><br>
						<div class="ui labeled button" tabindex="0" style="margin-top : 10px;">
							<div class="ui basic red button">
								<i class="heart icon"></i> 좋아요 수
							</div>
							<a class="ui basic red left pointing label"> 56 </a>
						</div><br>
						<div class="ui labeled button" tabindex="0" style="margin-top : 10px;">
							<div class="ui basic blue button">
								<i class="fork icon"></i> 스크랩 수 
							</div>
							<a class="ui basic left pointing blue label"> 87 </a>
						</div><br>
						<div class="ui labeled button" tabindex="0" style="margin-top : 10px;">
							<div class="ui basic black button">
								<i class="fork icon"></i> 신고 수 
							</div>
							<a class="ui basic left pointing black label"> 7 </a>
						</div>
					</div>
					<div id='box-center'>
						<div class="ui form">
							<div class="field">
								<textarea rows="2" cols="10">QnA내용</textarea>
							</div>
							<div class="ui list" style="text-align: left;">
								<div class="item">
									<img class="ui avatar image" src="/et/image/common/logo.png">
									<div class="content">
										<a class="header"><span style="color: yellow; ">아진</span> </a> 그건 정말 좋은생각이야!
									</div>
								</div>
								<div class="item">
									<img class="ui avatar image" src="/et/image/common/logo.png">
									<div class="content">
										<a class="header"><span style="color: yellow; ">애린</span> </a> 맞아맞아!
									</div>
								</div>
								<div class="item" style="">
									<img class="ui avatar image" src="/et/image/common/logo.png">
									<div class="content">
										<a class="header"> <span style="color: yellow; ">내아이디</span> </a>
										<div class="ui form">
											<div class="field">
												<div  >
												<input type="text" size="100px;" placeholder="댓글을 입력해주세요">
												 <div class="ui right yellow button">입력 </div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>					
				</div>
			</div>
			<div class="ui secondary pointing menu">
				<div class="right menu">
					<button class="ui yellow basic button" style="margin-bottom: 5px;">수정하기</button>
				</div>
			</div>
			<div class="ui segment">
				<div id="container">
					<div id='box-left'>
						<label><h2>회원아이디</h2></label><br>
						<div class="ui labeled button" tabindex="0" style="margin-top : 10px;">
							<div class="ui basic red button">
								<i class="heart icon"></i> 좋아요 수
							</div>
							<a class="ui basic red left pointing label"> 56 </a>
						</div><br>
						<div class="ui labeled button" tabindex="0" style="margin-top : 10px;">
							<div class="ui basic blue button">
								<i class="fork icon"></i> 스크랩 수 
							</div>
							<a class="ui basic left pointing blue label"> 87 </a>
						</div><br>
						<div class="ui labeled button" tabindex="0" style="margin-top : 10px;">
							<div class="ui basic black button">
								<i class="fork icon"></i> 신고 수 
							</div>
							<a class="ui basic left pointing black label"> 7 </a>
						</div>
					</div>
					<div id='box-center'>
						<div class="ui form">
							<div class="field">
								<textarea rows="2" cols="10">QnA내용</textarea>
							</div>
							<div class="ui list" style="text-align: left;">
								<div class="item">
									<img class="ui avatar image" src="/et/image/common/logo.png">
									<div class="content">
										<a class="header"><span style="color: yellow; ">아진</span> </a> 그건 정말 좋은생각이야!
									</div>
								</div>
								<div class="item">
									<img class="ui avatar image" src="/et/image/common/logo.png">
									<div class="content">
										<a class="header"><span style="color: yellow; ">애린</span> </a> 맞아맞아!
									</div>
								</div>
								<div class="item" style="">
									<img class="ui avatar image" src="/et/image/common/logo.png">
									<div class="content">
										<a class="header"> <span style="color: yellow; ">내아이디</span> </a>
										<div class="ui form">
											<div class="field">
												<div  >
												<input type="text" size="100px;" placeholder="댓글을 입력해주세요">
												 <div class="ui right yellow button">입력 </div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>					
				</div>
			</div>








		</div>
		<div class="two wide column"></div>
	</div>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>
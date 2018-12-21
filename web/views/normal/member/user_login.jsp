<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>ET_Planner</title>
<link rel="icon" href="/et/image/common/logo.png">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- font 영어 -->
<link href="https://fonts.googleapis.com/css?family=Ubuntu:700&amp;subset=latin-ext" rel="stylesheet">
<!-- font 한글 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700" rel="stylesheet">

<!-- 카카오톡 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 네이버 -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
#main {
	width: 27%;
	margin : 120px auto 0 auto;
}

.login {
	width: 300px;
	height: 35px;
}

#loginBtn {
	width: 300px;
	height: 48px;
}

.search {
	font-size: 12px;
	text-align: center;
	font-family:'Nanum Gothic', sans-serif;
}

#join {
	font-size: 12px;
	text-align: center;
	text-decoration: none;
	color: black;
	
}

#managerlogin {
	font-size: 12px;
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	font-family:'Nanum Gothic', sans-serif;
}

.mainlogo {
	text-align: center;
	font-family: 'Ubuntu', sans-serif;
}

#logo {
	color: black;
	font-size: 25px;
	text-decoration: none;
}


</style>
</head>
<body>
	<!--로그인페이지 시작-->
	<div class="main" id = "main">
		<form>
			<table>
				<tr>
					<td>
						<div class="mainlogo">
							<a href="/et/" id="logo" title="메인페이지로 이동" style="font-size : 39px;">
								<image src="/et/image/common/logo.png" style="width: 50px; height: 50px;" alt="메인로고">&nbsp;ET Planner</image>
							</a>
						</div> <br> <br>
					</td>
				</tr>
				<tr>
					<td>
						<div class="ui left icon input">
							<input type="text" placeholder="ID" class="login"> 
							<i class="lock icon"></i>
						</div>
						<br><br>
					</td>
				</tr>
				<tr>
					<td>
						<div class="ui left icon input">
							<input type="text" placeholder="PASSWORD" class="login">
							<i class="key icon"></i>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="search">
							<br> 
							<a href="/et/views/normal/member/user_search.jsp" style="color: black; text-decoration:none;">혹시 아이디 혹은 비밀번호를 잊으셨나요?</a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<button class="ui blue button" id="loginBtn">LOGIN</button> <br>
						<br> 
						
						<!-- 카카오톡 로그인 연동 시작 -->
						<div id="kakao">
							<a id="custom-login-btn" href="javascript:loginWithKakao()">
								<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300" />
							</a>
							<script type='text/javascript'>
							  //<![CDATA[
							    // 사용할 앱의 JavaScript 키를 설정해 주세요.
							    Kakao.init('KEY-VALUE');
							    function loginWithKakao() {
							      // 로그인 창을 띄웁니다.
							      Kakao.Auth.login({
							        success: function(authObj) {
							          alert(JSON.stringify(authObj));
							        },
							        fail: function(err) {
							          alert(JSON.stringify(err));
							        }
							      });
							    };
							  //]]>
							</script>
						</div> 
						<!-- 카카오톡 로그인 연동 끝 --> 
						<br> 
						
						<!-- 네이버 로그인 연동 시작 -->
						<!-- 네이버아이디로로그인 버튼 노출 영역 -->

						<div id="naver_id_login"> 
						<!-- //네이버아이디로로그인 버튼 노출 영역 --> 
						<script type="text/javascript">
						  	var naver_id_login = new naver_id_login("KEY-VALUE", "http://127.0.0.1:8002/et/views/normal/member/user_login_callback.jsp");
						  	var state = naver_id_login.getUniqState();
						  	naver_id_login.setButton("green", 6,65);
						  	naver_id_login.setDomain("http://127.0.0.1:8002/et/views/normal/member/user_login.jsp");
						  	naver_id_login.setState(state);
						  	naver_id_login.setPopup();
						  	naver_id_login.init_naver_id_login();
						  	
						  	/* var naverLogin = new naver.LoginWithNaverId(
						  			{
						  				clientId: "{tcR9vwEXbbuTYhKDCt7X}",
						  				callbackUrl: "{http://127.0.0.1:8002/et/views/login.jsp}",
						  				isPopup: true, ->팝업을 통한 연동처리 여부 
						  				loginButton: {color: "green", type: 3, height: 48} 
						  			}
						  		);
						  		
							 설정정보를 초기화하고 연동을 준비 
						  	naverLogin.init();  */
						  </script>
						</div>
						<!-- 네이버 로그인 연동 끝 -->
					</td>
				</tr>
				<tr>
					<td>
						<div id="join">
							<br><a href="/et/views/normal/member/user_join.jsp" style="color: black; text-decoration:none; font-family:'Nanum Gothic', sans-serif;">아이디가 없으시다면 지금 바로 회원가입 하세요!</a>
							<br>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="managerlogin">
							<br> 
							<div>관리자/제휴사 로그인 하러가기 &nbsp;
							<a href="/et/views/manager/manager_login.jsp" style="color: black; text-decoration:none"> <i class="large hand point right outline icon"></i></a>
							</div>
							<br>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>
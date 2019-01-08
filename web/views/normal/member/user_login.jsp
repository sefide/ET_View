<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.et.member.model.vo.Member"%>
<%
	String msg = (String)request.getAttribute("msg");
	String joinmsg = (String)request.getAttribute("joinmsg");
%>

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
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<!-- <script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->

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
	width: 36%;
	margin : 60px auto 0 auto;
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
.kakao-login-popup{
	position : absolute ;
	width : 420px;
	background : rgba(255,255,255, 0.9);
	padding : 1%;
	border : 1px solid gray;
	text-align : center;
	top: 20%;
    left: 35%;
    	visibility : hidden;
}
.kakao-popup-txt{
	font-size : 18px;
	font-weight : 700;
	margin-bottom : 10px;
}


</style>
</head>
<body>
	<!--로그인페이지 시작-->
	<div class = "kakao-login-popup">
		<i class = "close icon" onclick = "closePop();"></i>
		<div align = "center" id = "resultClaim">
			<label class = "kakao-popup-txt">이메일</label>
			<input type="email" name="userEmail" id="getuserEmail" placeholder="이메일을 입력해주세요"> 
			<span>
				<button class="ui button" onclick="return sendEmail();" style="width: 110px; height: 30px; font-size: 12px;">인증번호발송</button>
			</span>
			<!-- 인증번호 생성 -->
				<%!public int getRandom() {
					int randomCode = 0;
					randomCode = (int) Math.floor((Math.random() * 99999 - 10000 + 1)) + 10000;
					return randomCode;
				}%>
			<input type="hidden" value="<%=getRandom()%>" id="randomCode">
			
			<!-- 인증번호 입력란 -->
			<div class="ui transparent input" id="sendEmailClick">
				<input id="authCode" type="text" placeholder="인증번호를 입력하세요">
				<span>
					<a><button class="ui button" onclick="return auth();" style="width: 97px; height: 30px; font-size: 12px;">인증하기</button></a>
				</span>
			</div>
			<button id = "submitClaim"> 가입 완료 </button>
		</div>
	</div>
	<div class="main" id = "main">
		<form id="loginForm" action="<%= request.getContextPath() %>/login.me" method="post">
			<table align="center">
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
							<input type="text" placeholder="ID" class="login" name="userId"> 
							<i class="lock icon"></i>
						</div>
						<br><br>
					</td>
				</tr>
				<tr>
					<td>
						<div class="ui left icon input">
							<input type="password" placeholder="PASSWORD" class="login" name="userPwd">
							<i class="key icon"></i>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="search">
							<br> 
							<a href="/et/views/normal/member/user_search.jsp" style="color: black; text-decoration:none;">혹시 아이디 혹은 비밀번호를 잊으셨나요?</a>
						</div><br>
					</td>
				</tr>
				<tr>
					<td>
						<button class="ui blue button" id="loginBtn" onclick="login();">LOGIN</button> <br>
						<br> 
						
						<!-- 카카오톡 로그인 연동 시작 -->
						<div id="kakao">
							<a id="custom-login-btn" href="javascript:loginWithKakao()">
								<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300" />
							</a>
							<script type='text/javascript'>
							  //<![CDATA[
							    // 사용할 앱의 JavaScript 키를 설정해 주세요.
							    Kakao.init('key-value');
							    function loginWithKakao() {
							      // 로그인 창을 띄웁니다.
							      Kakao.Auth.login({
							        success: function(authObj) {
							          /* alert(JSON.stringify(authObj)); */
							          	Kakao.API.request({
							          		url:'/v1/user/me',
							          		success:function(data){
							          			var userId = data.id;//아이디
							          			var userEmail = data.kaccount_email;//이메일 받아오기
							          			var userEmail_verified = data.kaccount_email_verified; // 이메일 인증여부 확인 
							          			
							          			if(userEmail == null || !userEmail_verified){
							          				alert("이메일은 필수정보입니다. 이메일 정보제공을 동의해주세요.");
							          				Kakao.Auth.logout();
							          			}else {
							          				location.href="<%=request.getContextPath()%>/kakaoLogin.me?userId="+userId+"&userEmail="+userEmail+"&password=0202";
							          			}
							          		}
							          	})
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
						
						<!-- 가운데 여백 주기 div -->
						<div class="userSearch" style="width: 10px; height: 20px;"></div>
	
						<!-- 네이버 로그인 연동 시작 -->
						
						<!-- 네이버아이디로로그인 버튼 노출 영역 -->
						<div id="naverIdLogin"></div>
						<!-- //네이버아이디로로그인 버튼 노출 영역 -->
						<!-- 네이버아디디로로그인 초기화 Script -->
						<script type="text/javascript">
							var naverLogin = new naver.LoginWithNaverId(
								{
									clientId: "key-value",
									callbackUrl: "http://127.0.0.1:8003/et/views/normal/member/user_NaverLogin_callback.jsp",
									isPopup: false, /* 팝업을 통한 연동처리 여부 */
									loginButton: {color: "green", type: 3, height: 65} /* 로그인 버튼의 타입을 지정 */
								}
							);
							
							/* 설정정보를 초기화하고 연동을 준비 */
							naverLogin.init();
							
						</script>
						
						<!-- 네이버 로그인 연동 끝 -->
					</td>
				</tr>
				<tr>
					<td>
						<div id="join">
							<br><a href="/et/views/normal/member/user_join.jsp"
							style="color: black; text-decoration:none; font-family:'Nanum Gothic', sans-serif;" >아이디가 없으시다면 지금 바로 회원가입 하세요!</a>
							<br>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="managerlogin">
							<br> 
							<div>
							<a href="/et/views/common/manager/manager_login.jsp" style="color: black; text-decoration:none">관리자/제휴사 로그인 하러가기&nbsp;<i class="large hand point right outline icon"></i></a>
							</div>
							<br>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script>
		function login(){
			$("#loginForm").submit;
		}
		
		$(function(){
			<% System.out.println("msg : " + msg);
			if(msg != null){ %>
			alert("<%=msg%>");
			<%} %>
		});
		
		$(function(){
			<% System.out.println("msg : " + joinmsg);
			if(joinmsg != null){ %>
			alert("<%=joinmsg%>");
			<%} %>
		});
		
		//이메일 인증번호 발송		
		function sendEmail(){
			$("#sendEmailClick").show();
			
			var randomCode = $("#randomCode").val();
			
			var getuserEmail = document.getElementById("getuserEmail").value;
			
			$.ajax({
				url:"/et/sendEmail.me",
				type:"get",
				data:{userEmail:getuserEmail,randomCode:randomCode},
				success:function(data){
					if(data == "SUCCESS"){
						alert("인증코드 발송 성공!");
					}else{
						alert("인증코드 발송 실패");
					}
				},
				error:function(){
					console.log("실패!");
				}
			});
			return false;
				
		}	
		//이메일 인증코드 확인
		function auth(){
			if($("#authCode").val() == $("#randomCode").val()){
				alert("이메일이 인증되었습니다.");
				$("#emailCheckImg").show();
				$("#emailCheckImg").attr("src",checkImgPath);
			}else{
				alert("이메일 인증 실패");
			}
			return false;
		}
	</script>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>ET_Planner</title>
<link rel="icon" href="ET.png">
<!-- 카카오톡 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 네이버 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
	left: 490px;
	top: 150px;
}

.login {
	width: 300px;
	height: 35px;
}

#loginBtn {
	width: 300px;
	height: 48px;
}

#usersearch {
	font-size: 10px;
	text-align: center;
	text-decoration: none; /*a태그 밑줄 없애기*/
}

#join {
	font-size: 10px;
	text-align: center;
	text-decoration: none;
}

#managerlogin {
	font-size: 10px;
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
}

.mainlogo {
	text-align: center;
}

#logo {
	color: black;
	font-size: 30px;
}

.column {
	height: 100%;
}

.nav-item {
	margin: 0 36px;
}

.nav-left-mrg {
	margin-left: 28%;
}

.mt-20 {
	margin-top: 20px
}
</style>
</head>
<body>
	<!-- 네비게이션 시작 -->
    <!-- <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white">   
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" 
        data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
            
        <div class="collapse navbar-collapse nav-left-mrg" id="navbarTogglerDemo01">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0"> 
                <li class="nav-item">
                    <a class="nav-link" href="#">플랜짜기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">플랫엿보기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">투어엿보기</a>
                </li>
                <li class="nav-item">
                        <a class="nav-link" href="#">Q&A</a>
                </li>
            </ul>
        </div>
    </nav> -->
    <!-- 네비게이션 끝 -->
    
    
    <!-- footer 시작 -->
    <nav class="navbar fixed-bottom navbar-expand-lg navbar-light bg-light" >           
            <div class="collapse navbar-collapse nav-left-mrg" id="navbarTogglerDemo01">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0"> 
                    <li class="nav-item">
                        <a class="nav-link" href="#">제휴문의</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">고객센터</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">이용약관</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">광고 서비스 이용약관</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link" href="#">개인정보 취급방침</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- footer 끝 -->

    <!--로그인페이지 시작-->
    <div class="main">
        <form>
            <table>
                <tr>
                    <td>
                        <div class="mainlogo">
                            <a href="#" id="logo" title="메인페이지로 이동">
                                <image src="ET.png" style="width: 50px; height: 50px;" alt="메인로고">&nbsp;ET Planner</image>
                            </a>
                        </div>
                        <br><br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="ui left icon input">
                            <input type="text" placeholder="ID" class="login">
                            <i class="lock icon"></i>
                        </div>
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
                        <div id="usersearch">
                            <br>
                            <a href="#" style="color: black">혹시 아이디 혹은 비밀번호를 잊으셨나요?</a>
                        </div>
                    </td>      
                </tr>
                <tr>
                    <td> 
                        <button class="ui blue button" id="loginBtn">LOGIN</button>       
                        <br><br>
                        <!-- 카카오톡 로그인 연동 시작 -->
                        <div id="kakao">
							<a id="custom-login-btn" href="javascript:loginWithKakao()">
							<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
							</a>
							<script type='text/javascript'>
							  //<![CDATA[
							    // 사용할 앱의 JavaScript 키를 설정해 주세요.
							    Kakao.init('15a9324659e56b04d48506cedaead3f5');
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
					
					
						<!-- 네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naver_id_login">
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("tcR9vwEXbbuTYhKDCt7X", "http://localhost:8002/et/view/login.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 2,40);
  	naver_id_login.setDomain("http://localhost:8002/et/view/login.jsp");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
						
						</div>
                    </td>   
                </tr>
                <tr>
                    <td>
                        <div id="join">
                            <a href="#" style="color: black">아이디가 없으시다면 지금 바로 회원가입 하세요!</a>
                            <br>
                        </div>
                    </td>      
                </tr>
                <tr>
                    <td>
                        <div id="managerlogin">
                            <br>
                            <span>관리자/제휴사 로그인 하러가기</span>&nbsp;
                            <span><a href="#" style="color: black">
                                <i class="large hand point right outline icon"></i></a></span>
                            <br>
                        </div>
                    </td>      
                </tr>
            </table>
        </form>  
    </div>
	
	
</body>
</html>
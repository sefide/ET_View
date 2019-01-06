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
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script> -->
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
	width: 90%;
	margin-top:30px;
	margin-left:140px;:
	font-family: 'Nanum Gothic', sans-serif;
}
#main-children{
	width: 80%;
	margin-right: 10%;
}
.question {
	width: 70%;
}

.answer {
	width: 70%;	
}
.userSearch {
	width: 100%;

	font-family:'Nanum Gothic', sans-serif;"
}

#usercontent {
	width: 350px;
	height: 400px;
}

.idContent {
	margin-top:30px;
	font-family:'Nanum Gothic', sans-serif;"
}

.pwdContent{
	margin-top: 25px;
}


.mainlogo {
	width:90%;
	margin-left:55%;
	font-family: 'Ubuntu', sans-serif;
}
.content{
	margin-top: 30px;
}
#logo {
	color: black;
	font-size: 25px;
	text-decoration: none;
}
#joinGo{
	width:60%;
	margin-top:30px;
	margin-left: 65%;
	
}
.font{
	margin-left: 50px;
	font-weight: 600; 
	font-family: 'Nanum Gothic', sans-serif;
}
.pTag1, .pTag2{
	text-align: center;
	font-size: 13px;
}

</style>

</head>
<body>
<div class="main" align="center">
	<div id="main-children">
		<%-- <form id="idSearchForm" action="<%=request.getContextPath()%>/idsearch.me" method="post"> --%>
			<table align="center">
				<tr>
					<td>
					<div class="mainlogo" align="center">
						<a href="http://127.0.0.1:8003/et/" id="logo" title="메인페이지로 이동" style="font-size: 43px;"> 
							<image src="/et/image/common/logo.png"style="height: 50px;" alt="메인로고">&nbsp;ET Planner</image>
						</a>
					</div>
					</td>
				</tr>
				<tr>
					<td>
						<!-- 아이디 찾기 -->
						<div class="content">
							<div class="userSearch">
								<div class="ui top attached tabular menu" id="one">
									<div class="active item" style="background-color: whitesmoke;">아이디 찾기</div>
								</div>
								<div class="ui bottom attached active tab segment"
									id="usercontent" style="background-color: whitesmoke;">
									<div class="idContent" align="center">
										<div class="ui form">
											<div class="field">
												<div align="left" class="font">
													<label style="font-weight: 600;">아이디 질문 찾기</label>
												</div>
												<div class="ui form">
													<div class="question">
														<select name="userQuestion" id="userQuestion">
															<option value="">질문을 선택해주세요</option>
															<option value="어렸을 적 꿈은?">어렸을 적 꿈은?</option>
															<option value="가장 좋아하는 꽃은?">가장 좋아하는 꽃은?</option>
															<option value="내가 태어난 곳은?">내가 태어난 곳은?</option>
															<option value="내가 좋아하는 연예인은?">내가 좋아하는 연예인은?</option>
															<option value="가장 좋아하는 동물은?">가장 좋아하는 동물은?</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<br>
										<div class="ui form">
											<div class="field">
												<div align="left" class="font">
													<label>답안</label>
												</div>
												<div class="answer">
													<input type="text" name="userAnwser" id="userAnwser" placeholder="답안을 입력해주세요">
												</div>
												<br>
												<div align="left" class="font">
													<label>이메일</label>
												</div>
												<div class="answer">
													<input type="email" name="userEmail" id="userEmail" placeholder="이메일을 입력해주세요">
												</div>
											</div>
										</div>
										<br><a href="#"><button class="ui yellow button" onclick="return idSearch();" style="width: 69%; margin-left:5px; 'Nanum Gothic', sans-serif; color:black;">아이디 찾기</button></a> <br> <br> 
									</div>
									<div class="pTag1">
										<a href="/et/views/common/manager/manager_login.jsp" style="color: black; fontext-decoration:none;">로그인 하러가기&nbsp;<i class="large hand point right outline icon"></i></a>
									</div>
								</div>
							</div>
						</div>
					</td>
					<td>
						<!-- 가운데 여백 주기 div -->
						<div class="userSearch" style="width: 50px; height: 20px;"></div>
					</td>
					<td>
						<!-- 비밀번호 찾기 -->
						<div class="content">
							<div class="userSearch">
								<div class="ui top attached tabular menu">
									<div class="active item" style="background-color: whitesmoke; font-family: 'Nanum Gothic', sans-serif;">비밀번호 찾기</div>
								</div>
								<div class="ui bottom attached active tab segment" id="usercontent" style="background-color: whitesmoke;" align="center">
									<div class="pwdContent" >
										<br>
										<div class="ui form">
											<div class="field">
												<div align="left" class="font">
													<label>아이디</label>
												</div>
												<div class="answer">
													<input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요">
												</div>
												<br>
												<div align="left" class="font">
													<label>이메일</label>
												</div>
												<div class="answer">
													<input type="email" name="userEmailPass" id="userEmailPass" placeholder="이메일을 입력해주세요">
												</div>
											</div>
										</div>
										<div>
										<br><button class="ui button" onclick="pwdSearch();" style="width: 70%; font-family: 'Nanum Gothic', sans-serif;">임시 비밀번호 발급받기</button>
										<%! public static String getRamdomPassword(){
												char[] charSet 
													= new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
																	, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'
																	, 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R'
																	, 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' }; 
												int idx = 0; 
												StringBuffer sb = new StringBuffer(); 
												//System.out.println("charSet.length :::: "+charSet.length); 
												for(int i = 0; i < 10; i++) { 
													idx = (int) (charSet.length * Math.random());
													//System.out.println("idx :::: "+idx); 
													sb.append(charSet[idx]); 
													} // 36 * 생성된 난수를 Int로 추출 (소숫점제거)
												
												return sb.toString();
											}
										%>
											<input type="hidden" value="<%=getRamdomPassword()%>" id="randomCode">
										</div>
										<br>
										<div class="pTag2">
											<p>회원가입시 입력한 이메일로 임시 비밀번호가  <br>발급되었습니다.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 회원가입 하러가기 버튼 -->
						<div id="joinGo" align="center">
							<a href="/et/views/normal/member/user_join.jsp"><button class="ui blue button" style="color: black; font-family: 'Nanum Gothic', sans-serif; font-size: 15px;">ET로 회원가입 하기</button></a>
						</div><br>
					</td>
					<td></td>
				</tr>
			</table>
		<!-- </form> -->
	</div>
</div>
<script>

	$(".pTag1").hide();
	$(".pTag2").hide();

	function pwdSearch(){	//액션 따로 주기!!
		$("#idSearchForm").attr("action", "<%=request.getContextPath()%>/login.company")
		$("#idSearchForm").submit;
	}
	
	//아이디 찾기
	 function idSearch(){
		var userQuestion = $("#userQuestion").val();
		var userAnwser = $("#userAnwser").val();
		var userEmail = $("#userEmail").val(); 
		
		//console.log("확인");
		
		$.ajax({
			url:"/et/idsearch.me",
			type:"get",
			data:{userQuestion:userQuestion, userAnwser:userAnwser, userEmail:userEmail},	//아이디를 찾기 위해 보내주어야 할 데이터
			success:function(data){
				if(data == "FAIL"){
					alert("찾으시는 아이디가 없습니다");
				}else{
					alert("찾으시는 아이디는 " + "[ " + data  + " ]" + " 입니다.");
					$(".pTag1").show();
				}
			},
			error:function(){
				console.log("실패!");
			}
		});
		return false; 
			
	}	 
	
	//아이디 찾기 시 이메일 유효성 검사
	$("#userEmail").change(function(){
		var userQuestion = $("#userQuestion").val();
		var userAnwser = $("#userAnwser").val();
		var userEmail =  $("#userEmail").val();
		
		$.ajax({
			url:"/et/emailCheck.me",
			type:"get",
			data:{userQuestion:userQuestion, userAnwser:userAnwser},
			success:function(data){
				if(data != userEmail){
					alert("회원 가입시 입력한 이메일을 입력해주세요");
					$("#userEmail").html("");
					console.log("이메일 입력란을 공백처리 했습니다.");
				}else{
					console.log(data);
					return false;
				}
			},
			error:function(){
				console.log("실패!");
			}
		});
			
	});
	
	
	//임시비밀번호 발급
	function pwdSearch(){
		var randomCode = $("#randomCode").val();
		
		var userId = document.getElementById("userId").value;
		var userEmailPass = document.getElementById("userEmailPass").value;
		
		/* var email1 = document.getElementById("email1").value;
		var email2 = document.getElementById("email2").value;
		var fullEmail = email1 + "@" + email2; */
		
		 $.ajax({
			url:"/et/temporaryPassword.me",
			type:"get",
			data:{userId:userId, userEmailPass:userEmailPass, randomCode:randomCode},
			success:function(data){
				if(data == "SUCCESS"){
					alert("임시비밀번호 발송 성공!");
					$(".pTag2").show();
				}else{
					alert("임시비밀번호 발송 실패");
				}
			},
			error:function(){
				console.log("실패!");
			}
		});
		 
	}	 
</script>


	<%-- <!-- footer -->
	<%@ include file= "common/footer.jsp" %> --%>
</body>
</html>
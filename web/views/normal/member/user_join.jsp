<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.et.member.model.vo.Member"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ET_Planner</title>

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
	width:100%;
	margin : 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
}
.mainlogo {
	margin-top:20px;
	text-align: center;
	font-family: 'Ubuntu', sans-serif;
}
#logo {
	color: black;
	font-size: 25px;
	text-decoration: none;
}

#joinForm {
	width: 100%;;
	margin : 0 auto;
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
<form id="joinForm" action="<%=request.getContextPath()%>/insert.me" method="post">
	<table align="center">
		<tr>
			<td>
				<div class="mainlogo" align="center">
					<a href="/et/index.jsp" id="logo" title="메인페이지로 이동" style="font-size: 43px;"> <image src="/et/image/common/logo.png"
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
									<input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요">
									<button class="ui button" onclick="return idCheck();" style="width: 85px; height: 30px; font-size: 12px;">중복확인</button>
								</div>
							</div>
							<div align="left" class="font">
								<label style="font-weight: 600;">비밀번호</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="password" name="userPwd" id="pass" placeholder="비밀번호를 입력하세요">
								</div>
							</div>
							<div align="left" class="font">
								<label style="font-weight: 600;">비밀번호 확인</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="password"  id="newpass"placeholder="비밀번호를 입력하세요">
								</div>
							</div>
							<div align="left" class="font">
								<label style="font-weight: 600;">비밀번호 찾기 질문</label>
							</div>
							<div align="left" class="ui form">
								<div class="field">
									<div class="ui form">
										<div class="pwdQuestion">
											<select name="userQuestion">
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
							<div align="left" class="font">
								<label style="font-weight: 600;">질문의 답</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="text" name="userAnwser" placeholder="답을 입력해주세요">
								</div>
							</div>
							<div align="left" class="font">
								<label style="font-weight: 600;">이메일</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="email" name="userEmail" id="email"placeholder="이메일을 입력해주세요"><button class="ui button" style="width: 97px; height: 30px; font-size: 12px;">이메일인증</button>
								</div>
							</div>
							<div align="left" class="font">
								<label style="font-weight: 600;">이름</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="text" name="userName" id="name" placeholder="이름을 입력해주세요">
									<button type="submit" onclick="return join();" class="ui blue right labeled icon button"  
											style="width: 130px; height: 35px; font-size: 13px; color:white;">
									  <i class="right arrow icon"></i>가입하기
									</button>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>
	</form>
	<script>
	function join(){
		$("#joinForm").submit;
	}
	$(function(){
		<% System.out.println("msg : " + msg);
		if(msg != null){ %>
		alert("<%=msg%>");
		<%} %>
	});
	
	//아이디 중복체크
	function idCheck(){
		var userId = $("#userId").val();
		//console.log("확인");
		
		$.ajax({
			url:"/et/idCheck.me",
			type:"post",
			data:{userId:userId},
			success:function(data){
				if(data == "fail"){
					alert("이미 사용중인 아이디 입니다.");
				}else{
					alert("사용 가능한 아이디입니다.");
				}
			},
			error:function(){
				console.log("실패!");
			}
		});
		return false;
			
	}	
	
	//회원가입 유효성 검사
	function join(){
		console.log("test")
		//아이디 검사
		var idEx1 = /[a-z]{3,}/;	//영어로만 3글자 이상
		var idEx11 = /\D/;
		var userId = document.getElementById("userId").value;
		//변수1.test(변수2)) => 해당하는 변수값이 문자열에 존재하는지 boolean으로 리턴
		//변수2의 값이 변수1에 해당하는지(존해하는지 => 아이디값이 [a-z]{3,}의 조건에 부합하니?)
		console.log(idEx1.test(userId));
		if(idEx1.test(userId)&& userId.length <= 15){
			setTimeout(function(){alert("사용 가능한 아이디 입니다.")},1000);
		}else{
			setTimeout(function(){alert("아이디를 형식에 맞게 다시 입력해주세요!")},1000);
			return false;
		}

		
		//비밀번호 검사
		var passEx1 = /[a-z0-9]{4,}/ig;	//영어,숫자로 4글자 이상 이루어져야함, 대소문자 관계없이
		var passEx11 = /\d+\S/;	//숫자가 1개 이상 포함되어야 한다.
		var pass = document.getElementById("pass").value;
		
		if(passEx1.test(pass) && passEx11.test(pass)
				&& pass.length >= 6){	//비밀번호는 6자 이상
			setTimeout(function(){alert("사용 가능한 비밀번호 입니다.")},2000);
			//alert("사용 가능한 비밀번호입니다"); 
		}else{
			setTimeout(function(){alert("비밀번호를 형식에 맞게 다시 입력해주세요!")},2000);
			//alert("비밀번호를 형식에 맞게 다시 입력해주세요!");
			return false;
		}
		
		
		//비밀번호 확인 검사
		//비밀번호, 비밀번호 확인의 값이 일치하는지
		/* var input = document.getElementsByName("input");
		var inputPwd1 = input[1].value;	//input태그중 배열 인덱스 1번째 input
		var inputPwd11 = input[2].value;	//input태그중 배열 인덱스 2번째 input */
		var pass = document.getElementById("pass");
		var newpass = document.getElementById("newpass");
		
		if(pass.value == newpass.value){
			setTimeout(function(){alert("입력한 비밀번호가 설정됩니다")},2000);
			//alert("입력한 비밀번호가 설정됩니다");
		}else{
			setTimeout(function(){alert("비밀번호가 일치하지 않습니다. 확인해주세요!")},2000);
			//alert("비밀번호가 일치하지 않습니다. 확인해주세요!");
			/* pass.style.background="red";	//비밀번호 입력칸 빨갛게
			newpass.style.background="red";	//비밀번호 확인 입력칸 빨갛게 */
			pass.focus();	//비밀번호 입력칸으로 커서가 돌아간다
			return false;
		}
		
		//이메일 검사
		//4글자 이상이 나오고
		//@가 나오고
		//주소가 1글자 이상
		var emailEx1 = /\w{4,}@\w{1,}.\w{1,3}/;	//4글자이상@1글자이상.1~3글자
		var email = document.getElementById("email").value;
		
		if(emailEx1.test(email)){
			setTimeout(function(){alert("사용 가능한 이메일 입니다.")},2000);
			//alert("사용 가능한 이메일 입니다.");
		}else{
			setTimeout(function(){alert("이메일을 형식에 맞게 다시 입력해주세요!")},2000);
			//alert("이메일을 형식에 맞게 다시 입력해주세요!");
			return false;
		} 
		
		//setTimeout(function(){alert("ET Planner에 오신걸 환영합니다~^O^")},3000);
		return true;
	}
	
	
	 
	</script>
</body>
</html>
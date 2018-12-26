<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.et.company.model.vo.Company"%>
<%
	String msg1 = (String)request.getAttribute("msg1"); 
	String msg2 = (String)request.getAttribute("msg2");

%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ET_Planner</title>
<link rel="icon" href="../image/common/logo.png">
<!-- font 영어 -->
<link href="https://fonts.googleapis.com/css?family=Ubuntu:700&amp;subset=latin-ext" rel="stylesheet">
<!-- font 한글 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700" rel="stylesheet">

<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
	top: 80px;
}
.mainlogo {
	text-align: center;
	font-family: 'Ubuntu', sans-serif;
}
.search {
	font-size: 12px;
	text-decoration: none; /*a태그 밑줄 없애기*/
	font-family: 'Nanum Gothic', sans-serif;

}

#loginBtn {
	width: 185px;
	height: 38px;
	color: black;
	font-family: 'Nanum Gothic', sans-serif;
}

#form {
	width: 300px;
}

.font {
	margin-left: 40px;
	font-family: 'Nanum Gothic', sans-serif;
}

</style>
</head>
<body>
<div class="main" >
	<div class="mainlogo">
		<a href="http://127.0.0.1:8003/et/" id="logo" title="메인페이지로 이동" style="font-size: 39px; text-decoration:none; color:black"> 
		<image src="/et/image/common/logo.png" style="width: 50px; height: 50px;" alt="메인로고">&nbsp;ET Planner</image>
		</a>
	</div>
	<br>
	<br>
	<div align="center">
		<div class="ui top attached tabular menu" id="form">
			<a class="item active" data-tab="manager" style="font-family:'Nanum Gothic', sans-serif;">관리자</a>
			<a class="item" data-tab="tour" style="font-family:'Nanum Gothic', sans-serif;">제휴사</a>
		</div>
		<!-- 관리자 -->
	<form  id="managerLoginForm" action="<%=request.getContextPath() %>/login.manager" method="post">
		<div align="center" class="ui bottom attached tab segment active" data-tab="manager" id="form" style="background-color: whitesmoke;">
			<div align="left" class="font">
				<label style="font-weight: 600;">ID</label>
			</div>
			<div class="ui input">
				<input type="text" placeholder="아이디를 입력해주세요" name="managerId">
			</div>
			<br>
			<br>
			<div align="left" class="font">
				<label style="font-weight: 600;">PASSWORD</label>
			</div>
			<div class="ui input">
				<input type="password" placeholder="비밀번호를 입력해주세요" name="managerPwd">
			</div>
			<br>
			<br>
			<div class="search">
				<a href="#" style="color: black; text-decoration:none">혹시 아이디 혹은 비밀번호를 잊으셨나요?</a>
			</div>
			<br>
			<a href="#"></a><button class="ui blue button" id="loginBtn" onclick="manager_login();">관리자 로그인</button></a>
			<br>
			<br>
		</div>
	</form>
	<!-- 제휴사 -->
	<form id="companyLoginForm" action="<%= request.getContextPath()%>/login.company" method="post">
		<div align="center" class="ui bottom attached tab segment" data-tab="tour" id="form" style="background-color: whitesmoke;">
			<div align="left" class="font">
				<label style="font-weight: 600;">ID</label>
			</div>
			<div class="ui input">
				<input type="text" placeholder="아이디를 입력해주세요" name="companyId">
			</div>
			<br>
			<br>
			<div align="left" class="font">
				<label style="font-weight: 600;">PASSWORD</label>
			</div>
			<div class="ui input">
				<input type="password" placeholder="비밀번호를 입력해주세요" name="companyPwd">
			</div>
			<br>
			<br>
			<div class="search">
				<a href="http://127.0.0.1:8003/et/views/tour_pwd_search.jsp" style="color: black; text-decoration:none">비밀번호를 잊으셨나요?</a>
			</div>
			<br>
			<a href="#"><button type="submit" class="ui yellow button" id="loginBtn" onclick="company_login();">제휴사 로그인</button></a>
			<br>
			<br>
		</div>	
	</form>	
	</div>	
</div>

	<!-- J-query CDN -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<!-- Semantic UI JS CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

	<!-- tab 스크립트 -->
	<script>
		$('.menu .item').tab();
		
		function manager_login(){
			$("#managerLoginForm").submit;
		}
		
		$(function(){
			<% System.out.println("msg : " + msg1);
				if(msg1 != null){%>
				alert("<%= msg1%>");
			<%} %>
		}); 
		
		function company_login(){
			$("#companyLoginForm").submit;
		}
		
		$(function(){
			<% System.out.println("msg : " + msg2);
				if(msg2 != null){%>
				alert("<%= msg2%>");
			<%} %>	
		});
	</script>

</body>
</html>
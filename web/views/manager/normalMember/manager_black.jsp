<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<!-- Semantic UI -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<!-- 글꼴  -->
	<link rel="stylesheet" href="/css/style.css">
<style>
 	.main_01{
 		margin:2%;
 		float:left;
	}
	.ul_01{
		list-style:none;     
		margin-top: 10px;
	  	margin-left: -30px;
	  	margin-right: 10px;
	}  
	table{
 	width:900px;
 	height:80px;
 	text-align:center;
	}
 	table,tr,td,th{
 		border:1px solid black;
 	}
 	td{
 		width:300px;
	 }
 	th{
 		background-color:lightgray;
 	}
 	.btn{
 		margin-left:87%;
 	}
	
		
</style>
</head>
<body>
	<%@ include file = "/views/common/manager/header_manager.jsp" %>
	<%@ include file = "/views/common/manager/manager_nav1.jsp" %>
	
	
    <div class="main_01">
    	<div class="ui header title">▶블랙리스트</div>
    	- 정지 회원 조회 <br><br>
    	<div>
    		<table>
    			<tr>
    				<th>정지목록</th>
    				<th>회원번호</th>
    				<th>아이디</th>
    				<th>이메일</th>
    				<th>가입일</th>
    				<th>이름</th>
    				<th>정지 시작일</th>
    				<th>정지 종료일</th>
    				<th>정지기간</th>
    			</tr>
    			<tr>
    				<td><input type="checkbox" ></td>
    				<td>001</td>
    				<td>dog</td>
    				<td>dog@naver.com</td>
    				<td>2018-12-12</td>
    				<td>개</td>
    				<td>2018-12-15</td>
    				<td>2018-12-25</td>
    				<td>10일</td>
    			</tr>
    			<tr>
    				<td><input type="checkbox" ></td>
    				<td>002</td>
    				<td>cat</td>
    				<td>cat@naver.com</td>
    				<td>2018-12-17</td>
    				<td>고냔</td>
    				<td>2018-12-17</td>
    				<td>2018-12-22</td>
    				<td>5일</td>
    			</tr>
    		</table>
    		<div class="btn">
    			<button>정지 취소하기</button>
    		</div>
    	</div>
    	<br><br>
    	<div>
    		- 탈퇴 회원 조회 <br><br>
    		<table>
    			<tr>
    				<th>회원번호</th>
    				<th>아이디</th>
    				<th>이메일</th>
    				<th>가입일</th>
    				<th>이름</th>
    				<th>탈퇴일</th>
    			</tr>
    			<tr>
    				<td>001</td>
    				<td>dog</td>
    				<td>dog@naver.com</td>
    				<td>2018-12-12</td>
    				<td>개</td>
    				<td>2018-12-25</td>
    			</tr>
    			<tr>
    				<td>002</td>
    				<td>cat</td>
    				<td>cat@naver.com</td>
    				<td>2018-12-17</td>
    				<td>고냔</td>
    				<td>2018-12-22</td>
    			</tr>
    		</table>
    	</div>
    	
    </div>
	
	<div class = "two wide column"></div>
	
	<%@ include file = "/views/common/company/footer_com.jsp" %>
</body>
</html>
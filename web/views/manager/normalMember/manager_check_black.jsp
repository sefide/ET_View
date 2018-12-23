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
	.ul_01{
		list-style:none;     
		margin-top: 10px;
	  	margin-left: -30px;
	  	margin-right: 10px;
	}  
	.main_02{
	   	 margin:2%;
	   	 float:left;
	}

	 #tb1{
	 	width:800px;
	 	text-align:center;
	 }
	 table,tr,td,th{
	 	border:1px solid black;
	 }
	 td{
	 	width:50px;
	 }
	  th{
 		background-color:lightgray;
 	}
 	
	 .btn{
	 	margin-left:78%;
	 }
	 .notice{
	 	float:left;
	 	margin-left:2%;
	 }
	 .tb{
	 	width:900px;
	 }
</style>
</head>
<body>
<%@ include file = "/views/common/manager/header_manager.jsp" %>
<%@ include file = "/views/common/manager/manager_nav1.jsp" %>
   
    <div class="main_02">
    
    	<div class="ui header title"><br>▶블랙리스트</div>
    	
    	<div class="tb">
    	- 블랙 회원 조회 <br><br>
    	<table id="tb1">
    		<tr>
    			<th>선택</th>
    			<th>회원번호</th>
    			<th>아이디</th>
    			<th>이메일</th>
    			<th>신고수</th>
    		</tr>
    		<tr>
    			<td><input type="checkbox"></td>
    			<td>001</td>
    			<td>dog</td>
    			<td>dog@daum.net</td>
    			<td>1</td>
    		</tr>
    		<tr>
    			<td><input type="checkbox"></td>
    			<td>002</td>
    			<td>cat</td>
    			<td>cat@daum.net</td>
    			<td>12</td>
    		</tr>	
    		
    		<!-- 정보뽑아오는거는 나중에 for문 이용하기!  -->
    		
    	</table>
    	<div class="btn">
    	<button onclick="">정지</button>
    	<button onclick="">탈퇴</button>
    	</div>
    	
    </div>
    </div>
    
    
    
    
    <div class="notice">
    <br><br>
    <b>-회원 정지 기준</b><br>
    	<div>
    		신고 5개 - 10일 정지 <br>
    		신고 10개 - 3주 정지 <br>
    		신고 20개 - 강제탈퇴 <br>
    	</div>
    	
    </div>
    
	<div class = "two wide column"></div>
	
	<%@ include file = "/views/common/company/footer_com.jsp" %>
</body>
</html>
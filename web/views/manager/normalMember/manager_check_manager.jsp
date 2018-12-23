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
	.main_01{
	   	 margin:2%;
	   	 float:left;
	}
	#tb1{
	 	width:900px;
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
	 #tb2{
	 	float:left;
	 	width:500px;
	 	text-align:center;
	 	
	 }
	 
   	 
</style>
</head>
<body>
<%@ include file = "/views/common/manager/header_manager.jsp" %>
<%@ include file = "/views/common/manager/manager_nav1.jsp" %>
   
    <div class="main_02">
    
    	<div class="ui header title"><br>▶회원정보 조회</div>
    	- 회원정보 <br><br>
    	<table id="tb1">
    		<tr>
    			<th>번호</th>
    			<th>아이디</th>
    			<th>이메일</th>
    			<th>가입일</th>
    			<th>이름</th>
    			<th>블랙회원여부</th>
    			<th>포인트</th>
    			<th>질문</th>
    			<th>답변</th>
    		</tr>
    		<tr>
    			<td>0001</td>
    			<td>wzoo</td>
    			<td>wzoo@daum.net</td>
    			<td>2018-12-17</td>
    			<td>공주</td>
    			<td>Y</td>
    			<td>200</td>
    			<td>내가 존경하는 인물은?</td>
    			<td>이순신</td>
    		</tr>
    		<tr>
    			<td>0002</td>
    			<td>dog</td>
    			<td>dog@daum.net</td>
    			<td>2018-12-17</td>
    			<td>개</td>
    			<td>N</td>
    			<td>1234</td>
    			<td>내가 존경하는 인물은?</td>
    			<td>불독</td>
    		</tr>
    		
    		<!-- 정보뽑아오는거는 나중에 for문 이용하기!  -->
    		
    	</table>
    </div>
    
    
    
    <div>
    <br><br><br>
    -회원 포인트 현황<br><br>
    	<table id="tb2">
    		<tr>
    			<th bgcolor="lightgray" width="1px">회원 최대 포인트</th>
    			<td>244</td>
    		</tr>
    		<tr>
    			<th bgcolor="lightgray">200포인트 이상 회원 수 </th>
    			<td>3</td>
    	</table>
    </div>
	
	<div class = "two wide column"></div>
	
	<%@ include file = "/views/common/company/footer_com.jsp" %>
</body>
</html>
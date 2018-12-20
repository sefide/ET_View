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
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Ubuntu" rel="stylesheet">
<style>
body {

font-family: 'Nanum Gothic', sans-serif;
font-family: 'Ubuntu', sans-serif;
}


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
table{
 	width:800px;
 	height:120px;
 	text-align:center;
 	
 }
 table,tr,td{
 	border:1px solid black;
 	
 }
 td{
 	width:300px;
 	
 } 
 th{
 	background-color:lightgray;
 	border:1px solid black;
 }
 .num{
 	width:116px;
 }
 #td111 {
 font-family: 'Nanum Gothic', sans-serif;
 }
</style>
</head>
<body>
<%@ include file = "../common/header_manager.jsp" %>
<%@ include file = "../common/manager_company_nav1.jsp" %>
	
    <div class="main_01">
    	<div class="ui header title" >▶제휴사 관리</div>
    	- 제휴사 조회 <br><br>
    	<table id="tb1">
    		<tr>
    			<th></th>
    			<th id="td111">번호</th>
    			<th>제휴사명</th>
    			<th>사업자번호</th>
    			<th>연락처</th>
    			<th>등급</th>
    			<th>계약기간</th>
    			<th>대표자</th>
    			
    		</tr>
    		<tr>
    			<td class="num"><input type="checkbox" name="checkbox"></td>
    			<td>1</td>
    			<td>하나투어</td>
    			<td>114-86-977987</td>
    			<td>02-1234-5678</td>
    			<td>premium</td>
    			<td>2018-02-02</td>
    			<td>박현우</td>
    		</tr>
    		
    		
  
    	</table>
    	<br>
    	<button style=float:right;>삭제하기</button>
    	<button style=float:right;margin-right:30px;>수정하기</button>
    	<button style=float:right;margin-right:30px; >추가하기</button>
    </div>
	
 <div class = "two wide column"></div> 
		
	<%@ include file = "../common/footer_com.jsp" %>
</body>
</html>
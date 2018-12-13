<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<style>
	.column {
		height : 100%;
	}
	
	.img-travel-agency{
		width: 40px;
		border-radius :50%;
		border : 1px solid black;
		display : inline-block;
	}
</style>
</head>
<body>
	<%@ include file = "common/header_com.jsp" %>
	
	<div class="ui grid">
       	<div class = "two wide column"></div>
      	<div class = "twelve wide column" style="margin-top:90px;">
      		<div class = "container">
	      		<img src = "../image/common/logo.png" class ="img-travel-agency">
	      		<h2> 제휴사명 </h2>
	      		<div class="ui mt-20"> 
	      			<i class="certificate icon"></i>
	                <div class="ui header">내가 작성한 투어 </div>
	                <div>
	                	<table>
	                		<tr>
	                			<td> <label> 투어명 : </label> </td>
	                			<td> 투어명 예시 </td>
	                		</tr>
	                		<tr>
	                			<td> <label> 투어컨셉 : </label> </td>
	                			<td> 투어컨셉 예시 </td>
	                		</tr>
	                		<tr>
	                			<td> <label> 투어설명 : </label> </td>
	                			<td class = "td-tour-detail"> 투어설명 예시 </td>
	                		</tr>
	                		<tr>
	                			<td> <label> 투어가격 : </label> </td>
	                			<td> 투어가격 </td>
	                		</tr>
	                	</table>
						<p> 파워링크여부 </p>
						<p> 연결링크 </p>
						<a> </a>
	                </div>
	            </div>
	      		<div class="ui mt-20"> 
	      			<i class="certificate icon"></i>
	                <div class="ui header">다른 투어보기 </div>
		            <div>
		            
		            </div>
	            </div>
      		</div>
		</div>
		<div class = "two wide column"></div>
	</div>
	<%@ include file = "common/footer_com.jsp" %>
</body>
</html>
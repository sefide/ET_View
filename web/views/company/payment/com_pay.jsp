<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Ubuntu" rel="stylesheet">


<style>
	body{
		width: 300px;
		height: 280px;
		
	}
	
	
	.outer{
		
		width:300px;
		height:250px;
		font-family: 'Nanum Gothic', sans-serif;
		font-weight: 800
		
	}
	table{
		width:280px;
		height:200px;
		border:1px solid black;
		margin-left: auto;
		margin-right: auto;
		margin-top:10px;
		border-collapse: collapse;
	}
	table tr td{
		border:1px solid black;
		
	}
	.btnArea{
		text-align: center;
	}
</style>

</head>
<body>
	
	<div class="outer">
		<table>
			<tr style="text-align:center; height:50px; background-color: rgb(42,90,133)">
				<td colspan="3" style="color:white; font-weight: 800;">충전할 쿠폰 개수를 선택해주세요!</td>
			</tr>
			<tr style="text-align: center; height:50px; font-weight: 800;">
				<td><input type="radio" name="count">1개</td>
				<td><input type="radio" name="count">5개</td>
				<td><input type="radio" name="count">10개</td>
			</tr>
			<tr>
				<td colspan="3" style="font-weight: 800;">선택하신 쿠폰 개수: <label>5개</label></td>
			</tr>
			<tr>
				<td colspan="3">결제금액 : <label>100000원</label></td>
			</tr>
		</table>
		<br>
		<div class="btnArea">
			<button>취소하기</button>
			<button>결제하기</button>
		</div>
	</div>
</body>
</html>
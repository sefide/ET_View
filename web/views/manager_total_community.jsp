<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

	table.small {
		margin-left:200px;
		border:1px solid black;
		cursor: pointer;
		
	}
	#td1 {
		font-size:20px;
		font-style: bold;
	}
	
	table.type02 {
    border-collapse: separate;
    border-spacing: 0;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
 	margin-left:auto;
	margin-right:auto;
}
	table.type02 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #fff;
    border-left: 1px solid #fff;
    background: #eee;
}
	table.type02 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}

	#h1 {
		margin-top:100px;
		text-align:center;
	}
	#h3 {
		text-align:center;
	}

</style>
</head>
<body>
	<h1 id="h1">커뮤니티 현황</h1>
	<h3 id="h3">-커뮤니티 정보</h3>
		<table class="small">
			<tr>
				<td onclick="location.href='#'" id="td1">커뮤니티 현황</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			
			<tr>
				<td>게시글 조회</td>
			</tr>
		
		</table>

	<table class="type02">
    <tr>
        <th scope="row">총 게시물 수 </th>
        <td>0개</td>
    </tr>
    <tr>
        <th scope="row">오늘의 게시물 수</th>
        <td>0개</td>
    </tr>
    <tr>
        <th scope="row">일일 평균 게시물 수</th>
        <td>0개</td>
    </tr>
    
      <tr>
        <th scope="row">오늘 글 올린 회원 수</th>
        <td>0명</td>
    </tr>
</table>
</body>
</html>
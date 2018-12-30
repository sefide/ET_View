<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, com.kh.et.member.model.vo.*"%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	PageInfo pi=(PageInfo)request.getAttribute("pi");
	int listCount=pi.getListCount();
	int currentPage=pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
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
	   	 display:flex;
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
	 .nav{
 		width:20%;
 	}
 	.sub{
 		width:75%;
 	}
</style>
</head>
<body>
<%@ include file = "/views/common/manager/header_manager.jsp" %>
   
    <div class="main_02">
    	<div class="nav">	
			<%@ include file = "/views/common/manager/manager_nav1.jsp" %>
    	</div>
    
    	<div class="sub">
    	
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
    		<% for(Member m : list){ %>
	    		<tr height="27px">
	    			<td><input type="checkbox"></td>
	    			<td><%= m.getM_no() %></td>
	    			<td><%= m.getM_id() %></td>
	    			<td><%= m.getM_email() %></td>
	    			<td>신고수</td>
	    		</tr>
	    		<%} %>
    	</table>
    	
    	<div class="btn">
    	<button onclick="">정지</button>
    	<button onclick="">탈퇴</button>
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
    
    </div>
    </div>
    
	<div class = "two wide column"></div>
	
	<%@ include file = "/views/common/company/footer_com.jsp" %>
</body>
</html>
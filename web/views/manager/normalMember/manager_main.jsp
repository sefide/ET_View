<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.kh.et.manager.model.vo.*"%>
<%
	int[] select = (int[])request.getAttribute("select");
%>    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ET Planner Manager</title>
<link rel="icon" href="/et/image/common/logo.png">
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
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Ubuntu" rel="stylesheet">
	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
<style>

.ul_01{
	list-style:none;     
	margin-top: 10px;
	margin-left: -30px;
	margin-right: 10px;
 }  
 .main_01{
 	margin:2%;
 	display:flex;
}
table{
 	width:600px;
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

    <div class="main_01">
    	
    	<div class="nav">
			<%@ include file = "/views/common/manager/manager_nav1.jsp" %>
    	</div>
    
    	<div class="sub">
    	    <script type="text/javascript">
		      google.charts.load('current', {'packages':['bar']});
		      google.charts.setOnLoadCallback(drawChart);
		
		      function drawChart() {
		        var data = google.visualization.arrayToDataTable([
		          ['', '전체회원', '오늘의 신규회원', '탈퇴회원'],
		          ['회원현황', <%= select[0] %>, <%= select[1] %>, <%= select[2] %>]
		        ]);
		
		        var options = {
		          chart: {
		            title: '▶회원현황',
		            subtitle: '- 전체현황',
		          }
		        };
		
		        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
		
		        chart.draw(data, google.charts.Bar.convertOptions(options));
		      }
		    </script>
    		<div id="columnchart_material" style="width: 600px; height: 450px;"></div>
    	
    	
    	
	    	<%-- <div class="ui header title">▶회원현황</div>
	    	- 전체현황 <br><br>
	    	<table id="tb1">
	    		<tr>
	    			<th>전체회원</th>
	    			<td><%= select[0] %>명</td>
	    		</tr>
	    		<tr>
	    			<th>오늘의 신규회원</th>
	    			<td><%= select[1] %>명</td>
	    		</tr>
	    		<tr>
	    			<th>탈퇴한 회원</th>
	    			<td><%= select[2] %>명</td>
	    		</tr>
	    	</table> --%>
	    </div>
	</div>
	
    
	
	<div class = "two wide column"></div>
	

	<%@ include file = "/views/common/company/footer_com.jsp" %>

</body>
</html>
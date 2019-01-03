<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.et.manager.model.vo.*,com.kh.et.plan.model.vo.*"%>
    
    
     <%ArrayList<HashMap<String,Object>> list=(ArrayList<HashMap<String,Object>>)request.getAttribute("list");
    PageInfo pi=(PageInfo)request.getAttribute("pi");
    ArrayList<City> list2=(ArrayList<City>)request.getAttribute("list2");

    int listCount=pi.getListCount();
    int currentPage = pi.getCurrentPage();
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
 .main_01{
 	margin:2%;
 	float:left; 
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
 	border:1px solid black;
 }
 .num{
 	width:116px;
 }
 #table1 {
 	width:1000px;
 	height:200px;
 	text-align:center
 }
</style>
</head>
<body>
<%@ include file = "/views/common/manager/header_manager.jsp" %>
<%@ include file = "/views/common/manager/manager_plan_nav.jsp" %>
	
    <div class="main_01">
    	<div class="ui header title">▶여행지 관리</div>
    	- 여행지 조회 <br><br>
    	<table id="tb1">
    		<tr>
    		
    			<th style=width:60px;>번호</th>
    			<th>나라명</th>
    			<th>도시명</th>
    			<th>인기순위</th>
    			
    		</tr>
    		<% for(int i=0;i<list.size();i++){
    			HashMap<String,Object>hmap=list.get(i);
    		%>
    		<tr>
    			
    			<td><%=hmap.get("ctNo") %></td>
    			<td><%=hmap.get("ctName") %></td>
    			<td><%=hmap.get("ctCountry") %></td>
    			<td><%=hmap.get("rank") %></td>
    		</tr>
    		<%} %>
    		
  
    	</table>
    	<br>
     <table id="table1">
    	<tr>
    	
    		<th></th>
			<th>번호  </th>    	
    		<th>나라명</th>
    		<th>도시명</th>
    		<th>상세설명</th>

    	</tr>
    	<%for(City city:list2) {%>
    	<tr>
    	<td class="num"><input type="checkbox" name="checkbox" class="chkCheckBox" value=<%=city.getCtNo()%>></td>
    	<td><%=city.getCtNo() %></td>
    	<td><%=city.getCtCountry() %></td>
    	<td><%=city.getCtName() %></td>
    	<td><%=city.getCtInfo() %></td>
    	
    	</tr>
		<%} %>
    	</table>
    	
    	<br>
    	<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectCity.mng?currentPage = 1'"> << </button>
			
			<% if(currentPage <= 1){ %>
			<button disabled> < </button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectCity.mng?currentPage=<%=currentPage - 1%>'"> < </button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
					<button disabled><%= p %></button>
			<%      }else{ %>
					<button onclick="location.href='<%=request.getContextPath()%>/selectCity.mng?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
	
			<% } %>
			
			
			<% if(currentPage >= maxPage){ %> <!-- 마지막 페이지일 경우 -->
			<button disabled> > </button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectCity.mng?currentPage=<%=currentPage + 1%>'"> > </button>
			<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectCity.mng?currentPage=<%=maxPage%>'"> >> </button> 
			
		</div>
    	
    	<button style=float:right>삭제하기</button>
    	<button style=float:right;margin-right:30px; id="updateBtn">수정하기</button>
    
 
	<script>
	$(function(){
 		$("#updateBtn").click(function(){
 			var items = [];
 			$(".chkCheckBox:checked").each(function(){
 				items.push($(this).val());
 				console.log(items);
 			});
 			location.href = '<%=request.getContextPath()%>/updateOne.mng?chkValue='+items;
 			
 		});
 	
 	
 	});
	
	</script>
	  
	 
	 <div class = "two wide column"></div> 
	   <%@ include file = "/views/common/company/footer_com.jsp" %>
	 </div>
</body>
</html>
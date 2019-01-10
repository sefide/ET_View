<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, com.kh.et.member.model.vo.*" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	PageInfo pi=(PageInfo)request.getAttribute("pi");
	int listCount=pi.getListCount();
	int currentPage=pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	int[] arr= (int[])request.getAttribute("arr");
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
	   	 display:flex;
	}
	#tb1{
	 	width:1100px;
	 	text-align:center;
	 }
/* 	 table,tr,td,th{
	 	border:1px solid black;
	 } */
	 td{
	 	width:50px;
	 }
	  th{
 		background-color:lightgray;
 	}
	 #tb2{
	 	width:500px;
	 	text-align:center;
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
    
	    	<div class="ui header title"><br>▶회원정보 조회</div>
	    	- 회원정보 <br><br>
	   
	    	<table id="tb1" class="table">
	    		<tr height="27px">
	    			<th>번호</th>
	    			<th>아이디</th>
	    			<th>이메일</th>
	    			<th>가입일</th>
	    			<th>이름</th>
	    			<th>블랙회원여부</th>
	    			<th>포인트</th>
	    			<th width="100px">질문</th>
	    			<th>답변</th>
	    		</tr>
	    		<% for(Member m : list){ %>
	    		<tr height="27px">
	    			<td><%= m.getM_no() %></td>
	    			<td><%= m.getM_id() %></td>
	    			<td><%= m.getM_email() %></td>
	    			<td><%= m.getM_date() %></td>
	    			<td><%= m.getM_name() %></td>
	    			<td><%= m.getM_black_status() %></td>
	    			<td><%= m.getM_point() %></td>
	    			<td><%= m.getM_question() %></td>
	    			<td><%= m.getM_answer() %></td>
	    		</tr>
	    		<%} %>
	    	
	    	</table>
	    	<br>
	    <div class="pagingArea" align="center">
			<button  class="ui black basic button" onclick="location.href='<%=request.getContextPath() %>/select02.mng?currnetPage=1'"><<</button>
			<% if(currentPage <=1) {%>
			<button  class="ui black basic button" disabled><<<</button>
			<%}else{ %>
			<button  class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/select02.mng?currentPage=<%= currentPage -1%>'"><</button>		
			<%} %>
			
			<% for(int p=startPage; p<=endPage;p++){ 
				if(p==currentPage){
			%>		<button  class="ui black basic button" disabled><%= p %></button>
			<%	}else{ %>
					<button  class="ui black basic button" onclick="location.href='<%= request.getContextPath()%>/select02.mng?currentPage=<%= p%>'"><%= p %></button>
			
			<% }%>
			
			<%} %>
			
			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<%}else{ %>
			<button  class="ui black basic button" onclick="location.href='<%= request.getContextPath()%>/select02.mng?currentPage=<%= currentPage +1%>'">></button>
			<%} %>
			
			<button  class="ui black basic button" onclick="location.href='<%= request.getContextPath()%>/select02.mng?currentPage=<%=maxPage%>'">>></button>
			
			
			
		</div>
	    
	    
	    <%-- 
	    <div>
	    <br><br><br>
	    -회원 포인트 현황<br><br>
	    	<table id="tb2">
	    		<tr>
	    			<th bgcolor="lightgray" width="1px">회원 최대 포인트</th>
	    			<td><%= arr[0] %></td>
	    		</tr>
	    		<tr>
	    			<th bgcolor="lightgray">200포인트 이상 회원 수 </th>
	    			<td><%= arr[1] %></td>
	    	</table>
	    </div> --%>
    
     </div>
     
     </div>
	
	<div class = "two wide column"></div>
	
	<%@ include file = "/views/common/company/footer_com.jsp" %>
</body>
</html>
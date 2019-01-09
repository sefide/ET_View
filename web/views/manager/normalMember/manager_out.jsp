<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, com.kh.et.member.model.vo.*"%>
<%
	ArrayList<Member> outList = (ArrayList<Member>)request.getAttribute("outList");
	PageInfo pi2=(PageInfo)request.getAttribute("pi2");
	int listCount2=pi2.getListCount();
	int currentPage2=pi2.getCurrentPage();
	int maxPage2 = pi2.getMaxPage();
	int startPage2 = pi2.getStartPage();
	int endPage2 = pi2.getEndPage();
%>

<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
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
 	.main_01{
 		margin:2%;
 		display:flex;
	}
	.ul_01{
		list-style:none;     
		margin-top: 10px;
	  	margin-left: -30px;
	  	margin-right: 10px;
	}  
	table{
 	width:900px;
 	height:80px;
 	text-align:center;
	}
 	td{
 		width:300px;
	 }
 	th{
 		background-color:lightgray;
 	}
 	.btn{
 		margin-left:-1%;
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
    
    	<div class="ui header title">▶블랙리스트</div>
    	
    		- 탈퇴 회원 조회 <br><br>
    		<table class="table">
    			<tr>
    				<th>탈퇴목록</th>
    				<th>회원번호</th>
    				<th>아이디</th>
    				<th>이메일</th>
    				<th>이름</th>
    				<th>가입일</th>
    				<th>탈퇴일</th>
    			</tr>
    			<% for(Member m : outList){ %>
	    		<tr height="27px">
	    			<td><input id = "check" type="checkbox" value=<%= m.getM_no() %>></td>
	    			<td><%= m.getM_no() %></td>
	    			<td><%= m.getM_id() %></td>
	    			<td><%= m.getM_email() %></td>
	    			<td><%= m.getM_name() %></td>
	    			<td><%= m.getM_date() %></td>
	    			<td><%= m.getM_out_date() %></td>
	    		</tr>
	    		<%} %>
    		</table>
    		
    		<br>
    		<div class="pagingArea" align="center">
			<button class="ui black basic button" onclick="location.href='<%=request.getContextPath() %>/select05.mng?currnetPage2=1'"><<</button>
			<% if(currentPage2 <=1) {%>
			<button class="ui black basic button" disabled><<<</button>
			<%}else{ %>
			<button class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/select05.mng?currentPage2=<%= currentPage2 -1%>'"><</button>		
			<%} %>
			
			<% for(int p2=startPage2; p2<=endPage2;p2++){ 
				if(p2==currentPage2){
			%>		<button class="ui black basic button" disabled><%= p2 %></button>
			<%	}else{ %>
					<button class="ui black basic button" onclick="location.href='<%= request.getContextPath()%>/select05.mng?currentPage2=<%= p2%>'"><%= p2 %></button>
			
			<% }%>
			
			<%} %>
			
			<% if(currentPage2 >= maxPage2){ %>
			<button class="ui black basic button" disabled>></button>
			<%}else{ %>
			<button class="ui black basic button" onclick="location.href='<%= request.getContextPath()%>/select05.mng?currentPage2=<%= currentPage2 +1%>'">></button>
			<%} %>
			
			<button class="ui black basic button" onclick="location.href='<%= request.getContextPath()%>/select05.mng?currentPage2=<%=maxPage2%>'">>></button>
		</div>
		
    		<div class="btn">
    			<button id="restore" class="ui lightgrey button">회원 복구</button>
    		</div>
    		
    	</div>
    	</div>
    	
    	 <script>
			$(function(){
	    		var arr=new Array;
				
				//회원탈퇴
				$("#restore").click(function(){
					var restoreArr = new Array;
					//체크박스중 선택된값 있으면 배열에 담기
					$("#check:checked").each(function(){
						restoreArr.push($(this).val());	
					});
					
					var arr1=new Array;
					arr1 = restoreArr;
					
					$.ajax({
						url:"outRestore.mng",
						type:"GET",
						data:{arr1:arr1},
						success:function(data){
							if(data=="성공"){
								console.log("성공");
								alert("탈퇴회원이 복구되었습니다.");
								window.location.reload();
							}
						},
						error:function(data){
							if(data=="실패"){
								console.log("실패");
								alert("탈퇴회원 복구처리 실패ㅠㅜ");
							}
						}
					});
				});
				
			});	
    	</script>
	
	<div class = "two wide column"></div>
	
	<%@ include file = "/views/common/company/footer_com.jsp" %>

</body>
</html>
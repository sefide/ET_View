<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, com.kh.et.member.model.vo.*" %>
<%
	ArrayList<HashMap<String, Object>> StopList = (ArrayList<HashMap<String, Object>>)request.getAttribute("StopList");
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
    	- 정지 회원 조회 <br><br>
    	<div>
    		<table class="table">
    			<tr>
    				<th>정지목록</th>
    				<th>정지 시작일</th>
    				<th>정지 종료일</th>
    				<th>회원번호</th>
    				<th>아이디</th>
    				<th>이메일</th>
    				<th>가입일</th>
    				<th>이름</th>
    			</tr>
    			<%for(int i=0;i<StopList.size();i++) {
    		HashMap<String,Object>hmap=StopList.get(i);
    		%>
    		<tr>
    			<td><input id = "check" type="checkbox" value=<%= hmap.get("m_no") %>></td>
    			<td><%=hmap.get("s_start_date") %></td>
    			<td><%=hmap.get("s_end_date") %></td>
    			<td><%=hmap.get("m_no") %></td>
    			<td><%=hmap.get("m_id") %></td>
    			<td><%=hmap.get("m_email") %></td>
    			<td><%=hmap.get("m_date") %></td>
    			<td><%=hmap.get("m_name") %></td>
    		</tr>
    		<%} %>
    		</table>
    		
    		<br>
    		<div class="pagingArea" align="center">
			<button  class="ui black basic button" onclick="location.href='<%=request.getContextPath() %>/select04.mng?currnetPage=1'"><<</button>
			<% if(currentPage <=1) {%>
			<button  class="ui black basic button" disabled><<<</button>
			<%}else{ %>
			<button class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/select04.mng?currentPage=<%= currentPage -1%>'"><</button>		
			<%} %>
			
			<% for(int p=startPage; p<=endPage;p++){ 
				if(p==currentPage){
			%>		<button class="ui black basic button" disabled><%= p %></button>
			<%	}else{ %>
					<button class="ui black basic button" onclick="location.href='<%= request.getContextPath()%>/select04.mng?currentPage=<%= p%>'"><%= p %></button>
			
			<% }%>
			
			<%} %>
			
			<% if(currentPage >= maxPage){ %>
			<button class="ui black basic button" disabled>></button>
			<%}else{ %>
			<button class="ui black basic button" onclick="location.href='<%= request.getContextPath()%>/select04.mng?currentPage=<%= currentPage +1%>'">></button>
			<%} %>
			
			<button class="ui black basic button" onclick="location.href='<%= request.getContextPath()%>/select04.mng?currentPage=<%=maxPage%>'">>></button>
		</div>
    		
    		<div class="btn">
    			<button id="stopCancel" class="ui lightgrey button">정지 취소하기</button>
    		</div>
    	</div>

    		</div>
    	</div>
    	
    	<script>
			$(function(){
	    		var arr=new Array;
				
				//회원 정지시키기
				$("#stopCancel").click(function(){
					var cancelArr = new Array;
					//체크박스중 선택된값 있으면 배열에 담기
					$("#check:checked").each(function(){
						cancelArr.push($(this).val());	
					});
					
					var arr1=new Array;
					arr1 = cancelArr;
					
					$.ajax({
						url:"stopCancel.mng",
						type:"GET",
						data:{arr1:arr1},
						success:function(data){
							if(data=="성공"){
								console.log("성공");
								alert("정지취소 되었습니다.");
								window.location.reload();
							}
						},
						error:function(data){
							if(data=="실패"){
								console.log("실패");
								alert("정지취소 실패ㅠㅜ");
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
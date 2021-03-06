<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.et.manager.model.vo.*"%>
    
    <%
   		ArrayList<HashMap<String,Object>> list=(ArrayList <HashMap<String,Object>>)request.getAttribute("list");
		PageInfo pi = (PageInfo)request.getAttribute("pi");
		int listCount = pi.getListCount();
		int currentPage = pi.getCurrentPage();
		int maxPage = pi.getMaxPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage(); 
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
table{
 	text-align:center;
 }
 th{
 	background-color:lightgray;
 }
 .num{
 	width:116px;
 }
.nav{
	width:15%;
}
.sub{
	width:80%;
}
#tb1{
	width:800px;
}
</style>
</head>
<body>
<%@ include file = "/views/common/manager/header_manager.jsp" %>
	
    <div class="main_01">
    	<div class="nav">
			<%@ include file = "/views/common/manager/manager_plan_nav.jsp" %>
    	</div>
    
    
    	<div class="sub">
    	<div class="ui header title">▶여행플랜 조회</div>
    	- 여행플랜 <br><br>
    	<table class="table" id="tb1">
    		<tr>
    			<th>플랜관리</th>
    			<th>번호</th>
    			<th>제목</th>
    			<th>작성자</th>
    			<th>공개여부</th>
    			<th>플랜상태</th>
    			<th>좋아요수</th>
    		</tr>
    		<%for(int i=0;i<list.size();i++) {
    		HashMap<String,Object>hmap=list.get(i);
    		%>
    		<tr>
    			<td><input id = "check" type="checkbox" value=<%= hmap.get("pNo") %>></td>
    			<td><%=hmap.get("pNo") %></td>
    			<td><%=hmap.get("pTitle") %></td>
    			<td><%=hmap.get("m_name") %></td>
    			<td><%=hmap.get("pPrivate") %></td>
    			<td><%=hmap.get("pStatus") %></td>
    			<td><%=hmap.get("PI_type") %></td>
    		</tr>
    		<%} %>
    		
    		
    	</table>
    	
    	
    	<br>
    	<div class="pagingArea" style="margin-left:230px;">
    	
			<button class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/selectPlan.mng?currentPage = 1'"> << </button>
			
			<% if(currentPage <= 1){ %>
			<button class="ui black basic button" disabled> < </button>
			<% }else{ %>
			<button class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/selectPlan.mng?currentPage=<%=currentPage - 1%>'"> < </button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
					<button class="ui black basic button" disabled><%= p %></button>
			<%      }else{ %>
					<button class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/selectPlan.mng?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
	
			<% } %>
			
			
			<% if(currentPage >= maxPage){ %> <!-- 마지막 페이지일 경우 -->
			<button class="ui black basic button" disabled> > </button>
			<% }else{ %>
			<button class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/selectPlan.mng?currentPage=<%=currentPage + 1%>'"> > </button>
			<% } %>
			<button class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/selectPlan.mng?currentPage=<%=maxPage%>'"> >> </button> 
		</div>
		
		<div class="btn">
    			<button class="ui lightgrey button" id="planDelete">플랜 삭제</button>
    	</div>
		</div>
		
    </div>
   
    
     <script>
			$(function(){
	    		var arr=new Array;
				
				//플랜삭제
				$("#planDelete").click(function(){
					var restoreArr = new Array;
					//체크박스중 선택된값 있으면 배열에 담기
					$("#check:checked").each(function(){
						restoreArr.push($(this).val());	
					});
					console.log(restoreArr);
					
					var arr1=new Array;
					arr1 = restoreArr;
					
					$.ajax({
						url:"planDelete.mng",
						type:"GET",
						data:{arr1:arr1},
						success:function(data){
							if(data=="성공"){
								console.log("성공");
								alert("플랜이 삭제되었습니다.");
								window.location.reload();
							}
						},
						error:function(data){
							if(data=="실패"){
								console.log("실패");
								alert("플랜삭제 실패ㅠㅜ");
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
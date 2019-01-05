<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.et.manager.model.vo.*"%>
    
    
    <%ArrayList<HashMap<String,Object>> list=(ArrayList<HashMap<String,Object>>)request.getAttribute("list");
    PageInfo pi=(PageInfo)request.getAttribute("pi");
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
 	width:800px;
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
 	border:1px solid black;
 	background-color:lightgray;
 }
</style>
</head>
<body>
<%@ include file = "/views/common/manager/header_manager.jsp" %>
<%@ include file = "/views/common/manager/manager_community.jsp" %>
	
    <div class="main_01">
    	<div class="ui header title">▶게시글 조회</div>
    	- 게시글 정보 <br><br>
    	<table id="tb1">
    		<tr>
    			<th></th>
    			<th style=width:150px;>글 번호</th>
    			<th>제목</th>
    			<th>작성자</th>
    			<th>내용</th>
    			<th>날짜</th>
    			<th>좋아요 수 </th>
    			<th>댓글 수 </th>
    		</tr>
    		
    		<% for(int i=0;i<list.size();i++){
    			HashMap<String,Object>hmap=list.get(i);
    		%>
    		<tr>
    			<td class="num"><input type="checkbox" name="checkbox" class="chkCheckBox" value=<%=hmap.get("bNo")%>></td>
    			<td><%=hmap.get("bNo") %></td>
    			<td><%=hmap.get("bTitle") %></td>
    			<td><%=hmap.get("mName") %></td>
    			<td><%=hmap.get("bContent") %></td>
    			<td><%=hmap.get("bDate") %></td>
    			<td><%=hmap.get("like") %></td>
    			<td><%=hmap.get("reply") %></td>
    		</tr>
    		<%} %>
    	</table>
    	
    	<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/boardList.mng?currentPage = 1'"> << </button>
			
			<% if(currentPage <= 1){ %>
			<button disabled> < </button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/boardList.mng?currentPage=<%=currentPage - 1%>'"> < </button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
					<button disabled><%= p %></button>
			<%      }else{ %>
					<button onclick="location.href='<%=request.getContextPath()%>/boardList.mng?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
	
			<% } %>
			
			
			<% if(currentPage >= maxPage){ %> <!-- 마지막 페이지일 경우 -->
			<button disabled> > </button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/boardList.mng?currentPage=<%=currentPage + 1%>'"> > </button>
			<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/boardList.mng?currentPage=<%=maxPage%>'"> >> </button> 
			
		</div>

    	<br>
    	<button style=float:right id="deleteBtn" onclick="deleteBtn();">삭제하기</button>
    </div>
	
	<div class = "two wide column"></div>
	
	<%@ include file = "/views/common/company/footer_com.jsp" %>
	
	<script>
	
	$(function(){
 		$("#deleteBtn").click(function(){
 			var items = [];
 			$(".chkCheckBox:checked").each(function(){
 				items.push($(this).val());
 				console.log(items);
 			});
 			location.href = '<%=request.getContextPath()%>/deleteBoard.mng?chkValue='+items;
 			
 		});
 	});
	
	</script>
	
	
</body>
</html>
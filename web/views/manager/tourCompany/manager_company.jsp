<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.et.company.model.vo.*"%>
   
    <%
    ArrayList<Company> list=(ArrayList<Company>)request.getAttribute("list");
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
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
	<!-- 글꼴  -->
	<link rel="stylesheet" href="/css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Ubuntu" rel="stylesheet">
<style>
body {

font-family: 'Nanum Gothic', sans-serif;
font-family: 'Ubuntu', sans-serif;
}


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
 	
 	
 }
 td{
 	width:150px;
 	
 } 
 th{
 	
 
 }
 .num{
 	width:116px;
 }
 #td111 {
 font-family: 'Nanum Gothic', sans-serif;
 }
 
</style>
</head>
<body>
<%@ include file = "/views/common/manager/header_manager.jsp" %>
<%@ include file = "/views/common/manager/manager_company_nav1.jsp" %>
	
    <div class="main_01">
    	<div class="ui header title" >▶제휴사 관리</div>
    	- 제휴사 조회 <br><br>
    	<table class="table" id="tb1">
    		<tr>
    			<th></th>
    			<th id="td111">번호</th>
    			<th>제휴사명</th>
    			<th>사업자번호</th>
    			<th>연락처</th>
    			<th>계약 시작 날짜</th>
    			<th>계약 종료 날짜</th>

    			
    		</tr>
    	 	<%for(Company c:list) {%>
    		<tr>
    			<td class="num"><input type="checkbox" name="checkbox" class="chkCheckBox" value=<%=c.getC_no() %>></td>
    			<td><%=c.getC_no() %></td>
    			<td><%=c.getC_name() %></td>
    			<td><%=c.getC_biss_num() %></td>
    			<td><%=c.getC_phone() %></td>
    			<td><%=c.getC_date() %></td>
    			<td><%=c.getC_end_date() %></td>
    			    		
    		</tr>
    		<%} %>
    		
    		
  
    	</table>
    	<br>
    	<div class="pagingArea" align="center">
    		
			<button class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/selectList.co?currentPage = 1'"> << </button>
			
			<% if(currentPage <= 1){ %>
			<button  class="ui black basic button" disabled> < </button>
			<% }else{ %>
			<button class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/selectList.co?currentPage=<%=currentPage - 1%>'"> < </button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
					<button class="ui black basic button" disabled><%= p %></button>
			<%      }else{ %>
					<button  class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/selectList.co?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
	
			<% } %>
			
			
			<% if(currentPage >= maxPage){ %> <!-- 마지막 페이지일 경우 -->
			<button  class="ui black basic button" disabled> > </button>
			<% }else{ %>
			<button  class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/selectList.co?currentPage=<%=currentPage + 1%>'"> > </button>
			<% } %>
			<button  class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/selectList.co?currentPage=<%=maxPage%>'"> >> </button> 
			
		</div>
    	<br>
    	<br>
    	<br>
    	<br>
    	
    	<button class="ui black basic button" style=float:right; id="deleteBtn">삭제하기</button>
    	<!-- onclick="location.href='/et/views/manager/tourCompany/companyUpdate.jsp'"  -->
    	<button class="ui black basic button" style=float:right;margin-right:30px; id="updateBtn">수정하기</button>
    	<button  class="ui black basic button" style=float:right;margin-right:30px; onclick="location.href='/et/views/manager/tourCompany/companyInsert.jsp'">추가하기</button>
    </div>
    
 <script type="text/javascript">
 
 	$(function(){
 		$("#updateBtn").click(function(){
 			var items = [];
 			$(".chkCheckBox:checked").each(function(){
 				items.push($(this).val());
 				console.log(items);
 			});
 			location.href = '<%=request.getContextPath()%>/updateOne.co?chkValue='+items;
 			
 		});
 	
 	
 	});
 	
 	$(function(){
 		var arr=new Array;
 		
 		$("#deleteBtn").click(function(){
 			var delArr=new Array;
 			
 			$(".chkCheckBox:checked").each(function(){
 				delArr.push($(this).val());
 				console.log(delArr);
 				
 			});
 			
 			var arr1=new Array;
 			arr1=delArr;
 			
 				$.ajax({
 					url:"deleteOne.co",
 					type:"GET",
 					data:{arr1:arr1},
 					success:function(data){
 						if(data=="성공"){
 							console.log("성공");
 							alert("삭제되었습니다");
 							window.location.reload();
 						}
 					},
 					error:function(data){
 						if(data=="실패"){
 							console.log("실패");
 							alert("실패");
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
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.et.payment.model.vo.*, com.kh.et.company.model.vo.Company"%>
<% 

	ArrayList<Payment> list = (ArrayList<Payment>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	Company loginUser = (Company)session.getAttribute("loginCompany");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Ubuntu" rel="stylesheet">


	
<style>

	.column {
		height : 100%;
	}
	
	.container {
		padding-left : 5px;
	}
	
	.mt-20{
		margin-left : 3%;
	}
	
	.div-travel-agency{
	    display: inline-block;
   		width: 70%;
	}
	
	.img-travel-agency{
		width: 50px;
		border-radius :50%;
		border : 1px solid black;
		display : inline-block;
		margin : -15px 10px 0 38px;
	}
	.h2-travel-agency{
		display : inline-block;
		font-size : 36px;
		font-family: 'Ubuntu', sans-serif;
	}
	
	
	#title{
	   display: inline-block;
 	   width: 70%;
 	   font-family: 'Nanum Gothic', sans-serif;
 	   font-weight : 800;
	}
	
	
	
	#page-link{
		color : rgb(42,90,133);
	}
	
	
	#div-my-coupon{
		padding : 20px 30px;
		border: 1px solid lightgray;
		border-radius : 10px;
 		width : 90%;
 		margin: 0 0 20px 20px;
	}
	
	.div-tour-paging{
		display:inline-block;
		width : 150px;
		margin-left: 40%;	
	}
	.couponArea{
		width:800px;
		margin-left: auto;
		margin-right: auto;
		
	
	}
	.couponArea table,th,tr,td{
		border : 1px solid black;
		text-align: center;
	}
	.couponArea th {
		background-color: gray;
	}
	table{
		font-family: 'Nanum Gothic', sans-serif;
		
	}
	table th{
		
		font-weight: 800;
		font-size: medium;
	}
	table tr{
		height: 40px;
	}
	table td{
		font-weight: 700;
	}
	.pagingArea > button{
		border : 1px solid white;
	    background : white;
	}
</style>
</head>
<body>
	<%@ include file = "/views/common/company/header_com.jsp" %>
	
	<div class="ui grid">
       	<div class = "two wide column"></div>
      	<div class = "twelve wide column" style="margin-top:50px;">
      		<div class = "container">
      		<div style = "margin-bottom:20px;">
      		<div class = "div-travel-agency">
	      		<img src = "/et/image/common/logo_c.png" class ="img-travel-agency">
	      		<h2 class = "h2-travel-agency"> Travel Agency </h2>
	      	</div>
	      	</div>
	      	
      		<div class="ui mt-20"> 
      			<i class="certificate icon"></i>
                <div class="ui header title" id ="title">쿠폰 결제내역 </div>
 
                
                <div id = "div-my-coupon">
	                <table class="couponArea">
	                	<tr>
	                		<th>번호</th>
	                		<th>쿠폰등급</th>
	                		<th>구입 개수</th>
	                		<th>결제금액</th>
	                		<th>결제날짜</th>
	                	</tr>
	                	<%for (Payment pm : list){ %>
						<tr>
							<td><%= pm.getPayNo() %></td>
							<td><%= pm.getPayCT() %></td>
							<%if(pm.getPayCT().equals("premium")){ %>
							<td><%= pm.getPrice()/2 %>장</td>
							<%}else{ %>
							<td><%= pm.getPrice()/2 %>장</td>
							<%} %>
							<td><%= pm.getPrice() %>원</td>
							<td><%=pm.getPayDate()%></td>			
						</tr>
					<%} %>
	                </table>
	            </div>
	                
               <div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/searchSeeTour.tbo?currentPage=1'"><<</button>
			<%if(currentPage <= 1){%>
			<button disabled><</button>
			<% }else{%>
			<button onclick="location.href='<%=request.getContextPath()%>/searchSeeTour.tbo?currentPage=<%=currentPage -1%>'"><</button>
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
					<button disabled><%= p %></button>
			<%		}else{ %>
					<button onclick="location.href='<%= request.getContextPath()%>/searchSeeTour.tbo?currentPage=<%= p %>'"><%= p %></button>
			<%		}%>
				
			<% } %>
			
			
			<%if(currentPage >= maxPage){ %>
			<button disable>></button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath()%>/searchSeeTour.tbo?currentPage=<%=currentPage + 1%>'">></button>
			<%} %>
			
			<button onclick="location.href='<%=request.getContextPath()%>/searchSeeTour.tbo?currentPage=<%=maxPage%>'">>></button>
            </div>
			</div>

            </div>
            
          
				
            
	            
           </div>
     	</div>
	</div>
	
	<%@ include file = "/views/common/company/footer_com.jsp" %>
</body>
</html>
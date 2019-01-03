<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.et.point.model.vo.*"%>
 <%
	ArrayList<Point> list = (ArrayList<Point>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	
	
	<title>ET_Planner</title>
	<link rel="icon" href="/views/image/common/logo.png">
	
	<style>
		.container1 {
		margin-left : 50px;
		width : 90%;
		border-bottom: 1px solid rgb(200,200,200);
   		height: 300px;
	}
	/* 프로필  */
	.div-img-profile {
		width : 240px;
		height : 240px;
		border : 1px solid gray;
		background : rgba(42,90,133,0.5);;
		border-radius : 50%;
		float :left;
		text-align : center;
	}
	.img-profile {
		width : 190px;
		height : 190px;
		margin : 15% 0;
	}
	
	.div-txt-profile{
		float : left;
		margin : 50px 0 30px 40px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	.div-name{
		font-size : 36px;
		font-weight : 600;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.div-point{
		font-size : 20px;
		font-weight : 800;
		margin-bottom : 1px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	 .div-profileTxt{
		font-size : 15px;
		font-weight : 700;
		font-family: 'Nanum Gothic', sans-serif;
		margin-bottom : 10px;
	 }
	.btn-profile{
		margin-top : 35px;
		font-family: 'Nanum Gothic', sans-serif;
		width : 100px;
		height : 30px;
		border-radius : 7px;
		font-weight:700;
	}
	
	/* 우측 메뉴  */
	.div-menu{
		float : right;
		margin-top : 40px;
	}
	
	.div-menu  li {
		list-style : none;
		font-size : 20px;
		margin: 10px 0;
		font-weight : 300;
		font-size : 20px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.this-page {
		font-weight : 800;
	}
	
	.div-menu a, .div-menu li{
		color : black;
	}
	.div-menu li:hover, .div-menu a:hover {
		text-decoration : none;
		color : rgb(254, 200, 0);
	}
	
	/* 하단 포인트 히스토리   */
	.container2{
		width : 93%;
		margin-left : 40px;
	}
	.div-myPage-title{
		margin-top : 20px;
		font-size : 30px;
		font-weight : 600;
		font-family: 'Nanum Gothic', sans-serif;
		display : inline-block;
		width : 250px;
	}
	
	.div-point-list{
		margin-left : 15px;
	}
	#pointArea{
    	
    	width:100%;
    
    }
  
    #point{
    	margin-top: 100px;
    	background-color: gray;
    	height: 100px;
    	width: 200px;
    	text-align: center;
    	margin-left: 80px;
    	float:left;
    	
    }
    #pointHistory{
    	float:right;
    	margin-top: 30px;
    	display:inline-block;
    	width:400px;
    	height: 300px;
    }
    #pointHistory table,th,td{
    	width:100%;
    	padding : 10px;
    	
    }
    
    .td-1{
    	width:100px;
    }
    .td-2{
    	width:140px;
    }
    .td-3{
    	text-align:right;
    	width:164px;
    }
   


	


	</style>
</head>
<body>
	<%@ include file = "/views/common/normal/header.jsp" %>
	
	<div class="ui grid">
        <div class = "two wide column"></div>
        
        <div class = "twelve wide column" style="margin-top:120px;">
            <!-- 내용 넣기 -->
            <div class = "container1"> <!-- 위에 자기내용  -->
    				<div class = "div-img-profile">
    					<img src = "<%=loginUser.getA_change_Name() %>" class = "img-profile">
    				</div>
    				<div class = "div-txt-profile">
    					<div class = "div-name"><%=loginUser.getM_name() %></div>
    					<div class = "div-point"><%=loginUser.getM_point() %> <i class="euro sign icon"></i></div>
    					<div class = "div-profileTxt"><%=loginUser.getM_profile() %> </div>
    					<button class = "btn-profile" onclick = "editProfile();"> 프로필 수정 </button>
    				</div>
    				<div class = "div-menu">
    					<ul>
    						<li><a onclick = "goMyPlan();" > > 내 플랜보기 </a> </li>
    						<li><a href = "/et/views/normal/myPage/myPage_activity_history.jsp"> > 나의 활동내역 </a></li>
    						<li><a href = "/et/views/normal/myPage/myPage_pointHistory.jsp"  class = "this-page"> > 포인트 히스토리 </a></li>
    						<li><a href = "/et/views/normal/myPage/user_update.jsp"> > 회원정보 수정 </a></li>
    					</ul>
    				</div>
    				
    			</div>
    			
    			<br>
     		<br clear = "both">
        		<div class = "container2">
        		<div class = "div-myPage-title"> 포인트 히스토리 </div>
        		<br><br>
        			<div> <!-- 포인트내역   -->
      				<div class = "div-point-list">  
      				<div id="pointArea">
        <div id="point">
        	<h1><%=loginUser.getM_point() %><i class="euro sign icon"></i></h1>
        	<h3>보유포인트</h3>
        </div>
        <div id="pointHistory">
        	<table>       		
       			<tr>
       				<th colspan="3"><h1>포인트 사용내역</h1></th>
       			</tr>
       			<%for (Point p : list){ %>
				<tr>
				<%--<input type="hidden" value="<%= p.get()%>"> --%>
					<%int point= p.getpValue();
					if(point > 0){ %>
					<td class="td-1"><%= p.getpValue() %> 획득!</td>
					<%}else{ %>
					<td class="td-1"><%=Math.abs(p.getpValue()) %> 차감!</td>v
					<%} %>
					<td class="td-2"><%= p.getpReason() %></td>
					<td class="td-3"><%= p.getpDate() %></td>
					
				</tr>
				<%} %>
        	</table>
        	<br>
        	<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/pointList.po?currentPage=1'"><<</button>
			<%if(currentPage <= 1){%>
			<button disabled><</button>
			<% }else{%>
			<button onclick="location.href='<%=request.getContextPath()%>/pointList.po?currentPage=<%=currentPage -1%>'"><</button>
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
					<button disabled><%= p %></button>
			<%		}else{ %>
					<button onclick="location.href='<%= request.getContextPath()%>/pointList.po?currentPage=<%= p %>'"><%= p %></button>
			<%		}%>
				
			<% } %>
			
			
			<%if(currentPage >= maxPage){ %>
			<button disable>></button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath()%>/pointList.po?currentPage=<%=currentPage + 1%>'">></button>
			<%} %>
			
			<button onclick="location.href='<%=request.getContextPath()%>/pointList.po?currentPage=<%=maxPage%>'">>></button>
		</div>
		
        </div>
        
 
        </div>
        								
        			</div>
        		</div>
        	</div>
        </div>
        <div class = "two wide column"></div>
   	</div>
   	
 	<script>
 	function goMyPlan(){
	    	var mno = <%=loginUser.getM_no()%>;
	    	location.href = "<%=request.getContextPath()%>/selectPlanList.pl?mno="+mno;
	}
	function editProfile() {
		window.open("views/normal/myPage/myPage_profile_edit.jsp", "프로필 수정", "width=500, height=520, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	}
 	</script>
	
	
	<%@ include file = "/views/common/normal/footer.jsp" %>
	

</body>
</html>
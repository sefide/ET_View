<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.et.tourBoard.model.vo.*, com.kh.et.common.NumberExec"%>
<% 
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list");
	PageInfo pi=(PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	NumberExec Ne = new NumberExec();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ET_Planner</title>
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
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR" rel="stylesheet">
	
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
	
	.div-ta-coupon{
		width: 250px;
		display : inline-block;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.p-txt-coupon{
	    margin: -10px 2px;
   		font-weight: 700;
   		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.div_tour_left {
		display : inline-block;
		width : 60%;
		/* border : 1px solid black; */
	}
	.div_tour_right{
		display : inline-block;
		width : 30%;
		float : right;
		pardding-left : 15px;
	}
	#title{
	   display: inline-block;
 	   width: 70%;
 	   font-family: 'Nanum Gothic', sans-serif;
 	   font-weight : 800;
	}
	
	.span-tour-ex{
		font-family: 'Nanum Gothic', sans-serif;
		
	}
	
	#page-link{
		color : rgb(42,90,133);
	}
	
	.card {
		height : 330px;
		width:200px;
	}
	.card-img-top{
		height : 270px;
	} 
	
	.div-card-tour{
		width : 90%;
		margin-top: 10px;
		display: inline-block;
	}
	
	#div-my-tour{
		padding : 20px 30px;
		border: 1px solid lightgray;
		border-radius : 10px;
 		width : 90%;
 		margin: 0 0 20px 20px;
	}
	
	.span-tour-title{
		font-weight : 800;
		margin-top : 5px;
		font-size : 16px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	.div-tour-paging{
		display:inline-block;
		width : 150px;
		margin-left: 40%;	
	}
	
	.div-tour-btn{
		display:inline-block;
		width : 200px;
		margin-right: 5%;
	}
	.card-deck{
		display:inline-block;
		margin-right: 40px;
	}
	 .mt-20{
		margin-left: 0%;
	}
	.pagingArea{
		margin-left: 300px;
	}
	
	button {
    		border : 1px solid white;
    		background : white;
    }
     #tour-price{
		color :  #ee685a;
		font-weight : 800;
		font-size : 15px;
	}
</style>
</head>
<body>
      		<div class="ui mt-20">              
            <div class = "div-card-tour"  align="left">
	            <%for(int i=0; i <list.size(); i++){ 
                	HashMap<String,Object> hmap = list.get(i);
                %> 
	            <div class="card-deck" style="width:230px">
	             <input type="hidden" value="<%=hmap.get("tno")%>">
				  <div class="card">
				 	<a href="http://<%=hmap.get("link")%>" target="_blank"><div>
				    <img src="/et/tourUpload/<%=hmap.get("changeName")%>"  width="200px" height="200px">
				    </div>
				    </a>
				    <div class="card-body">
				      <h5 class="card-title"> <%= hmap.get("title") %> </h5>
				      <p class="card-text" id = "tour-price"> <%= Ne.commaMoney((int)hmap.get("price")) %>원 </p>
				      <p class="card-text"><small class="text-muted"><%=hmap.get("concept") %> </small></p>
				    </div>
				  </div>
				 </div>
				 
				<%} %>
				</div>
            <br><br>
             <div class="pagingArea">
			<button onclick="location.href='<%=request.getContextPath()%>/selectList2.tbo?currentPage=1'"><<</button>
			<%if(currentPage <= 1){%>
			<button disabled><</button>
			<% }else{%>
			<button onclick="location.href='<%=request.getContextPath()%>/selectList2.tbo?currentPage=<%=currentPage -1%>'"><</button>
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
					<button disabled><%= p %></button>
			<%		}else{ %>
					<button onclick="location.href='<%= request.getContextPath()%>/selectList2.tbo?currentPage=<%= p %>'"><%= p %></button>
			<%		}%>
				
			<% } %>
			
			
			<%if(currentPage >= maxPage){ %>
			<button disable>></button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath()%>/selectList2.tbo?currentPage=<%=currentPage + 1%>'">></button>
			<%} %>
			
			<button onclick="location.href='<%=request.getContextPath()%>/selectList2.tbo?currentPage=<%=maxPage%>'">>></button>
            </div>
            
           </div> <!-- container -->
     	</div> <!-- twelve column 끝  -->
</body>
</html>
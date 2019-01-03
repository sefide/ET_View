<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.et.tourBoard.model.vo.PageInfo, com.kh.et.company.model.vo.*"%>
<% 
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list");
	PageInfo pi=(PageInfo)request.getAttribute("pi");
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
<title>ET_Planner</title>
<link rel="icon" href="/et/image/common/logo.png">
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
	
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
		margin-left : 20px;
		margin-top: 10px;
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
	      		<div class = "div-ta-coupon">
		      		<p class = "p-txt-coupon"> 보유한 쿠폰  </p> 	
		      		<table class="ui celled black table">
		      			<tr> 
		      				<th> <i class="star outline icon"></i> Standard </th>
		      				<th> <i class="star icon"></i> Premium </th>
		      			</tr>
		      			<tr> 
		      				<td> <label> 10장 </label>  </td>
		      				<td> <label> 3장  </label>  </td>
		      			</tr>
		      		</table>
	      		</div>
	      	</div> <!-- 끄엥  -->
	      	
	      	
      		<div class="ui mt-20"> 
      			<i class="certificate icon"></i>
                <div class="ui header title" id ="title">내가 작성한 투어 </div>
                
				 
                <div id = "div-my-tour">
               <%for(int i=0; i <list.size(); i++){ 
                	HashMap<String,Object> hmap = list.get(i);
                %>
                <input type="hidden" value="<%=hmap.get("tcno")%>">
               <%if(list != null){ %>
	                <div class = "div_tour_left">
	                	<input type="hidden" value="<%=hmap.get("tno")%>">
		                <div class = "span-tour-title"> 투어명 </div> 
						<span class = "span-tour-ex"> <%= hmap.get("title") %></span> <br>
		                	<div class = "span-tour-title"> 투어컨셉 </div> 
						<span class = "span-tour-ex"> <%= hmap.get("concept") %></span> <br>
						<div class = "span-tour-title"> 설명 </div> 
						<span class = "span-tour-ex"> <%=hmap.get("info") %></span> <br>
						<div class = "span-tour-title"> 가격 </div> 
						<span class = "span-tour-ex"> <%=hmap.get("price") %>원</span><br>
	                	</div>
	                	
	                	<div class = "div_tour_right">
						<div  class = "span-tour-title"> 파워링크여부 </div>
						<%if(hmap.get("grade").equals("premium")){ %> 
						<span class = "span-tour-ex"> YES</span><i class="star icon"></i> <label> Premium </label>
						<%}else{ %>
						<span class = "span-tour-ex"> No</span><i class="star icon"></i> <label> Standard </label>
						<%} %>
						<div  class = "span-tour-title">연결링크 </div>
						<a href="http://<%=hmap.get("link")%>" target="_blank"><%=hmap.get("link")%></a>
						<div  class = "span-tour-title"> 대표사진  </div>
						<span class = "span-tour-ex"> <%=hmap.get("originName") %> </span>
	                </div>
                </div>
                
                <%} %>
	
            <div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.tbo?currentPage=1'"><<</button>
			<%if(currentPage <= 1){%>
			<button disabled><</button>
			<% }else{%>
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.tbo?currentPage=<%=currentPage -1%>'"><</button>
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
					<button disabled><%= p %></button>
			<%		}else{ %>
					<button onclick="location.href='<%= request.getContextPath()%>/selectList.tbo?currentPage=<%= p %>'"><%= p %></button>
			<%		}%>
				
			<% } %>
			
			
			<%if(currentPage >= maxPage){ %>
			<button disable>></button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath()%>/selectList.tbo?currentPage=<%=currentPage + 1%>'">></button>
			<%} %>
			
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.tbo?currentPage=<%=maxPage%>'">>></button>
                <div class = "div-tour-btn">
             	  	<button class="ui yellow button" onclick = "goEditTour();">수정하기 </button>
					<!-- <button class="ui yellow button">삭제하기 </button> -->
				</div>
            </div>
    		<%} %>
    		
    		
      		<div class="ui mt-20"> 
      			<i class="certificate icon"></i>
                <div class="ui header title" id ="title">다른 투어보기 </div>
                
	            <div class = "div-card-tour">
	    			<iframe src="<%=request.getContextPath() %>/selectList2.tbo" width="1200" height="400" style="border:0" scrolling="no"></iframe>
	    		</div>
				 
            
           </div> <!-- container -->
     	</div> <!-- twelve column 끝  -->
		<div class = "two wide column"></div>
	</div> <!-- ui grid 끝  -->
	
	


	<script>
	var jb = jQuery.noConflict();
		function goEditTour() {
			location.href = "/et/views/company/tourBoard/com_EditBoard.jsp";
		}
	
		<%-- function test(){
			jb.ajax({
				url:"<%=request.getContextPath()%>/AjaxselectList.tbo",
				type:"get",
				success:function(data){
					console(data);
				},
				error : function(data){
					console.log("데이터 통신 실패!");
				}
			});
		
		
	}
	test(); --%>
	
		
	</script>
	
	<%@ include file = "/views/common/company/footer_com.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.et.company.model.vo.*"%>
 <% 
	Company loginUser = (Company)session.getAttribute("loginCompany");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<title>ET_Planner</title>
	<link rel="icon" href="/views/image/common/logo.png">
	<link rel="stylesheet" href="/css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Ubuntu" rel="stylesheet">
	
<style>
	<!-- 글꼴  -->

	body{
		font-family: 'Nanum Gothic', sans-serif;	
		font-family: 'Ubuntu', sans-serif;
		font-weight: 800px;
	}
 	.column{
     	height: 100%;
     }
     
     .div-outer{
		width : 100%;
		display : flex;
		flex-wrap: wrap;
	}
	
	.div-profile{
		width : 29%;
	}
	
    .div-img-profile {
		width : 50px;
		height : 50px;
		border : 1px solid gray;
		background : rgba(42,90,133,0.5);;
		border-radius : 50%;
		float :left;
		text-align : center;
		padding : 2%;
	}
	.img-profile {
		width : 35px;
		height : 35px;
	}
	
	.div-com-id{
		margin-left: 10px;
		font-weight : 800;
		font-size : 26px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.coupon-type{
		font-weight : 700;
		font-size : 16px;
		font-family: 'Ubuntu', sans-serif;
		border-right : 1px solid lightgray;
	}
	font{
		font-weight : 700;
		font-size : 16px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	#table1{
		width :240px;
		margin : 1px;
	}
	
	.div-com-activity{
		width:100%;
		margin-top:20px;
		text-align: left;
		margin-right: 50px;
	}
	
	.txt-activity{
		font-size : 18px;
		font-weight : 700;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.txt-activity-title {
		font-size : 15px;
		font-weight : 700;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.txt-coupon {
		font-size : 15px;
		font-weight : 700;
		font-family: 'Nanum Gothic', sans-serif;
	}
/*     .div-img-profile {
		width : 120px;
		height : 120px;
		border : 1px solid gray;
		background : rgba(42,90,133,0.5);;
		border-radius : 50%;
		float :left;
		text-align : center;
	}
	.img-profile {
		width : 80px;
		height : 80px;
		margin : 15% ;
	}
	.div-com-id{
		width:120px;
		height: 34px;
		margin-left: 150px;
	}
	
	.div-com-activity{
		width:260px;
		height:150px;
		margin-top:20px;
		text-align: left;
	} */
	.store{
		width : 68%;
		height : 570px;
		/* margin : 1%; */
	}
	
	.div-payment-std{
		background-color: white;
		width: 350px;
		height: 350px;
		display: inline-block;
		margin-top: 20px;
		margin-left: 200px;
		text-align: center;
		background-color:gray;
		
	}
	.div-payment-prm{
		background-color: white;
		width: 350px;
		height: 350px;
		display: inline-block;
		margin-top: 20px;
		margin-left: 30px;
		text-align: center;
		background-color:gray;
		float: right
	}
	.price{
		background-color: yellow;
		height: 50px;
		width: 250px;
		margin-left: auto;
		margin-right: auto;
	}
	#payResultListGo:hover{
	 cursor:pointer;
	}
	
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file = "/views/common/company/header_com.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

    <div class="ui grid">
        <div class = "two wide column"></div>
        <div class = "twelve wide column" style="margin-top:50px;">
    	
    		<div class = "div-outer">
        	<div class = "div-profile">
        	
	        	<div class = "div-profile-inner">
	        		<div class = "div-img-profile">
		    		<img src = "/et/image/common/logo_c.png" class = "img-profile">
			    	</div>
			    	<span class="div-com-id"> 아이디 </span>
	        	</div>
        	
		    	<br>
		    	<div class="div-com-activity">
				    <div class = "txt-activity">자사 활동내역</div> <br>
			    	
			    	<table class="ui called small table" id ="table1">
			    		<tr>
			    			<td class ="coupon-type"><i class="star outline icon"></i> Standard <font>쿠폰</font> </td>
			    			<td><label class = "txt-coupon"> <%=loginUser.getcStandard()%>장 </label><td>
			    		</tr>
			    		
			    		<tr>
			    			<td class ="coupon-type"><i class="star icon"></i> Premium <font>쿠폰</font> </td>
			    			<td><label class = "txt-coupon"> <%=loginUser.getcPremium()%>장 </label><td>
			    		</tr>
			    		
			    		<tr>
			    			<td class = "coupon-type"> <i class="star outline icon"></i><font>글 개수</font></td>
			    			<td> <label class = "txt-coupon" id="standard"></label> </td>
			    		</tr>
			    		<tr>
			    			<td class = "coupon-type"> <i class="star icon"></i><font>글 개수</font></td>
			    			<td> <label class = "txt-coupon" id="premium"></label> </td>
			    		</tr>
					</table>
					<br>
					<div class = "txt-activity" onclick="payResultList();" id="payResultListGo">결제내역 보러가기</div>
		    	</div>
		    	
	        </div>
	          
	        
		    	<div class="store">
		    		<%@ include file="/views/company/coupon/includeStore.jsp" %>
		    </div>
          </div>
          	


    	
        </div>
        <div class = "two wide column"></div>
        
   	</div>
   	
   	<!-- footer -->
	<%@ include file = "/views/common/company/footer_com.jsp" %>
	<script>
		$(function() {
			$.ajax({
				url:"<%=request.getContextPath()%>/companyPostCountPre.tbo",
				type:"get",
				success:function(data){
					$("#standard").text(data+"개");
				},
				error:function(data){
					console.log("에러!!");
				}
			});
		});
		
		$(function() {
			$.ajax({
				url:"<%=request.getContextPath()%>/companyPostCountStd.tbo",
				type:"get",
				success:function(data){
					$("#premium").text(data+"개");
				},
				error:function(data){
					console.log("에러!!");
				}
			});
		});
		
		function payResultList() {
			location.href="<%=request.getContextPath()%>/companyPayList.pm";
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.et.company.model.vo.*"%>
    <% Company c =(Company)request.getAttribute("c");
	int comNo=(int)request.getAttribute("comNo");
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
 	.column{
     	height: 100%;
     }
     
     .outer {
     	display:flex;
     	padding:1%;
     	flex-wrap:wrap;
     	width:100%;
     
     }.
     .inner-1 {
     	width:20%;
     
     }
     .inner-2 {
     	width:70%;
     	margin-left:100px;
     }
     body { padding:50px 100px; font:13px/150% Verdana, Tahoma, sans-serif; }

		/* tutorial */

		input, textarea { 
			padding: 9px;
			border: solid 1px #E5E5E5;
			outline: 0;
			font: normal 13px/100% Verdana, Tahoma, sans-serif;
			width: 200px;
			background: #FFFFFF url('http://store.blueb.co.kr/data/201010/IJ12864517897808/bg_form.png') left top repeat-x;
			background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF), color-stop(4%, #EEEEEE), to(#FFFFFF));
			background: -moz-linear-gradient(top, #FFFFFF, #EEEEEE 1px, #FFFFFF 25px);
			box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
			-moz-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
			-webkit-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
			}

		textarea { 
			width: 400px;
			max-width: 400px;
			height: 150px;
			line-height: 150%;
			}

		input:hover, textarea:hover,
		input:focus, textarea:focus { 
			border-color: #C9C9C9; 
			-webkit-box-shadow: rgba(0, 0, 0, 0.15) 0px 0px 8px;
			}

		.form label { 
			margin-left: 10px; 
			color: #999999; 
			}

		.submit input {
			width: auto;
			padding: 9px 15px;
			background: #617798;
			border: 0;
			font-size: 14px;
			color: #FFFFFF;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
			}
			#ceonum2 {
			width:100px;
			}
			#num {
				width:400px;
			
			}

    
</style>

</head>
<body>

	<!-- navigation - header.jsp -->
	<%@ include file= "/views/common/manager/header_manager.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

    <div class="ui grid">
        <div class = "two wide column"></div>
        <div class = "twelve wide column" style="margin-top:50px;">
        	
        	<div class="outer">
        	<div class="inner-1">
        	<%@ include file = "/views/common/manager/manager_company_nav1.jsp" %>
      	
        	</div>
        	
        	
    	
        	<div class="inner-2">
        <form  id="joinForm"  action ="<%=request.getContextPath()%>/updateCompany.co?comNo=<%=comNo%>" method="post" class="form">
	<fieldset><legend>제휴사 수정</legend>
	<p class="name">

		<label for="name">제휴사 명</label><br>
		<input type="text" name="name" id="name" value=<%=c.getC_name()%>><br>
		<label for="num">사업자번호</label>&nbsp;<br>
		<input type="text" name="num" id="num" value=<%=c.getC_biss_num()%>><br>
		<label for="phone">연락처</label>&nbsp;<br>
		<input type="text" name="phone" id="phone" value=<%=c.getC_phone()%>><br>
		<label for="email">이메일</label><br>
		<input type="email" name="email" id="email" value=<%=c.getC_email()%>><br>
		<label for="category">카테고리</label><br>
		<input type="text" name="category" id="category" value=<%=c.getC_category()%>><br>
		<label for="address">주소</label><br>
		<input type="text" name="address" id="address" value=<%=c.getC_biss_address()%>><br>
			
		
	
		<br><br>
		
	<label for="contact">계약기간</label><br>
		<p style=font-size:7px;>시작날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종료날짜<br></p>
		
		<input type="date" name="term" id="term" value=<%=c.getC_date()%> />-<input type="date" name="term2" id="term2" value=<%=c.getC_end_date()%> /><br>
		<br>
		<br>
		<button type="submit" id="insertBtn" onclick="updateCompany();">완료</button>
		
	</p>

       </p>
       </fieldset>
       </form>
       
         
</div>
        </div>
        </div>
        <div class = "two wide column"></div>
   	</div>
   	
   	<!-- footer -->
	<%@ include file= "/views/common/normal/footer.jsp" %>
	<script>
	function updateCompany() {
		$("#joinForm").submit();
	}
	
	</script>
</body>
</html>
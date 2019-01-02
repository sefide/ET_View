<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<!-- 글꼴  -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Ubuntu" rel="stylesheet">
	
<style>
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
	
	/* 우측 투어글 작성 form */
	.outer{
		width : 68%;
		height : 1000px;
		background: white;
		color:black;
		float: right;
		
	}
	.bar-insertTour{
		width : 100%;
		border-top : 3px solid rgb(237,197,58);
		/* rgb(42,90,133); */
		height : 30px;
		margin-top : 12px;
		margin-bottom : 15px;
	}
	
	#icon{
		width : 35px;
		font-size : 28px;
		color : rgb(42,90,133);
		/* display : inline-block; */
	}
	
	.txt-insertTour{
		color : rgb(42,90,133);
		font-weight : 800;
		font-size : 30px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	
	/* .tableArea{
		width: 100%;
		height: 350px;
		margin-left: auto;
		margin-right: auto;
	} */
	
	.attr1{
		font-size: 18px;
		width:105px;
		color : rgb(42,90,133);
		font-weight : 700;
		font-family: 'Nanum Gothic', sans-serif;
	}
	.attr2{
		width:100px;
		
	}
	#attr3{
		width : 150px;
	}
	
	
	table td {
		/* border : 1px solid black;  */
		padding : 15px 0;
	}
	
	#div-img-ex{
		border : 1px solid lightgray;
		border-radius : 5px;
		color : lightgray;
	}
	
	#tourImgSelect{
		width : 100%;
		height : 300px;
		
		border :none;
	}
	
	
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file = "/views/common/company/header_com.jsp" %>
	
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
			    			<td><label class = "txt-coupon"> 10 </label><td>
			    		</tr>
			    		
			    		<tr>
			    			<td class ="coupon-type"><i class="star icon"></i> Premium <font>쿠폰</font> </td>
			    			<td><label class = "txt-coupon"> 10 </label><td>
			    		</tr>
			    		
			    		<tr>
			    			<td class = "coupon-type"> <i class="star outline icon"></i><font>글 개수</font></td>
			    			<td> <label class = "txt-coupon"> 10 </label> </td>
			    		</tr>
			    		<tr>
			    			<td class = "coupon-type"> <i class="star icon"></i><font>글 개수</font></td>
			    			<td> <label class = "txt-coupon"> 10 </label> </td>
			    		</tr>
					</table>
					<br>
		    	</div>
		    	
	        </div>
	          
	        <div class="outer">
            <i class="certificate icon" id = "icon"></i>
	        <span class ="txt-insertTour">투어글 올리기</span>
			<div class = "bar-insertTour"></div>
			<div class="tableArea  ui form">
				<form action="<%=request.getContextPath()%>/insert.tbo" method="post" encType="multipart/form-data">
					<table>
						<tr>
							<td class="attr1">제목</td>
							<td colspan="5">
								<div class="field">
									<input type="text" class="ui input" size="80" name="title">
								</div>
							</td>
						</tr>
						<tr>
							<td class="attr1"><label>나라 선택</label></td>
							<td colspan="2"><select class="ui fluid dropdown" name="nation">
								<option value="프랑스">프랑스</option>
								<option value="독일">독일</option>
								<option value="영국">영국</option>
								<option value="네덜란드">네덜란드</option>
								<option value="이탈리아">이탈리아</option>
								<option value="체코">체코</option>
								<option value="그리스">그리스</option>
								<option value="헝가리">헝가리</option>
								<option value="오스트리아">오스트리아</option>
								<option value="크로아티아">크로아티아</option>
								<option value="덴마크">덴마크</option>
								<option value="스위스">스위스</option>
								<option value="터키">터키</option>
								<option value="포르투갈">포르투갈</option>
								<option value="스페인">스페인</option>
							</select>
							</td>
							<td class="attr1" align="center"><label>도시 선택</label></td>
							<td colspan="2">
							 <select class="ui fluid dropdown" name="city">
								<option value="1">파리</option>
								<option value="2">리옹</option>
								<option value="3">니스</option>
								<option value="4">뮌헨</option>
								<option value="5">베를린</option>
								<option value="6">뉘른베르크</option>
								<option value="7">프랑크푸르트</option>
								<option value="8">런던</option>
								<option value="9">옥스포드</option>	
								<option value="10">밀라노</option>
								<option value="11">베네치아</option>
								<option value="12">피렌체</option>
								<option value="13">로마</option>
								<option value="14">프라하</option>
								<option value="15">아테네</option>
								<option value="16">부다페스트</option>
								<option value="17">빈</option>
								<option value="18">잘츠부르크</option>
								<option value="19">자그레브</option>
								<option value="20">코펜하겐</option>
								<option value="21">오덴세</option>
								<option value="22">인터라켄</option>
								<option value="23">취리히</option>
								<option value="24">이스탄불</option>
								<option value="25">앙카라</option>
								<option value="26">리스본</option>
								<option value="27">바르셀로나</option>
								<option value="28">마드리드</option>
								<option value="29">암스테르담</option>
							</select>
							</td>	
						</tr>
						<tr>
							<td class="attr1">대표사진 </td>
							<td class="attr2" colspan = "3">
								<input type ="file" name = "tourPhoto"  onchange = "loadImg(this, 1)">
							</td>
							
							<!-- <td class="attr3" ></td> -->
							<td class="attr1"  id = "attr3" align="center">파워링크 여부</td>
							<td>
								<div class ="ui radio checkbox">
								<input type="radio" name = "powerLink" id = "powerYes" value="premium"><label for = "powerYes">premium</label>
								</div>
							
								<div class ="ui radio checkbox">
								<input type="radio" name = "powerLink" id = "powerNo" value="standard"><label for = "powerNo">standard</label>
								</div>
							</td>
		
						</tr>
						<tr>
							<td></td>
							<td colspan = "5">
								<div id ="div-img-ex">
									<img id = "tourImgSelect">대표사진 미리보기
								</div>
							</td>
						</tr>
						<tr>
							<td class="attr1">투어컨셉</td>
							<td colspan="2">
								<div class ="field">
									<select class="ui dropdown" name="concept">
										<option value =""> -----  선택  ----- </option> 
										<option value ="식도락"> 식도락 </option> 
										<option value ="인문학/교양"> 인문학/교양 </option>
										<option value ="레저/취미"> 레저/취미 </option>
										<option value ="감성"> 감성 </option>
									</select>
								</div>
							</td>
	
							<td class="attr1" align="center">투어가격</td>
							<td colspan="2">
								<div class="field">
									<input type="text" class="ui input" size="50" name="price">
								</div>
							
							</td>
						</tr>
						<tr>
							<td class="attr1">설명</td>
							<td colspan="5">
							    <div class="field">
								    <textarea name = "tourContent" placeholder = "투어에 대해 설명해주세요. "></textarea>
							    </div>
							</td>
						
						</tr>
						<tr>
							<td class="attr1">연결링크</td>
							<td colspan="5"><!-- <a href="#">Go to the Link</a> -->
							  <div class="field">
							    <input type="text" class="ui input" size="50" name="link" placeholder = "투어 상세링크를 넣어주세요.">
							  </div>
							</td>
						</tr>
						
					</table>
					<br>
					
					<div align="center">
						<button type="reset" class="ui grey basic button">취소하기</button>
						<button type="submit" class="ui grey basic button">등록하기</button>
					</div>
				</form>
				
			</div>
				
			</div>
    	
        </div>
        </div>
        <div class = "two wide column"></div>
        
    	
   	</div>
   	
   	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
   	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js">
   	$(function() {
   	 	$('.ui.radio.checkbox')
	   		.checkbox()
	  	;
   	 	
   	 	$('select.dropdown')
     		.dropdown()
  		 ;
   	});
   	</script>
   	<script>
   		function name() {
			
		}
   	
   	</script>
   	<script>
   	function loadImg(value,num) {
		if(value.files && value.files[0]) { // value는 요소 파일이 있는 상태에 동작한다. 
			var reader = new FileReader(); // reader는 스트림 
			reader.onload = function(e) {
				switch(num){
				case 1:$("#tourImgSelect").attr("src", e.target.result);break;
				}
			}
			reader.readAsDataURL(value.files[0]); //value의 files에 0번째 있는 애를 읽어온다. 
		}
		
	} 
	  
   	</script>
   	
   	<!-- footer -->
	<%@ include file = "/views/common/company/footer_com.jsp" %>
</body>
</html>
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
<style>
 	.column{
     	height: 100%;
     }
    .div-img-profile {
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
		margin-right: 50px;
	}
	
	
	/* .outer1{
		background-color: gray;
		width: 750px;
		height: 500px;
		float: right;
		margin-left:50px;
	} */
	.outer{
		width: 750px;
		height: 500px;
		background: white;
		color:black;
		float: right;
		margin-left:50px;
	}
	table,td,tr{
		border: 1px solid white;
	}
	.tableArea{
		width:700px;
		height: 350px;
		margin-left: auto;
		margin-right: auto;
	}
	
	.attr1{
		font-size: 25px;
		width:105px;
	}
	.attr2{
		width:80px;
	}
	.attr3{
		width:160px;
	}
	.img{
		border : 2px dashed white;
		width:120px;
		height: 120px;
	}
	select{
		width:120px;
		height: 30px;
	}
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file= "/views/common/header_com.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

    <div class="ui grid">
        <div class = "two wide column"></div>
        <div class = "twelve wide column" style="margin-top:50px;">
        <div class = "div-img-profile">
    		<img src = "/et/image/common/logo_c.png" class = "img-profile">
    		<div class="div-com-activity">
	    		<h3>내 활동내역</h3>
	    		<br>
	    		<h4>Standard 쿠폰개수 : 5개</h4>
	    		<h4>Premium 쿠폰개수 : 5개</h4>
	    		<h4>내 글 개수: 6개</h4>
    		</div>
    	</div>
    	<div class="div-com-id">
    	<br>
    	<br>
    	<h2>아이디</h2>
    	</div>
          <!-- 내용 넣기 -->
			
          
          	<div class="outer">
	          <br>
		<h2>게시물 올리기</h2>
		<div class="tableArea">
			<form action="" method="post">
				<table>
					<tr>
						<td class="attr1">제목</td>
						<td colspan="5">
							<input type="text" size="80" name="title">
						</td>
					</tr>
					<tr>
						<td class="attr1">파일첨부</td>
						<td class="attr2"><button>사진등록</button></td>
						<td class="attr3"><div class="img">
						
						</div>
						<td class="attr1" align="center">파워링크 여부</td>
						<td><input type="radio">&nbsp;&nbsp;Yes</td>
						<td><input type="radio">&nbsp;&nbsp;No</td>
					</tr>
					<tr>
						<td class="attr1">투어컨셉</td>
						<td colspan="2">
							<select name="concept">
								<option>해상레저</option>
								<option>열기구</option>
								<option>클라이밍</option>
							</select>
						</td>

						<td class="attr1" align="center">투어가격</td>
						<td colspan="2"><input type="text" style="width:100%;"></td>
					</tr>
					<tr>
						<td class="attr1">설명</td>
						<td colspan="5"><textarea name="content" rows="6" cols="83"></textarea> 
						</td>
					
					</tr>
					<tr>
						<td class="attr1">연결링크</td>
						<td colspan="5"><a href="#">Go to the Link</a></td>
					
					</tr>
					
				</table>
				<br>
				<div align="center">
					<button type="reset">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
			</form>
		</div>
	          	
          	
          	



    	
        </div>
        <div class = "two wide column"></div>
        
    	
   	</div>
   	
   	<!-- footer -->
	<%@ include file= "/views/common/footer.jsp" %>
</body>
</html>
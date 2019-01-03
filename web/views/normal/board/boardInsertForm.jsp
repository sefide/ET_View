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
  #container {
	display: flex;
}

#box-left {
	flex: 1;
}

#box-center {
	flex: 3;
	text-align: center;
}

#box-right {
	flex: 1;
	text-align: right;
}
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file= "/views/common/normal/header.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->
	<% if(loginUser != null){%>
    <div class="ui grid">
        <div class = "two wide column"></div>
        <div class = "twelve wide column" style="margin-top:50px;">
        
          <!-- 내용 넣기 -->
          
          
          <h1 class="ui header">
				글 작성하기
			</h1>
          
          
          <!-- 내가 (본인이 ) 글쓰는 부분 -->
			<div class="ui segment">
				<div id="container">
					<div id='box-left'>
						<img class="ui small circular image"
							src="/et/image/common/logo.png">
					</div>
					<div id='box-center'>
						<form action="<%= request.getContextPath() %>/insert.bo" method="post">
						<div align="left">
							제목 <input type="text" name="title" size="110">
						</div>
						<br>
						<div class="ui form">
							<div class="field">							
								<textarea rows="2" cols="10" style="height: 100px;" name="content"></textarea>
							</div>
							<div class="ui list" style="text-align: right;">
								<button class="ui right yellow button" type="reset">취소하기</button>
								 <button class="ui right yellow button" type="submit">등록하기</button>

							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
          
          
          <% }else{
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("../common/errorPage.jsp");
	} %>
          
          
   
          
        </div>
        <div class = "two wide column"></div>
   	</div>
   	
   	<!-- footer -->
	<%@ include file= "/views/common/normal/footer.jsp" %>

</body>
</html>
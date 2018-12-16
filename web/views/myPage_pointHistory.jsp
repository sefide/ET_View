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
	.myPage{
	
		margin-top: 40px;
	}
 	.column{
     	height: 100%;
     }
   
    .myPage div {
    	display: inline-block;
    	margin-right: 10px;
    }
    .introduce{
    	margin-left: 5px;
    
    }
    .myContents{
    	float: right;
    }
    a{
    	color : black;
    }
    #pointArea{
    	
    	width:100%;
    
    }
  
    #point{
    	margin-top: 250px;
    	background-color: gray;
    	height: 100px;
    	width: 200px;
    	text-align: center;
    	margin-left: 80px;
    	float:left;
    	
    }
    #pointHistory{
    	float:right;
    	margin-top: 150px;
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
    	width:120px;
    }
    .td-3{
    	text-align:right;
    	width:184px;
    }
   
    
    
</style>
</head>
<body>
	<%@ include file = "/views/common/header.jsp" %>
	
	<div class="ui grid">
        <div class = "two wide column"></div>
        <div class = "twelve wide column" style="margin-top:50px;">
        
          <!-- 내용 넣기 -->
        <div class="myPage">
	        <div style="border-radius: 50%; height: 150px; width: 150px; background-color: yellow;"></div>
	        <div class = "introduce">
	        	<h3>아이디: etPlanner</h3>
	        	<h3>회원 소개글: 안녕하세요</h3>
	        	<h3>잔여 포인트 : 150euro</h3>
	        	<button class="addfiles">프로필 수정</button>
				<input id="fileupload" type="file" name="files[]" multiple style='display: none;'>
				
        </div>
        <script>
        $('.addfiles').on('click', function() { $('#fileupload').click();return false;});
        </script>
        <div class="myContents">
      		<br>
			<h3>My 플랜</h3>
	       	<h3>나의 활동내역</h3>
	       	<h3><a href="#">포인트 히스토리</a></h3>
	       	<h3>회원 정보 수정</h3>
		</div>
        </div>
        <div id="pointArea">
        <div id="point">
        	<h1>1111€</h1>
        	<h3>보유포인트</h3>
        </div>
        <div id="pointHistory">
        	<table>
        		<thead>
        			<tr>
        				<th colspan="3"><h1>포인트 사용내역</h1></th>
        			</tr>
        		</thead>
        		<tbody>
        			<tr>
        				<td class="td-1">5유로 획득</td>
        				<td class="td-2">댓글 좋아요!</td>
        				<td class="td-3">2018-12-16</td>
        			
        			</tr>
        			<tr>
        				<td class="td-1">10유로 획득</td>
        				<td class="td-2">베스트 댓글!</td>
        				<td class="td-3">2018-12-16</td>
        			
        			</tr>
        			<tr>
        				<td class="td-1">50유로 차감</td>
        				<td class="td-2">플랜 공간 확장!</td>
        				<td class="td-3">2018-12-16</td>
        			
        			</tr>
        		</tbody>
        	</table>
        </div>
        </div>
        </div>
        <div class = "two wide column"></div>
   	</div>
	
	
	<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>
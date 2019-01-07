<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.et.board.model.vo.*"%>
<%
	Board b = (Board) request.getAttribute("b");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery -->
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Semantic UI -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script> 
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<title>ET_Planner</title>
<link rel="icon" href="/views/image/common/logo.png">
<style>
.column {
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
.div-claim{	
 float : right;
	
}
.claim{
	font-size : 12px;
	color :gray;
	cursor : pointer;
}
.claim-popup{
	position : absolute ;
	width : 420px;
	background : rgba(255,255,255, 0.9);
	padding : 1%;
	border : 1px solid gray;
	text-align : center;
	top: 20%;
    left: 35%;
}
.claim-popup-txt{
	font-size : 18px;
	font-weight : 700;
	margin-bottom : 10px;
}
.caution-txt{
	text-align : left;
	margin-top : 8px;
	font-size : 12px;
	color :gray;
}
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file="/views/common/normal/header.jsp"%>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px;">

			<!-- 내용 넣기 -->
			
			
  			<h1 class="ui header" style="margin-top: 15px;">
				게시글 상세보기
				&nbsp;&nbsp;
				<div class="ui labeled button" tabindex="0">
							<div class="ui red button" id="likePlan">
								<i class="heart icon"></i> 좋아요!
							</div>
							<a class="ui basic red left pointing label" id="likeCnt"> <%=b.getbLike() %>
							</a>
							<div class="ui red button" id="unlikePlan" style="display: none;" >
								<i class="empty heart icon"></i> 좋아요!
							</div>
							<a class="ui basic red left pointing label" id="unlikeCnt" style="display: none;" ><%=b.getbLike() %> 
							</a>
			</div>		
			</h1>
			<!-- 좋아요 스크립트부분 -->
			<script>
							<% if(loginUser != null){%>
							/* 좋아요  클릭시 */
							$("#likePlan").click(function() {	
									var bno = '<%= b.getbNo()%>' ;														
									var user = '<%= loginUser.getM_no() %>' ; 
									var writer = '<%= b.getbWriter()%>' ; 								
									jQuery.ajax({
										url:"/et/clickLikeBoard.bo",
										data:{bno:bno, user:user, writer:writer},
										type:"post",
										success:function(data){											
											$("#likePlan").css("display", "none");
											$("#likeCnt").css("display", "none");
											$("#unlikePlan").css("display", "block");	
											$("#unlikeCnt").css("display", "block");	
											
											 //좋아요 갯수를 가져오는 ajax
											$.ajax({
												url:"/et/countBoardLike.bo",
												data:{bno:bno, user:user, writer:writer},
												type:"post",
												success:function(data){
													console.log(data);	
													 $("#unlikeCnt").text(data.like);
													},
												error:function(){
														console.log('실패');
													}
												}); 
												
										},
										error:function(){
											console.log('실패');
										}
									});
	
							});
							
											
							/* 좋아요 취소시*/
							$("#unlikePlan").click(function() {	
								var bno = '<%= b.getbNo()%>' ;														
								var user = '<%= loginUser.getM_no() %>' ; 
								var writer = '<%= b.getbWriter()%>' ; 
									jQuery.ajax({
									url:"/et/clickUnLikeBoard.bo",
									data:{bno:bno, user:user, writer:writer},
									type:"post",
									success:function(data){																
										$("#unlikePlan").css("display", "none");
										$("#unlikeCnt").css("display", "none");
										$("#likeCnt").css("display", "block");
										$("#likePlan").css("display", "block");
										
										jQuery.ajax({
											url:"/et/countBoardLike.bo",
											data:{bno:bno, user:user, writer:writer},
											type:"post",
											success:function(data){												
												 $("#likeCnt").text(data.like);
												},
											error:function(){
													console.log('실패');
												}
											});
									},
									error:function(){
										console.log('실패');
									}
								});
							});			
						<%}%>
						</script>
				
			
			
			
			<div class="ui segment">
			
				<div id="container">
					<div id='box-left'>
						<img class="ui small circular image"
							src="/et/image/common/logo.png">
					</div>
					<div id='box-center'>
						
						<!-- 제목 -->
						<div align="left" >
							제목
						<input type="text" size="50" 
									name="title" value="<%=b.getBtitle()%>" readonly>		
						</div>
						<div align="left">
							작성일
							<input type="date" name="date" value="<%=b.getbDate() %>" readonly>						
						</div>
						<div align="left" >
							작성자
							<input type="text" value="<%=b.getbWriter()%>" name="writer" readonly>	
						</div>						
						
						<!-- 내용 -->
						<div class="ui form">
							<div class="field">
								<textarea rows="2" cols="10" style="height: 100px;" id="content" readonly><%=b.getbContent()%></textarea>
							</div>
						</div>
						
					</div>
				</div>
			
				<div class="ui form">
				<div class="field">
				<div class="ui list" style="text-align: right;">
			
			
				<button class="ui right yellow button" onclick="location.href='<%=request.getContextPath()%>/selectList.bo'">목록으로 되돌아가기</button>
				<% if( loginUser != null && loginUser.getM_id().equals(b.getbWriter()) ){%>		
				<% int num = b.getbNo();  %>			
				<button class="ui right yellow button" id="edit" >수정 및 삭제 하기</button>
				<%}%>
				<script>
					$("#edit").click(function name() {
						
						var num = <%=b.getbNo() %>;
						
						location.href="<%=request.getContextPath()%>/selectDetail.bo?num=" + num ;
						
					} );
				
				</script>
			
				</div>								
				</div>
				</div>
			
			</div>
			
			<!-- 신고 및 기타 ,, -->
			<div class = "div-claim">
				<a class = "claim"><i class="frown icon"></i> 글 신고하기 </a>
			</div>
			<div class = "claim-popup">
				<i class = "close icon" onclick = "closePop();"></i>
				<div align = "center" id = "resultClaim">
				<div class = "claim-popup-txt"> <i class="frown outline icon"></i>신고 이유를 기입해주세요. </div>

				<input type ="radio" name = "reason" id = "reason1" value = "reason1"> <label for = "reason1">불필요한 비속어의 사용이 섞여있습니다. </label> <br>
				<input type ="radio" name = "reason" id = "reason2" value = "reason2"> <label for = "reason2">특정 대상에 대한 괴롭힘에 참여했습니다.  </label> <br>
				<input type ="radio" name = "reason" id = "reason3" value = "reason3"> <label for = "reason3">인종, 성별, 정체성, 장애등에 대한 혐오를 조장하고 있습니다. </label> <br>
				<input type ="radio" name = "reason" id = "reason4" value = "reason4"> <label for = "reason4">폭력적 위협 혹은 신체적인 위해를 가하고 있습니다. </label> <br>
				<input type ="radio" name = "reason" id = "reason5" value = "reason5"> <label for = "reason5">자살 또는 자해를 조장하거나 암시하는 내용입니다. </label> <br>
				<input type ="radio" name = "reason" id = "reason6" value = "reason6"> <label for = "reason6">기타 </label> <br>
				<button id = "submitClaim"> 신고 </button>
				<div class = "caution-txt">타당하지 않은 근거로 신고 시 본 사이트 사용에 불이익을 받을 수 있습니다.  </div>
				</div>
			</div>
			<script>
				function closePop() {
					$(".claim-popup").css("visibility" , "hidden");
				}
				
				$(".claim").click(function(){
					$(".claim-popup").css("visibility" , "visible");
				});
				
				$("#submitClaim").click(function(){
					<% if(loginUser != null){%>
					var radioVal = $('input[name="reason"]:checked').next().text();
					var userId = <%= loginUser.getM_no()%>;
					var boardNo = <%= b.getbNo()%>;
					var boardwriter = '<%= b.getbWriter()%>';
					console.log(radioVal);
					if(radioVal != null){
						$.ajax({
							url : "claim.bo",
							data : {radioVal: radioVal, userId : userId, boardNo : boardNo, boardwriter : boardwriter},
							contentType : 'application/json; charset=UTF-8',
							type : "get",
							success : function(data){ 
								$("#resultClaim").html("");
								if(data == "FAIL"){
									console.log("신고실패  ");
									$("#resultClaim").append("<div class = 'claim-popup-txt'> 신고처리가 잘 안됐습니다... </div>");
								}else {
									console.log("신고완료 ");
									$("#resultClaim").append("<div class = 'claim-popup-txt'> 신고처리가 정상적으로 완료되었습니다. </div>");
								}
								
							}, error : function(data){
								console.log("서버 전송 실패");	
							}
						});
					}else {
						alert("신고 사유를 작성해주세요 . ");
					}
					<%} else {%>
						alert("신고하려면 로그인이 필요합니다. ");
					<%}%>
				});
				
			
			</script>
			
			
			<!-- 댓글다는부분 -->
			<!-- <div class="ui yellow segment">Yellow</div> -->
			
			<div class="replyArea">
				<div class="replyWriterArea">
				<table align="center">
					<tr>
						<td>댓글 작성</td>
						<td><textarea rows="3" cols="80" id="replyContent"></textarea></td>
						<td><button id="addReply">댓글 등록</button></td>
				</tr>
			</table>
			</div>
				<div id="replySelectArea">
					<table id="replySelectTable" border="1" align="center"></table>
				</div>
			</div>
			<br><br><br><br>
			<!-- 댓글 달기 -->
	 		<script>
             $(function() {

          	   <%if (loginUser != null){%>
               $("#addReply").click(function() {
            	  	  var writer = <%=loginUser.getM_no() %> ;
                  var bid = <%= b.getbNo() %>;
                  var content = $("#replyContent").val();

                  $.ajax({
                     url : "/et/insertReply.bo",
                     data : {
                        writer : writer, 
                        bid:bid ,
                        content : content
                     },
                     type : "post",
                     success : function(data) {
                        console.log(data);
						
						var $replySelectTable = $("#replySelectTable");
						$replySelectTable.html('');
						
					 	for(var key in data){
							var $tr = $("<tr>");
							var $writerTd = $("<td>").text(data[key].bWriter).css("width","100px");
							var $contentTd = $("<td>").text(data[key].bContent).css("width","400px");
							var $dateTd = $("<td>").text(data[key].bDate).css("width", "200px");
							
							$tr.append($writerTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							$replySelectTable.append($tr);	 
						}
					},
					error:function(){
						console.log(실패);
					}
				});
			});
            <%}%>
		});
	</script>  
			
	</div>
		<div class="two wide column"></div>
	</div>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>
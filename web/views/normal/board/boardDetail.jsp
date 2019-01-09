<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.et.board.model.vo.*"%>
<%
	HashMap<String,Object> bMap = (HashMap<String,Object>)request.getAttribute("aList");
 	
		
	Board b = (Board) bMap.get("b");
	ArrayList<Board> list = (ArrayList<Board>) bMap.get("list");
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
	flex: 0.7;
}

#box-center {
	flex: 3.3;
	text-align: center;
	font-size : 17px;
	font-family: 'Nanum Gothic', sans-serif;
	
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
.claim : hover{
	color :lightgray;
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
    	visibility : hidden;
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
.claim-popup-reply{
	position : absolute ;
	width : 420px;
	background : rgba(255,255,255, 0.9);
	padding : 1%;
	border : 1px solid gray;
	text-align : center;
	top: 20%;
    left: 35%;
    	visibility : hidden;
}
.board-contents{
	margin : 1%;
}
#img-profile {
	width : 150px;
	height : 150px;
	border-radius : 50%;
	border : 1px solid gray;
	/* margin : 15% 0; */
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
					<!-- 좋아요 -->
					<div class="ui labeled button" tabindex="0">
					<div class="ui red button" id="likePlan">
						<i class="heart icon"></i> 좋아요!
					</div>
					<a class="ui basic red left pointing label" id="likeCnt"> <%=b.getbLike()%>
					</a>
					<div class="ui red button" id="unlikePlan" style="display: none;">
						<i class="empty heart icon"></i> 좋아요!
					</div>
					<a class="ui basic red left pointing label" id="unlikeCnt"
						style="display: none;"> <%=b.getbLike()%>
					</a>
					</div>
					<!-- 스크랩 -->
					<div class="ui labeled button" tabindex="0" style="margin-top: 10px;">
					<div class="ui basic blue button" id="scrapPlan">
					<i class="fork icon"></i> 스크랩
					</div>
					<a class="ui basic left pointing blue label" id="scrapCnt"> <%=b.getbScrap() %> <a>
							
					<div class="ui blue button" id="unscrapPlan" style="display: none;">
					<i class="empty fork icon"></i> 스크랩</div>
					<a class="ui basic left pointing blue label" id="unscrapCnt" style="display: none;" > <%=b.getbScrap() %><a>
							
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
						
						
						/* 스크랩 클릭 */
						$("#scrapPlan").click(function() {							
							var bno = '<%= b.getbNo()%>' ;														
							var user = '<%= loginUser.getM_no() %>' ; 
							var writer = '<%= b.getbWriter()%>' ; 							
									jQuery.ajax({
										url:"/et//clickScrapBoard.bo",
										data:{pno:pno, user:user, writer:writer},
										type:"post",
										success:function(data){
											console.log(data);		
											
											 $("#scrapPlan").css("display", "none");
											$("#scrapCnt").css("display", "none");
											$("#unscrapPlan").css("display", "block");	
											$("#unscrapCnt").css("display", "block");	
											
											
											jQuery.ajax({
												url:"/et/countScrapCnt.pl",
												data:{pno:pno, user:user, writer:writer},
												type:"post",
												success:function(data){
													console.log(data);	
													 $("#unscrapCnt").text(data.scrap);
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
			
			<div class="ui segment" style="border-color: #fbbd08;" >
				<div id="container">
					<div id='box-left'>
						<img id = "img-profile" src="<%=b.getbCheckBest()%>">
					</div>
					<div id='box-center'>
						<!-- 제목 -->
						<div class = "board-contents" align="left" >
							제목 : 
							<b><%=b.getBtitle() %></b>
						<%-- <input type="text" size="50" 
									name="title" value="<%=b.getBtitle() %>" readonly>	 --%>	
						</div>
						<div class = "board-contents" align="left">
							작성일 : <b><%=b.getbDate() %></b>
							<%-- <input type="date" name="date" value="<%=b.getbDate() %>" readonly> --%>						
						</div>
						<div class = "board-contents" align="left" >
							여행자 : <b><%=b.getbWriter() %></b>
							<%-- <input type="text" value="<%=b.getbWriter()%>" name="writer" readonly>	 --%>
						</div>						
						
						<!-- 내용 -->
						<div class = "board-contents" align="left">
							내용 : <b style = "font-size : 20px;"> <%=b.getbContent()%> </b>
							<%-- <textarea rows="2" cols="10" style="height: 100px;" id="content" readonly><%=b.getbContent()%></textarea> --%>
						</div>
						<br>
					</div>
				</div>
			
				<div class="ui form">
				<div class="field">
				<div class="ui list" style="text-align: right;">
			
			
				<button class="ui yellow basic button" onclick="location.href='<%=request.getContextPath()%>/selectList.bo'">목록으로 되돌아가기</button>
				<% if( loginUser != null && loginUser.getM_id().equals(b.getbWriter()) ){%>		
				<% int num = b.getbNo();  %>			
				<button class="ui yellow basic button" id="edit" >수정 및 삭제 하기</button>
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
			
			<!-- 게시글 신고 팝업 -->
			<div class = "div-claim">
				<a class = "claim"><i class="frown icon"></i> 글 신고하기 </a>
			</div>
			<div class = "claim-popup">
				<i class = "close icon" onclick = "closePop1();"></i>
				<div align = "center" id = "resultClaim">
				<div class = "claim-popup-txt"> <i class="frown outline icon"></i>게시글에 대한 신고 이유를 기입해주세요. </div>
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
			<!-- 댓글 신고 팝업 -->
			<div class = "claim-popup-reply">
				<i class = "close icon" onclick = "closePop2();"></i>
				<div align = "center" id = "resultClaim2">
				<div class = "claim-popup-txt"> <i class="frown outline icon"></i>댓글에 대한 신고 이유를 기입해주세요. </div>
				<input type ="radio" name = "reasonR" id = "reasonR1" value = "reason1"> <label for = "reasonR1">불필요한 비속어의 사용이 섞여있습니다. </label> <br>
				<input type ="radio" name = "reasonR" id = "reasonR2" value = "reason2"> <label for = "reasonR2">특정 대상에 대한 괴롭힘에 참여했습니다.  </label> <br>
				<input type ="radio" name = "reasonR" id = "reasonR3" value = "reason3"> <label for = "reasonR3">인종, 성별, 정체성, 장애등에 대한 혐오를 조장하고 있습니다. </label> <br>
				<input type ="radio" name = "reasonR" id = "reasonR4" value = "reason4"> <label for = "reasonR4">폭력적 위협 혹은 신체적인 위해를 가하고 있습니다. </label> <br>
				<input type ="radio" name = "reasonR" id = "reasonR5" value = "reason5"> <label for = "reasonR5">자살 또는 자해를 조장하거나 암시하는 내용입니다. </label> <br>
				<input type ="radio" name = "reasonR" id = "reasonR6" value = "reason6"> <label for = "reasonR6">기타 </label> <br>
				<button id = "submitClaimReply"> 신고 </button>
				<div class = "caution-txt">타당하지 않은 근거로 신고 시 본 사이트 사용에 불이익을 받을 수 있습니다.  </div>
				</div>
			</div>
		
		
			<h3 class="ui header" style="margin-top: 15px;">
				댓글을 달아주세요!</h3>		
			<!-- 댓글다는부분 -->
			<!-- <div class="ui yellow segment">Yellow</div> -->
			
			<div class="replyArea">
				<div class="replyWriterArea">
				<table align="left" >
					<tr>		
						<td align="left"> 
							    <textarea rows="3" cols="100" id="replyContent" style="background-color:transparent; border: solid 2px #fbbd08; border-radius: 5px;">
								</textarea>	
			  			</td>
						<td style="margin-left: 20px;"><button id="addReply" class="ui invert yellow button" style="float: none; position: static;" >댓글 등록!</button></td>
				</tr>
				</table>
				</div>
				<br>
				<div id="replySelectArea">
					 <table  class="ui yellow table" id="replySelectTable" border="1" align="center">
						<thead id="thead">
							<!-- <tr>
								<th>작성자</th>
								<th>내용</th>
								<th>작성일</th>
								<th>신고!!!</th>
							</tr> -->
						</thead>						
						<%  for(int i = 0 ; i< list.size() ; i++){ 
								Board bn = (Board)list.get(i);%>
							<tr><td> <%= bn.getbWriter() %></td>
								<td><%= bn.getbContent() %></td>
								<td><%=bn.getbDate() %></td>
								<td onclick = "claimBtn(this);">댓글 신고하기
								<input type = "hidden" value = "<%= bn.getbNo() %>">
								<input type = "hidden" value = "<%= bn.getbWriter() %>">
								</td>
							</tr>
							<% } %>
						</tbody>	
					</table> 
				</div>
			</div>
			<br><br><br><br>
			<!-- 댓글 달기 -->
	 		<script>
	 		/* 게시글 신고  */
	 		function closePop1() {
				$(".claim-popup").css("visibility" , "hidden");
			}
			
			$(".claim").click(function(){
				$(".claim-popup").css("visibility" , "visible");
			});
			
			/* 댓글 신고 */
			function claimBtn(obj){
				$(".claim-popup-reply").css("visibility" , "visible");
				var boardNo = $(obj).find("input").eq(0).val(); // 보드 번호 
				var boardwriter = $(obj).find("input").eq(1).val(); // 보드 작성자 아이디 
				var loginUserId = "";
				$("#submitClaimReply").click(function(){
					
					<% if(loginUser != null){%>
					
					var radioVal = $('input[name="reasonR"]:checked').next().text();
					var userNo = <%= loginUser.getM_no()%>;
					loginUserId = "<%= loginUser.getM_id()%>";
					console.log(radioVal);
					if(radioVal != null){
						$.ajax({
							url : "claim.bo",
							data : {radioVal: radioVal, userNo : userNo, boardNo : boardNo, boardwriter : boardwriter, loginUserId : loginUserId},
							contentType : 'application/json; charset=UTF-8',
							type : "get",
							success : function(data){ 
								$("#resultClaim2").html("");
								if(data.indexOf('FAIL_NORMAL')>-1){
									$("#resultClaim2").append("<div class = 'claim-popup-txt'> 신고처리 중 오류가 발생했습니다. </div>");
								}
								else if(data.indexOf('FAIL_SAMEUSER')>-1) {
									$("#resultClaim2").append("<div class = 'claim-popup-txt'> 본인글에 대한 신고처리는 불가능합니다.  </div>");
								}
								else if(data.indexOf('FAIL_EXIST')>-1){
									$("#resultClaim2").append("<div class = 'claim-popup-txt'> 이전에 신고한 글입니다.  </div>");
								}
								else {
									$("#resultClaim2").append("<div class = 'claim-popup-txt'> 신고처리가 정상적으로 완료되었습니다. </div>");
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
			}
			function closePop2() {
				$(".claim-popup-reply").css("visibility" , "hidden");
			}
			
	 		$(function() {

               $("#addReply").click(function() {
            	   <%if (loginUser != null){%>
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
	                  
	                  /* var $thead = $("thead"); */
	                  /* $replySelectTable.append($thead); */
	                  
	                   for(var key in data){
	                     var $tr = $("<tr>");
	                     var $writerTd = $("<td>").text(data[key].bWriter).css("width","100px");
	                     var $contentTd = $("<td>").text(data[key].bContent).css("width","400px");
	                     var $dateTd = $("<td>").text(data[key].bDate).css("width", "200px");
	                     var $claimTd = $("<td onclick = 'claimBtn();'>").text("댓글 신고하기").css("width", "100").attr("onclick", "claimBtn(this);");
	                     var $claimBNo = $("<input>").attr("type", "hidden").val(data[key].bNo);
	                     var $claimBwriter = $("<input>").attr("type", "hidden").val(data[key].bWriter);
	                     
	                     $claimTd.append($claimBNo);
	                     $claimTd.append($claimBwriter);
	                     $tr.append($writerTd);
	                     $tr.append($contentTd);
	                     $tr.append($dateTd);
	                     $tr.append($claimTd);
	                     
	                     $replySelectTable.append($tr);    
	                  }
	               },
	               error:function(){
	                  console.log(실패);
	               }
	            });
	              <%}else {%>
	              alert(" 댓글을 달려면 로그인이 필요합니다. ");
	               <%}%>
	         });
      	});
		 
		
		$("#submitClaim").click(function(){
			<% if(loginUser != null){%>
			var radioVal = $('input[name="reason"]:checked').next().text();
			var userNo = <%= loginUser.getM_no()%>;
			var boardNo = <%= b.getbNo()%>;
			var boardwriter = '<%= b.getbWriter()%>';
			var loginUserId = "<%= loginUser.getM_id()%>";
			console.log(radioVal);
			if(radioVal != null){
				$.ajax({
					url : "claim.bo",
					data : {radioVal: radioVal, userNo : userNo, boardNo : boardNo, boardwriter : boardwriter, loginUserId : loginUserId},
					contentType : 'application/json; charset=UTF-8',
					type : "get",
					success : function(data){ 
						$("#resultClaim").html("");
						if(data.indexOf('FAIL_NORMAL')>-1){
							$("#resultClaim").append("<div class = 'claim-popup-txt'> 신고처리 중 오류가 발생했습니다. </div>");
						}
						else if(data.indexOf('FAIL_SAMEUSER')>-1) {
							$("#resultClaim").append("<div class = 'claim-popup-txt'> 본인글에 대한 신고처리는 불가능합니다.  </div>");
						}
						else if(data.indexOf('FAIL_EXIST')>-1){
							$("#resultClaim").append("<div class = 'claim-popup-txt'> 이전에 신고한 글입니다.  </div>");
						}
						else {
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
			

	</div>
		<div class="two wide column"></div>
	</div>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="kr">
<head>
       
        <!-- Add the datepicker script and set the ARIA describedby property to
             point to to the table that explains keyboard control. Don't worry
             you don't have to set the describedby parameter, I'm just showing
             you how it can be done! -->
        <script type="text/javascript" src="http://www.blueb.co.kr/data/201010/IJ12873724731095/datepicker.js">{"describedby":"fd-dp-aria-describedby"}</script>
        <link href="http://www.blueb.co.kr/data/201010/IJ12873724731095/demo.css"       rel="stylesheet" type="text/css" />
        
        <!-- Add the datepicker's stylesheet -->
        <link href="http://www.blueb.co.kr/data/201010/IJ12873724731095/datepicker.css" rel="stylesheet" type="text/css" />
    

<script type="text/javascript">
//  

// Utility function - not needed by the datepicker script but used by a few of the demos below   
function pad(value, length) { 
        length = length || 2; 
        return "0000".substr(0,length - Math.min(String(value).length, length)) + value; 
};

// 
</script>
<style>
	
  .square {
  	margin-left:80px;
    width: 900px;
    height: 600px;
    border: 1px solid red;
    float:left;
  }
</style>

</style>
</head>
<body>
<%@ include file = "/views/common/normal/header.jsp" %>
<br>
<br>
<br></br>
<h1 style=float:left;margin-left:80px;>플랜 제목</h1>&nbsp;&nbsp;
<select>
	<option>관리</option>
	<option>수정</option>
	<option>삭제</option>
</select>
   
<br>
<br>
<br>
<script>
$("body").append("<div class='square'></div>");
</script>
       
       <br></br>


</span>

					
			
					</div>
      <div style=float:right;margin-right:80px>
      <label for="dp-s1">날짜</label> : <input type="text" class="w18em" id="dp-s1" name="dp-s1" value="" /></div>

      <script type="text/javascript">
      //   
        var opts = {                            
                formElements:{"dp-s1":"d-sl-m-sl-Y"},                
                staticPos:true,
                fillGrid:true,
                constrainSelection:false,
                finalOpacity:100         
                };           
        datePickerController.createDatePicker(opts);
      // 
      </script>
      </div>
      
   <div class = "two wide column"></div>
    	<%@ include file = "/views/common/normal/footer.jsp" %>

</body>
</html>
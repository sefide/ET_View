<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Ubuntu" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
	body{
		width: 300px;
		height: 280px;
		
	}
	
	
	.outer{
		
		width:300px;
		height:250px;
		font-family: 'Nanum Gothic', sans-serif;
		font-weight: 800
		
	}
	table{
		width:280px;
		height:200px;
		border:1px solid black;
		margin-left: auto;
		margin-right: auto;
		margin-top:10px;
		border-collapse: collapse;
	}
	table tr td{
		border:1px solid black;
		
	}
	.btnArea{
		text-align: center;
	}
</style>

</head>
<body>
	
	<div class="outer">
		<table>
			<tr style="text-align:center; height:50px; background-color: rgb(42,90,133)">
				<td colspan="3" style="color:white; font-weight: 800;">충전할 쿠폰 개수를 선택해주세요!</td>
			</tr>
			<tr style="text-align: center; height:50px; font-weight: 800;">
				<td><input type="radio" name="count" value="1">1개</td>
				<td><input type="radio" name="count" value="5">5개</td>
				<td><input type="radio" name="count" value="10">10개</td>
			</tr>
			<tr>
				<td colspan="3" style="font-weight: 800;">선택하신 쿠폰 개수: <label id="count"></label></td>
			</tr>
			<tr>
				<td colspan="3">결제금액 : <label id="price"></label></td>
			</tr>
		</table>
		<br>
		<div class="btnArea">
			<button>취소하기</button>
			<button onclick="pay();">결제하기</button>
		</div>
	</div>

	<script>
	$("input[type = radio]").click(function(){
		$("#count").text($(this).val());
		
		$("price")
	});
	
	
	function pay() {
		var IMP = window.IMP;
		IMP.init('imp87909065');
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:Premium',
		    amount : 10,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
		
	}
	</script>
</body>
</html>
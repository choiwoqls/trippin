
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>
</head>

<script>
	function check(f){
		return true;
	}
</script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
.tx-ar{
	width:600px;
	height:200px;
	margin-left: 30%;
    margin-top: 3%;
    resize: none;
}
.btns{
	margin-left: 50%;
}
.btns input{
	cursor: pointer;
    background-color: transparent;
    border: 1px solid #000;
    border-radius: 2px;
}
.btns input:hover{
	background-color: #78decf;
	border-color: #78decf;
}
</style>

<body>
	<header class="header">
		<br>
		<form method="post" action="${cpath }/admin/purchase/refund?purchase=${param.purchase}&kind=${param.kind}" onsubmit="return check(this)">
			<input type="hidden" name="m_seq" value="${map.M_SEQ }">
			<input type="hidden" name="cancel_seq" value="${cvo.cancel_seq }">
			<input type="hidden" name="money" id="money" value="${map.TOT_MONEY * cvo.cancel_percent / 100 - map.USE_CASH - (map.TOT_MONEY - map.USE_CASH - map.PAY_MONEY) }">
			<input type="hidden" name="fee" id="fee" value="${map.TOT_MONEY * (1-cvo.cancel_percent/100) }">
 			
			<div align="center" id="dataTable">
				<h3>환불</h3>
				<table border="1" style="width: 1200px; text-align:center;" >
					<tr>
						<th>예약번호</th>
						<td colspan="3">${map.SERIAL_NO }</td>
					</tr>
					<tr>
						<th>회원명</th>
						<td colspan="3">${map.M_NAME }</td>
					</tr>
					<tr>
						<th>결제 수단</th>
						<td colspan="3">${map.PAY_NAME }</td>
					</tr>
					<tr>
						<th>결제일</th>
						<td>${map.DATETIME }</td>
						<th>총금액</th>
						<td><fmt:formatNumber value="${map.TOT_MONEY }" pattern="#,##0" />원</td>
					</tr>
					<tr>
						<th>환불 비율</th>
						<td>${cvo.cancel_percent }%</td>
						<th>캐시할인</th>
						<td><fmt:formatNumber value="${map.USE_CASH }" pattern="#,##0" />원</td>
					</tr>
					<tr>
						<th>사용 쿠폰</th>
						<td>${map.COUPON_NAME }</td>
						<th>쿠폰 할인액</th>
						<td><fmt:formatNumber value="${map.TOT_MONEY - map.USE_CASH - map.PAY_MONEY }" pattern="#,##0" />원</td>
					</tr>
					<tr>
						<th>결제 금액</th>
						<td><fmt:formatNumber value="${map.PAY_MONEY }" pattern="#,##0" />원</td>
						<th>적립 캐시</th>
						<td><fmt:formatNumber value="${map.CASH }" pattern="#,##0" />원</td>
					</tr>
				</table>
			</div>
			<div align="center">
				<h3>환불 예상액</h3>
					<input type="hidden" name="cash" value="${map.USE_CASH }">
					<input type="hidden" name="su" value="${su }">
					<input type="hidden" name="couponlist_seq" value="${vo.couponlist_seq }">
				<table border="1" style="width: 1200px; text-align:center;" >
					<tr>
						<th>취소수수료</th>
						<td><fmt:formatNumber value="${map.TOT_MONEY * (1-cvo.cancel_percent / 100) }" pattern="#,##0" />원</td>
						<th>캐시 반환</th>
						<td><fmt:formatNumber value="${map.USE_CASH }" pattern="#,##0" />원</td>
					</tr>
					<tr>
						<th>취소 캐시</th>
						<td><fmt:formatNumber value="${map.CASH }" pattern="#,##0" />원</td>
						<th>쿠폰</th>
						<td>
							<c:if test="${su != null }">
								${map.COUPON_NAME } (${su==0 ? '반환 불가' : '반환 가능'})
							</c:if>
						</td>
					</tr>
					<tr>
						<th>환불가능액</th>
						<td colspan="3"><fmt:formatNumber value="${map.TOT_MONEY * cvo.cancel_percent / 100 - map.USE_CASH - (map.TOT_MONEY - map.USE_CASH - map.PAY_MONEY) }" pattern="#,##0" />원</td>
					</tr>
				</table>
			</div>
			<input type="hidden" name="">
			<textarea  class="tx-ar" name="memo"></textarea>
			<div class="btns"><input type="submit" value="환불하기"></div>
		</form>
		<div class="btns"><input type="button" value="뒤로가기" onclick="history.back()"></div>
		
		<script>
			$(function(){
				var money = document.getElementById("money");
				var fee = document.getElementById("fee");
				
				money.value = Math.round(money.value);
				fee.value = Math.round(fee.value);
			})
		</script>
		
		<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>
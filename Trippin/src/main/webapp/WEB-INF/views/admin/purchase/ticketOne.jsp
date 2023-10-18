
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>
</head>
<body>
	<header class="header">
		<br>
		<button type="button" onclick="location.href='${cpath}/admin/purchase/cancelList'">결제 취소 목록</button>
		<button type="button" onclick="location.href='${cpath}/admin/purchase/accomList'">숙소 예약 목록</button>
		<button type="button" onclick="location.href='${cpath}/admin/purchase/ticketList'">티켓 예매 목록</button>
		<div align="center" id="dataTable">
			<h3>${map.TICKET_NAME }</h3>
			<table border="1" style="width: 1200px; text-align:center;" >
				<tr>
					<th colspan="4">기본 정보</th>
				</tr>
				<tr>
					<th>예약번호</th>
					<td>${map.SERIAL_NO }</td>
					<th>회원명</th>
					<td>${map.M_NAME }</td>
				</tr>
				<tr>
					<th>유효기간</th>
					<td>${map.USE_DATE } ~ ${map.END_DATE }</td>
					<th>상태</th>
					<td>${map.STATUS==0 ? '미사용' : cc.STATUS == 1? '사용' : cc.STATUS==2? '기간만료' : '취소' }</td>
				</tr>
				<tr>
					<th>선택 사항</th>
					<td colspan="3">
						<c:forEach var="pick" items="${pickList }">
							<span>[${pick.opt_name }]&nbsp;&nbsp;${pick.subopt_name }&nbsp;×&nbsp;${pick.amount }&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${pick.sum_price }" pattern="#,##0" />원</span><br>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th colspan="4">예약 정보</th>
				</tr>
				<tr>
					<th>예약자 이름</th>
					<td>${map.RESERVER_NAME }</td>
					<th>대표자 이름</th>
					<td>${map.REPRE_NAME }</td>
				</tr>
				<tr>
					<th>예약자 번호</th>
					<td>${map.RESERVER_TEL }</td>
					<th>대표자 번호</th>
					<td>${map.REPRE_TEL }</td>
				</tr>
				<tr>
					<th>예약자 이메일</th>
					<td>${map.RESERVER_EMAIL }</td>
				</tr>
				<tr>
					<th colspan="4">결제 정보</th>
				</tr>
				<tr>
					<th>결제 수단</th>
					<td>${map.PAY_NAME }</td>
					<th>결제일</th>
					<td>${map.DATETIME }</td>
				</tr>
				<tr>
					<th>총금액</th>
					<td><fmt:formatNumber value="${map.TOT_MONEY }" pattern="#,##0" />원</td>
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
		<c:if test="${cvo != null }">
			<div align="center" id="dataTable">
				<h3><취소 내역></h3>
				<table border="1" style="width: 1200px; text-align:center;" >
					<tr>
						<th>취소 사유</th>
						<td>${cvo.cancel_cate_name }</td>
						<th>접수 일시</th>
						<td>${cvo.datetime }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">${cvo.content }</td>
					</tr>
					<tr>
						<th>환불 비율</th>
						<td>${cvo.cancel_percent }%</td>
						<th>환불 상태</th>
						<td>${cvo.status==0? '접수' : '처리완료'}</td>
					</tr>
				</table>
				<c:if test="${cvo.status == 0 }">
					<input type="button" value="환불 진행" onclick="location.href='${cpath}/admin/purchase/refundForm?purchase=${param.purchase }&kind=1'">
				</c:if>
			</div>
		</c:if>
		<c:if test="${rvo != null }">
			<div align="center" id="dataTable">
				<h3><환불 내역></h3>
				<table border="1" style="width: 1200px; text-align:center;" >
					<tr>
						<th>취소 수수료</th>
						<td><fmt:formatNumber value="${rvo.fee}" pattern="#,##0" />원</td>
						<th>환불 금액</th>
						<td><fmt:formatNumber value="${rvo.money}" pattern="#,##0" />원</td>
						<th>환불 일시</th>
						<td>${rvo.datetime }</td>
					</tr>
					<tr>
						<th>메모</th>
						<td colspan="5">${rvo.memo }</td>
					</tr>
				</table>
			</div>
		</c:if>
		<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>
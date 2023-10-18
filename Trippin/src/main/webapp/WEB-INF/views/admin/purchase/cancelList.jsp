
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
		
		<form action = "${cpath }/admin/purchase/cancelSearch" method="post">
			<select name="type">
				<option value="m_name" ${type == 'm_name' ? 'selected':''}>회원명</option>
				<option value="serial_no" ${type == 'serial_no' ? 'selected':''}>예약번호</option>
				<option value="kind" ${type == 'kind' ? 'selected':''}>종류</option>
				<option value="status" ${type == 'status' ? 'selected':''}>상태</option>
			</select>
			<input type="text" name="word" value="${word }">
			<input type="submit" value="검색">
		</form>
		
		<div align="center" id="dataTable">
			<table border="1" style="width: 1200px; text-align:center;" >
				<tr>
					<th>No</th>
					<th>회원명</th>
					<th>종류</th>
					<th>예약번호</th>
					<th>환불유형</th>
					<th>접수일자</th>
					<th>상태</th>
				</tr>
				<c:if test="${list == null }">
					<tr>
						<th colspan="7">해당하는 내역이 존재하지 않습니다.</th>
					</tr>
				</c:if>
				<c:if test="${list !=null }">
					<c:forEach var="cc" items="${list }"> 
						<tr>
							<td>${cc.CANCEL_SEQ }</td>
							<td>${cc.M_NAME }</td>
							<td>${cc.KIND == 0? '숙소' : '티켓' }</td>
							<td><a href="${cpath }/admin/purchase/ticketOne?purchase=${cc.T_PURCHASE_SEQ}">${cc.SERIAL_NO }</a></td>
							<td>${cc.CANCEL_PERCENT==100 ? '전액' : '부분' }</td>
							<td>${cc.DATETIME }</td>
							<td>${cc.STATUS==0 ? '접수' : '환불완료' }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		<c:if test="${list !=null && type==null}">
			<div align="center" class="paging">
				<c:if test="${paging.prev }">
					<a href="${cpath }${url }?page=${paging.begin - 1}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }" step="1">
					<c:choose>
						<c:when test="${i == paging.page }">
							<strong>[${i}]</strong>
						</c:when>
						<c:otherwise>
							<a href="${cpath }${url }?page=${i}" style="width:20.37px;">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.next }">
					<a href="${cpath }${url }?page=${paging.end + 1}">[다음]</a>
				</c:if>
			</div>
		</c:if>
		<c:if test="${list !=null && type!=null}">
			<div align="center" class="paging">
				<c:if test="${paging.prev }">
					<a href="${cpath }${url }?page=${paging.begin - 1}&type=${type}&word=${word}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }" step="1">
					<c:choose>
						<c:when test="${i == paging.page }">
							<strong>[${i}]</strong>
						</c:when>
						<c:otherwise>
							<a href="${cpath }${url }?page=${i}&type=${type}&word=${word}" style="width:20.37px;">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.next }">
					<a href="${cpath }${url }?page=${paging.end + 1}&type=${type}&word=${word}">[다음]</a>
				</c:if>
			</div>
		</c:if>
		<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>
<script type="text/javascript">
function openPopup(url){
	window.open(url,'popupWindow','width=800, height=600, scrollbars=yes')
}
</script>


	<div align="center">
		<table id="list" border="1" cellspacing="0" cellpadding="5px"
			style="width: 1200px; text-align: center; ">
			<tr>
				<th>정렬</th>
				<th>회원 이름</th>
				<th>회원 이메일</th>
				<th>상호명</th>
				<th>종류</th>
				<th>통보 이메일</th>
				<th>이메일 수집 동의 여부</th>
				<th>승인 상태</th>
				<th>신청일</th>
			</tr>
			<c:choose>
				<c:when test="${empty nplist }">
					<tr>
						<td colspan="9" align="center"><span
							style="font-weight: bold;">접수된 글이 없습니다.</span></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="np" items="${nplist }" varStatus="i">
						<tr
							onclick="openPopup('${cpath}/admin/newplace/selectNewplace?newplace_seq=${np.newplace_seq }')"
							style="cursor: pointer; width: 65%">
							<td>${i.count }</td>
							<td>${np.m_name }</td>
							<td>${np.m_email }</td>
							<td>${np.name }</td>
							<td class="kind">${np.kind == 1 ? "관광지" : "맛집"}</td>
							<td>${np.email }</td>
							<td align="center" style="width: 10%">${np.email_status == 0 ? "X" : "O"}</td>
							<td align="center" style="width: 8%" class="checkstatus">${np.status == 0 ? "미승인" : (np.status == 1?"승인 완료":"부적격")}</td>
							<td align="center" style="width: 10%" id="thisdate">${np.datetime }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	
<br>
<div align="right">
		<form action="${cpath }/admin/newplace/applicationList" method="get"
			onsubmit="return search(this)">
			<span> <select name="type" id="type">
					<option value="newplace_seq"
						${param.type == 'newplace_seq' ? 'selected' : '' }>글번호</option>
					<option value="m_name"
						${param.type == 'm_name' or empty param.type ? 'selected' : '' }>회원
						이름</option>
					<option value="m_email"
						${param.type == 'm_email' ? 'selected' : '' }>이메일</option>
					<option value="name" ${param.type == 'name' ? 'selected' : '' }>상호명</option>
					<option value="status" ${param.type == 'status' ? 'selected' : '' }>상태</option>
			</select> <input type="text" name="word" placeholder="검색어 입력" id="word"
				value="${param.word }" autocomplete="off"> <input
				type="submit" value="검색">
			</span>
		</form>
	</div >
	<div align="right">
		<input type="date" id="date1"> ~ <input type="date" id="date2">
		<input type="button" value="검색" onclick="dateSearch()">

	</div>
	<br>
	<c:if test="${param.type==null }">
	<div align="center">
		<c:if test="${paging.prev }">
			<a
				href="${cpath }/${url}?page=${paging.begin - 1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/${url}?page=${i}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/${url}?page=${paging.end + 1}">[다음]</a>
		</c:if>
	</div>
	</c:if>
	<c:if test="${param.type!=null }">
	<div align="center">
		<c:if test="${paging.prev }">
			<a
				href="${cpath }/${url}?page=${paging.begin - 1}&type=${param.type}&word=${param.word}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/${url}?page=${i}&type=${param.type}&word=${param.word}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/${url}?page=${paging.end + 1}&type=${param.type}&word=${param.word}">[다음]</a>
		</c:if>
	</div>
	</c:if>
</div>


	<script>
		function dateSearch() {
			var date1 = new Date(document.getElementById("date1").value);
			var date2 = new Date(document.getElementById("date2").value);

			var rows = document.querySelectorAll("#list tr");
			rows.forEach(function(row, index) {

				if (index === 0)
					return; // Skip the header row

				/* for (var i = 1; i < rows.length; i++) { 
				var row = rows[i];
				var dateString = row.querySelector("#thisdate").textContent;
				var npDate = new Date(dateString); */

				var dateString = row.querySelector("#thisdate").textContent;
				var npDate = new Date(dateString);

				if (date1 <= npDate && npDate <= date2) {
					row.style.display = "table-row";
				} else {
					row.style.display = "none";
				}
			});
		}
			
		function search(f) {
			var type= document.getElementById("type").value;
			var word= document.getElementById("word").value;
			
			if(type === ''){
				alert("검색할 유형을 선택하세요!");
				return false;
			}else if(word===''){
				alert("검색할 단어를 입력하세요!");
				return false;
			}
			f.submit();
			
			
		}
	</script>

<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>


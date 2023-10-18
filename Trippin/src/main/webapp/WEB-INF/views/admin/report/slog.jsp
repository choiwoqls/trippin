<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <script>








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
function popUp(url) {
	window.open(url,"_blank","width=800, height=600");
	
}
</script>   

<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>



<div align ="center" id="dataTable">

<table border="1" style="width: 1200px; text-align: "center; >
<thead>
<tr>

<th>번호</th>
<th>회원닉네임</th>


<!-- 필터링 -->
<th>
신고사유
</th>
<th>이메일</th>
<th>
상태

</th>
<th>등록 일시</th>
<th>상태등록 일시</th> 
<th>글 유형</th> 


</tr>
</thead>
<tbody style="text-align: center;">
<c:forEach var="ml" items="${spList}">
 <input type="hidden" name="s_report_seq" id="s_report_seq" value="${ml.S_REPORT_SEQ}"> 
<tr>

<td >${ml.S_REPORT_SEQ} </td>
<td><a href="javascript:void(0)" style="text-decoration: none; color: black;" onclick="popUp('${cpath}/admin/sreport/scontent?s_report_seq=${ml.S_REPORT_SEQ}&m_seq=${ml.M_SEQ}&kind=${ml.KIND}')"> ${ml.M_NICKNAME }</a></td>
<td>${ml.REPORT_CATE_NAME }</td>
<td>${ml.MEMAIL }</td>

<td>${ml.RESULT == 0 ? '미승인' : (ml.RESULT == 1 ? '승인' : '부적격')}</td>
<td>${ml.DATETIME}</td>
<td>${ml.RESULTDATE }</td> 
<td>${ml.KIND ==0?'여행기':'여행기 댓글' }</td> 

</tr>
</c:forEach>
</tbody>

</table>

<table>
<br>
<div align="right">
		<form action="${cpath }/admin/sreport/srlist" method="get" onsubmit="return search(this)">
			 <select name="type" id="type">
			 		<option value="">선택하세요</option>
					<option value="m_nickname"
						${param.type == 'm_nickname' ? 'selected' : '' }>회원닉네임</option>
					<option value="report_cate_name"
						${param.type == 'report_cate_name' ? 'selected' : '' }>신고사유</option>
					<option value="email"
						${param.type == 'email' ? 'selected' : '' }>이메일</option>
					<option value="result" 
						${param.type == 'result' ? 'selected' : '' }>상태</option>
					<option value="kind" 
						${param.type == 'kind' ? 'selected' : '' }>글 유형</option>
			</select> 
			<input type="text" name="word" placeholder="검색어 입력" id="word" value="${param.word }" autocomplete="off"> 
			<input type="submit" value="검색">
			
		</form>
	</div >
		
	<br>
	<c:if test="${param.type==null }">
	<div align="center">
		<c:if test="${paging.prev }">
			<a
				href="${cpath }/admin/sreport/srlist?page=${paging.begin - 1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/admin/sreport/srlist?page=${i}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/admin/sreport/srlist?page=${paging.end + 1}">[다음]</a>
		</c:if>
	</div>
	</c:if>
	<c:if test="${param.type!=null }">
	<div align="center">
		<c:if test="${paging.prev }">
			<a
				href="${cpath }/admin/sreport/srlist?page=${paging.begin - 1}&type=${param.type}&word=${param.word}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/admin/sreport/srlist?page=${i}&type=${param.type}&word=${param.word}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/admin/sreport/srlist?page=${paging.end + 1}&type=${param.type}&word=${param.word}">[다음]</a>
		</c:if>
	</div>
	</c:if>
</div>



</table>

</div>


<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>

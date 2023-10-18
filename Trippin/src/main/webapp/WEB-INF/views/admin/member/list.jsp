<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>


<div align ="center" id="dataTable">



<table border="1" style="width: 1200px; text-align: center; ">
<thead>
<tr>
<th>번호</th>
<th>이름</th>
<th>회원상태</th>
<th>가입일</th>
<th>이메일</th>
<th>레벨</th>
</tr>
</thead>
<tboady>
<c:forEach  var="ml" items="${mvlist}">
<tr>
<td>${ml.m_seq }</td>
<td><a href="${cpath}/admin/member/content?m_seq=${ml.m_seq}"  style="text-decoration: none; color: black;">${ml.m_name }</a></td>
<td>${ml.m_status==0 ?'활동중' : (ml.m_status == 1? '탈퇴' : '영구정지') }</td>
<td>${ml.m_joindate }</td>
<td>${ml.m_email }</td>
<td>${ml.m_level }</td>
</tr>
</c:forEach>
</tboady>
</table>

<br>


<form action="${cpath }/admin/member/list" method="get">

<div align="right"> 
<select name="type">
<option value="" >선택하세요</option>
<option value="m_name" ${param.type == 'm_name'?'selected' : ''}> 회원이름</option>
<option value="m_email" ${param.type == 'm_email'?'selected' : ''}> 이메일</option>
<option value="m_level" ${param.type == 'm_level'?'selected' : ''}> 레벨</option>
</select>
<input type="text" name="word" placeholder="검색어를 입력하세요" value="${param.word }" >
<input type="submit" value="검색">
</div>
</form>
<c:if test="${param.type==null }">
<div align ="center">
		<c:if test="${paging.prev}">
			<a href="${cpath }/admin/member/list?page=${paging.begin-1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin}" end="${paging.end}" step="1">
			<c:choose>
				<c:when test="${i==paging.page}">
					<strong>[${i}]</strong>
				</c:when>
				<c:otherwise>
					<a href="${cpath }/admin/member/list?page=${i}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next}">
			<a href="${cpath }/admin/member/list?page=${paging.end +1}">[다음]</a>
		</c:if>
	</div>
	</c:if>
	<c:if test="${param.type!=null }">
<div align ="center">
		<c:if test="${paging.prev}">
			<a href="${cpath }/admin/member/list?page=${paging.begin-1}&type=${param.type}&word=${param.word}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin}" end="${paging.end}" step="1">
			<c:choose>
				<c:when test="${i==paging.page}">
					<strong>[${i}]</strong>
				</c:when>
				<c:otherwise>
					<a href="${cpath }/admin/member/list?page=${i}&type=${param.type}&word=${param.word}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next}">
			<a href="${cpath }/admin/member/list?page=${paging.end +1}&type=${param.type}&word=${param.word}">[다음]</a>
		</c:if>
	</div>
	</c:if>
	</div>
<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>

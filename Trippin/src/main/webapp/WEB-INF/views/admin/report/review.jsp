<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <script>
/* function applyCategoryFilters(){
	var selectCate1 = document.getElementById("categoryFilter1").value;
	var selectStatus = document.getElementById("stausValue").value;
	var reviewStatus = document.getElementById("reviewStatus1").value;

	console.log(reviewStatus);

	var dataTable = document.getElementById("dataTable");
	var rows = dataTable.getElementsByTagName("tr");
	
	for(let i =1; i<rows.length; i++){
		var rowCate1 = rows[i].getElementsByTagName("td")[2].innerText;
		var rowStatus = rows[i].getElementsByTagName("td")[4].innerText; 
		var rowStatus2 = rows[i].getElementsByTagName("td")[7].innerText; 
		
		var showRow = true;
		
		//if로 각각 조건 걸어야 개별 필터링 가능
		
		if(selectCate1 !== "" && selectCate1 !== rowCate1){
			showRow = false;
			
		}
		
	if(selectStatus !== "" && selectStatus !== rowStatus){
			showRow = false;
		}
	
	if(reviewStatus !== "" && reviewStatus !== rowStatus2 ){
		showRow = false;
	}
		
		if(showRow){
			rows[i].style.display ="table-row";
		}else{
			rows[i].style.display = "none";
		}
	}
	
} */
function openPopup(url){
	window.open(url,'popupWindow','width=800, height=600, scrollbars=yes')
} 


function selectAllRows() {
	  const checkboxes = document.getElementsByName("selectRow");
	  const selectAllCheckbox = document.getElementById("selectAll");

	  for (let i = 0; i < checkboxes.length; i++) {
	    checkboxes[i].checked = selectAllCheckbox.checked;
	  }
	}

	function checkSelectAll() {
	  const checkboxes = document.getElementsByName("selectRow");
	  const selectAllCheckbox = document.getElementById("selectAll");
	  let allChecked = true;

	  for (let i = 0; i < checkboxes.length; i++) {
	    if (!checkboxes[i].checked) {
	      allChecked = false;
	      break;
	    }
	  }

	  selectAllCheckbox.checked = allChecked;
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

<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>

<div align ="center" id="dataTable">
<table border="1" style="width: 1200px; text-align: "center; >
<thead>
<tr>
<!-- <th><input type="checkbox" id="selectAll" onchange="selectAllRows()"></th> -->
<th>번호</th>
<th>작성자</th>


<!-- 필터링 -->
<th>
신고사유
<%-- <label for="categoryFilter1">신고사유</label>

<select id="categoryFilter1" onchange="applyCategoryFilters()">
<option value="">전체</option>
<c:forEach var="rn" items="${rcList}">
<option value="${rn.report_cate_name }">${rn.report_cate_name }</option>
</c:forEach>
</select> --%>

</th>
<th>이메일</th>
<th>
상태
<!-- <label for id="statusValue">상태 </label>
<select id="stausValue" onchange="applyCategoryFilters()">
<option value="">전체</option>
<option value="미승인">미승인</option>
<option value="승인">승인</option>
<option value="부적격">부적격</option>

</select> -->
</th>
<th>등록 일시</th>
<th>상태등록 일시</th> 
<th>
리뷰유형
<!-- <label for id="reviewStatus">리뷰유형 </label>
<select id="reviewStatus1" onchange="applyCategoryFilters()">
<option value="">전체</option>
<option value="리뷰">리뷰</option>
<option value="리뷰댓글">리뷰댓글</option>
</select> -->
</th>

</tr>
</thead>
<tbody style="text-align: center;">
<c:forEach var="rl" items="${rvList}">
<tr>
<!-- <td><input type="checkbox" id="selectRow" class="selectRow" name="selectRow" onchange="checkSelectAll()"></td> -->
<td>${rl.REPORT_SEQ}</td>
<td><a href ="javascript:void(0);" onclick="openPopup('${cpath}/admin/report/review?boardNo=${rl.BOARD_NO}&kind=${rl.RKIND }&report_cate_seq=${rl.RCSEQ}')" style="text-decoration: none; color: black;">${rl.M_NICKNAME }</a></td>
<td>${rl.REPORT_CATE_NAME }</td>
<td>${rl.MEMAIL }</td>

<td>${rl.RESULT == 0 ? '미승인' : (rl.RESULT == 1 ? '승인' : '부적격')}</td>
<td>${rl.DATETIME}</td>
<td>${rl.RESULTDATE}</td>
<td>${rl.RKIND ==0?'리뷰':'리뷰댓글'}</td>
<%-- <td>${rl.checkdate }</td> --%>
</tr>
</c:forEach>
</tbody>

</table>
<br>
<div align="right">
		<form action="${cpath }/admin/report/mrlist" method="get" onsubmit="return search(this)">
			 <select name="type" id="type">
			 		<option value="">선택하세요</option>
					<option value="m_nickname"
						${param.type == 'm_nickname' ? 'selected' : '' }>회원닉네임</option>
					<option value="report_cate_name"
						${param.type == 'm_report_cate_name' ? 'selected' : '' }>신고사유</option>
					<option value="email"
						${param.type == 'email' ? 'selected' : '' }>이메일</option>
					<option value="result" 
						${param.type == 'result' ? 'selected' : '' }>상태</option>
			</select> 
			<input type="text" name="word" placeholder="검색어 입력" id="word" value="${param.word }" autocomplete="off"> 
			<input type="submit" value="검색">
			
		</form>
	</div >
		
	<br>
	<c:if test="${param.type == null }">
	<div align="center">
		<c:if test="${paging.prev }">
			<a
				href="${cpath }/admin/report/mrlist?page=${paging.begin - 1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/admin/report/mrlist?page=${i}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/admin/report/mrlist?page=${paging.end + 1}">[다음]</a>
		</c:if>
	</div>
	</c:if>
	<c:if test="${param.type != null }">
	<div align="center">
		<c:if test="${paging.prev }">
			<a
				href="${cpath }/admin/report/mrlist?page=${paging.begin - 1}&type=${param.type}&word=${param.word}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/admin/report/mrlist?page=${i}&type=${param.type}&word=${param.word}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/admin/report/mrlist?page=${paging.end + 1}&type=${param.type}&word=${param.word}">[다음]</a>
		</c:if>
	</div>
	</c:if>


</div>     

<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>

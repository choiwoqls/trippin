 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>
<script>
function openPopup(url){
	window.open(url,'popupWindow','width=800, height=600, scrollbars=yes')
} 
</script>
<script>


//전체 체크 및 개별 체크
/* function selectAllRows() {
	  var checkboxes = document.getElementsByClassName("selectRow");
	  var checkAll = document.getElementById("selectAll");

	  for (var i = 0; i < checkboxes.length; i++) {
	    checkboxes[i].checked = checkAll.checked;
	  }
	}
function checkSelectAll(){
	  var checkboxes = document.getElementsByClassName("selectRow");
	  var checkAll = document.getElementById("selectAll");
	  
	  let allChecked = true;

	  for (var i = 0; i < checkboxes.length; i++) {
	    if(!checkboxes[i].checked){
	    	allChecked = false;
	    	break;
	    	
	    }
	    
	  }
	  
	  checkAll.checked = allChecked;
	}
	
	//전체 필터링
function applyCategoryFilters(){
	var selectCate1 = document.getElementById("categoryFilter1").value;
	var selectCate2 = document.getElementById("categoryFilter").value;
	var selectStatus = document.getElementById("stausValue").value;

	var dataTable = document.getElementById("dataTable");
	var rows = dataTable.getElementsByTagName("tr");
	
	for(let i =1; i<rows.length; i++){
		var rowCate1 = rows[i].getElementsByTagName("td")[2].innerText; 
		var rowCate2 = rows[i].getElementsByTagName("td")[3].innerText; 
		var rowStatus = rows[i].getElementsByTagName("td")[5].innerText; 
		
		var showRow = true;
		
		//if로 각각 조건 걸어야 개별 필터링 가능
		
		if(selectCate1 !== "" && selectCate1 !== rowCate1){
			showRow = false;
			
		} if(selectCate2 !== "" && selectCate2 !== rowCate2){
			showRow = false;
		
	}if(selectStatus !== "" && selectStatus !== rowStatus){
			showRow = false;
		}
		
		if(showRow){
			rows[i].style.display ="table-row";
		}else{
			rows[i].style.display = "none";
		}
	}

} 
	 */
	

</script>
<script type="text/javascript">
function search(f) {
	
	var type=document.getElementById("typeSelect");
	var word=document.getElementById("word");
	
	if(type.value===''){
		alert("검색할 유형을 선택하세요!")
		return false;
	}else if(word.value===''){
		alert("검색할 단어을 입력하세요!")
		return false;
	}
		
	
	f.submit;
}

</script>

</head>
<body>
	<header class="header">

<br>

<div align ="center" id="dataTable">

<table id="list" border="1" style="width: 1200px; text-align: "center; >
<thead>
<tr>
<!-- <th><input type="checkbox" id="selectAll" onchange="selectAllRows()"></th> -->
<th>번호</th>
<th>회원닉네임</th>
<!-- 필터링 -->
<th>
유형
<!-- <label for="categoryFilter1">유형</label>
<select id="categoryFilter1" onchange="applyCategoryFilters()">
<option value="">전체</option>
<option value="관광지">관광지</option>
<option value="맛집">맛집</option>


</select> -->
</th>
<th>
수정유형
<%-- <label for="categoryFilter">수정유형 </label>
<select id="categoryFilter" onchange="applyCategoryFilters()">
	<option value="">전체</option>
	<c:forEach var="rvl" items="${revCateList }">
	<option value="${rvl.revision_cate_name }">${rvl.revision_cate_name }</option>
	
	</c:forEach>

</select> --%>
</th>
<th>내용</th>
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
</tr>
</thead>
<tbody style="text-align: center;">
<c:forEach var="rl" items="${revoList}">
<tr>
<!-- <td><input type="checkbox" class="selectRow" name="selectRow" onchange="checkSelectAll()"></td> -->
	<td>${rl.REVISION_SEQ }</td>
	<td>${rl.M_NICKNAME }</td>
	<td>${rl.CATE_SEQ == 1?'관광지':'맛집' }</td>
	<td>${rl.REVISION_CATE_NAME }</td>
	<td><a href="javascript:void(0);" onclick="openPopup('${cpath}/admin/revision/content?revision_seq=${rl.REVISION_SEQ }')" style="text-decoration: none; color: black;">
	${rl.CONTENT }
	</a></td>
	<td>${rl.STATUS == 0 ? '미승인' : (rl.STATUS == 1 ? '승인' : '부적격')}</td>
	<td >${rl.DATETIME}</td>
	<td >${rl.CHECKDATE}</td>
</tr>
</c:forEach>
</tbody>

</table>
<br>
<div align="right">
		<form action="${cpath }/admin/revision/list" method="get" onsubmit="return search(this)">
			 <select name="type" id="typeSelect">
			 		<option value="">선택하세요</option>
					<option value="m_nickname"
						${param.type == 'm_nickname' ? 'selected' : '' }>회원닉네임</option>
					<option value="cate_seq"
						${param.type == 'cate_seq' ? 'selected' : '' }>유형</option>
					<option value="revision_cate_name"
						${param.type == 'revision_cate_name' ? 'selected' : '' }>수정유형</option>
					<option value="content" 
						${param.type == 'content' ? 'selected' : '' }>내용</option>
					<option value="status" 
						${param.type == 'status' ? 'selected' : '' }>상태</option>
			</select> 
			<input type="text" name="word" placeholder="검색어 입력" id="word" value="${param.word }" autocomplete="off"> 
			<input type="submit" value="검색">
			
		</form>
	</div >
		
	<br>
	<c:if test="${param.type ==null}">
	<div align="center">
		<c:if test="${paging.prev }">
			<a
				href="${cpath }/admin/revision/list?page=${paging.begin - 1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/admin/revision/list?page=${i}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/admin/revision/list?page=${paging.end + 1}">[다음]</a>
		</c:if>
	</div>
	</c:if>
	<c:if test="${param.type !=null}">
	<div align="center">
		<c:if test="${paging.prev }">
			<a
				href="${cpath }/admin/revision/list?page=${paging.begin - 1}&type=${param.type}&word=${param.word}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/admin/revision/list?page=${i}&type=${param.type}&word=${param.word}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/admin/revision/list?page=${paging.end + 1}&type=${param.type}&word=${param.word}">[다음]</a>
		</c:if>
	</div>
	</c:if>
</div>


<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>


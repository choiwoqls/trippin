<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>

<script>
function openPopup(url){
	window.open(url,'popupWindow','width=800, height=600, scrollbars=yes')
} 

//전체 체크 및 개별 체크
function selectAllRows() {
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
	

</script>
<script type="text/javascript">
function check(f) {
	
	if(f.word.value===''){
		alert('검색어를 입력해주세요');
		return false;
		
	}
	
	return true;
	
}
</script>
</head>
<body>
<header class="header">

<div align="center" id="dataTable">

	
	
		
<table border="1" style="width: 1200px; text-align: "center; >
<thead>
<tr>
<!-- <th><input type="checkbox" id="selectAll" onchange="selectAllRows()"></th>
 -->
 <th>번호</th>
<th>회원닉네임</th>
<!-- 필터링 -->
<th>
종류

<!-- <label for="categoryFilter1">종류</label>
<select id="categoryFilter1" onchange="applyCategoryFilters()">
<option value="">전체</option>
<option value="숙소">숙소</option>
<option value="투어,티켓">투어,티켓</option>
<option value="서비스 일반">서비스 일반</option>


</select> -->
</th>
<th>
문의유형
<%-- <label for="categoryFilter">문의유형 </label>
<select id="categoryFilter" onchange="applyCategoryFilters()">
	<option value="">전체</option>
	<c:forEach var ="cs" items="${csSubCateList}">
	<option value="${cs.cs_subcate_name }">${cs.cs_subcate_name }</option>
	
	</c:forEach>

</select> --%>
</th>
<th>제목</th>
<th>
상태
<!-- <label for id="statusValue">상태 </label>
<select id="stausValue" onchange="applyCategoryFilters()">
<option value="">전체</option>
<option value="미응답">미응답</option>
<option value="답변완료">답변완료</option>


</select> -->
</th>
<th>문의 일시</th>
<th>답변 일시</th>
</tr>
</thead>
<tbody style="text-align: center;">
<c:forEach var="iq" items="${iqList }">
<tr>
<td>${iq.inquiry_seq }</td>
<!-- <td><input type="checkbox" class="selectRow" name="selectRow" onchange="checkSelectAll()"></td>
 -->
 <td>${iq.m_nickname }</td>
<td>${iq.cs_cate_name }</td>
<td>${iq.cs_subcate_name }</td>
<td><a href="javascript:void(0);" onclick="openPopup('${cpath}/admin/cs/content?inquiry_seq=${iq.inquiry_seq }')" style="text-decoration: none; color: black;">${iq.title }</a></td>

<td>${iq.answer == 0 ? '미응답' : '답변완료'}</td>
<td>${iq.datetime}</td>
<td>${iq.do_answer_date}</td>
</tr>
</c:forEach>


</tbody>

</table>
<br>
<div align="right">
		<form action="${cpath }/admin/cs/inquiry" method="get" onsubmit="return search(this)">
			 <select name="type" id="type">
			 		<option value="">선택하세요</option>
					<option value="m_nickname"
						${param.type == 'm_nickname' ? 'selected' : '' }>회원닉네임</option>
					<option value="cs_cate_name"
						${param.type == 'cs_cate_name' ? 'selected' : '' }>종류</option>
					<option value="cs_subcate_name"
						${param.type == 'cs_subcate_name' ? 'selected' : '' }>문의유형</option>
					<option value="title"
						${param.type == 'title' ? 'selected' : '' }>제목</option>
					<option value="answer" 
						${param.type == 'answer' ? 'selected' : '' }>상태</option>
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
				href="${cpath }/admin/cs/inquiry?page=${paging.begin - 1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/admin/cs/inquiry?page=${i}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/admin/cs/inquiry?page=${paging.end + 1}">[다음]</a>
		</c:if>
	</div>
	</c:if>
	<c:if test="${param.type != null }">
	<div align="center">
		<c:if test="${paging.prev }">
			<a
				href="${cpath }/admin/cs/inquiry?page=${paging.begin - 1}&type=${param.type}&word=${param.word}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/admin/cs/inquiry?page=${i}&type=${param.type}&word=${param.word}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/admin/cs/inquiry?page=${paging.end + 1}&type=${param.type}&word=${param.word}">[다음]</a>
		</c:if>
	</div>
	</c:if>
    
	</div>
<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>

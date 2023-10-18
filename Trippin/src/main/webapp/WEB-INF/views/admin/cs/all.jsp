<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>

<script>


function openPopup(url) {
	window.open(url, 'popupWindow','width=800,height=600, scrollbars=yes')	
}
</script>
<script>
function selectAllRows() {
	  const checkboxes = document.getElementsByName("deleteRow");
	  const selectAllCheckbox = document.getElementById("selectAll");

	  for (let i = 0; i < checkboxes.length; i++) {
	    checkboxes[i].checked = selectAllCheckbox.checked;
	  }

	  const deleteButton = document.getElementById("deleteButton");
	  deleteButton.disabled = selectAllCheckbox.checked; // 전체 선택 여부에 따라 삭제 버튼 활성화/비활성화
	}

	function checkSelectAll() {
	  const checkboxes = document.getElementsByName("deleteRow");
	  const selectAllCheckbox = document.getElementById("selectAll");
	  let allChecked = true;

	  for (let i = 0; i < checkboxes.length; i++) {
	    if (!checkboxes[i].checked) {
	      allChecked = false;
	      break;
	    }
	  }

	  selectAllCheckbox.checked = allChecked;

	  const deleteButton = document.getElementById("deleteButton");
	  deleteButton.disabled = allChecked; // 전체 선택 여부에 따라 삭제 버튼 활성화/비활성화
	}

	
/* 	function applyCategoryFilter() {
		  const selectedCategory = document.getElementById("categoryFilter").value;
		  const dataTable = document.getElementById("dataTable");
		  const rows = dataTable.getElementsByTagName("tr");

		  for (let i = 1; i < rows.length; i++) {
		    const rowCategory = rows[i].getElementsByTagName("td")[2].innerText;
		    if (selectedCategory === "" || selectedCategory === rowCategory) {
		      rows[i].style.display = "table-row"; // 선택된 카테고리와 일치하면 보여주기
		    } else {
		      rows[i].style.display = "none"; // 일치하지 않으면 숨김 처리
		    }
		  }
		}
	 */
	function deleteSelectedRows() {
		  const checkboxes = document.getElementsByName("deleteRow");
		  const selectedRows = [];

		  for (let i = 0; i < checkboxes.length; i++) {
			
		    if (checkboxes[i].checked) {
		      selectedRows.push(parseInt(checkboxes[i].value));
		    }
		  }

		  if (selectedRows.length === 0) {
		    alert("체크박스를 선택해주세요");
		  } else {
		    // 폼 생성 및 설정
		    const deleteForm = document.createElement("form");
		    deleteForm.method = "post";
		    deleteForm.action = "${cpath}/admin/cs/delete";

		    // 선택된 값들을 파라미터로 추가
		    for (let i = 0; i < selectedRows.length; i++) {
		      const input = document.createElement("input");
		      input.type = "hidden";
		      input.name = "selectedRows";
		      input.value = selectedRows[i];
		      deleteForm.appendChild(input);
		    }

		    // 폼을 body에 추가하고 전송
		    document.body.appendChild(deleteForm);
		    deleteForm.submit();
		  }
		}
	
	//개별필터링
	/* function applyCategoryFilters(){
	var selectCate1 = document.getElementById("categoryFilter1").value;
	var selectCate2 = document.getElementById("categoryFilter").value;
	

	var dataTable = document.getElementById("dataTable");
	var rows = dataTable.getElementsByTagName("tr");
	
	for(let i =1; i<rows.length; i++){
		var rowCate1 = rows[i].getElementsByTagName("td")[2].innerText; 
		var rowCate2 = rows[i].getElementsByTagName("td")[3].innerText; 
	
		
		var showRow = true;
		
		//if로 각각 조건 걸어야 개별 필터링 가능
		
		if(selectCate1 !== "" && selectCate1 !== rowCate2){
			showRow = false;
			
		} if(selectCate2 !== "" && selectCate2 !== rowCate1){
			showRow = false;
		
	}
		
		if(showRow){
			rows[i].style.display ="table-row";
		}else{
			rows[i].style.display = "none";
		}
	}

}  */
	
	
</script>
</head>
<body>
	<header class="header">
		<!-- 검색창 -->
		
		
<div align="center" id="dataTable">



  <!-- 테이블  -->
  <table border="1" style="width: 1200px; text-align: center;">
    <thead>
      <tr>
        <th><input type="checkbox" id="selectAll" onchange="selectAllRows()"></th>
        <th>번호</th>
        <th>
        카테고리
      <%--   <!-- 필터링 옵션  -->
  <label for="categoryFilter">카테고리:</label>
  <select id="categoryFilter" onchange="applyCategoryFilters()">
    <option value="">전체</option>
   <c:forEach var="cc" items="${csCateList }"> 
    <option value="${cc.cs_cate_name}">${cc.cs_cate_name }</option>
    </c:forEach>

  </select> --%>
        </th>
          
        <th>
        유형
        <%-- <label for="categoryFilter1">유형:</label>
  		<select id="categoryFilter1" onchange="applyCategoryFilters()">
    <option value="">전체</option>
   <c:forEach var="css" items="${cstList }"> 
    <option value="${css.cs_subcate_name}">${css.cs_subcate_name }</option>
    </c:forEach>

  </select> --%>
  </th>
        <th>제목</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="c" items="${cstList }"> 
        <tr>
          <td><input type="checkbox" name="deleteRow" onchange="checkSelectAll()" value="${c.cs_seq }"></td>
          <td>${c.cs_seq }</td>
          
          <td>${c.cs_cate_name}</td>
          <td>${c.cs_subcate_name}</td>
          <td>
            <a href="javascript:void(0);" onclick="openPopup('${cpath }/member/cs/content/${c.cs_seq}')" style="color: black; text-decoration: none;">${c.title}</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <br>
  <div align="right">
  
		<form action="${cpath}/admin/cs/all" method="get" onsubmit="return search(this)">
		<select name="type" id="type">
			<option value="">선택하세요</option>
			<option value="cs_cate_name"
				${param.type =='cs_cate_name'? 'selected':''}>카테고리</option>
			<option value="cs_subcate_name"
				${param.type =='cs_subcate_name'? 'selected':''}>유형</option>
			<option value="title"
				${param.type =='title'? 'selected':''}>제목</option>
				 
		</select>
		<input type="text" name="word" placeholder="검색어를 입력하세요" value="${param.word }" autocomplete="off" id="word">
		<input type="submit" value="검색" >
			
		</form>
	</div>
		<br>
 
 <div style="display: flex; justify-content: flex-end; width:1200px; margin-top: 10px;">
     	<input type="button" value="삭제" onclick="deleteSelectedRows()" id="deleteButton">
      <input type="button" value="글 등록" onclick="location.href='${cpath}/admin/cs/insertForm'">
   </div>


  </div>
  <c:if test="${param.type==null }">
   <div align ="center">
		<c:if test="${paging.prev}">
			<a href="${cpath }/admin/cs/all?page=${paging.begin-1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin}" end="${paging.end}" step="1">
			<c:choose>
				<c:when test="${i==paging.page}">
					<strong>[${i}]</strong>
				</c:when>
				<c:otherwise>
					<a href="${cpath }/admin/cs/all?page=${i}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next}">
			<a href="${cpath }/admin/cs/all?page=${paging.end +1}">[다음]</a>
		</c:if>
	</div>
	</c:if>
	<c:if test="${param.type!=null }">
  <div align ="center">
		<c:if test="${paging.prev}">
			<a href="${cpath }/admin/cs/all?page=${paging.begin-1}&&word=${param.word}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin}" end="${paging.end}" step="1">
			<c:choose>
				<c:when test="${i==paging.page}">
					<strong>[${i}]</strong>
				</c:when>
				<c:otherwise>
					<a href="${cpath }/admin/cs/all?page=${i}&word=${param.word}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next}">
			<a href="${cpath }/admin/cs/all?page=${paging.end +1}&word=${param.word}">[다음]</a>
		</c:if>
	</div>
	</c:if>
<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>
	
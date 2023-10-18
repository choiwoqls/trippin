<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <script>
/* function applyCategoryFilters(){
	var selectCate1 = document.getElementById("categoryFilter1").value;
	var selectStatus = document.getElementById("stausValue").value;
	console.log(selectCate1);
	//console.log(selectStatus);

	var dataTable = document.getElementById("dataTable");
	var rows = dataTable.getElementsByTagName("tr");
	
	for(let i =1; i<rows.length; i++){
		var rowCate1 = rows[i].getElementsByTagName("td")[3].innerText;
		var rowStatus = rows[i].getElementsByTagName("td")[5].innerText; 
		
		var showRow = true;
		
		//if로 각각 조건 걸어야 개별 필터링 가능
		
		if(selectCate1 !== "" && selectCate1 !== rowCate1){
			showRow = false;
			
		}
		
	if(selectStatus !== "" && selectStatus !== rowStatus){
			showRow = false;
		}
		
		if(showRow){
			rows[i].style.display ="table-row";
		}else{
			rows[i].style.display = "none";
		}
	}
	
} */

function selectAllRows() {
    const checkboxes = document.querySelectorAll('.selectRow');
    const selectAllCheckbox = document.getElementById('selectAll');
    
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = selectAllCheckbox.checked;
    }
    
    var appBtn = document.getElementById("appBtn");
    var NonBtn = document.getElementById("NonBtn");
    
    appBtn.disabled=selectAllCheckbox.checked;
    NonBtn.disabled=selectAllCheckbox.checked;
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

function getSelectedCheckboxes() {
    const checkboxes = document.querySelectorAll('.selectRow');
    const selected = [];
    
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selected.push(checkboxes[i].value);
        }
    }
    
    return selected;
}



function openPopup() {
	
 	const selected = getSelectedCheckboxes();
 	const resultV = document.querySelector('input[name=result]:checked');
 	//const score = document.getElementById("score").value;
 	//console.log(resultV.value);
 	
 	if(resultV && selected.length >0){
 		
 		const result = resultV.value;
 		const url = '${pageContext.request.contextPath}/admin/mreport/memo?m_report_seq='+selected+'&result='+result;

 		
 		window.open(url,'popupWindow','width=500, height=200, scrollbars=yes' )
 	}else{
 		alert('라디오 버튼과 최소 하나의 체크박스를 선택해주세요');
 	}
 	

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
function popUp(url) {
	window.open(url,"_blank","width=800, height=600");
	
}
</script>   

<%@ include file="/WEB-INF/views/admin/layout/header.jsp"%>



<div align ="center" id="dataTable">

<table border="1" style="width: 1200px; text-align: "center; >
<thead>
<tr>
<th><input type="checkbox" id="selectAll" onchange="selectAllRows()" ></th>
<th>번호</th>
<th>회원닉네임</th>


<!-- 필터링 -->
<th>
신고사유
<%-- <label for="categoryFilter1">신고사유</label>
<select id="categoryFilter1" onchange="applyCategoryFilters()">
<option value="">전체</option>
<c:forEach var="mn" items="${mcnlist }">
<option value="${mn.m_report_cate_name }">${mn.m_report_cate_name }</option>
</c:forEach> --%>
</select>

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


</tr>
</thead>
<tbody style="text-align: center;">
<c:forEach var="ml" items="${mrlist}">
<input type="hidden" name="score" id="score" value="${ml.score}">
<tr>
<td><input type="checkbox" class="selectRow" name="selectRow" onchange="checkSelectAll()" value="${ml.m_report_seq }"></td>
<td >${ml.m_report_seq} </td>
<td><a href="javascript:void(0)" style="text-decoration: none; color: black;" onclick="popUp('${cpath}/admin/mreport/mcontent?m_report_seq=${ml.m_report_seq}&bad_seq=${ml.bad_seq}')"> ${ml.m_nickname }</a></td>
<td>${ml.m_report_cate_name }</td>
<td>${ml.email }</td>

<td>${ml.result == 0 ? '미승인' : (ml.result == 1 ? '승인' : '부적격')}</td>
<td>${ml.datetime}</td>
<td>${ml.resultdate }</td> 

</tr>
</c:forEach>
</tbody>

</table>

<table>
<br>
<div align="right">
		<form action="${cpath }/admin/report/mlist" method="get" onsubmit="return search(this)">
			 <select name="type" id="type">
			 		<option value="">선택하세요</option>
					<option value="m_nickname"
						${param.type == 'm_nickname' ? 'selected' : '' }>회원닉네임</option>
					<option value="m_report_cate_name"
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
	<c:if test="${param.type==null }">
	<div align="center">
		<c:if test="${paging.prev }">
			<a
				href="${cpath }/admin/report/mlist?page=${paging.begin - 1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/admin/report/mlist?page=${i}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/admin/report/mlist?page=${paging.end + 1}">[다음]</a>
		</c:if>
	</div>
	</c:if>
	<c:if test="${param.type!=null }">
	<div align="center">
		<c:if test="${paging.prev }">
			<a
				href="${cpath }/admin/report/mlist?page=${paging.begin - 1}&type=${param.type}&word=${param.word}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/admin/report/mlist?page=${i}&type=${param.type}&word=${param.word}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/admin/report/mlist?page=${paging.end + 1}&type=${param.type}&word=${param.word}">[다음]</a>
		</c:if>
	</div>
	</c:if>
</div>
<input type="radio" name="result" value="1" id="appBtn">승인
<input type="radio"name="result" value="2" id="NonBtn">부적격
<input type="button" value="확인" onclick="openPopup();">

</table>

</div>


<%@ include file="/WEB-INF/views/admin/layout/footer.jsp"%>

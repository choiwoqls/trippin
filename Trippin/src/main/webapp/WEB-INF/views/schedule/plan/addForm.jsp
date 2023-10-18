<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
			<script
			  src="https://code.jquery.com/jquery-3.7.0.js"
			  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			  crossorigin="anonymous">
			</script>

<meta charset="UTF-8">
<title>${msg }</title>
</head>
<script>
	function goNext(item) {
		console.log(item);
		const form = document.getElementById("addForm");		
		if(item == 'sub'){
			console.log("11");
			form.action+="schedule/plan/add";	
		}else{
			console.log("22");
			form.action+="schedule/plan/res";
		}
		form.submit();
	}
</script>


<body>
<div align="center">
	<form action="${pageContext.request.contextPath }/" id="addForm" method="post">
		<input id="bc" type="hidden" name="check" value="${check }">
		<input type="hidden" name="plan_seq" value="${vo.plan_seq }">
		<div>${msg }</div>
		<c:choose>
			<c:when test="${check }">
				<div><textarea id="data" name="data" rows="10" cols="50" maxlength="50">${vo.memo }</textarea></div>
			</c:when>
			<c:otherwise>
				<div><input id="data" type="time" name="data" value="${vo.time }"> </div>
			</c:otherwise>
		</c:choose>
		<div style="display: flex; margin-left: 40%;" align="center">
			<div><input type="button" value="입력" onclick="goNext('sub')"> </div>
			<div style="margin-left: 1%;"><input type="button" value="삭제하기" onclick="goNext('del')"></div>
		</div>
	</form>

</div>
</body>
</html>
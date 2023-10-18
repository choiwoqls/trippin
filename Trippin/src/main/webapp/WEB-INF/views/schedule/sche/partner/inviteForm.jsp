<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 초대장</title>
<script>
	function answer(item) {
		
		const form = document.getElementById("inviteForm");
		
		if(item == 'ok'){
			form.submit();
		}else{
			alert("이전 페이지로 돌아갑니다.");
			  history.back();
		}
	}

</script>
</head>
<body>
<div align="center">
	<div style="margin-top: 5%;'">
	(${sInfo.TITLE } ) 여행에 초대 받으셨습니다 <br>
	참여하시겠습니까 ? 
	<form action="${pageContext.request.contextPath }/schedule/sche/partner/addMPlan" method="post" id="inviteForm">
		<input type="hidden" name="s_seq" value="${sInfo.S_SEQ }">
		<input type="hidden" name="sender_seq" value="${sender_seq }">
		<div style="display: flex; margin-left: 45%; margin-top: 2%;" align="center">
			<div style="margin-right: 5%;"><input type="button" value="수락" onclick="answer('ok')"></div>
			<div><input type="button" value="거절" onclick="answer('no')"></div>
		</div>
	</form>
	</div>
</div>
</body>
</html>
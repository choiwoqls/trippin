<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<div class="title">
			이메일 계정 인증
		</div>
		<div class="m_email">
			${m_email }
		</div>
		<div class="explain">
			위의 계정으로 본인인증 이메일을 전송합니다.<br>
			이메일을 확인해 본인 인증을 완료해주세요.<br><br>
			
			본인이 아닐 경우, 비밀번호 변경 및 계정 유지가 어려울 수 있습니다.
		</div>
		<div class="send">
			<input type="button" value="인증 메일 전송" class="sendBtn" onclick="sendBtn()">
		</div>
	</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<form action="${pageContext.request.contextPath }/schedule/plan/addDMemo" method="get">
	<input type="hidden" name="s_seq" value="${s_seq }">
	<input type="hidden" name="day_no" value="${day_no}">
	<div>
		<textarea id="memo" name="memo" rows="10" cols="50" maxlength="50" required="required"></textarea>
	</div>
	<div><input type="button" value="입력" onclick="submit()"> </div>
	</form>
</div>
</body>
</html>
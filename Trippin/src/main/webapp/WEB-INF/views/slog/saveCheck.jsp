<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> - - -</title>

</head>
<body>
		<input type="hidden" name="loginCheck" id="loginCheck" value="${loginCheck }">
	<form action="${pageContext.request.contextPath }/" method="post" id="scForm">
		<input type="hidden" name="slog_seq" id="slog_seq" value="${slog_seq }">		
		<input type="hidden" name="m_seq" id="m_seq" value="${m_seq }">		
		<input type="hidden" name="saveCheck" id="saveCheck" value="${saveCheck }">
		<input type="hidden" name="s_seq" id="s_seq" value="${s_seq }">
		<input type="hidden" name="slogCheck" id="slogCheck" value="${slogCheck }">		
	</form>
</body>
<script>

	const form = document.getElementById("scForm");

	const lgck = document.getElementById("loginCheck").value;
	const slck = document.getElementById("slogCheck").value
	const svck = document.getElementById("saveCheck").value;
	
	console.log(typeof(lgck));
	console.log(svck);
	
	if(lgck=="true"){ //로그인 완료
		form.action += "slog/saveSlog";
		if(slck=="true"){ //데이터가 있을때
			if(svck=="true"){ //게시된 데이터가 아닐 때
				if(!window.confirm("이미 작성중인 여행기가 있습니다 불러오시겠습니까?")){
					history.back();					
				}
			}else{
				if(!window.confirm("이미 해당 일정의 여행기를 작성했습니다. 여행기를 수정하시겠습니까?")){
					history.back();										
				}
			}
		}
	}else{
		alert("로그인 하세요");
		form.method = "get";
		form.submit();
	}
	
form.submit();
</script>
</html>
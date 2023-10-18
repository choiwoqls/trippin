<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<title>Insert title here</title>
</head>
<body>
	<div class="box">
		<form method="post">
		<input type="hidden" name="m_seq" value="${m_seq }">
			<div class="top">
				<div class="title">
					비밀번호 재설정
				</div>
				<hr>
				<div class="content">
					내 현재 계정은 ${m_email }입니다.<br>
					아래의 새로운 비밀번호로 변경합니다.
				</div>
				<div class="inputPw">
					<input type="password" class="pw" name="m_pw" placeholder="새로운 비밀번호 입력">
				</div>
				<div class="explain">
					영문 대소문자, 숫자, 특수문자 포함 8자리 이상 입력해주세요.
				</div>
				<div class="send_area">
					<input type="button" value="변경" class="sendBtn" onclick="send(this.form)">
				</div>
			</div>
		</form>
	</div>


<script type="text/javascript">
	function send(f){
		var m_pw = f.m_pw.value;
		
		const pwrg = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
		
		if(m_pw == ''){
			alert("비밀번호를 입력해주세요.");
			f.m_pw.focus();
			return;
		}else if(!pwrg.test(m_pw)){
			alert("비밀번호는 특수문자 포함 영문자 8~20글자로 이루어져야 합니다.\n특수문자는 !, @, #, $, %, ^, &, * 만 사용 가능합니다.");
			f.m_pw.focus();
			return;
		}else{
			f.action = "${cpath}/member/editProfile/updatePw";
			f.submit();
		}
	}
	
</script>
</body>
</html>
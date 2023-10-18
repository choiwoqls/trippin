<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script
	src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous">
</script>
<title>Insert title here</title>
<style>
	.content {
		padding: 3%;
		background-color: #F2F2F2;
	}
	.title {
		font-size : 20px;
		font-weight : bold;
		padding-bottom : 3%;
	}
	.email {
		font-weight : bold;
		font-size : 16px;
		padding-bottom : 3%;
	}
	.explain {
		font-size : 15px;
		color: rgba(58, 58, 58, 0.8);
		padding-bottom : 3%;
	}
	.send_area {
		
	}
	.send_area input {
		font-weight: bold;
	    background-color: rgb(54, 143, 255);
	    border: 0;
	    color: white;
	    width: 20%;
	    padding-top: 1.5%;
	    padding-bottom: 1.5%;
	    border-radius: 5px;
	    cursor: pointer;
	    font-size : 16px;
	}
</style>
</head>
<body>
	<div class="box">
		<div class="content">
			<div class="title">
				비밀번호 재설정
			</div>
			<div class="email" id="m_email">
				${m_email }
			</div>
			<div class="explain">
				위의 계정으로 비밀번호를 재설정할 수 있는 메일을 보냅니다.
			</div>
			<div class="send_area">
				<input type='button' value="이메일 전송" class="sendBtn" onclick="send()">
			</div>
			<input type="hidden" name="m_seq" id="m_seq" value="${m_seq }">
		</div>
	</div>
	
	<script type="text/javascript">
		function send(){
			var m_email = document.getElementById("m_email").innerText;
			var m_seq = document.getElementById("m_seq").value;
			
			$.ajax({
				type: "POST",
				url: '${pageContext.request.contextPath}/member/editProfile/sendEmail',
				data: {m_email: m_email, m_seq: m_seq},
				success: function show(data){
					if(data === 'hi'){
						alert("이메일을 전송하였습니다.");
						window.close();
					}
				}
			});
		}
	</script>
</body>
</html>
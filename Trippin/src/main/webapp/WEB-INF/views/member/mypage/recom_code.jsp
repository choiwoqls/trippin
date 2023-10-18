<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script
	src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous">
</script>
<%@ include file="/WEB-INF/views/member/mypage/layout/header.jsp"%>

	<div class="box">
		<div class="title">
			초대코드 입력
		</div>
		<div class="subtitle">
			친구에게 받은 초대코드를 입력해주세요.
		</div>
		<form method="post">
			<input type="hidden" name="m_seq" value="${mvo.m_seq }">
			<div class="input_area">
				<input type="text" class="inputCode" name="recom_code" placeholder="초대코드 입력">
			</div>
			<div class="save_area">
				<input type="button" class="saveBtn" value="코드 입력" onclick="save(this.form)">
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		function save(f){
			var recom_code = f.recom_code.value;
			var m_seq = f.m_seq.value;
						console.log("1: "+recom_code);
			
			if(recom_code == ''){
				alert("추천코드를 입력해주세요.");
				return;
			}else{
				f.action = "${cpath}/member/mypage/inputCode";
				f.submit();
			}
			
			/* $.ajax({
				type: 'post',
				url: '${cpath}/member/mypage/checkCode?m_code=' + recom_code,
				success: function(data){
					if(data == 'none'){
						alert("입력하신 추천코드가 존재하지 않습니다.");
						return;
					}else{
						console.log("2: "+recom_code);
						f.action = "${cpath}/member/mypage/inputCode";
						f.submit();
					}
				}
			}); */
			
		}
	</script>

<%@ include file="/WEB-INF/views/member/mypage/layout/footer.jsp"%>
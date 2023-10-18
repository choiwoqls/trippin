<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${su!=0 }">
		<script type="text/javascript">
			alert("${msg}이(가) 완료되었습니다.")
			history.go(-2);
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("${msg}에 실패하였습니다.");
			history.back();
		</script>
	</c:otherwise>
</c:choose>
    
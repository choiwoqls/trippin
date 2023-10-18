<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<title>reservation room</title>
  
</head>
<body>
	<form action="${cpath }/member/accom/insert" method="post">
		<input type="hidden" id="m_seq" name="m_seq" value="${m_seq }">
		

		${rv_seq }
	<div>
		${rvlist.NAME }<br>
		
	</div>
	<div>
		${rvlist.ADDR1_NAME }
		<br>
	</div>
	<div>
		체크인 : <span>${rvlist.CHECKIN }</span> / <span>${startDate}</span><br>
	</div>
	<div>
		${fn:replace(duration, 'days', '일')}<br>
	</div>
	<div>
		체크아웃 : <span>${rvlist.CHECKOUT }</span> / <span>${endDate}</span><br>
	</div>
	<br>
<br>
<div>
${rvlist.ROOM_NAME}<br>
</div>
<div>
투숙인원 : 성인 <span>${result}</span>인
</div>
<div>
 , 아동 <span>${totalCount}</span>인
 (<span>${selectedButtons}</span>)
</div>
<br>
<div>
요금 기준인원 : 성인<span>${rvlist.MAXPEOPLE }</span>인<br>
</div>
<p><b>예약자 정보</b></p>
한글명 : <input type="text" id="name" placeholder="실명, 한글로 입력" name="reservation_name" value="${rvmember.m_name }"><br>
휴대전화번호 : <input type="text" id="tel" placeholder="-빼고 숫자만입력" name="reservation_tel" value="${rvmember.m_tel }"><br>
이메일 : <input type="text" id="mail" placeholder="ID@trippin.com" name="reservation_mail" value="${rvmember.m_email }"><br>

<p><b>투숙자 정보</b></p>
<p>대표 투숙자</p>
성 : <input type="text" id="lastName" placeholder="홍" name="stay_last_name" value="${rvlist.STAY_LAST_NAME }"> / 
이름 : <input type="text" id="firstName" placeholder="길동" name="stay_first_name"value="${rvlist.STAY_FIRST_NAME }"><br>
생년월일 : <input type="text" id="birth" placeholder="YYYYMMDD" name="stay_birth" value="${rvlist.STAY_BIRTH}"> / 
성별 : <input type="radio" id="sex" name="stay_sex" value="0" checked>남자
	  <input type="radio" id="sex" name="stay_sex" value="1" checked>여자<br>
<p><b>교통편 정보</b></p>
숙소 이동 방법 : 
<select id="traffic">
    <option value="대중교통">대중교통 및 도보 이동</option>
    <option value="자가">자가용 이동</option>
</select>
<div>
총 결제금액 : <span>${rvlist.ROOM_PRICE }</span>원<br>
</div>


<input type="submit" value="예약하기">
</form>



</body>
</html>
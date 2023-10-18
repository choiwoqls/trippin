<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리핀</title>
<style>
.test-input {
	border: 0;
    border-radius: 15px;
    font-weight: bold;
    cursor: pointer;
    padding-left: 4%;
    padding-right: 4%;
    padding-top: 1%;
    padding-bottom: 1%;
    position: absolute;
    bottom: 1vh;
    right: 2.5vw;
}
.all-section {
	position : relative;
	width : 50%;
		}
.good-btn {
	border : 0;
	cursor : pointer;
	border-radius : 20px;
	padding : 1%;
	padding-left : 2%;
	padding-right : 2%;
	font-weight : bold;
	background-size: 400% 400% !important;
  		animation: gradient1 5s ease infinite;
	background: linear-gradient(
		        45deg,
		        #ff0000,
		        #ff7300,
		        #fffb00,
		        #48ff00,
		        #00ffd5,
		        #002bff,
		        #7a00ff,
		        #ff00c8,
		        #ff0000
		    );
background: linear-gradient( 45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000 );
	  color : white;
}
.good-btn2 {
	background-image: url("https://cdn.xelf.io/resources/image/20191208/20191208094528217881320965.png") !important;
   	
    border: 0;
    cursor: pointer;
    border-radius: 20px;
    padding: 1%;
    padding-left: 2%;
    padding-right: 2%;
    font-weight: bold;
    background-size: 60px 50px !important;
    background-repeat: no-repeat !important;
    animation: gradient1 3s ease infinite;
    background: linear-gradient( 45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000 );
    background: linear-gradient( 45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000 );
    color: white;
}
@keyframes gradient1 {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

@keyframes gradient2 {
    0% {
        background-position: 100% 50%;
    }
    50% {
        background-position: 0% 50%;
    }
    100% {
        background-position: 100% 50%;
    }
}
.btn-section {
	text-align: right;
    padding-right: 4%;
}
.oneTK{
	width: 100%;
}
.price_area{
	font-weight: bold;
}
</style>
	</head>
		<body style=" margin-left : 20%; margin-right : 20%; ">
			<div  class="btn-section">
				<span style="align:right">
					<input  class="good-btn2" type="button" value="새로운 장소 등록하기" onclick="document.location.href='${cpath}/member/newplace/searchAddr'">
					<input  class="good-btn" type="button" value="메인페이지" onclick="document.location.href='${cpath}/'">
				</span>
			</div>
			<div align="center" style="display : flex; flex-wrap : wrap; width : 100%;">
				<c:forEach var="l" items="${tkList }" varStatus="i">
					<div class="oneTK">
						<div class="all-section">
							<table border="0" cellspacing="5px" style= " height:70px; border-bottom : 1px solid #EBEBEB; margin-right : 6%; cursor: pointer;" onclick="document.location.href='${cpath}/member/ticket/selectTK?ticket_seq=${l.TICKET_SEQ }'">
								<tr width="400px">
									<th rowspan="4" valign="top" width="8%" style="color : blue;">${i.count }</th>
									<td width="63%"><b>${l.TICKET_NAME }</b></td>
									<td rowspan="4" valign="top" width="29%" height="70px">
										<img src="${cpath}/common/getImg?path=${l.TICKET_IMG }&file=${l.FILE }" style="width:130px; height : 130px;"/>
									</td>
								</tr>
								<tr>
									<td>${l.TICKET_INTRO }</td>
								</tr>
								<tr>
									<td><font color="red">♥</font>${l.JJ }</td>
								</tr>
								<tr>
									<td style="color : #BABABA; width : 100%;">
										<span style="width : 60%; display : inline-block;">${l.T_PARTNER_NAME }·${l.ADDR2_NAME }</span>
									</td>
								</tr>
							</table>
						</div>
						<div class="price_area">
							<fmt:formatNumber value="${l.MIN_PRICE }" pattern="#,##0" />원
						</div>
					</div>
				</c:forEach>
			</div>
	
			<c:if test="${tkList !=null}">
				<div align="center" class="paging">
					<c:if test="${paging.prev }">
						<a href="${cpath }${url }&page=${paging.begin - 1}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${paging.begin }" end="${paging.end }" step="1">
						<c:choose>
							<c:when test="${i == paging.page }">
								<strong>[${i}]</strong>
							</c:when>
							<c:otherwise>
								<a href="${cpath }${url }&page=${i}" style="width:20.37px;">[${i}]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.next }">
						<a href="${cpath }${url }&page=${paging.end + 1}">[다음]</a>
					</c:if>
				</div>
			</c:if>
		</body>
	</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.math.BigDecimal" %>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script src="${cpath}/resources/js/httpRequest.js"></script>

<link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
	.main {
		
		padding-left : 3%;
		padding-right : 3%;
	}
	.main-title {
		border-bottom : 3px solid #E8EAED;
		font-weight : bold;
		font-size : 20px;
		padding-top : 3%;
		padding-bottom : 3%;
	}
	.red-dot {
		color : red;
	}
	.main-info {
		color : silver;
		
	}
	#coupon_0 {
		margin-top : 3%;
		
		border-bottom : 3px solid #E8EAED;
		padding-top : 3%;
		padding-bottom : 3%;
		font-size : 18px;
		font-weight : bold;
	}
	.coupon-list {
		border-bottom : 3px solid #E8EAED;
		padding-top : 3%;
		padding-bottom : 3%;
	}
	.coupon-name {
		font-size : 18px;
		font-weight : bold;
	}
	.detail {
		font-size : 16px;
		color : rgba(58, 58, 58, 0.4);
		font-weight : bold;
	}
	.date {
		color : gray;
	}
	.blue-pay,.won {
		color : #2987F0;
		font-weight : bold;
		font-size : 20px;
	}
	.price-flex {
		display : flex;
	}
</style>
</head>
<body>
	<div class="main">
		<div class="main-title"><span>사용 가능한 쿠폰</span></div>
		<div><span class="main-info"><span class="red-dot">*</span> 더블클릭 시 해당 쿠폰이 적용됩니다.</span></div>
		<div>
			<c:if test="${clist != null }">
				<div id="coupon_0">
					<span>쿠폰 선택하지 않음</span>
				</div>
				<c:forEach var="c" items="${clist }" varStatus="i">
					<div class="coupon-list" id="coupon_${c.COUPON_SEQ }${c.TABLE_TYPE}">
						<span class="coupon-name">${c.NAME }</span>
						<div>
							<c:if test="${c.TYPE==1}">
								<span class="detail">${c.MAX_MIN/10000 }만원 이상 예약 시 사용 가능</span>	
							</c:if>
							<c:if test="${c.TYPE!=1}">
								${c.AMOUNT }% 할인(최대 <fmt:formatNumber value="${c.MAX_MIN}" pattern="#,##0" />원 할인)
							</c:if>
						</div>
						<div class="date">${c.VALID_DATE }까지 사용 가능</div>
							<div class="price-flex">
								<div>
									<span class="blue-pay" id="price_${c.COUPON_SEQ }${c.TABLE_TYPE}">
										<c:if test="${c.TYPE==1 }">
											${c.AMOUNT}
										</c:if>
										<c:if test="${c.TYPE!=1 }">
											${c.AMOUNT * tot / 100 <= c.MAX_MIN ? c.AMOUNT*tot/100  : c.MAX_MIN }
										</c:if>
										
									</span>
								</div>
								<div class="won">
									원	
								</div>
							</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<script>
    $(document).ready(function() {
		roundPrice();
    	
        $("div[id^='coupon_']").on("dblclick", function() {
            //더블 클릭된 요소의 id 값 가져와서 coupon_seq에 저장
            var coupon_seq = $(this).attr("id");
            var discount = 0;
            if(coupon_seq != "coupon_0"){
	        	var priceText = $(this).find("span[id^='price_']").text();
	        	discount = parseFloat(priceText.replace(/[^0-9.-]+/g,""));
            }
            
           	window.opener.setValuesAndClose(coupon_seq, discount);
            window.close();
        });
    });
    
    function roundPrice(){
    	var prices = document.querySelectorAll("span[id^='price_']");
    	for(var i=0; i<prices.length; i++){
    		// 반올림 처리
    		prices[i].innerText = (Math.round(parseInt(prices[i].innerText) / 10) * 10).toLocaleString();
    	}
    }
    

</script>
</body>
</html>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.title{
	    font-size: 22px;
	    font-weight: bold;
	    border-bottom: 2px solid;
	    text-align: center;
	    padding-bottom: 2%;
	}
	.box{
		margin-top: 3%;
	}
	.coupon{
	 	display: flex;
	 	align-items: center;
	}
	.name{
	    font-size: 18px;
    	font-weight: bold;
	}
	.down{
	
	}
	.downtext{
		color: #9C9B99;
		font-size: 13px;
    	text-align: -webkit-center;
	}
	.valid{
	
	}
	.validtext{
		color: #9C9B99;
		font-size: 13px;
    	text-align: -webkit-center;
	}
	.status{
	
	}
</style>
</head>
<header>
	<div class="title">
		나의 쿠폰
	</div>
</header>
<body>
	<div class="box">
		<c:forEach var="c" items="${myCoupon }">
			<div class="coupon">
				<div class="name">
					${c.NAME }
				</div>
				<div class="down">
					<div class="downtext">
						발급 날짜
					</div>
					<div class="downinfo">
						${c.DOWNDATE }
					</div>
				</div>
				<div class="valid">
					<div class="validtext">
						유효 기간
					</div>
					<div class="validinfo">
						${c.VALID_DATE }
					</div>
				</div>
				<div class="status">
					${c.msg }
				</div>
			</div>
		</c:forEach>
	</div>
	
	
	
</body>
</html>
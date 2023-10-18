<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lzc8p76rjy&submodules=geocoder"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<meta charset="utf-8">
<script src="${cpath}/resources/js/httpRequest.js"></script>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap"
	rel="stylesheet">
	
<style>
html,body,div,span,object,iframe,h1,h2,h3,h4,h5,h6,p,
blockquote,pre,abbr,address,cite,code,del,dfn,em,img,
ins,kbd,q,samp,small,strong,sub,sup,var,b,i,dl,dt,dd,ol,ul,li,
fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,
article,aside,canvas,details,figcaption,figure,footer,header,hgroup,
menu,nav,section,summary,time,mark,audio,video,fieldset {margin:0; padding:0; }


ol,ul{list-style:none}
li { list-style-type:none; }
table{border-collapse:collapse;border-spacing:0;}
img{max-width:100%;height:auto;}
mark{background:none}
select{max-width:100%;}
caption, legend {display:none;}
hr{display:none;}
h1,h2,h3,h4,h5,h6 { font-size:100%; }
address,strong{font-style:normal; font-weight:normal;}
table {border-collapse:collapse; }
input, select{outline: none;font-family:inherit}

body {
    height : auto;
    overflow-x: hidden;
}
.header {
    height: 50vh;
}
.hd-in {
    height : 9vh;
    padding-top : 0.5%;
}
.hd-left {
    font-weight: bold;
    color: #929292;
    font-size: 13px;
    padding-left: 2%;
}
.hd-left a {
    color: #929292;
    text-decoration: none;
}
.title {
    
    padding-top : 3%;
}
.mtitle {
    font-weight: bold;
    font-size: 35px;
    text-align: center;
    padding-top: 1%;
}
.stitle {
    font-weight: bold;
    color: #9B9D9B;
    text-align: center;
    padding-top: 2%;
}
.stitle-logo {
    font-family: 'Jua', sans-serif;
    color: #50E3C2;
    font-size: 25px;
}
.main {
    width : 100%;
}
.main-detail {
    width: 50%;
    margin: 0 auto;
    border-top: 2px solid;
    margin-bottom: 10%;
    border-bottom: 2px solid;
}
.mi-one {
    display : flex;
    height: auto;
    line-height: 10vh;
    border-bottom : 1px solid #E8E8E8;
}
.mi-name {
    width : 30%;
    padding-left : 2%;
    font-weight: bold;
 	font-size: 17px;
	margin-left: 10%;
}
.input-one{
    width : 80%;
    margin-left: 6%;
}
.foot {
	padding-top: 5%;
    padding-bottom: 2%;
    text-align: center;
    margin-bottom: 10%;
}
.fts-one {
    padding-top : 1%;
    padding-bottom : 1%;
    padding-left : 2%;
    padding-right : 2%;
    background-color: white;
    box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
    border : 2px solid rgb(77,77,77);
    cursor: pointer;
    border-radius: 10px;
    font-weight: bold;
}
.fts-one:hover {
    color : white;
    background-color: rgb(77,77,77);
}
.btn{
    width: 50%;
    margin: 0 auto;
    padding-bottom: 1%;
    text-align: right;
    justify-content: space-between;
    display: flex;
}
.btn input{
	padding-top: 1%;
    padding-bottom: 1%;
    padding-left: 2%;
    padding-right: 2%;
    background-color: white;
    box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
    border: 2px solid rgb(77,77,77);
    cursor: pointer;
    border-radius: 10px;
    font-weight: bold;
}
.btn-right{
	display: flex;
    gap: 2%;
    width: 50%;
    justify-content: flex-end;
}
.btn-right input{
	width: 20%;
}
input:hover{
	background-color:#50E3C2;
	border-color:#50E3C2;
}
</style>

</head>
<body style="overflow-x: hidden">
	<header class="header">
		<div class="inner">
			<div class="hd-in">
				<div class="hd-left">
					<img
						src="https://business.yanolja.com/common/kr/web/img/icon-home.png"
						onclick="document.location.href='${cpath}/admin/main'"> > 관리자 > 혜택관리 
						> <a href="${cpath }/admin/benefit/couponList">쿠폰관리</a> 
						> <a href="${cpath }/admin/benefit/couponIn">${param.type==0?'기본':'등급'}쿠폰상세</a>
				</div>
			</div>
		</div>
		<div class="title">
			<div class="mtitle">${param.type==0?'기본 ':'등급 '}쿠폰 상세</div>
			<div class="stitle">
				나를 아는 여행앱 &nbsp;
				<span class="stitle-logo">Trippin'</span>
			</div>
		</div>
		
	</header>
	<div class="main">
		<div class="btn">
			<input type="button" value="목록보기" onclick="history.back()"> 
			<div class="btn-right">
				<c:if test="${vo.status == 2}">
					<input type="button" value="재발급" onclick="reInsert()">
				</c:if>
				<c:if test="${vo.status == 0 }">
					<input type="button" value="중단하기" onclick="changeStatus(1)">
					<input type="button" value="종료하기" onclick="changeStatus(2)">
				</c:if>
				<c:if test="${vo.status == 1 }">
					<input type="button" value="중단해제" onclick="changeStatus(0)">
					<input type="button" value="종료하기" onclick="changeStatus(2)">
				</c:if>
			</div>
		</div>
		<div class="main-detail">
			<div class="mi-one">
				<div class="mi-name">쿠폰명</div>
				<div class="input-one">
					${vo.name }
				</div>
			</div>
			<div class="mi-one">
				<div class="mi-name">상세</div>
				<div class="input-one">
					${vo.use == 1 ? '국내 숙소 ' : '티켓, 투어 ' }
					<c:if test="${vo.type==0 }">
						${vo.amount }% 할인
						(최대 <fmt:formatNumber value="${vo.max_min%10000!=0 ? vo.max_min :vo.max_min/10000 }" pattern="#,##0"/>${vo.max_min%10000!=0?'원':'만원' })
					</c:if>
					<c:if test="${vo.type==1 }">
						<fmt:formatNumber value="${vo.max_min%10000!=0 ? vo.max_min :vo.max_min/10000 }" pattern="#,##0"/>${vo.max_min%10000!=0 ? '원':'만원' } 이상 예약 시
					</c:if>
				</div>
			</div>
			<c:if test="${param.type==0 }">
				<div class="mi-one">
					<div class="mi-name">쿠폰 유형</div>
					<div class="input-one">
						${vo.kind == 0 ? '웰컴 ' : vo.kind==1 ? '월 혜택 ' : '특별 '} 쿠폰
					</div>
				</div>
			</c:if>	
			<div class="mi-one">
				<div class="mi-name">혜택 기간</div>
				<div class="input-one">
					<c:if test="${param.type==0 }">
						<c:if test="${vo.kind==1 }">
							${vo.valid_date }월 한정
						</c:if>
						<c:if test="${vo.kind != 1 }">
							발급일로부터 ${vo.valid_date }일 이내
						</c:if>
					</c:if>
					<c:if test="${param.type==1 }">
						발급일로부터 ${vo.valid_date }일 이내
					</c:if>
				</div>
			</div>
			<div class="mi-one">
				<div class="mi-name">발급 상태</div>
				<div class="input-one">
					${vo.status==0?'발급중':vo.status==1?'중단':'종료' }
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function reInsert(){
			var confirmation = confirm("재발급은 기본정보만 적용되며, 수정 가능합니다.\r\n발급하시겠습니까?");
			if(confirmation){
				location.href="${cpath}/admin/benefit/reInsert?seq=${param.type==1? vo.l_coupon_seq:vo.coupon_seq}&type=${param.type}";
			}else{
				return;
			}
		}
		
		function checkDeleteOk(){
			var confirmation = confirm("게시물을 삭제하시겠습니까?\r\n*관련된 정보 모두 삭제가 진행됩니다.")
			if (confirmation){
				location.href="${pageContext.request.contextPath }/admin/common/delete?f_seq=${h.F_SEQ}";
			}else{
				return;
			}
		}
	
		function changeStatus(num){
			if(num==2){
				var confirmation = confirm("종료 후에는 재발급만 가능합니다.\r\n쿠폰을 종료하시겠습니까?");
			}else{
				var confirmation = confirm("상태를 변경하시겠습니까?");
			}
			
			if(confirmation){
				var type = ${param.type};
				var seq = ${vo.coupon_seq};
			
				if(type==1){
					seq = ${vo.l_coupon_seq};
				}
			
				$.ajax({
					url : "${cpath}/admin/benefit/changeStatus",
					type : "post",
					data : JSON.stringify({num:num, seq:seq, type:type}),
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					success : function(data){
						if(data == true){
							alert("처리가 완료되었습니다.");
							document.location.reload();
						}else{
							alert("처리에 실패했습니다.\r\n다시 시도하세요.");
						}
					}
				});
			}
		}
	</script>
</body>
</html>

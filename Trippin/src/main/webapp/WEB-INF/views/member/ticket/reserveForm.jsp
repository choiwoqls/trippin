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
<link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

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
    background-color: #F2F2F2;
    height: auto;
}
.header {
    margin-left : 30%;
    margin-right : 30%;
    background-color: white;
    height: 10vh;
    border-bottom : 1px solid #F2F2F2;
}
.main {
    margin-left : 30%;
    margin-right : 30%;
    background-color: white;
    font-family: Arial, Helvetica, sans-serif;
}
.hd-in {
    height: 9vh;
    padding-left : 10%;
    padding-top : 2%;
}
.hd-in a {
    text-decoration: none;
    cursor: pointer;
}
.hd-in a img {
    width : 25px;
    margin-top : 2%;
}
.hd-in span {
    position: relative;
    bottom : 0.7vh;
    left : 3vw;
    font-size : 21px;
    font-weight: 550;
}
.top-info {
    padding-top : 3%;
    padding-bottom : 4%;
    border-bottom : 1px solid rgb(239, 239, 239);
    margin-left : 2%;
    margin-right : 2%;
}
.top-title {
    font-weight: bold;
    font-size : 22px;
    padding-bottom : 3%;
}
.top-date {
    display : flex;
    justify-content: space-between;
    font-weight: bold;
    
}
.td-first {
    color : #4285F4;
    font-size : 12px;
    line-height: 3.5vh;
}
.color-date {
    margin-top : 2%;
    padding-left : 3%;
    padding-right : 3%;
    padding-top : 3%;
    padding-bottom : 3%;
    background-color: #DBE8FD;
    color : #4285F4;
    font-weight: bold;
    font-size : 14px;
}
.top-count {
    padding-top : 3%;
    padding-left : 2%;
    padding-right : 2%;
}
.top-stitle {
    font-weight : bold;
    padding-bottom : 3%;
}
.top-c {
    display: flex;
    justify-content: space-between;
    font-size: 14px;
    padding-bottom : 3%;
}
.tc-name {
    color : rgba(58, 58, 58, 0.4);
    font-weight: bold;
}
.tc-info {
    color : #897E7F;
    font-weight: bold;
}
.m-header {
    padding-bottom : 2%;
    border-bottom : 10px solid rgb(239, 239, 239);
}
.detail-1 {
    padding-top : 3%;
    padding-left : 2%;
    padding-right : 2%;
}
.detail-title {
    font-weight: bold;
    font-size : 18px;
    padding-bottom : 3%;
}
.di-1 span {
    font-size : 12px;
    font-weight: bold;
    padding-bottom: 1%;
}
.detail-input {
    padding-bottom : 2%;
}
.di-input input{
    border : 1px solid rgb(239, 239, 239);
    border-radius: 4px;
    width : 96%;
    height : 4.5vh;
    padding-left : 3%;
    font-weight: bold;
}
.di-1 input:focus{
    border-color: #4285F4;
}
.di-1:focus-within {
    color: #4285F4;
}
.tci-div {
    padding-bottom : 2%;
}
.d1-foot {
    font-size : 12px;
    font-weight: bold;
    color: #CDCDCD;
}
.detail {
    border-bottom : 10px solid rgb(239, 239, 239);
}
.total {
    margin-top : 3%;
    border-top : 1px solid rgb(239, 239, 239);
    padding-bottom : 5%;
    border-bottom : 10px solid rgb(239, 239, 239);
}
.total-1, .total-2 {
    padding-left : 2%;
    padding-right : 2%;
    padding-top : 3%;
    display: flex;
    justify-content: space-between;
    font-weight: bold;
}
.total-2 {
    font-size : 14px;
}
.tot2-name {
    color :#897E7F;
}
.tot2-text {
    color :#4285F4;
}
.fast-img {
    width : 16px;
    height: 16px;
    cursor: pointer;
    position: relative;
    top : 0.35vh;
}
.text-img img {
    width : 10px;
    height : 10px;
    position: absolute;
    top : 16px;
    right : 17px;
    cursor: pointer;
}
.sel-text {
    width : 9vw;
    background-color: white;
    border: 1px solid rgba(239,239,239,1);
    box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 15px;
    border-radius: 8px;
    color: rgba(58, 58, 58, 0.8);
    font-weight: 500;
    padding: 15px 37px 15px 15px;
    font-size : 12px;
    position: relative;
    left : 74%;
    bottom : 1.2vh;
    display: none;
}
.sel-textz {
    width : 13vw;
    background-color: white;
    border: 1px solid rgba(239,239,239,1);
    box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 15px;
    border-radius: 8px;
    color: rgba(58, 58, 58, 0.8);
    font-weight: 500;
    padding: 15px 37px 15px 15px;
    font-size : 12px;
    position: relative;
    left : 2%;
    bottom : 0.5vh;
    display: block;
    word-break:break-all;
}
.payment {
    padding-top : 3%;
    padding-left : 2%;
    padding-right : 2%;
}
.pm-1 {
    font-weight: bold;
    font-size : 20px;
    padding-bottom : 3%;
}
.pm-2 {
    display : flex;
    justify-content: space-between;
    font-weight: bold;
    color :#897E7F;
    font-size : 15px;
}
.pm-3 {
    display: flex;
    justify-content: space-between;
    
    margin-top : 5%;
}
.pm3-name {
    line-height: 3.3vh;
    font-weight: bold;
    color :#897E7F;
    display: flex;
    flex-direction: column;
}
.pm3-text {
    width : 60%;
    text-align: right;
}
.pm3-text input {
    border : 1px solid #F2F2F2;
    width : 70%;
    padding : 5%;
    height : 0.5vh;
}
.pm-4 {
    display: flex;
    justify-content: space-between;
    
    margin-top : 2%;
}
.pm4-name {
    line-height: 5.5vh;
    font-weight: bold;
    color :#897E7F;
}
.pm4-text {
    width : 60%;
    text-align: right;
}
.pm4-img {
    width : 24px;
    position : relative;
    bottom : 0.6vh;
    cursor: pointer;
}
.pm4-text input {
    border : 1px solid #F2F2F2;
    width : 70%;
    padding : 5%;
    height : 0.5vh;
}
.sel-check, .sel-check1 {
    appearance: none;
    width : 22px;
    height : 22px;
    margin: 3px 8px 3px 4px;
    border-radius: 25px;
    position : relative;
    top : 25%;
    cursor: pointer;
    border : 1px solid rgba(58,58,58,0.2);
}
.sel-check:checked, .sel-check1:checked {
    background-color: #2987F0;
    border: none;
}
.sel-check::after, .sel-check1::after {
    content: "";
    display : block;
    width : 100%;
    height : 100%;
    background-image: url("https://assets.triple.guide/images/ico-check@3x.png");
    background-size: 100% 100%;
}
.agree {
    padding-left : 2%;
    padding-right : 2%;
}
.ag-1 {
    padding-top : 5%;
    padding-bottom : 3%;
    font-size : 20px;
    font-weight: bold;
}
.ag2-check {
    border-bottom : 2px solid rgba(239,239,239,1);
    padding-bottom : 2%;
    font-weight: bold;
}
.ag-3,.ag-4 {
    padding-top : 2%;
    padding-bottom : 2%;
}
.ag-3 span{
    font-weight: bold;
    font-size : 14px;
    border-bottom: 1px solid;
}
.ag-4 span {
    font-weight: bold;
    font-size : 14px;
}
.ag4-check2 {
    padding-top : 2%;
    padding-left : 2.5%;
}
.sel-subcheck2, .sel-subcheck3 {
    appearance: none;
    width : 22px;
    height : 22px;
    margin: 3px 8px 3px 4px;
    border-radius: 25px;
    position : relative;
    top : 1vh;
    cursor: pointer;
    content: "";
    background-image: url("https://assets.triple.guide/images/ico-check@3x.png");
    background-size: 100% 100%;
    filter: invert(73%) sepia(0%) saturate(33%) hue-rotate(143deg) brightness(102%) contrast(93%);
}
.sel-subcheck2:checked, .sel-subcheck3:checked {
    filter: invert(40%) sepia(87%) saturate(1642%) hue-rotate(194deg) brightness(96%) contrast(96%);
    border: none;
}
.sel-subcheck2::after, .sel-subcheck3::after {
    content: "";
    display : block;
    width : 100%;
    height : 100%;
    background-image: url("https://assets.triple.guide/images/ico-check@3x.png");
    background-size: 100% 100%;
}
.ag4-check2 span {
    border-bottom : 1px solid;
}
.info-btn img {
    width : 15px;
    position: relative;
    top : 0.3vh;
    left : 0.4vw;
    filter: invert(57%) sepia(7%) saturate(383%) hue-rotate(305deg) brightness(86%) contrast(85%);
}
.ag4-info {
    background-color: rgba(239,239,239,1);
    padding : 3%;
    font-size : 10px;
    margin-top : 2%;
}
.a4-text {
    color : #4285F4;
    font-size : 13px !important;
}
.a4-textx {
    color : #de2e5f;
    font-size : 13px !important;
}
.a4-othertext {
    color : red;
    font-size : 13px !important;
}
li::marker {
    content: "•";
}
li {
    padding-left : 1%;
}
.info-btn {
    border : 2px solid rgba(58,58,58,0.2);
    border-radius: 4px;
    padding : 1%;
    padding-right : 2%;
    padding-left : 2%;
    display: inline-block;
    margin-top : 2%;
    background-color: white;
    cursor: pointer;
}
.info-btn span {
    font-size : 13px !important;
    font-weight: bold;
    color : rgba(58, 58, 58, 0.8);
}
.foot-btn {
    padding-left : 2%;
    padding-right : 2%;
    padding-top : 3%;
    padding-bottom : 3%;
}
.accept-btn {
	width : 100%;
	margin-top : 20.8%;
	height : 50px;
	margin-bottom : 0.2%;
	border : 1px solid;
	line-height: 50px;
	text-align: center;
	font-size : 20px;
	background-color: #2987F0;
	color : white;
	border-radius: 5px;
	font-weight: bold;
} 
.my-cash {
	font-size : 14px;
	color : #4285F4;
}
</style>
            
<script>
	function check(f){
		var re_name = f.reserver_name;
		var re_email = f.reserver_email;
		var re_tel = f.reserver_tel;
		
		var rep_name = f.repre_name;
		var rep_tel = f.repre_tel;
		
		var all = document.getElementById("all");
		
		console.log(rep_tel.value);
		
		if(re_name.value==''){
			alert("예약자 이름을 입력하세요!");
			re_name.focus();
			return false;
		}
		if(re_email.value==''){
			alert("예약자 이메일을 입력하세요!");
			re_email.focus();
			return false;
		}
		if(re_tel.value==''){
			alert("예약자 전화번호를 입력하세요!");
			re_tel.focus();			
			return false;
		}
 		if(rep_name.value==''){
			alert("대표자 이름을 입력하세요!");
			rep_name.focus();
			return false;
		}
		if(rep_tel.value==''){
			alert("대표자 전화번호를 입력하세요!");
			rep_tel.focus();
			return false;
		}
		if(!all.checked){
			alert("약관 및 이용 동의는 필수입니다!");
			return false;
		}  
		return true;
	}
</script>
</head>
<body>
    <header class="header">
        <div class="inner">
            <div class="hd-in">
                <a>
                    <img onclick="history.back()" src="https://cdn.icon-icons.com/icons2/1462/PNG/512/134leftarrow_100014.png">
                </a>
                <span>예약 정보 입력</span>
            </div>
        </div>
    </header>
    <form method="post" action="${cpath }/member/ticket/purchaseForm?ticket=${param.ticket}" onsubmit="return check(this)">
		<input type="hidden" name="percent" value="${percent }">
		<input type="hidden" name="end_date" value="${end }">
		<input type="hidden" name="use_date" value="${start }">
	     <div class="main">
	         <div class="m-header">
	             <div class="top-info">
	                 <div class="top-title">
	                     <span>${ticket_name }</span>
	                 </div>
	                 <div class="top-date">
	                     <div class="td-first">이용예정일</div>
	                     <div>${start }</div>
	                 </div>
	                 <div class="color-date">
	                     <span>유효기간 : </span>
	                     <span>${start } 
	                     	<c:if test="${end != ''}">
	                     		~ ${end }
	                     	</c:if>
	                     </span>
	                 </div>
	             </div>
	             <div class="top-count">
	                 <div class="top-stitle">
	                     <span>${ticket_name }</span>
	                 </div>
	                 <div class="top-c">
	                     <div class="tc-name">수량</div>
	                     <div class="tc-info">
	                     	<c:forEach var="pick" items="${pickList }">
	                      	<input type="hidden" value="${pick.t_amount_seq }" name="seq">
	                          <div class="tci-div">
	                              <span>${pick.subopt_name }</span>
	                              <span>x${pick.amount }</span>
	                          </div>
	                         </c:forEach>
	                     </div>
	                 </div>
	             </div>
	         </div>
	         <div class="detail">
	             <div class="detail-1">
	                 <div class="detail-title">
	                     <span>예약자 정보</span>
	                 </div>
	                 <div class="detail-input">
	                     <div class="di-1">
	                         <div class="di-name">
	                             <span>한글성명</span>
	                         </div>
	                         <div class="di-input">
	                             <input type="text" id="rename" name="reserver_name" value="${trvo.reserver_name }" placeholder="홍길동">
	                         </div>
	                     </div>
	                 </div>
	                 <div class="detail-input">
	                     <div class="di-1">
	                         <div class="di-name">
	                             <span>이메일</span>
	                         </div>
	                         <div class="di-input">
	                             <input type="email" id="reemail" name="reserver_email" placeholder="triple@triple.com" value="${trvo.reserver_email }">
	                         </div>
	                     </div>
	                 </div>
	                 <div class="detail-input">
	                     <div class="di-1">
	                         <div class="di-name">
	                             <span>휴대전화번호</span>
	                         </div>
	                         <div class="di-input">
	                             <input type="text" id="retel" name="reserver_tel" value="${trvo.reserver_tel }">
	                         </div>
	                     </div>
	                 </div>
	             </div>
	             <div class="detail-1" style="padding-top : 7%;">
	                 <div class="detail-title">
	                     <span>대표 예약 정보</span>
	                 </div>
	                 <div class="detail-input">
	                     <div class="di-1">
	                         <div class="di-name">
	                             <span>여행자이름</span>
	                         </div>
	                         <div class="di-input">
	                             <input type="text" id="reprename" name="repre_name" value="${trvo.reserver_name }" placeholder="홍길동">
	                         </div>
	                     </div>
	                     <span class="d1-foot">실명으로 작성해 주세요.</span>
	                 </div>
	                 <div class="detail-input">
	                     <div class="di-1">
	                         <div class="di-name">
	                             <span>휴대전화번호</span>
	                         </div>
	                         <div class="di-input">
	                             <input type="text" id="repretel" name="repre_tel">
	                         </div>
	                     </div>
	                     <span class="d1-foot">휴대폰 번호를 입력해 주세요.</span>
	                 </div>
	             </div>
	         </div>
	         <div class="payment">
	             <div class="pm-1">
	                 <div class="pm1-name">
	                     <span>결제 내역 안내</span>
	                 </div>
	             </div>
	             <div class="pm-2">
	                 <div class="pm2-name">
	                     <span>예약금액(세금포함)</span>
	                 </div>
	                 <input type="hidden" name="tot_money" value="${tot }">
	                 <div class="pm2-text">
	                     <span><fmt:formatNumber value="${tot}" pattern="#,##0" />원</span>
	                 </div>
	             </div>
	             <c:if test="${cash != 0 }">
	              <div class="pm-3">
	                  <div class="pm3-name">
	                      <span>캐시 결제</span>
	                      <span class="my-cash">나의 캐시 (<fmt:formatNumber value="${cash }" pattern="#,##0" />원) </span>
	                  </div>
	                  <div class="pm3-text">
	                      <span>-</span>
	                      <input type="number" name="cash" id="cash" min="0" max="${cash }" step="10" value="0" onchange="inputCash(this)">
	                  </div>
	              </div>
	             </c:if>
	             <c:if test="${cash == 0 }">
	             	<input type="hidden" name="cash" value="0">
	             </c:if>
	             <c:if test="${clist!=null }">
	                 <input type="hidden" name="coupon_seq" id="coupon_seq">
	              <div class="pm-4">
	                  <div class="pm4-name">
	                      <span>쿠폰 할인</span>
	                  </div>
	                  <input type="hidden" name="coupon_seq" id="coupon_seq">
	                  <div class="pm4-text">
	                      <span>-</span>
	                      <input type="text" name="price" id="discount" readonly="readonly" value="0" onclick="openCouponPage()">
	                      <img class="pm4-img" src="https://img1.daumcdn.net/thumb/C500x500/?fname=http://t1.daumcdn.net/brunch/service/user/4aca/image/yon7WF20NQAoBIYOaNm6PHYX5A0.jpg" onclick="openCouponPage()">
	                  </div>
	              </div>
	             </c:if>
	         </div>
	         <script>
	          function addTip() {
	              const tip_add = document.getElementById("tip-add");
	              tip_add.className = "sel-textz";
	          }
	          function XTip() {
	              const tip_add = document.getElementById("tip-add");
	              tip_add.className = "sel-text";
	          }
	         </script>
	         <div class="total">
	             <div class="total-1">
	                 <div class="tot1-name">
	                     <span>총 결제 금액(세금 포함)</span>
	                 </div>
	                 <input type="hidden" id="pay_money" name="pay_money">
	                 <div class="tot1-text">
	                     <span id="realPay"></span>
	                 </div>
	             </div>
	             <div class="total-2">
	                 <div class="tot2-name">
	                     <span>최대 적립 가능 트리플 캐시</span>
	                     <img class="fast-img" onclick="addTip()" src="https://assets.triple.guide/images/ico_tooltip_info_black@4x.png">
	                 </div>
	                 <div class="tot2-text">
	                     <span id="earnCash"></span>
	                 </div>
	             </div>
	             <div class="sel-text" id="tip-add">
	                 쿠폰 및 캐시 사용에 따라 변동될 수 있으며 최종 적립 예정 트리플 캐시는 결제 페이지에서 확인할 수 있습니다.
	                 <div class="text-img">
	                     <img onclick="XTip()" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
	                 </div>
	             </div>
	         </div>
	         <div class="agree">
	             <div class="ag-1">
	                 <div class="ag1-name">
	                     <span>상품 이용 동의</span>
	                 </div>
	             </div>
	             <div class="ag-2">
	                 <div class="ag2-check">
	                     <input type="checkbox" class="sel-check" id="all" onclick="checkAll()">
	                     <span>전체 동의</span>
	                 </div>
	             </div>
	             <div class="ag-3">
	                 <div class="ag3-check">
	                     <input type="checkbox" class="sel-check1" onclick="checkOne(1)">
	                     <span>이용 전, 꼭 알아두세요.</span>
	                 </div>
	             </div>
	             <div class="ag-4">
	                 <div class="ag4-check">
	                     <input type="checkbox" class="sel-check1" id="check2" onclick="checkOne(2)">
	                     <span>이용 규정과 약관</span>
	                 </div>
	                 <div class="ag4-check2">
	                     <input type="checkbox" class="sel-subcheck2" onclick="checkSub(2)">
	                     <span>파트너 상품 구매자 약관</span>
	                 </div>
	                 <div class="ag4-check2">
	                     <input type="checkbox" class="sel-subcheck2" onclick="checkSub(2)">
	                     <span>취소 / 이용 규정</span>
	                 </div>
	                 <div class="ag4-check2">
	                     <input type="checkbox" class="sel-subcheck2" onclick="checkSub(2)">
	                     <span style="border-bottom : 0;">취소 및 환불정책</span>
	                 </div>
	                 <div class="ag4-info">
	                 	<c:if test="${cm != null }">
	                      <ul>
	                          <li>
	                          	<c:if test="${cm.percent == 100 }">
	                              <span class="a4-text">${cm.date } 오후 5:00(서울시간)까지 취소 요청하면 무료 취소로 전액 환불 됩니다.</span>
	                         	</c:if>
	                          	<c:if test="${cm.percent != 100 }">
	                              <span class="a4-textx">${cm.date } 오후 5:00(서울시간)까지 취소 요청하면 ${100-cm.percent }% 공제 후 환불 됩니다.</span>
	                         	</c:if>
	                          </li>
	                      </ul>
	                      <div class="info-btn" onclick="javascript:cancelDetail()">
	                          <span>나중에 취소하면 어떻게 되나요?<img src="https://cdn.icon-icons.com/icons2/1904/PNG/512/rightarrow_121279.png"></span>
	                      </div>
	                      
							<script>
							  function cancelDetail() {
							    const start = new Date('${start}');
							    const end = new Date('${end}');
							    var ticket = '${param.ticket}';
						
							    const formatDate = (date) => {
							      const year = date.getFullYear();
							      const month = String(date.getMonth() + 1).padStart(2, '0');
							      const day = String(date.getDate()).padStart(2, '0');
							      return year+`-`+month+`-`+day;
							    };
							
							    var url = '${cpath}/member/ticket/cancelInfo/' + formatDate(start) + '/?ticket=' + ticket;
							
							    if (end != '') {
							      url += '&end=' + formatDate(end);
							    }
							
							    window.open(url, '취소규정', 'width=600,height=800,top=300,left=300,scrollbars=yes');
							  }
							</script>

	                     </c:if>
	                     <c:if test="${cm == null }">
	                     	<ul>
	                          <li>
	                              <span class="a4-othertext">취소 및 환불이 불가 합니다.</span>
	                          </li>
	                      </ul>
	                     </c:if>
	                 </div>
	                 <div class="ag4-check">
	                     <input type="checkbox" class="sel-check1" id="check3" onclick="checkOne(3)">
	                     <span>개인 정보 수집과 이용 동의</span>
	                 </div>
	                 <div class="ag4-check2">
	                     <input type="checkbox" class="sel-subcheck3" onclick="checkSub(3)">
	                     <span>개인 정보 수집 / 이용 방침</span>
	                 </div>
	                 <div class="ag4-check2">
	                     <input type="checkbox" class="sel-subcheck3" onclick="checkSub(3)">
	                     <span>개인정보 제 3자 제공</span>
	                 </div>
	             </div>
	         </div>
	         <div class="foot-btn">
	         	<input class="accept-btn" type="submit" value="결제하기">
	         </div>
	     </div>	
    </form>
	<script>
		var realPay = document.getElementById("realPay");
		var pay_money = document.getElementById("pay_money");
		var idCash = document.getElementById("cash");
	
		$(function(){
			// 뒤로 가기 했을 경우 반영하기 위해
			var cash = 0;
			if(idCash != null){
				cash = idCash.value;
			}
			realPay.innerText = (${tot} - cash).toLocaleString()+'원';
			pay_money.value = ${tot} - cash;
	
			
			var recash = Math.round(${tot}*${percent}/100);
			var earnCash = ${tot}*${percent}/100
			if(recash < earnCash){
				recash += 1;
			}
			document.getElementById("earnCash").innerText = recash.toLocaleString()+'원';
		});
		
		// 페이지 넘기기 전 언제든 쿠폰 변경 가능하므로 캐시 제한금액을 하나 고정시키기
		var totMinusCash = ${tot};
		
		// 사용하려는 캐시 조절할 때
		function inputCash(c){
			if(popup && !popup.closed){
				popup.close();
			}
			
			var coupon = document.getElementById("coupon_seq");
			if(coupon != null){
				coupon.value = '';
		        document.getElementById("discount").value = 0;
			}
			
			realPay.innerText = (${tot} - c.value).toLocaleString()+'원';
			pay_money.value = ${tot} - c.value;
			totMinusCash = pay_money.value;
		}
		
		var popup;
		function openCouponPage(){
			var url = `${cpath}/member/ticket/coupon?price=` + totMinusCash;
			var features = "width=550px, height=550px, top=300px, left=300px, scrollbars=yes";
			popup = window.open(url, "쿠폰 목록", features);
		}
		
		function setRealPay(discount){
			var real = ${tot} - discount;
			if(idCash !=  null){
				real -= idCash.value;
			}
			realPay.innerText = real.toLocaleString()+'원';
			pay_money.value = real;
		}
		
	    function setValuesAndClose(coupon_seq, discount) {
	        document.getElementById("coupon_seq").value = coupon_seq;
	        document.getElementById("discount").value = (discount).toLocaleString()+'원';
	        setRealPay(discount);
	    }
		
		var all = document.getElementById("all");
		var checkboxes = document.getElementsByClassName('sel-check1');
		var subboxes = document.querySelectorAll('input[class^=sel-subcheck]');
		
		// 전체 동의 기능
		function checkAll(){
			if(all.checked){
				for(var i = 0; i<checkboxes.length; i++){
					checkboxes[i].checked = true;
				}
				for(var j = 0; j<subboxes.length; j++){
					subboxes[j].checked = true;
				}
			}else{
				for(var i = 0; i<checkboxes.length; i++){
					checkboxes[i].checked = false;
				}
				for(var j = 0; j<subboxes.length; j++){
					subboxes[j].checked = false;
				}
			}
		}
		
		// 개별 체크 시 전체 체크 여부 확인
		function checkOne(num){
			// 세부 약관 체크
			var subs = document.getElementsByClassName('sel-subcheck'+num);
			var status = document.getElementById("check"+num).checked;
			for(var j=0; j<subs.length; j++){
				subboxes[j].checked = status;
			}
			
			// 전체 동의 체크
			let allchecked = true;
			for(var i = 0; i<checkboxes.length; i++){
				if(!checkboxes[i].checked){
					allchecked = false;
					break;
				}
			}
			all.checked = allchecked;
		}
		
		// 세부 약관 체크 시 상위 약관 체크 여부 확인
		function checkSub(num){
			let mainchecked = true;
			var subs = document.getElementsByClassName('sel-subcheck'+num);
			for(var i = 0; i<subs.length; i++){
				if(subs[i].checked == false){
					mainchecked = false;
					break;
				}
			}
			document.getElementById('check'+num).checked = mainchecked;
			
			if(!mainchecked){
				all.checked = mainchecked;
			}
		}
	</script>
</body>
</html>




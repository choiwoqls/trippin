<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>

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
       border-bottom : 2px solid rgb(239, 239, 239);
       margin-left : 2%;
       margin-right : 2%;
   }
   .top-title {
       font-weight: bold;
       font-size : 22px;
       padding-bottom : 1%;
   }
   .top-date {
       font-weight: bold;
       
   }
   .td-first {
       color : #897E7F;
       font-size : 12px;
       
   }
/*    .color-date {
       margin-top : 2%;
       padding-left : 3%;
       padding-right : 3%;
       padding-top : 3%;
       padding-bottom : 3%;
       background-color: #DBE8FD;
       color : #4285F4;
       font-weight: bold;
       font-size : 14px;
   } */
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
       font-size: 14px;
       padding-bottom : 3%;
   }
   .tc-name {
       font-weight: bold;
       display : flex;
       justify-content: space-between;
       padding-bottom : 2%;
       width : 100%;
       
   }
   .name-tag {
       width : 70%;
   }
   .price-tag {
       width : 30%;
       text-align: right;
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
   .pm-3{
       display: flex;
       justify-content: space-between;
       font-size : 14px;
       font-weight: bold;
       margin-top : 2%;
       color :#897E7F;
   }
   .pm-4 {
       display: flex;
       font-size : 14px;
       font-weight: bold;
       justify-content: space-between;
       color :#897E7F;
   }
   .minus {
       padding-right : 0.3vw;
       font-size : 14px;
   }
   .pm3-name {
       
       font-weight: bold;
   }
   .pm3-text {
       width : 60%;
       text-align: right;
   }
   
   .pm3-img {
       width : 24px;
       position : relative;
       bottom : 1.5vh;
       cursor: pointer;
   }
   .pm3-text input {
       border : 1px solid #F2F2F2;
       width : 70%;
       padding : 5%;
       height : 0.5vh;
   }
   .sel-check {
       appearance: none;
       width : 22px;
       height : 22px;
       margin: 3px 8px 3px 4px;
       border-radius: 25px;
       position : relative;
       top : 1vh;
       cursor: pointer;
       border : 1px solid rgba(58,58,58,0.2);
       content: "";
       background-image: url("https://assets.triple.guide/images/ico-check@3x.png");
       background-size: 100% 100%;
       background-color: gray;
   }
   .sel-check:checked {
       background-color: #2987F0;
       border: none;
   }
   .sel-check::after {
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
   .sel-check2 {
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
   .sel-check2:checked {
       filter: invert(40%) sepia(87%) saturate(1642%) hue-rotate(194deg) brightness(96%) contrast(96%);
       border: none;
   }
   .sel-check2::after {
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
   	width:100%;
       background-color: #2987F0;
       border-radius: 4px;
       height : 6vh;
       text-align: center;
       line-height: 6vh;
       font-weight: bold;
       font-size:15px;
       color : white;
       cursor: pointer;
   }
   .ag2-top{
       display : flex;
       justify-content: space-between;
       flex-wrap: wrap;
       gap : 1.5vh;
       padding-top : 3%;
       padding-left : 5%;
       padding-right : 5%;
   }
   .ag2-list1, .ag2-list2, .ag2-list3, .ag2-list4 {
       width : 48%;
       padding-top : 3%;
       padding-bottom : 3%;
       font-weight: bold;
       background-color: white;
       cursor: pointer;
       border : 2px solid #F2F2F2;
       border-radius: 4px;
       text-align : center;
   }
   .ag2-listpick1, .ag2-listpick2, .ag2-listpick3, .ag2-listpick4 {
       width : 48%;
       padding-top : 3%;
       padding-bottom : 3%;
       font-weight: bold;
       background-color: lightblue;
       cursor: pointer;
       border : 2px solid #F2F2F2;
       border-radius: 4px;
       text-align : center;
   }
   .ag2-list1:focus, .ag2-list2:focus, .ag2-list3:focus, .ag2-list4:focus {
       border : 2px solid #2987F0;
   }
   .agl1-img {
       width : 45px;
   }
   .agl3-img{
       width : 65px;
   }
   .agl2-img {
   		width : 65px;
   		padding-top : 10px;
   }
   .agl4-img {
   		width : 65px;
   		padding-top : 10px;
   }
   .check-info {
       padding-left : 2%;
       padding-right : 2%;
       margin-top : 5%;
   }
   .ci-section {
       background-color: rgb(248, 248, 248);
       padding-left : 2%;
       padding-right : 2%;
       padding-top : 3%;
       padding-bottom : 3%;
   }
   .ci-title {
       font-weight: bold;
       
   }
   .ci-stitle {
       font-weight: bold;
       padding-bottom : 1%;
   }
   .ci-detail {
       padding-left : 1%;
       list-style: none;
       list-style-type: none;
   }
   .ci-text {
       padding-top : 3%;
       padding-bottom : 3%;
       border-bottom : 2px solid #F2F2F2;
       word-break: keep-all;
   }
   .ci-detail li {
       line-height: 200%;
       font-size : 13px;
       font-weight: bold;
       color :#616161;
       white-space: pre-line;
       appearance: none;
       padding-left : 2%;
   }
   .check-section {
       padding-top : 3%;
   }
   .ci-check {
       font-size : 13px;
       font-weight: bold;
       color: #616161;
       line-height: 200%;
       
       list-style-position: inside;
       
   }
   .ci-check li {
       display: flex;
   }
   .ci-check li::before {
       content: "✔";
       padding-right : 2%;
   }
   .ci-check span {
       padding-left : 0.5%;
   }
</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script>

	</script>
</head>
<body>
	<header class="header">
		<div class="inner">
			<div class="hd-in">
				<a href="#" onclick="history.back()"> <img 
					src="https://cdn.icon-icons.com/icons2/1462/PNG/512/134leftarrow_100014.png">
				</a> <span>결제내용 확인</span>
			</div>
		</div>
	</header>
	<form method="post">
		<input type="hidden" name="coupon_seq" value="${coupon_seq }">
		<input type="hidden" name="use_date" value="${use_date }"> 
		<input type="hidden" name="end_date" value="${end_date }"> 
		<input type="hidden" name="tot_money" value="${tot_money }"> 
		<input type="hidden" name="pay_money" value="${pay_money }"> 
		<input type="hidden" name="repre_name" value="${repre_name }"> 
		<input type="hidden" name="repre_tel" value="${repre_tel }"> 
		<input type="hidden" name="useCash" value="${cash }">

		<div class="main">
			<div class="m-header">
				<div class="top-info">
					<div class="top-title">
						<span id="ticket_name">${ticket_name}</span>
					</div>
					<div class="top-date">
						<div class="td-first">
							<span>${optName}</span>
						</div>
					</div>
				</div>
				<div class="top-count"  id="pick_info">
					<div class="top-c">
						<c:forEach var="pick" items="${pickList}">
							<input type="hidden" name="seq" value="${pick.t_amount_seq }">
							<div class="tc-name">
								<div class="name-tag">
									<span>${pick.subopt_name}&nbsp;x${pick.amount}</span>
								</div>
								<div class="price-tag">
									<span>
										<fmt:formatNumber value="${pick.sum_price }" pattern="#,##0" />원
									</span>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="payment">
				<div class="pm-1">
					<div class="pm1-name">
						<span>결제 정보</span>
					</div>
				</div>
				<div class="pm-2">
					<div class="pm2-name">
						<span>예약금액(세금포함)</span>
					</div>
					<div class="pm2-text">
						<span><fmt:formatNumber value="${tot_money }" pattern="#,##0" />원</span>
					</div>
				</div>
				<c:if test="${cash != 0 }">
					<div class="pm-3">
						<div class="pm3-name">
							<span>캐시 사용</span>
						</div>
						<div class="pm3-text">
							<span class="minus">­−</span><span><fmt:formatNumber value="${cash }" pattern="#,##0" />원</span>
						</div>
					</div>
				</c:if>
				<c:if test="${tot_money - pay_money - cash!=0}">
					<div class="pm-4">
						<div class="pm4-name">
							<span>쿠폰 할인</span>
						</div>
						<div class="pm4-text">
							<span class="minus">­−</span>
							<span><fmt:formatNumber value="${tot_money - pay_money - cash}" pattern="#,##0" />원</span>
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
					<div class="tot1-text">
						<span><fmt:formatNumber value="${pay_money }" pattern="#,##0" />원</span>
					</div>
				</div>
				<div class="total-2">
					<div class="tot2-name">
						<span>적립 예정 트리플 캐시</span> <img class="fast-img" onclick="addTip()"
							src="https://assets.triple.guide/images/ico_tooltip_info_black@4x.png">
					</div>
					<div class="tot2-text">
						<span id="cash"></span>
						<input type="hidden" name="earnCash" id="giveCash">
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
						<span>결제수단</span>
					</div>
				</div>
				<div class="ag-2">
					<div class="ag2-top">
						<input type="hidden" name="pay_seq" id="pay_seq" value="5">
						<c:forEach var="p" items="${pay}" varStatus="i">
							<div class="ag2-list${i.count}" onclick="showDcInfo(${p.pay_seq},${i.count})">
								<img class="agl${i.count}-img" src="${p.img}">
								<div>${p.pay_name}</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="check-info">
				<c:forEach var="p" items="${pay }">
					<div class="ci-section" id="info_${p.pay_seq }" style="display: none">${p.dc_info }</div>
				</c:forEach>
			</div>
			<div class="foot-btn">
				<input type="button" value="결제하기" class="accept-btn" onclick="finishPurchase(this.form)">
			</div>
		</div>
	</form>

	<script>
		var pay_seq= document.getElementById("pay_seq");
	
		$(function(){
			// 적립 예정 캐시이므로 쿠폰 적용된 최종 가격에 대한 캐시로
			var recash = Math.round(${pay_money}*${percent}/100);
			var cash = ${pay_money}*${percent}/100
			if(recash < cash){
				recash += 1;
			}
			
			document.getElementById("cash").innerText = recash.toLocaleString() + "원";
			document.getElementById("giveCash").value = recash;
			
			showDcInfo(1,1);
		})
	
		function showDcInfo(num, i){
			
			var infos = document.querySelectorAll("div[id^='info_']");
			
			document.querySelector(".ag2-list"+i).className = "ag2-listpick"+i;
			pay_seq.value = num;
			
			var picks = document.querySelectorAll("div[class^='ag2-list']");
			if(picks != null){
				for(var k = 1; k<=picks.length; k++){
					if(picks[k-1].className == "ag2-listpick"+k && i!=k){
						picks[k-1].className= "ag2-list"+k;
					}
				}
			}
			
			for(var j=0; j<infos.length; j++){
				if(infos[j].id != "info_"+num){
					document.getElementById(infos[j].id).style.display="none";
				}else{
					document.getElementById(infos[j].id).style.display="block";
				}
			}
		}
		
		function finishPurchase(f){
			console.log(f);
	 		var pickList = document.getElementById("pick_info");
	 		var ticket_name = document.getElementById("ticket_name");
			var confirmation = confirm(ticket_name.innerText+"\r\n"+pickList.innerText
					+"\r\n해당 정보로 결제를 진행하시겠습니까?");
			
			console.log(confirmation);
			
			if(confirmation){
				f.action = "${cpath }/member/ticket/purchase?ticket="+${param.ticket};
				f.submit();
			}else{
		 		return;
			}
		}
	</script>

</body>
</html>




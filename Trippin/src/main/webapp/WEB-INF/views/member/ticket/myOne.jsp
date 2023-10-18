<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리핀</title>

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

 table{border-collapse:collapse;border-spacing:0;}
 img{max-width:100%;height:auto;width: 20px;}
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
 .header{
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
 .top-stitle {
     font-weight : bold;
     padding-bottom : 3%;
 }
 .m-header, .infos {
     padding-bottom : 2%;
     border-bottom : 10px solid rgb(239, 239, 239);
 }
 .detail-input {
     padding-bottom : 2%;
 }
 .t-info {
     padding-top : 3%;
     padding-left : 2%;
     padding-right : 2%;
 }
 .tf-1 {
     font-weight: bold;
     font-size : 20px;
 }
   
.color-info, .nocolor-info, 
.tck-show, .color-date, .tf2-info{
    margin-top : 5%;
    padding-left : 3%;
    padding-right : 3%;
    padding-top : 3%;
    padding-bottom : 3%;
    height:auto;
    border-radius: 1.4%;
}

.color-info {
    background-color: #61decb;
    color : #eef6f4;
    font-weight: bold;
    font-size : 14px;
}

.nocolor-info{
	background-color: #abaaaa;
	color : #f2f2f2;
	font-weight: bold;
	font-size : 14px;
}

.tck-show{
	background-color: #eef6f4;
    color : #61decb;
    font-size : 14px;
}

.sub-ci{
	font-weight: bold; 
	font-size: 12px;
	color : #ffffff;
}

.top-btn{
	margin-top:7%;
	margin-bottom : 6%;
}

.top-btn input[type=button]{
    width: 99%;
    height: 34px;
    background: none;
    margin-left: 0.5%;
    margin-right: 0.5%;
    border: 1px solid #c9c7c7;
    font-weight: bold;
}

.color-date {
    background-color: #eff3fa;
    color : #4285F4;
    font-size : 14px;
}

.tf2-info{
	background-color: #f2f2f2;
    font-size : 16px;
    font-weight: bold;
}

.tf2-subinfo{
    font-size : 13px;
    color:#939090;
    margin-top:1.5%;
    margin-bottom: 3%;
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
.ex-info{
	border-bottom: 1px solid rgb(239, 239, 239);
	padding-left : 3%;
    padding-right : 3%;
    padding-top : 5%;
    padding-bottom : 5%;
   	justify-content: space-between;
   	display: flex;
   	font-weight: bold;
}
.ex-partner{
   	justify-content: space-between;
   	display: flex;
   	font-weight: bold;
   	padding-left : 3%;
    padding-right : 3%;
    padding-top : 5%;
    padding-bottom : 5%;
}
.ei-intro{
	font-size: 12px;
    color: #aba6a6;
}
.ei-img{

}
.sub-info{
	padding-left : 3%;
    padding-right : 3%;
    padding-top : 5%;
    padding-bottom : 5%;
    font-weight: bold;
}
.in-title{
    font-weight: bold;
    color: #297bd2;
    margin-bottom: 2%;
}
.in-info{
	display: flex;
    justify-content: space-between;
    color: #958686;
    margin-bottom: 2%;
}
.in-info span{
	color : #000;
}
.tf1-info{
    margin-top: 5%;
	font-weight: bold;
}
.in-last{
	border-top: 2px solid rgb(239, 239, 239);
    padding-top: 3%;
    font-size: 18px;
    justify-content: space-between;
    display: flex;
}
.in-cash{
	font-size: 15px;
    display: flex;
    justify-content: space-between;
    margin-top: 3%;
}
.in-cashin{
    display: flex;
    justify-content: right;
    font-size: 13px;
    gap: 1%;
}
.res-info{
	padding-top: 0.5%;
    padding-bottom: 2%;
    padding-left: 3%;
    padding-right: 3%;
    background-color: #f2f2f2;
    margin-top: 10%;
    word-break : keep-all;
}
.res-info div{
    font-size: 14px;
    margin-top: 4%;
    font-weight : bold;
}
.in-cashin span {
	padding-top : 0.3%;
}
.reflex-section {
	display : flex;
	justify-content : space-between;
	padding-top: 3%;
    font-size: 18px;
}
.top-line {
	border-top: 2px solid rgb(239, 239, 239);
    padding-top: 5%;
    padding-bottom : 3%;
}
.cancel-section {
	padding-bottom : 3%;
}
.ad-info {
	font-size : 14px;
	color: rgba(58, 58, 58, 0.4);
	font-weight : 500;
}
.res {
	padding-bottom : 3%;
}
.footer-info {
	color: #616161;
    font-size: 13px !important;
}
.h3-section {
	padding-top : 3%;
}
.h3-list {
	color: #616161;
    font-size: 14px !important;
}
.can-btn {
	padding-top : 3%;
}
.can-btn input {
	width: 100%;
    padding-top: 2%;
    padding-bottom: 2%;
    font-weight: bold;
    color: white;
    background: rgb(54, 143, 255);
    border: 0;
    border-radius: 4px;
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
    left: 17.5vw;
    display: block;
    word-break:break-all;
}
</style>

</head>
	<body>
		<input type="hidden" id="valid" value="${valid }">
		<header class="header">
		    <div class="inner">
		        <div class="hd-in">
		        	<a onclick="location.href='${cpath}/'">
		            	<img onclick="location.href='${cpath}/'" src="data:image/png;base64,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">
		            </a>
		            <span>결제내역 상세</span>
		        </div>
			</div>
		</header>
		<div class="main">
			<div class="m-header">
				<div class="top-info">
					<div class="top-title">
						<span id="ticket_name">${map.TICKET_NAME }</span>
					</div>
					<div class="top-date">
						<div class="td-first">
							<span>${map.ADDR1_NAME }·투어확정서</span>
						</div>
					</div>
					<c:if test="${map.STATUS ==0 || map.STATUS == 1 }">
						<div class="color-info">
					       	<c:if test="${map.STATUS == 0 }">
						         <div>
						         	<span>투어티켓 예약이 확정되었습니다.</span>
						         </div>
						         <div style="margin-top:2%;">
						         	<span class="sub-ci">예약번호&nbsp;${map.SERIAL_NO }</span>
						         </div>
					        </c:if>
					        <c:if test="${map.STATUS == 1}">
					        	<div>
					        		사용이 완료된 투어티켓입니다.
					        	</div>
					        	<div style="margin-top:2%;">
					        		<span class="sub-ci">예약번호&nbsp;${map.SERIAL_NO }</span>
					        	</div>
					        </c:if>
					     </div>
					     <c:if test="${map.STATUS == 0 }">
						     <div class="tck-show">
					         	<span>투어파트너와 만나 투어확정서를 제시해주세요. 단, 바우처가 있는 경우 첨부된 바우처를 함께 제시해야 합니다.</span>
					         </div>
				         </c:if>
				     </c:if>
				     <c:if test="${map.STATUS != 0 && map.STATUS!=1 }">
				     	<div class="nocolor-info">
					        <c:if test="${map.STATUS == 2}">
					        	<div>
					        		사용기한이 만료된 투어티켓입니다. (*취소 불가 상품)
					        	</div>
					        	<div style="margin-top:2%;">
					        		<span class="sub-ci">예약번호&nbsp;${map.SERIAL_NO }</span>
					        	</div>
					        </c:if>
					        <c:if test="${map.STATUS == 3 && status==0}">
					        	<div>
					        		투어티켓 예약이 취소접수 되었습니다.
					        	</div>
					        	<div style="margin-top:2%;"> 
					        		<span class="sub-ci">예약번호&nbsp;${map.SERIAL_NO }</span>
					        	</div>
					        </c:if>
					        <c:if test="${map.STATUS == 3 && status==1}">
					        	<div>
					        		투어티켓 예약이 취소완료 되었습니다. 
					        	</div>
					        	<div style="margin-top:2%;">
					        		<span class="sub-ci">예약번호&nbsp;${map.SERIAL_NO }</span>
					        	</div>
					        </c:if>
				        </div>
				     </c:if>
			        <div class="top-btn">
			        	<input type="button" value="상품 상세" onclick="location.href='${cpath}/member/ticket/selectTK?ticket_seq=${map.TICKET_SEQ}'">
			        </div>
				</div>
			</div>
			<div class="infos">
				<div class="t-info">
					<div class="tf-1">
						<div class="tf1-name">
							<span>투어·티켓 정보</span>
						</div>
					</div>
					<div class="tf-2">
						<div class="tf2-info">
							<div>${map.TICKET_NAME }</div>
							<div class="tf2-subinfo">
								<div>입장권</div>
								<div>이용예정일 : ${map.USE_DATE }</div>
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
					</div>
					<div class="tf-3">
						<div class="color-date">
						   <span>유효기간 : </span>
						   <span>${map.USE_DATE } ~ ${map.END_DATE }</span>
						</div>
					</div>
				</div>
				<div class="ex-info">
					<div style="line-height: 1.3;">사용방법</div>
					<div><img src="https://cdn.icon-icons.com/icons2/1904/PNG/512/rightarrow_121279.png"></div>
				</div>
				<div class="ex-info">
					<div style="line-height: 1.3;">꼭 알아두세요</div>
					<div><img src="https://cdn.icon-icons.com/icons2/1904/PNG/512/rightarrow_121279.png"></div>
				</div>
				<div class="ex-partner">
					<div>
				    	<div>${map.T_PARTNER_NAME }</div>
				       	<div class="ei-intro">${map.T_PARTNER_INTRO }</div>
			       	</div>
			       	<div class="ei-img">${map.T_PARTNER_IMG }</div>
				</div>
			</div>
		   	<div class="infos">
		   		<div class="sub-info">
		   		   <div class="in-title">예약자 정보</div>
			       <div>
						<div class="in-info">이름<span>${map.RESERVER_NAME }</span></div>
						<div class="in-info">전화번호<span>${map.RESERVER_TEL }</span></div>
						<div class="in-info">이메일<span>${map.RESERVER_EMAIL }</span></div>
			       </div>
		       </div>
		       <div class="sub-info">
			       <div class="in-title">대표 예약 정보</div>
			       <div>
						<div class="in-info">휴대전화번호<span>${map.REPRE_TEL }</span></div>
						<div class="in-info">여행자이름<span>${map.REPRE_NAME }</span></div>
			       </div>
		       </div>
		    </div>
	   		<div class="t-info">
	   			<div class="tf-1">
	         		<div class="tf1-name">결제 정보</div>
	         	</div>
	         	<div class="tf1-info">
			        <div class="in-info">
			         	주문 금액(세금 포함) <span><fmt:formatNumber value="${map.TOT_MONEY }" pattern="#,##0" />원</span>
			        </div>
			        <c:if test="${map.USE_CASH != 0 }">
				        <div class="in-info">
				          	캐시 사용 <span>-<fmt:formatNumber value="${map.USE_CASH }" pattern="#,##0" />원</span>
				        </div>
			        </c:if>
			        <c:if test="${map.COUPON_SEQ != null }">
				        <div class="in-info">
				          	쿠폰 할인 <span>-<fmt:formatNumber value="${map.TOT_MONEY - map.PAY_MONEY - map.USE_CASH }" pattern="#,##0" />원</span>
				        </div>
			        </c:if>
			        <div class="in-last">
			         	총 결제금액 <span><fmt:formatNumber value="${map.PAY_MONEY }" pattern="#,##0" />원</span>
			        </div>
			        <div class="in-cash">
			         	적립 트리플 캐시 <span><fmt:formatNumber value="${map.CASH }" pattern="#,##0" />원</span>
			        </div>
			        <div class="in-cashin">
			        	캐시 적립일 
			        	<img class="fast-img" onclick="addTip()" src="https://assets.triple.guide/images/ico_tooltip_info_black@4x.png">
			        	<span>${map.CASH_DATE }</span>
			        </div>
			        <div class="sel-text" id="tip-add">
	                 캐시는 적립예정일 이후 적립됩니다. 적립예정일은 티켓에 따라 다르니 상세 페이지를 참고하시기 바랍니다.
	                 <div class="text-img">
	                     <img onclick="XTip()" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
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
	             </div>
		        </div>
		         <div class="tf2-info">
		   			결제 일시 : <span>${map.DATETIME }</span>
		   		</div>
		   		<div class="res">
			   		<c:if test="${map.STATUS == 3 && status==0}">
			       		<div class="res-info">
			       			<h3 class="h3-section">결제 취소 확인중</h3>
			       			<div class="h3-list">
			       				투어파트너 상품의 경우, 파트너의 취소환불 정책에 따라 처리 될 예정이며, 취소까지는 최소 1~7 영업일이 소요될 수 있습니다.
		       				</div>
		       				<div class="h3-list">
			       				만일 취소 수수료가 부과될 경우, 해당 수수료를 차감한 금액이 취소되며, 결제취소는 카드사에 따라 승인 취소처리에 일정기간(약 5~7영업일)이 추가로 소요될 수 있습니다.
			       			</div>
			       		</div>
		       		</c:if>
		       		<c:if test="${map.STATUS == 3 && status==1}">
			       		<div class="t-info" style="margin-top:5%;">
				   			<div class="tf-1">
				         		<div class="tf1-name">취소/환불 정보</div>
				         	</div>
			       			<div class="tf1-info">
			       				<div class="in-info">주문 금액 (세금 포함) <span><fmt:formatNumber value="${rmap.TOT_MONEY }" pattern="#,##0" />원</span></div>
			       				<div class="in-info">주문 취소 금액 <span><fmt:formatNumber value="${rmap.TOT_MONEY }" pattern="#,##0" />원</span></div>
			       				<div class="in-info">취소 수수료 <span><fmt:formatNumber value="${rmap.FEE }" pattern="#,##0" />원</span></div>
			       			</div>
			       			<div class="tf1-info" style="border-top:2px solid rgb(239, 239, 239); padding-top:5%;">
			       				<div class="cancel-section">
				       				<div class="in-info">환불 금액 <span><fmt:formatNumber value="${rmap.TOT_MONEY  - rmap.FEE}" pattern="#,##0" />원</span></div>
				       				<div class="in-info">쿠폰 할인 금액 차감 <span>-<fmt:formatNumber value="${rmap.TOT_MONEY - rmap.FEE - rmap.USE_CASH - rmap.MONEY }" pattern="#,##0" />원</span></div>
				       				<div class="in-info">캐시 사용 금액 차감 <span>-<fmt:formatNumber value="${rmap.USE_CASH }" pattern="#,##0" />원</span></div>
			       				</div>
			       				<div class="top-line">
				       				<h4>총 환불금액</h4>
				       				<div class="reflex-section">
					       				<div>농협카드</div>
					       				<div><fmt:formatNumber value="${rmap.MONEY }" pattern="#,##0" />원</div>
				       				</div>
			       				</div>
			       				<div class="ad-info">* 쿠폰은 사용기한이 남은 경우 다시 지급됩니다.</div>
								<div class="ad-info">* 사용한 캐시는 반환되며, 환불일로부터 1년의 유효기간이 주어집니다. </div>       				
			       			</div>
			       			
			       			<div class="res-info">
			       				<div>결제 취소일시 : ${rmap.DATETIME }</div>
			       				<div class="footer-info">결제 카드사에 따라 승인취소 처리에 일정 기간 ( 약 5 ~ 7 영업일 )이 소요될 수 있습니다.</div>
			       			</div>
			       		</div>
			       	</c:if>
			       	<c:if test="${cmap.su != 0 && map.STATUS==0}">
					    <div class="can-btn">
					    	<input type="button" value="취소하기" onclick="location.href='${cpath}/member/cancelForm/1?purchase=${param.purchase }'">
					    </div>
	   				</c:if>
			        <c:if test="${cmap.su == 0}">
			        	<h4 style= "color: #de2e5f; font-size: 14px;">* 해당 상품은 취소 불가 상품입니다. 판매처로 문의하시기 바랍니다.</h4>
			        </c:if>
	       		</div>
	         </div>
		</div>
    </body>
</html>

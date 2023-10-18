<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<title>Room</title>
</head>
        <head>
            <meta charset="utf-8">
            <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
            <title>Room</title>

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">

            <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
            <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
            
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            
            <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
                }
                .hd-in {
                    display : flex;
                    margin-left: 30%;
                    margin-right : 30%;
                    background-color: white;
                    height : 70px;
                    
                    line-height: 70px;
                }
                .main {
                    margin-left: 30%;
                    margin-right : 30%;  
                    background-color: white;
                }
                header {
                    background-color: #F2F2F2;
                }
                .hd-left img {
                    width : 40px; 
                }
                .hd-left {
                    padding-top : 2.2%;  
                }
                .hd-mid {
                    padding-left : 4%;
                    font-weight : bold;
                    font-size : 18px;
                }
                .slider {
                    border-radius: 15px;
                }
                .slider img {
                    width : 100%;
                    
                    height : 60vh;
                    
                }
                .counter {
                    position : absolute;
                    padding-left: 2%;
                    padding-right : 2%;
                    padding-top : 0.5%;
                    padding-bottom : 0.5%;
                    border-radius: 15px;
                    background-color: rgba(0, 0, 0, 0.2);
                    color : white;
                    top : 13vh;
                    left : 63vw;
                }
                .slider-controls {
                    padding-top : 2%;
                    
                    text-align: center;
                }
                .slider-controls button {
                    background-color: rgb(77,77,77);
                    color : white;
                    border : 0;
                    font-weight: bold;
                    border-radius: 6px;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    padding-left : 2%;
                    padding-right : 2%;
                    cursor: pointer;
                }
                .main-2 {
                    padding-top : 5%;
                    padding-bottom : 5%;
                    font-size : 25px;
                    font-weight: bold;
                    margin-left : 5%;
                    font-family: Arial, Helvetica, sans-serif;
                    border-bottom: 1px solid rgb(239, 239, 239);
                    margin-right : 5%;
                }
                .main-4, .main-5 {
                    padding-top : 5%;
                    padding-bottom : 5%;
                    font-size : 18px;
                    font-weight: bold;
                    margin-left : 5%;
                    font-family: Arial, Helvetica, sans-serif;
                    border-bottom: 1px solid rgb(239, 239, 239);
                    margin-right : 5%;
                }
                .main-6,.main-7 {
                    padding-top : 5%;
                    padding-bottom : 5%;
                    font-size : 18px;
                    font-weight: bold;
                    margin-left : 5%;
                    border-bottom: 1px solid rgb(239, 239, 239);
                    margin-right : 5%;
                }
                .m2-option {
                    list-style: square ;
                    list-style-position: inside;
                    color : #898989;
                    font-size : 12.5px;
                    padding-top : 2%;
                    padding-left : 1%;
                }
                .m2-count {
                    font-size : 14px;
                    color: #898989;
                    padding-top : 3%;
                }
                .m2-img img{
                    position : relative;
                    top : 0.6vh;
                    width : 22px;
                }
                .main-3 {
                    padding-top : 3%;
                    padding-left : 5%;
                    padding-right : 5%;
                }
                .m3-title {
                    color : #ee2323;
                    font-weight: bold;
                    font-size : 14px;
                }
                .m3-info1 img, .m3-info2 img{
                    width : 22px;
                    position : relative;
                    top : 0.7vh;
                }
                .main-3 {
                    font-family: Arial, Helvetica, sans-serif;
                    font-size : 14px;
                    color : rgb(58, 58, 58);
                    border-bottom : 10px solid #898989;
                }
                .m3-info3 {
                    display: flex;
                    justify-content: space-between;
                    padding-top : 5%;
                    
                }
                .i3-left {
                    font-weight: bold;
                    font-size : 12px;
                    
                    padding-top : 2%;
                }
                .i3-right {
                    font-size : 22px;
                    font-weight: bold;
                }
                .m3-info4 {
                    padding-top : 3%;
                    padding-bottom : 8%;
                }
                .m3-btn {
                    border : 1px solid rgba(58,58,58,0.2);
                    text-align: center;
                    padding-top : 2%;
                    padding-bottom : 2%;
                    font-weight: bold;
                    border-radius: 4px;
                    cursor: pointer;
                }
                .btn-info {
                    display : none;
                    border : 1px solid;
                    border-radius : 4px;
                    padding-left : 2%;
                    padding-top : 3%;
                }
                .btn-infoz {
                    display : block;
                    border : 1px solid;
                    border-radius : 4px;
                    padding-left : 2%;
                    padding-top : 3%;
                }
                .btn-top img {
                    width : 30px;
                    cursor: pointer;
                }
                .btn-title {
                    padding-top : 3%;
                    padding-bottom : 3%;
                    padding-left : 3%;
                    font-size : 20px;
                    font-weight: bold;
                    border-bottom : 1px solid rgb(239, 239, 239);
                }
                .btn-mid1 {
                    padding-top : 2%;
                    padding-bottom : 2%;
                    margin-left : 3%;
                    margin-right : 3%;
                    color : black;
                    font-weight: bold;
                    font-size : 16px;
                    border-bottom : 1px solid rgb(239, 239, 239);
                }
                .btn-mid2 {
                    padding-top : 3%;
                    padding-bottom : 3%;
                    margin-left : 3%;
                    margin-right : 3%;
                    font-weight: bold;
                    border-bottom : 1px solid rgb(239, 239, 239);
                }
                .btn-mid3 {
                    padding-top : 3%;
                    padding-bottom : 3%;
                    margin-left : 3%;
                    margin-right : 3%;
                    font-weight: bold;
                }
                .btn-bottom {
                    margin-left : 3%;
                    margin-right : 3%;
                }
                .btn-blue {
                    color : #2987F0;
                }
                .mid2-info1, .mid2-info2 {
                    display : flex;
                    justify-content: space-between;
                }
                .mid2-info1 {
                    
                    margin-bottom : 2%;
                }
                .normal {
                    padding-top : 0.7%;
                }
                .nr-price {
                    font-size : 17px;
                }
                .coupon {
                    color: rgba(58, 58, 58, 0.4);
                }
                .mid3-detail {
                    display: flex;
                    justify-content: space-between;
                }
                .total {
                    padding-top : 2%;
                }
                .mid3-price {
                    color : #2987F0;
                    font-size : 24px;
                }
                .caution {
                    background-color: rgb(239, 239, 239);
                    border-radius: 4px;
                    padding-left : 3%;
                    padding-top : 3%;
                    padding-bottom : 3%;
                    margin-bottom : 3%;
                }
                .ca-title {
                    font-weight: bold;
                    padding-bottom : 2%;
                }
                .ca-textarea {
                    
                }
                .ca-textarea li {
                    padding-left : 10px;
                    padding-right : 10px;
                    word-break: keep-all;
                    display: flex;
                    align-items: baseline;
                }
                .ca-textarea li::before {
                    content: " · ";
                }
                .m4-ul {
                    padding-top : 3%;
                    list-style-position: inside;
                    font-size : 14px;
                }
                .m4-ul li {
                    padding-left : 10px;
                    padding-right : 10px;
                    word-break: keep-all;
                    display: flex;
                    align-items: baseline;
                }
                .m4-ul li::before {
                    content: " · ";
                }
                .m4-ul span {
                    padding-left : 2%;
                }
                .m5-text, .m7-text {
                    padding-top : 3%;
                    padding-left : 2%;
                    font-weight: 500;
                    font-size : 16px;
                }
                .m6t1 {
                    
                    margin-top : 3%;
                }
                .m6t1-name {
                    display : flex;
                    background-color: rgb(234, 234, 234);
                    border-top-left-radius: 7px;
                    border-top-right-radius: 7px;
                }
                .in-name, .out-name {
                    width : 50%;
                    text-align: center;
                    padding-top : 2%;
                    padding-bottom : 2%;
                    font-size : 14px;
                }
                .m6t1-time {
                    display : flex;
                    background-color: rgb(245, 245, 245);
                    border-bottom-left-radius: 7px;
                    border-bottom-right-radius: 7px;
                }
                .in-time, .out-time {
                    width : 50%;
                    text-align: center;
                    padding-top : 2%;
                    padding-bottom : 2%;
                    font-size : 14px;
                    font-weight : 500;
                }
                .m7-text {
                    color: rgb(58, 58, 58);
                    font-size: 15px;
                }
                .text-detail {
                    list-style: none;
                    color: rgb(58, 58, 58);
                    font-size: 15px;
                }
                .text-title {
                    padding-bottom : 3%;
                }
                .text-span {
                    white-space: pre-line;
                }
                .reserv {
                    margin-top : 5%;
                    padding-bottom : 3%;
                    
                    
                    height : 7vh;
                    
                }
                .reserv-btn {
                    color : white;
                    font-weight: bold;
                    font-size : 13px;
                    cursor: pointer;
                    height : 5vh;
                    line-height : 5vh;
                    padding-top : 0.5%;
                    padding-bottom : 0.5%;
                    border-radius: 4px;
                    text-align: center;
                    background-color: rgb(54, 143, 255);
                    border:none;
                    width : 845px;
                }
                .reserv-fix {
                    position: fixed;
                    bottom : 0;
                    padding-top : 2%;
                    border-top : 1px solid #F2F2F2;
                    width : 40%;
                    padding-bottom: 2%;
                    background-color: white;
                }
            </style>

        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <a href="#"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU"></a>
                        </div>
                        <div class="hd-mid">
                            <span>${det.ROOM_NAME }</span>
                        </div>
                    </div>
                </div>
            </header>
            <div class="main">
                <div class="main-1">
                    <div class="m1-mid">
                        <div class="slider">
                            <div><img src="https://www.utopmarina.com/UtopMarinaNew_common/images/homepage/acco/01_deluxeDouble02.jpg" alt="Image 1"></div>
                            <div><img src="https://www.utopmarina.com/UtopMarinaNew_common/images/homepage/acco/01_deluxeDouble08.jpg" alt="Image 2"></div>
                            <div><img src="https://yaimg.yanolja.com/v5/2022/08/22/15/640/6303a569c12e41.61667707.jpg" alt="Image 3"></div>
                          </div>
                        
                          <div class="slider-controls">
                            <button class="prev-button">이전</button>
                            <span class="counter"><span class="current-slide">1</span>/<span class="total-slides">3</span></span>
                            <button class="next-button">다음</button>
                          </div>
                        
                          <script>
                            $(document).ready(function(){
                              var $slider = $('.slider');
                              var $counter = $('.counter');
          
                              $slider.on('init reInit afterChange', function(event, slick, currentSlide, nextSlide){
                                  var i = (currentSlide ? currentSlide : 0) + 1;
                                  var total = slick.slideCount;
                                  $counter.find('.current-slide').text(i);
                                  $counter.find('.total-slides').text(total);
                              });
          
                              $slider.slick({
                                  autoplay: false,
                                  dots: false,
                                  infinite: true,
                                  speed: 400,
                                  slidesToShow: 1,
                                  slidesToScroll: 1,
                                  prevArrow: $('.prev-button'), 
                                  nextArrow: $('.next-button'), 
                                  easing: 'easeInOutExpo' 
                              });
                              });
                          </script>
                        
                    </div>
                </div>
                
                
                
		<div class="i3-right">
		    <span id="formattedPrice"></span>
		</div>
                
                <div class="main-2">
                    <div class="m2-title">
                        <span>${det.ROOM_NAME }</span>
                    </div>
                    <div class="m2-detail">
                        <div class="m2-count">
                            <span class="m2-img">
                                <img src="https://assets.triple.guide/images/hotels/room-basic-info-icons/ico-person@3x.png">
                            </span>
                            <span>최대 ${det.MAXPEOPLE }인</span>
                        </div>
                        
                        <ul class="m2-option">
                        <c:if test="${det.SMOKE ne null }">
                            <li>${det.SMOKE }</li>
                        </c:if>
                        <c:if test="${det.ROOM_VIEW_NAME ne null }">
                            <li>${det.ROOM_VIEW_NAME }</li>
                        </c:if>
                        <c:if test="${det.ROOM_SIZE ne null }">
                            <li>${det.ROOM_SIZE }</li>
                        </c:if>
                        <c:if test="${det.BED_KIND_NAME ne null }">
                            <li>${det.BED_KIND_NAME }</li>
                        </c:if>
                        </ul>
                    </div>
                </div>
                <div class="main-3">
                    <div class="m3-title">
                        <span>${det.CANCELLATION }</span>
                    </div>
                    <c:if test="${det.BREAKFAST ne null}">
                    <div class="m3-info1">
                        <img src="https://assets.triple.guide/images/hotels/room-basic-info-icons/ico-check@3x.png">
                        <span> ${det.BREAKFAST }</span>
                    </div>
                    </c:if>
                    <div class="m3-info1">
                        <img src="https://assets.triple.guide/images/hotels/room-basic-info-icons/ico-check@3x.png">
                        <span> ${det.ROOM_VIEW_NAME }</span>
                    </div>
                    <div class="m3-info2">
                        <img src="https://assets.triple.guide/images/hotels/room-basic-info-icons/ico-person@3x.png">
                        <span> 2인 기준 / 최대 ${det.MAXPEOPLE }인</span>
                    </div>
                    <div class="m3-info3">
                        <div class="i3-left">
                            <span>1박, 세금포함</span>
                        </div>
                        <div class="i3-right">
                            <span id="roomprice">원</span>
                        </div>
                    </div>
                    <div class="m3-info4">
                        <div class="m3-btn" id="showprice" onclick="showlist()">
                            결제 예상 금액 정보
                        </div>
                        <div class="btn-info" id="exitprice">
                            <div class="btn-top">
                                <img onclick="closelist()" src="https://cdn-icons-png.flaticon.com/512/109/109602.png">
                            </div>
                            <div class="btn-title">
                                <span>예상 결제금액 정보</span>
                            </div>
                            <div class="btn-mid1">
                                <span>${startDate} </span>ㅡ<span class="btn-blue">${fn:replace(duration, 'days', '일')} </span>ㅡ<span> ${endDate }</span>
                                
                            </div>
                            <div class="btn-mid2">
                                <div class="mid2-info1">
                                    <div class="normal">
                                        <span>기본요금</span>
                                    </div>
                                    <div class="nr-price">
                                        <span id="brp"></span>
                                    </div>
                                </div>
                                <div class="mid2-info2">
                                    <div class="coupon">
                                        <span>쿠폰할인</span>
                                    </div>
                                    <div class="cu-price">
                                        <span>보유한 쿠폰 없음</span>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-mid3">
                                <div class="mid3-detail">
                                    <div class="total">
                                        <span>총 금액</span>
                                    </div>
                                    <div class="mid3-price">
                                        <span id="trp"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-bottom">
                                <div class="caution">
                                    <div class="ca-title">
                                        <span>유의사항</span>
                                    </div>
                                    <div class="ca-text">
                                        <ul class="ca-textarea">
                                            <li>총 금액은 세금이 포함된 결제 예상금액입니다.</li>
                                            <li>보유한 쿠폰 중 최대로 할인되는 쿠폰이 자동 적용됩니다.</li>
                                            <li>다음의 경우, 추가 요금이 발생해 현장에서 결제가 필요할 수 있습니다. (기준 인원보다 많은 인원이 투숙, 혜택에 포함되지 않은 부가서비스 이용, 해외 일부 지역의 도시세 및 리조트 피 등)</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
					const roomPriceStr = "${det.ROOM_PRICE}".replace(/,/g, ''); 
					const roomPrice = parseFloat(roomPriceStr); 
					const formattedPrice = roomPrice.toLocaleString('ko-KR');

					const rp = document.getElementById("roomprice");
					const brp = document.getElementById("brp");
					const trp = document.getElementById("trp");
					
					rp.innerText = formattedPrice+"원";
					brp.innerText = formattedPrice+"원";
					trp.innerText = formattedPrice+"원";
					
				</script>
                <script>
                    function showlist() {
                        const open = document.getElementById("showprice");
                        const openDiv = open.className;
                        const close = document.getElementById("exitprice");
                        const closeDiv = close.className;
                        
                        if(openDiv == "m3-btn") {
                            close.className = "btn-infoz";
                        }
                    }
                    function closelist() {
                        const close = document.getElementById("exitprice");
                        close.className = "btn-info";
                    }
                </script>
                <div class="main-4">
                    <div class="m4-title">
                        <span>취소 규정</span>
                    </div>
                    <ul class="m4-ul">
                        <li>
                            <span>${det.CANCELLATION }</span>
                        </li>
                    </ul>
                </div>
				<c:if test="${blist ne null }">
					<div class="main-5">
						<div class="m5-title">
							<span>객실 혜택</span>
						</div>
						<div class="m5-text">
								<c:forEach var="benefit" items="${blist }">
									<span>${benefit }</span>
								</c:forEach>
								<br>
								<br>
						</div>
					</div>
				</c:if>
		<div class="main-6">
                    <div class="m6-title">
                        <span>체크인/체크아웃 시간</span>
                    </div>
                    <div class="m6-text">
                        <div class="m6t1">
                            <div class="m6t1-name">
                                <div class="in-name">
                                    <span>체크인</span>
                                </div>
                                <div class="out-name">
                                    <span>체크아웃</span>
                                </div>
                            </div>
                            <div class="m6t1-time">
                                <div class="in-time">
                                    <span>${det.CHECKIN }</span>
                                </div>
                                <div class="out-time">
                                    <span>${det.CHECKOUT }</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-7">
                    <div class="m7-title">
                        <span>이용 안내</span>
                    </div>
                    <div class="m7-text">
                        <div class="text-title">
                            <span>${det.ROOM_CONDITION }</span>
                        </div>
                    </div>
                </div>
                <div class="main-7">
                    <div class="m7-title">
                        <span>예약 공지</span>
                    </div>
                    <div class="m7-text">
                        <div class="text-title">
                            <span>${det.NOTICE }<br>
                                체크인 ${det.CHECKIN }, 체크아웃 ${det.CHECKOUT }</span>
                        </div>
                    </div>
                </div>
                <div class="reserv">
                    <div class="reserv-fix">
                        <div class="reserv-btn">
                            <form id="reservationForm" name="aa" method="post" action="${cpath}/admin/member/accom/rvRoom">
							    <input type="hidden" name="room_seq" value="${det.ROOM_SEQ}">
							    <input type="hidden" name="selectedButtons" value="${selectedButtons}">
							    <input type="hidden" name="totalCount" value="${totalCount}">
							    <input type="hidden" name="result" value="${result}">
							    <input type="hidden" name="startDate" value="${startDate }">
							    <input type="hidden" name="endDate" value="${endDate }">
							    <input type="hidden" name="duration" value="${duration }">
							    <input type="hidden" name="login" value="${login }">
							    <input type="submit" class="reserv-btn" value="예약하기">
							</form>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
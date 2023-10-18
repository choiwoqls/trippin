<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
            <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lzc8p76rjy&submodules=geocoder"></script>
            <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
            <script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
            <meta charset="utf-8">
            <!-- include summernote css/js -->
			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
			
			<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
			<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
			            
            <c:set var="cpath" value="${pageContext.request.contextPath }" />
            <script src="${cpath}/resources/js/httpRequest.js"></script>

            <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
            <title>나를 아는 여행 앱, 트리플</title>

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">

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
                .back-btn {
                    padding-left : 15%;
                    padding-top : 3%;
                }
                .back-btn input {
                    padding-left : 2%;
                    padding-right : 2%;
                    padding-top : 0.5%;
                    padding-bottom : 0.5%;
                    cursor: pointer;
                    background-color: white;
                    border-radius: 10px;
                    font-weight : bold;
                    box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
                    border : 2px solid rgb(77,77,77);
                }
                .back-btn input:hover {
                    background: rgb(77,77,77);
                    color : #fff;
                }
                .main {
                    width : 100%;
                }
                .main-detail {
                    width : 70%;
                    margin : 0 auto;
                    border-top : 2px solid;
                }
                .mi-one {
                    display : flex;
                    height: auto;
                    line-height: 10vh;
                    border-bottom : 1px solid #E8E8E8;
                }
                
                .mi-one2{
					border-bottom: 1px solid #E8E8E8;
					/* padding: 1%; */
					display: flex;
					line-height: 10vh;
				}
                
                .mi-name {
                    width : 20%;
                    padding-left : 2%;
                    font-weight: bold;
	                font-size: 18px;
                }
                .input-one, .input-two {
                    width : 80%;
                }
                .input-two2{
                	width: 65%;
                }
                
                .input-one input {
                    width : 70%;
                    height : 5.5vh;
                    border: 2px solid #E8E8E8;
                }
                .input-one input:focus {
                    border: 2px solid #50E3C2;
	                
                }
                .date-check {
                    font-weight: bold;
                }
                .io-info {
                    line-height: 3vh;
                    margin-top : -2vh;
                    color : #CDCDCD;
                    font-weight: bold;
                    padding-left : 1%;
                    font-size: 12px;
                }
                .io-info span {
                    color : red;
                }
                .input-two input {
                    margin-right : 1%;
                }
                .input-two label {
                    padding-right : 3%;
                    font-weight: bold;
                }
                .input-two2 input {
                    margin-right : 1%;
                }
                .input-two2 input[type=text] {
                    width: 86%;
				    height: 5.5vh;
				    border: 2px solid #E8E8E8;
                }
                .input-two2 label {
                    padding-right : 3%;
                    font-weight: bold;
                }
                .foot {
                    padding-top : 3%;
                    padding-bottom : 2%;
                    text-align: center;
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
                .info-check {
                    color : #ed0086;
                }
                .info-tcheck {
                    color : #8E8EA0;
                    font-weight: bold;
                    font-size : 14px;
                }
                .icheck-input {
                    position: relative;
                    top : 0.25vh;
                    left : 2vw;
                }
                .input-one select {
                    border : 0;
                    border-bottom : 1px solid #CDCDCD;
                    padding-bottom : 1vh;
                    color : #54616C;
                }
                .cate_area1{
                	width: 120px;
                }
                .cate_area2{
                	width: 140px;
                }
                .cate_area3{
                	width: 140px;
                }
                select::-ms-expand {
					display: none;
				}
                .scity {
					-o-appearance: none;
					-webkit-appearance: none;
					-moz-appearance: none;
					appearance: none;
					width: 150px;
					height: 35px;
					background:
						url('https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png')
						calc(100% - 5px) center no-repeat;
					background-size: 20px;
					padding: 5px 30px 5px 10px;
					border: 0px;
					outline: 0 none;
				}
				
				.sbox {
					position: relative;
					width: 150px;
					height: 35px;
					border-radius: 4px;
					border: 2px solid #50E3C2;
				}
				
				.sobx .scity {
					width: inherit;
					height: inherit;
					background: transparent;
					border: 0 none;
					outline: 0 none;
					padding: 0 5px;
					position: relative;
					z-index: 3;
				}
				
				.sbox .scity option {
					background: gray;
					color: #fff;
					padding: 3px 0;
					font-size: 15px;
				}
				
				.sbox .sarrow {
					position: absolute;
					top: 0;
					right: 0;
					z-index: 1;
					width: 35px;
					height: inherit;
					border-left: 2px solid #50E3C2;
					display: flex;
					justify-content: center;
					align-items: center;
				}
				
				.sbox .sarrow img {
					width: 50%;
					transition: 0.5s;
					background-color: white;
				}
				
				.sbox .scity:focus+.sarrow img {
					transform: rotate(180deg);
				}
				
				#vouchertime, #min_people{
					width: 45px;
				}
				.ticketContent, .special_info, .use_info, .more_info, .faq{
					margin-top: 3%;
				}
				#sell_date_check{
					margin-left: 6%;
				}
				.disable{
					width: 15%;
					font-weight: bold;
				}
				#validDateCheck{
					margin-left: 10%;
				}
                textarea {
                	resize : none;
                	outline : none;
                	padding-top : 2%;
                	padding-left : 3%;
                	font-size : 16px;
                }
                .notice{
                	padding-left: 15%;
    				padding-top: 1.5%;
    				font-weight: bold;
    				font-size: 15px;
                }
            </style>

        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <img
                                src="https://business.yanolja.com/common/kr/web/img/icon-home.png" onclick="document.location.href='${cpath}/admin/main'" style="cursor: pointer;"> 
                                > 관리자 > 업체 등록 > 티켓·투어 등록
                        </div>
                    </div>
                </div>
                <div class="title">
                    <div class="mtitle">티켓·투어 등록</div>
                    <div class="stitle">
                        나를 아는 여행앱 &nbsp;
                        <span class="stitle-logo">Trippin'</span>
                    </div>
                </div>
                <div class="back-btn">
                    <input type="button" value="목록으로" onclick="location.href='${cpath}/admin/ticketList'">
                </div>
                <div class="notice">
                	<font color="red">*</font> 는 필수 입력 항목입니다.
                </div>
            </header>
            <div class="main">
                <div class="main-detail">
                    <form method="post" enctype="multipart/form-data">
                        <input type="hidden" name="ticket_seq" value="${ticket_seq }" id="ticket_seq">
                        <div class="mi-one">
                            <div class="mi-name">상품명<font color="red">*</font></div>
                            <div class="input-one">
                                <input type="text" name="ticket_name" value="${vo.ticket_name }">
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">카테고리<font color="red">*</font></div>
                            <div class="input-two" style="display: flex;">
                            	<div class="cate_area1">
	                            	<select name="ticket_cate_no" id="tcn">
	                            		<option value="0" id="word">----[필수]----</option>
	                            		<c:forEach var="tc" items="${tclist }">
	                            			<option value="${tc.ticket_cate_seq }" ${cate_seqList[0] == tc.ticket_cate_seq ? 'selected' : 0 }>${tc.ticket_cate_name }</option>
	                            		</c:forEach>
	                            	</select>
                            	</div>
                            	<div class="cate_area1">
	                            	<select name="ticket_cate_no">
	                            		<option value="0" id="word">----[선택]----</option>
	                            		<c:forEach var="tc" items="${tclist }">
	                            			<option value="${tc.ticket_cate_seq }" ${cate_seqList[1] == tc.ticket_cate_seq ? 'selected' : 0 }>${tc.ticket_cate_name }</option>
	                            		</c:forEach>
	                            	</select>
                            	</div>
                            	<div class="cate_area1">
	                            	<select name="ticket_cate_no">
	                            		<option value="0" id="word">----[선택]----</option>
	                            		<c:forEach var="tc" items="${tclist }">
	                            			<option value="${tc.ticket_cate_seq }" ${cate_seqList[2] == tc.ticket_cate_seq ? 'selected' : 0 }>${tc.ticket_cate_name }</option>
	                            		</c:forEach>
	                            	</select>
                            	</div>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">상품 사진<font color="red">*</font></div>
                            <div class="input-two">
                                <input type="file" name="files" multiple="multiple">
                                <div class="io-info">
                                    <span>*</span> 첫번째 사진은 메인사진이 됩니다.
                                </div>
                            </div>
                        </div>
                        
                        <div class="mi-one2" style="line-height : 0;">
							<div class="mi-name" style="line-height : 10vh;">지역<font color="red">*</font></div>
							<div class="input-one" style="display: flex; padding-top : 2.5%;">
								<div class="sbox">
									<select class="scity" name="addr1_seq" id="citykindz" onchange="citykindchange(this)">
										<option value="0">선택하세요</option>
										<c:forEach var="a1" items="${addr1list }">
											<option value="${a1.addr1_seq }" ${addr1_seq == a1.addr1_seq ? 'selected' : '' }>${a1.addr1_name }</option>
										</c:forEach>
									</select> 
									<span class="sarrow">
										<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3-ywUVHBNam3DS8gXfLDGYf7lpS98npeAhw&usqp=CAU" alt="">
									</span>
								</div>
								<div class="sbox" style="margin-left: 2%;">
									<select class="scity" id="citykindy" name="addr2_seq">
										<option value="${vo.addr2_seq }">${addr2_name }</option>
									</select> 
									<span class="sarrow">
										<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3-ywUVHBNam3DS8gXfLDGYf7lpS98npeAhw&usqp=CAU" alt="">
									</span>
								</div>
								<script>
								
								function  citykindchange(e) {
								$.ajax({
										url:"${pageContext.request.contextPath}/admin/area",
										type:"post",
										data:{addr1_seq:e.value},
										success: function sc(data) {
											let sity = document.querySelector('#citykindy');
											sity.innerHTML = '';
											data.forEach(s => {
												let newOp = document.createElement("option");
												newOp.value = s.addr2_seq;
												newOp.innerText = s.addr2_name;
												sity.appendChild(newOp);
											})
										}
										
									})
									 
								}
									
								</script>
							</div>
						</div>
                        <div class="mi-one">
                            <div class="mi-name">한 줄 소개</div>
                            <div class="input-one">
                                <input type="text" name="ticket_intro" value="${vo.ticket_intro }">
                                <div class="io-info">
                                    <span>*</span> 목록에서 보이는 소개글이 됩니다.
                                </div>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">바우처</div>
                            <div class="input-two2"> 
                                <input type="radio" name="voucher" value="0" ${vo.voucher == 0 ? 'checked' : '' } class="candy" id="now" onclick="hereVoucher();"><label for="now">즉시 제공</label>
                                <input type="radio" name="voucher" class="candy" id="time" onclick="hereVoucher();">
                                <label for="time" style="padding-right: 0%;">최대</label> <input type="number" class="candy" name="voucher" value="${vo.voucher != 0 ? vo.voucher : '' }" id="vouchertime" min="0"><label for="time">시간 소요</label>
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="voucher" value="-1" id="none" onclick="disableThis('candy', 'none');"><label for="none">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">취소 여부</div>
                            <div class="input-two2">
                                <input type="radio" name="cancel_status" value="0" class="cancel" id="yesCancel"><label for="yesCancel">취소 불가</label>
                                <input type="radio" name="cancel_status" value="1" class="cancel" id="noCancel"><label for="noCancel">취소 가능</label>
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="cancel_status" value="-1" id="cancelDisable" onclick="disableThis('cancel', 'cancelDisable');"><label for="cancelDisable">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">사용 방법</div>
                            <div class="input-two2">
                                <input type="text" name="usemethod" class="usemethod">
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="usemethod" value="" id="usemethodDisable" onclick="disableThis('usemethod', 'usemethodDisable');"><label for="usemethodDisable">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">투어파트너<font color="red">*</font></div>
                            <div class="input-two">
                            	<select name="t_partner_seq">
                            		<option value="0">--선택하기--</option>
                            		<c:forEach var="ptn" items="${ptnlist }">
                            			<option value="${ptn.t_partner_seq }">${ptn.t_partner_name }</option>
                            		</c:forEach>
                            	</select>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">설명 제목<font color="red">*</font></div>
                            <div class="input-one">
                                <input type="text" name="title">
                                <div class="io-info">
                                    <span>*</span> 상품 페이지 내 설명란 타이틀
                                </div>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">상품 설명<font color="red">*</font></div>
                            <div class="input-two">
                                <textarea name="content" rows="15px" cols="62px" class="ticketContent"></textarea>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">판매 기간</div>
                            <div class="input-two2">
                                <input type="date" name="sell_date" id="sell_date_cal" class="selldate">
                                <input type="checkbox" id="sell_date_check" onclick="sell_date_func()" class="selldate"><label for="sell_date_check">직접 입력</label>
                                <input type="text" name="sell_date" id="sell_date" placeholder="년-월-일 형식으로 입력" disabled="disabled" style="width: 30%;" class="selldate">
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="sell_date" value="" id="selldateDisable" onclick="disableThis('selldate', 'selldateDisable');"><label for="selldateDisable">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">유효 기간</div>
                            <div class="input-two2">
                                <input type="radio" name="valid_type" value="0" id="period" class="validType" onclick="hereValid_type(0)"><label for="period">기간</label>
                                <input type="radio" name="valid_type" value="1" id="endDay" class="validType" onclick="hereValid_type(1)"><label for="endDay">날짜</label>
                            	<div id="inputValid_Date"></div>
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="valid_type" value="-1" id="validtypeDisable" onclick="disableThis('validType', 'validtypeDisable');"><label for="validtypeDisable">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">최소 인원</div>
                            <div class="input-two2">
                                <input type="number" name="min_pp" class="min_pp" id="min_people" min="0" width="10px">명
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="min_pp" value="-1" id="min_ppDisable" onclick="disableThis('min_pp', 'min_ppDisable');"><label for="min_ppDisable">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">투어 타입</div>
                            <div class="input-two2">
                            	<select name="tour_type" class="tourType">
                            		<option value="0">---[선택]---</option>
                            		<option value="혼자">혼자</option>
                            		<option value="그룹">그룹</option>
                            	</select>
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="tour_type" value="" id="tour_typeDisable" onclick="disableThis('tourType', 'tour_typeDisable');"><label for="tour_typeDisable">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">사용 언어</div>
                            <div class="input-two2">
                            	<input type="checkbox" name="language" class="language" id="korean" value="한국어"><label for="korean">한국어</label>
                                <label>그 외: </label><input type="text" name="language" class="language" style="width:60%;">
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="language" value="" id="languageDisable" onclick="disableThis('language', 'languageDisable');"><label for="languageDisable">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">이용 조건</div>
                            <div class="input-two2">
                                <input type="text" name="use_condition" class="use_condition">
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="use_condition" value="" id="use_conditionDisable" onclick="disableThis('use_condition', 'use_conditionDisable');"><label for="use_conditionDisable">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name" style="width: 10%;">상세 정보</div>
                            <div class="input-two2" style="width: 76%; margin-top: 7%; margin-bottom: 2%;">
									<textarea id="summernote" name="ticket_summer" rows="200" cols="120"></textarea>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">특별 약관</div>
                            <div class="input-two2">
                                <textarea name="special_info" rows="15px" cols="62px" class="special_info"></textarea>
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="special_info" value="" id="special_infoDisable" onclick="disableThis('special_info', 'special_infoDisable');"><label for="special_infoDisable">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">사용 방법<br>(예약 정보 확인)</div>
                            <div class="input-two2">
                                <textarea name="use_info" rows="15px" cols="62px" class="use_info"></textarea>
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="use_info" value="" id="use_infoDisable" onclick="disableThis('use_info', 'use_infoDisable');"><label for="use_infoDisable">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="mi-one" style="line-height: 5vh; padding-bottom: 2%;">
                            <div class="mi-name">포함/불포함 사항</div>
                            <div class="input-two2">
                                <table border="1" style="cellpacing:0; margin-top: 3%; margin-bottom: 3%;" >
                                	<tr style="width:33%; line-height: 3vh;">
                                		<th>항목</th>
                                		<th>포함</th>
                                		<th>불포함</th>
                                	</tr>	
                                	<c:forEach var="it" items="${inclItmsList }" varStatus="i">
	                                	<tr style="width:33%; line-height: 3vh;">
	                                		<td>${it.include_item }</td>
	                                		<th>
	                                			<input type="checkbox" name="include" id="include${i.count }" class="include" value="${it.include_items_seq }" onclick="hereInclude();">
	                                		</th>
											<th>
												<input type="checkbox" name="not_include" id="not_include${i.count }" class="include" value="${it.include_items_seq }" onclick="hereInclude();">
											</th>
										</tr>	                                		
                                	</c:forEach>
                                </table>
                                <div>
                                	<label>그 외 포함 사항: </label><input type="text" name="include" class="include">
                                </div>
                                <div>
                                	<label>그 외 불포함 사항: </label><input type="text" name="not_include" class="include">
                                </div>
                            </div>
                            <div class="disable">
	                        	<input type="checkbox" name="include" id="includeDisable" onclick="disableThis('include', 'includeDisable');"><label for="includeDisable">해당사항 없음</label>
	                        </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">꼭 알아두세요</div>
                            <div class="input-two2">
                                <textarea name="more_info" rows="20px" cols="62px" class="more_info">==업체 정보==
==상품 문의 연락처==
==이용 정보==
==고객 센터 정보==</textarea>
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="more_info" value="" id="more_infoDisable" onclick="disableThis('more_info', 'more_infoDisable');"><label for="more_infoDisable">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">자주 묻는 질문</div>
                            <div class="input-two2">
                                <textarea name="faq" rows="15px" cols="62px" class="faq"></textarea>
                            </div>
                            <div class="disable">
                            	<input type="checkbox" name="faq" value="" id="faqDisable" onclick="disableThis('faq', 'faqDisable');"><label for="faqDisable">해당사항 없음</label>
                            </div>
                        </div>
                        <div class="foot">
                            <div class="ft-submit">
                                <input class="fts-one" type="button" value="등록하기" onclick="checkii(this.form);"> 
                            </div>
                        </div>
                    </form>
                </div>
            </div>
	    <script type="text/javascript">
	
	        
            function disableThis(v, v2){
            	var candy = document.querySelectorAll("."+v);
            	var check = document.getElementById(v2);
            	var ck = false;
            	console.log(candy);
            	if(check.checked){
            		ck = true;
            	}
	           	for(let i=0; i<candy.length; i++){
	           		candy[i].disabled = ck;
	           		
	           		if(i == 2 && candy[2].id == 'sell_date'){
	           			candy[2].disabled = true;
	           		}
	           	}
            }
            
	        
            function hereVoucher(){
            	var now = document.getElementById("now");
            	var time = document.getElementById("time");
            	var vouchertime = document.getElementById("vouchertime");
            	var none = document.getElementById("none");
            	
            	if(now.checked){
            		vouchertime.disabled = true;
            	}
            	if(time.checked){
            		vouchertime.disabled = false;
            	}
            }
            
	        
	        function sell_date_func(){
	        	var sell_date_cal = document.getElementById("sell_date_cal");
	        	var sell_date_check = document.getElementById("sell_date_check");
	        	var sell_date = document.getElementById("sell_date");
	        	
	        	
	        	if(sell_date_check.checked){
	        		sell_date_cal.disabled = true;
		        	sell_date.disabled = false;
	        	}else{
	        		sell_date_cal.disabled = false;
		        	sell_date.disabled = true;
	        	}
	        }
	        
	        
	        function hereValid_type(v){
	        	var inputValid_Date = document.getElementById("inputValid_Date");
	        	
	        	if(v == 0){
	        		inputValid_Date.innerHTML = '구매 후 <input type="text" name="valid_date" class="validType" style="width: 8%; height: 3.5vh;">일';
	        	}else{
	        		inputValid_Date.innerHTML = 
	        			'<input type="date" name="valid_date" class="validType" id="start">부터&nbsp; <input type="date" name="valid_date" class="validType">까지'
	        			+ '<input type="checkbox" class="validType" id="validDateCheck" onclick="hereValid_Date();"><label for="validDateCheck">마감 날짜만</label>';
	        	}
	        }
	        
	        function hereValid_Date(){
	        	var validDateCheck = document.getElementById("validDateCheck");
	        	var start = document.getElementById("start");
	        	
	        	if(validDateCheck.checked){
	        		start.disabled = true;
	        	}else{
	        		start.disabled = false;
	        	}
	        }
		        
	        
	        function hereInclude(){
				for(var i = 1; i < ${inclItmsList.size()+1 }; i++){
					
					if(document.getElementById("include"+i).checked){
						document.getElementById("not_include"+i).disabled = true;
					}else if(!document.getElementById("include"+i).checked){
						document.getElementById("include"+i).disabled = false;
						document.getElementById("not_include"+i).disabled = false;
					}
					
					if(document.getElementById("not_include"+i).checked){
						document.getElementById("include"+i).disabled = true;
					}
				}
			}
	        
	        
	        
	        
	      //summernote 부분 
			function textEdit(){
			   jsonArray = [];
			   
			   $('#summernote').summernote({
			         height: 500,                 // 에디터 높이
			         minHeight: null,             // 최소 높이
			         maxHeight: null,             // 최대 높이
			         focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			         lang: "ko-KR",					// 한글 설정
			        toolbar: [
			           // [groupName, [list of button]]
			           ['fontname', ['fontname']],
			           ['fontsize', ['fontsize']],
			           ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			           ['color', ['forecolor','color']],
			           ['table', ['table']],
			           ['para', ['ul', 'ol', 'paragraph']],
			           ['height', ['height']],
			           ['insert',['picture','link','video']],
			           ['view', ['fullscreen', 'help']]
			         ],
			       fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			       fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			       callbacks: {
			         onImageUpload : function(files){
			        	   console.log("onImageUpload", JSON.stringify(files));
			               // 파일 업로드(다중업로드를 위해 반복문 사용)
			               for (var i = files.length - 1; i >= 0; i--) {
			                   uploadSummernoteImageFile(files[i], this);
			               }
			          }
			    } 
			 });
			
			   $('#summernote').summernote('fontSize', '14');
			
			   function uploadSummernoteImageFile(file, el) {
			       var data = new FormData();
			       var ticket_seq = document.getElementById("ticket_seq").value;
			       data.append("file",file);
			           $.ajax({
			             url: '${ pageContext.request.contextPath }/summer_image2?ticket_seq='+ticket_seq,
			             type: "POST",
			             enctype: 'multipart/form-data',
			             data: data,
			             cache: false,
			             contentType : false,
			             processData : false,
			             success : function(data) {
			                       var json = JSON.parse(data);
			                       console.log(json);
			                       $(el).summernote('editor.insertImage',json["url"]);
			                           jsonArray.push(json["url"]);
			                           jsonFn(jsonArray);
			                   },
			                   error : function(e) {
			                       console.log(e);
			                   }
			               });
			           }
			
			}
			
			function jsonFn(jsonArray){
				console.log(jsonArray);
			}
			
			$(document).ready(textEdit());	
	        
			
			
			function checkii(f){
                var ticket_name = f.ticket_name.value;
                var ticket_cate_no = document.getElementById("tcn").value;
                var addr2_seq = f.addr2_seq.value;
                var t_partner_seq = f.t_partner_seq.value;
                var title = f.title.value;
                var content = f.content.value;
                
                if(ticket_name == ""){
                    alert("상품명을 입력해주세요.");
                    f.ticket_name.focus();
                    return;
                }
                if(ticket_cate_no == ""){
                    alert("카테고리를 선택해주세요.");
                    f.ticket_cate_no.focus();
                    return;
                }
                if(addr2_seq == "0"){
                    alert("주소를 선택해주세요.");
                    f.addr2_seq.focus();
                    return;
                }
                if(t_partner_seq == "" || t_partner_seq == 0){
                    alert("투어파트너를 선택해주세요.");
                    f.t_partner_seq.focus();
                    return;
                }
                if(title==''){
                    alert("설명 제목을 입력해주세요.");
                    f.title.focus();
                    return;
                }
                if(content == ""){
                    alert("상품 설명을 작성해주세요.");
                    f.content.focus();
                    return;
                }
                f.action = "${cpath }/admin/ticket/checkInsert";
                f.submit();
            }
			
			
			
			
	    </script>
        </body>
    </html>
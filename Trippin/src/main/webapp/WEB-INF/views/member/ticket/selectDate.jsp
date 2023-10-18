<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리핀</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap"
	rel="stylesheet">

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd,
	q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li,
	fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr,
	th, td, article, aside, canvas, details, figcaption, figure, footer,
	header, hgroup, menu, nav, section, summary, time, mark, audio, video,
	fieldset {
	margin: 0;
	padding: 0;
}

ol, ul {
	list-style: none
}

li {
	list-style-type: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

img {
	max-width: 100%;
	height: auto;
}

mark {
	background: none
}

select {
	max-width: 100%;
}

caption, legend {
	display: none;
}

hr {
	display: none;
}

h1, h2, h3, h4, h5, h6 {
	font-size: 100%;
}

address, strong {
	font-style: normal;
	font-weight: normal;
}

table {
	border-collapse: collapse;
}

input, select {
	outline: none;
	font-family: inherit
}

body {
	background-color: #F2F2F2;
}

.inner {
	margin-left: 24%;
	margin-right: 22%;
	background-color: white;
}

.hd-in img {
	width: 30px;
	margin-top: 3%;
	margin-left: 5%;
	cursor: pointer;
}

.hd-in h2 {
	margin-top: 3%;
	margin-left: 3%;
	font-weight: bold;
	font-size: 30px;
}

.hd-in h4 {
	margin-top: 3%;
	margin-left: 3%;
	color: #9B9D9B;
	padding-bottom: 3%;
}

.m-index {
	margin-left: 24%;
	margin-right: 22%;
	background-color: white;
}

.dateHead div {
	background: #04CFD4;
	color: #fff;
	text-align: center;
	border-radius: 5px;
	font-weight: bold;
}

.grid {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
	grid-gap: 5px;
}

.grid div {
	padding: .6rem;
	font-size: .9rem;
	cursor: pointer;
}

.dateBoard div {
	color: #222;
	font-weight: bold;
	min-height: 6rem;
	padding: .6rem .8rem;
	border-radius: 5px;
	border: 1px solid #eee;
}

.noColor {
	background: #eee;
}

.rap-header {
	display: flex;
	justify-content: space-between;
	padding: 1rem 2rem;
}

.btn {
	display: block;
	width: 20px;
	height: 20px;
	border: 3px solid #000;
	border-width: 3px 3px 0 0;
	cursor: pointer;
}

.prevDay {
	transform: rotate(-135deg);
}

.nextDay {
	transform: rotate(45deg);
}

.mb-title, .mb-titlex {
	width: 100%;
	margin-top: 20.8%;
	height: 50px;
	margin-bottom: 0.2%;
	border: 1px solid;
	line-height: 50px;
	text-align: center;
	font-size: 20px;
	color: white;
	background-color: #2987F0;
	border-radius: 5px;
	font-weight: bold;
}

/* .mb-title {
	background-color: #2987F0;
} */

.mb-title:disabled {
	background-color: #e4e6e8;
}

.choose {
	background-color: #04CFD4;
}

.between {
	background-color: silver;
}

@import
	url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css")
	;

* {
	margin: 0;
	padding: 0;
	list-style: none;
	box-sizing: border-box;
	font-family: Pretendard;
}

.rap {
	max-width: 820px;
	padding: 0 1.4rem;
}

.dateHead {
	margin: .4rem 0;
}

.quantity-container {
	display: flex;
	align-items: center;
}

.quantity-button {
	border: none;
	background-color: #f0f0f0;
	padding: 5px 10px;
	cursor: pointer;
}

.quantity-input {
	width: 50px;
	text-align: center;
	border: 1px solid #ddd;
}

.list1 {
	border: 1px solid #CDCDCD;
	margin-bottom: 2%;
	padding: 2%;
}

.list1 label {
	display: flex;
}

.list-check {
	width: 10%;
	text-align: center;
	padding-top: 2%;
}

.list-check input {
	width: 20px;
	height: 20px;
}

.title-sec {
	width: 90%;
}

.opt_name {
	font-size: 16px;
	font-weight: bold;
	padding-bottom: 2%;
}

.list-info {
	font-size: 14px;
	font-weight: bold;
}

.option-select {
	font-weight: bold;
	font-size: 20px;
	padding-bottom: 2%;
}

.amount-list {
	margin-top: 3%;
	border: 1px solid;
	display: flex;
	padding: 3%;
	height: 15vh;
}

.aml-1 {
	width: 60%;
	font-weight: bold;
}

.blue-span {
	color: rgba(54, 143, 255, 1);
}

#name1 {
	padding-bottom: 2%;
	font-weight: bold;
	font-size: 18px;
}

.price {
	display: inline-block;
	color: rgba(54, 143, 255, 1);
}

.styled-number-input {
	display: flex;
	border-radius: 5px;
	width: 40%;
	justify-content: end;
}

.styled-number-input input {
	border: none;
	outline: none;
	padding: 5px;
	text-align: center;
	font-size: 16px;
}

.styled-number-input .button-container {
	display: flex;
	flex-direction: column;
}

.styled-number-input .minus, .styled-number-input .plus {
	padding: 5px;
	cursor: pointer;
	border: none;
	background-color: transparent;
}
.styled-number-input input[type="number"]::-webkit-inner-spin-button,
	.styled-number-input input[type="number"]::-webkit-outer-spin-button {
	appearance: none;
	display: none;
}
.minus {
	position: relative;
	left: -3.5vw;
	top: 3.5vh;
}
.plus {
	position: relative;
	top: 0.5vh;
}
.plus img {
	width: 15px;
}
.minus img {
	width: 15px;
}
.amt-1 {
	width: 2vw;
}
.total-h2 {
	font-size: 20px;
	font-weight: bold;
	padding-bottom: 3%;
}
#product {
	font-weight: bold;
	font-size: 18px;
	padding-bottom: 2%;
}
#useOk {
	color: rgba(54, 143, 255, 1);
	font-weight: bold;
	padding-bottom: 3%;
	border-bottom: 1px solid #CDCDCD;
}
#selectList {
	padding-top: 2%;
	padding-bottom: 2%;
}
.detail-info {
	display: flex;
	width: 100%;
	padding-bottom: 2%;
	justify-content: space-between;
	color: #848484;
	font-weight: bold;
}
.left-name {
	display: flex;
}

.right-price {
	display: flex;
	font-weight: bold;
}

.total-price {
	display: flex;
	padding-top: 2%;
	border-top: 1px solid #CDCDCD;
	justify-content: space-between;
}

.total-price b {
	font-size: 20px;
}

.tot-info {
	font-weight: bold;
	display: flex;
	font-size: 20px;
}

.foot-info {
	background-color: #FAFAFA;
	color: #A4A4A4;
	padding: 3%;
	font-weight: bold;
	word-break: keep-all;
}

.mb-label {
	font-weight: bold;
	font-size: 20px;
}

.mbl-span {
	font-weight: bold;
	font-size: 20px;
	color: rgba(54, 143, 255, 1);
}

.me-bot {
	padding-top: 3%;
}
</style>

</head>
<body>
	<input type="hidden" id="valid" value="${valid }">
	<input type="hidden" id="start" value="${start }">
	<header class="header">
		<div class="inner">
			<div class="hd-in">
				<img onclick="history.back()"
					src="data:image/png;base64,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">
				<h2>티켓일정 등록</h2>
			</div>
		</div>
	</header>
	<div class="main">
		<div class="m-index">
			<div class='rap'>
				<div class="rap-header">
					<div class="btn prevDay"></div>
					<h2 class='dateTitle'></h2>
					<div class="btn nextDay"></div>
				</div>

				<div class="grid dateHead">
					<div>일</div>
					<div>월</div>
					<div>화</div>
					<div>수</div>
					<div>목</div>
					<div>금</div>
					<div>토</div>
				</div>

				<div class="grid dateBoard"></div>

				<div class="me-bot">
					<label class="mb-label" for="result">이용 예정일 선택</label> <span
						class="mbl-span" id="result"></span>

					<form id="date-form" method="post"
						action="${cpath }/member/ticket/reserveForm?ticket=${param.ticket}">
						<input type="hidden" name="endDate" value="${valid }"> 
						<input type="hidden" name="startDate" id="startDate"> 
						<br>
						<div id="option" style="display: none;">
							<div class="option-select">옵션 선택</div>
							<c:forEach var="opt" items="${olist }" varStatus="i">
								<div class="list1">
									<label for="${i.index }">
										<div class="list-check">
											<input type="radio" name="opt_seq" value="${opt.opt_seq }" id="${i.index }" onclick="subOpt(${opt.opt_seq })">
										</div>
										<div class="title-sec">
											<div class="opt_name" id="opt_name${opt.opt_seq }">${opt.opt_name }</div>
											<div class="list-info" style="color: darkgray">${opt.opt_info }</div>
										</div>
									</label>
								</div>
							</c:forEach>
						</div>
						<br>
						<div id="amount" style="display: none;">
							<div class="option-select">수량 선택</div>
						</div>
						<br>
						<div id="total" style="display: none;">
							<h2 class="total-h2">예약 내역</h2>
							<div id="detail">
								<div id="product"></div>
								<div id="useOk" style="display: none;">
									유효 기간 : <span id="selectDate"></span>
									<c:if test="${valid != null }">
			                				~
			                			<span id="endDate">${valid }</span>
									</c:if>
								</div>
								<div id="selectList">
									<!-- 하위 옵션별 선택 수량 및 가격 -->
								</div>
							</div>
							<div class="total-price">
								<label for="tot"><b>총 결제 금액</b></label>
								<div class="tot-info">
									<div id="tot">0</div>
									<span>원</span>
								</div>
							</div>
						</div>
						<br>
						<div class="foot-info">해당 금액은 트리플 판매가 기준입니다. 쿠폰 및 셀프패키지 할인은
							실제 결제 시 적용 및 확인이 가능합니다.</div>
						<input type="hidden" id="selectJ"> <input type="hidden" name="day" id="day">
						<input class="mb-title" id="sendBtn" type="button" value="예약 정보 입력하기" onclick="submitForm()" />
					</form>
				</div>
			</div>
			<script>
                      
						var sendbtn = document.getElementById("sendBtn");
			
                      	$(function(){
                      		resetRadio();
                      		sendbtn.disabled = true;
                      	})
                      
						var lday = 0;
						
                      	// 유효기간의 시작 또는 오늘 
                      	const now = String(document.getElementById("start").value).split('-');
                      	const nowYear = parseInt(now[0]);
                      	const nowMonth = parseInt(now[1]);
                      	const nowDate = parseInt(now[2]);
						
                      	// 유효기간 
						const valid = String(document.getElementById("valid").value).split('-');
						const validYear = parseInt(valid[0]);
						const validMonth = parseInt(valid[1]);
						const validDate = parseInt(valid[2]);
						
                        const makeCalendar = (date) => {
                        	if(document.getElementById("selectJ").value!=""){
                        		addDay(document.getElementById("selectJ").value);
                        	}
                        	
	                        const currentYear = new Date(date).getFullYear();
	                        var currentMonth = new Date(date).getMonth() + 1;
	                        
	                        const firstDay = new Date(date.setDate(1)).getDay();
	                        const lastDay = new Date(currentYear, currentMonth, 0).getDate();                                             
							
	                        lday = lastDay;
	                        
	                        const limitDay = firstDay + lastDay;
	                        const nextDay = Math.ceil(limitDay / 7) * 7;
							
	                        let htmlDummy = '';
	                        // 10월 전일 경우 08월로 나타낼 수 있도록 
	                        if(currentMonth<10){
								currentMonth = '0'+currentMonth.toString();
							}
	                        
	                        for (var i = 0; i < firstDay; i++) {
	                            htmlDummy += `<div class="noColor"></div>`;
	                        }
	                        
	                        // 유효기간의 달과 달력에 표시되는 달이 일치할 경우 -> 그 날까지만 def, 그 이후로는 noColor
	                        if(currentYear == validYear && currentMonth == validMonth){
	                        	 for (var l = 1; l <= validDate; l++){
		                        	htmlDummy += `<div class="def" id="cddv`+l+`"  onclick="addDay(`+l+`)"><input type="hidden" id="cday`+l+`" value ="`+currentYear+`-`+currentMonth+`-`+ l+`">`+l+`</div>
		                            `;
			                     }
	                        	 
	                        	 for (var j = validDate+1; j <= lastDay; j++) {    
		                            htmlDummy += `<div class="noColor" id="cddv`+j+`" ><input type="hidden" id="cday`+j+`" value ="`+currentYear+`-`+currentMonth+`-`+ j+`">`+j+`</div>
		                            `;
			                     }
	                        	 
	                        }else{
	                        	// 유효기간이 아니면서 달력에 표시되는 달이 이번 달과 같을 경우 -> 이미 지난 날은 noColor 
		                        if(currentMonth == nowMonth){
			                        for (var l = 1; l < nowDate; l++) {
			                        	htmlDummy += `<div class="noColor" id="cddv`+l+`" ><input type="hidden" id="cday`+l+`" value ="`+currentYear+`-`+currentMonth+`-`+ l+`">`+l+`</div>
			                            `;
			                        }
			
			                        for (var j = nowDate; j <= lastDay; j++) {    
			                            htmlDummy += `<div class="def" id="cddv`+j+`"  onclick="addDay(`+j+`)"><input type="hidden" id="cday`+j+`" value ="`+currentYear+`-`+currentMonth+`-`+ j+`">`+j+`</div>
			                            `;
			                        }
			                    // 위의 2가지 경우 다 아닐 경우 그 달은 그냥 def
		                        }else{
			                       for (var j = 1; j <= lastDay; j++) {    
			                            htmlDummy += `<div class="def" id="cddv`+j+`"  onclick="addDay(`+j+`)"><input type="hidden" id="cday`+j+`" value ="`+currentYear+`-`+currentMonth+`-`+ j+`">`+j+`</div>
			                            `;
			                        }
		                        }
	                        }
	                        
	                        for (var k = limitDay; k < nextDay; k++) {
	                            htmlDummy += `<div class="noColor"></div>`;
	                        }
							
	                        document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
	                        document.querySelector(`.dateTitle`).innerText = currentYear+`년 `+ currentMonth+`월`;
	                        }
							
	                        const date = new Date();
	                        date.setYear(nowYear);
	                        date.setMonth(nowMonth-1);
	                        date.setDate(nowDate);
							
	                        makeCalendar(date);
	
	                        document.querySelector(`.prevDay`).onclick = () => {
	                        	 if(date.getFullYear() <= nowYear && date.getMonth() < nowMonth){
	                        		 // 지금보다 이전일 경우에는 이동 못하도록 막기 
	                             	return;
	                             }else{
			                        makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
	                             }
	                        }
	                            
	                        document.querySelector(`.nextDay`).onclick = () => {
	                        	if((date.getFullYear() >= validYear && date.getMonth()+1 >= validMonth) || date.getFullYear() > validYear){
	                        		// 유효기간보다 이후일 경우에 막기
	                        		return;
	                        	}else{
			                        makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
	                        	}
                       		}
                        
                        var day = document.getElementById("day");
                        var selectJ = document.getElementById("selectJ");
						
                        // 날짜 선택한 경우 
                        function addDay(j) {	
                        	// 추후에 넣을 자리 
                        	const result = document.getElementById("result");
                        	const cddv = document.getElementById("cddv"+j);
                        	
                        	const clName = cddv.className;	// 선택한 항목의 div
                        	
                        	var date = document.getElementById("cday"+j).value;	// 선택한 항목의 input type=hidden
                        	var dateDetail = date.split("-");	// '-'로 스플릿
                        	if(dateDetail[2].length == 1){
                        		dateDetail[2] = '0'+dateDetail[2];	// 일자의 경우에도 10 밑이면 '08일' 형태로 나오도록 
                        		date = dateDetail[0]+"-"+dateDetail[1]+"-"+dateDetail[2];	// 바꾼 형태로 다시 구성
                        	}
							
                        	if(clName == "def"){	// 선택가능한 날짜라면
                        		
								if(day.value==""){	// 그리고 기존에 선택한 날이 없었다면
									cddv.className = "choose";	// 선택된 항목 class로 바꾸기
									selectJ.value = j;	// 고른 일자 넣기
									
									result.innerText = date;	// day에 해당 날짜 보여주기
									day.value = date;	// result는 보이기 용, day는 넘기는 용
									
									document.getElementById("selectDate").innerText = date;	// 기간 보여주기 위한 시작일
									document.getElementById("startDate").value = date;	// 넘기기 위한 시작일
								
								}else{	// 기존에 선택한 날이 있었다면
									resetRadio();
									var preCddv = document.getElementById("cddv" + selectJ.value);	// 기존 선택한 날짜
									
									// 기존에 선택한 preCddv가 활성화 되어있다면
									if(preCddv!= null && preCddv.className != 'noColor'){	
										preCddv.className = 'def';
									}
									cddv.className = "choose";
									day.value = date;
									selectJ.value = j;
									result.innerText = date;
									document.getElementById("selectDate").innerText = date;
									document.getElementById("startDate").value = date;
	                        		document.getElementById("amount").style.display="none";
	                        		document.getElementById("total").style.display="none";
								}
                        	}
                        	
                        	if(day.value!=""){
                        		document.getElementById("option").style.display="block";
                        	}
						}
                        
                        function subOpt(opt_seq){
                        	selectList.innerHTML = '';
                        	product.innerText='';
							useOk.style.display="none";
							tot.innerText = '0';
							
                        	var amount = document.getElementById("amount");
                        	amount.style.display="block";
                        	document.getElementById("total").style.display="block";
                        	
                        	$.ajax({
                        	    url: "${cpath}/member/ticket/takeOpt",
                        	    type: "post",
                        	    data: { opt_seq: opt_seq },
                        	    success: function show(data) {
                        	        amount.innerHTML = "";

                        	        if (data != null) {
                        	            data.forEach(d => {
                        	                let formattedPrice = new Intl.NumberFormat('en-US').format(d.subopt_price); // Format price with comma
                        	                let priceHTML = '';
                        	                
                        	                if (d.dc_rate != '') {
                        	                    let formattedDcRate = new Intl.NumberFormat('en-US').format(d.dc_rate); // Format discount rate with comma

                        	                    priceHTML = `
                        	                        <div style="color: darkgray; text-decoration: line-through;">` + formattedPrice + `원</div>
                        	                        <div class="price" id="price`+d.subopt_seq+`">` + formattedDcRate + `</div><sapn class="blue-span">원</span>`;
                        	                } else {
                        	                    priceHTML = `<div class="price" id="price`+d.subopt_seq+`">`+ formattedPrice +`</div><span class="blue-span">원</span>`;
                        	                }
                        	                
                        	                if(d.subopt_info == null){
                        	                	d.subopt_info = '';
                        	                }

                        	                let div = document.createElement('div');
                        	                div.className='amount-list';
                        	                div.innerHTML = `
	                        	                <div class="aml-1">
	                        	                    <div id="name`+d.subopt_seq +`">`+d.subopt_name+`</div>
	                        	                    <div style="color: darkgray">`+d.subopt_info+`</div>`
	                        	                    + priceHTML +
	                        	                `</div>
                        	                    <div class="styled-number-input">
                        	                   		<input class="amt-1" type="number" value="0" id="amt`+ d.subopt_seq + `" name="amount" min="0">
                        	                		<div class="button-container">
                        	                			<div id="minus" class="minus" onclick="add('minus',`+ d.subopt_seq +`)")><img src="https://cdn-icons-png.flaticon.com/512/43/43625.png"></div>
                        	                			<div id="plus" class="plus" onclick="add('plus',`+ d.subopt_seq +`)"><img src="https://cdn-icons-png.flaticon.com/512/32/32339.png"></div>
                        	                		</div>
                        	                   	</div>
                        	                    `;
                        	                amount.appendChild(div);
                        	            });
                        	        } 
                        	    }
                        	});
                        }
                        
                        const product = document.getElementById("product");
                        const useOk = document.getElementById("useOk");
                        
                        // radio 선택한거 리셋시키기(날짜 변경하거나 뒤로가기 됐을 경우)
                        function resetRadio() {
                            var radioButtons = document.getElementsByName('opt_seq');
							product.innerText='';
							useOk.style.display="none";
                            for (var i = 0; i < radioButtons.length; i++) {
                                radioButtons[i].checked = false;
                            }
                        }
                        
                        // 수량 변화할 때
                        function changeCnt(num){
                        	let cnt = document.getElementById("amt"+num);
	                       	const radioButtons = document.getElementsByName('opt_seq');
	                       	if(cnt.value > 0 && product.innerText ==''){
	                       	    for (let i = 0; i < radioButtons.length; i++) {
	                       	    	if(radioButtons[i].checked){
	                       	    		const optName = document.getElementById('opt_name'+radioButtons[i].value);
	                       	    		product.innerText = optName.innerText;
	                       	    		useOk.style.display="block";
	                       	    		sendbtn.disabled = false;
	                       	    	}
	                       	    }
	                       	}
	                       	
	                       	// 수량 변화시키기
	                       	const selectList = document.getElementById("selectList");
	                       	if(cnt.value == 1 && document.getElementById("nameSpan"+num)==null){
	                       		var name = document.getElementById("name"+num);
	                       		
	                       		var div = document.createElement('div');
	                       		div.id = "detail"+num;
	                       		div.className = "detail-info";
	                       		div.innerHTML = `
	                       			<div class="left-name">
	                       				<div class="names" id="nameSpan`+num+`">`+name.innerText+`</div>
	                       				<div class="nums" id="numSpan`+num+`"></div>
	                       			</div>
	                       			<div class="right-price">
	                       				<div id="priceSpan`+num+`"></div>
	                       				<span>원</span>
	                       			</div>
	                       		`;
	                       		selectList.appendChild(div);
	                       	}
	                       	
	                       	var price = document.getElementById("price"+num).innerText.replace(',','');
                       		price = Number(price) * Number(cnt.value);
                       		if(price>0){
                       			price = new Intl.NumberFormat('en-US').format(price);
	                       		document.getElementById("priceSpan"+num).innerText = price;
                       		}
	                       	
	                      	var names = document.getElementsByClassName('names');
	                      	var cnts = document.getElementsByName('amount');
	                       	var prices = document.getElementsByClassName('price');
	                       	var tot = document.getElementById("tot");
	                      	
	                      	// 늘렸던 수량을 0으로 줄였을 때 변화
	                       	if(cnt.value == 0 && document.getElementById("nameSpan"+num)!=null){
	                       		selectList.removeChild(document.getElementById("detail"+num));
		                       	// 전부 0이 되면 안 보이기
		                       	if(names.length == 0){
		                       		product.innerText='';
									useOk.style.display="none";
									tot.innerText = '0';
									sendbtn.disabled = true;
		                       	}
	                       	}
	                       	
	                       	// 가격  합산
	                       	var sum = 0;
	                       	for(var i=0; i<cnts.length; i++){
	                       		sum += Number(cnts[i].value) * Number(prices[i].innerText.replace(',', ''));
	                       	}
	                       	tot.innerText = new Intl.NumberFormat('en-US').format(sum);;
	                       	
	                       	// 수량 표시
	                       	if(cnt.value>=1){
	                       		document.getElementById("numSpan"+num).innerText = '×'+cnt.value;
	                       	}
                        }
                        
                        function submitForm() {
							if(day.value==""){
								alert("날짜를 선택해주세요.");
								return;
							}if(tot.innerText=='0'){
								alert("옵션을 골라 수량을 선택하세요.");	
								return;
							}else{
								const recheck = window.confirm("다음으로 넘어가시겠습니까?");								
								if(recheck){
									document.getElementById("date-form").submit();																
								}else{
									return ;
								}
							}
						}
                        
                        function add(item, i) {
                        	var numInput = document.getElementById("amt"+ i);
                        	numInput.style.appearance = "textfield";
                            numInput.style.mozAppearance = "textfield";
                            numInput.style.webkitAppearance = "textfield";
	                          
	                          if(item == "plus"){
		                          numInput.stepUp();	 
		                          this.changeCnt(i);
	                          }else{
		                          numInput.stepDown();	                        	  
		                          this.changeCnt(i);
	                          }
                        }
                        
                      </script>
		</div>
	</div>
</body>
</html>

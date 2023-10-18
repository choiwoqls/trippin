<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
    <html lan="kr">
        <head>
            <meta charset="utf-8">
            <c:set var="cpath" value="${pageContext.request.contextPath }"/>
            <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
            <title>나를 아는 여행 앱, 트리플</title>

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.css">
			  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
			  <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
			  <script src="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js"></script>
			<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
            
            <!-- 달력 -->
		<script>
		$(document).ready(function() {
		  $('#dateRangePicker').daterangepicker({
		    opens: 'left',
		    linkedCalendars: false
		  }, function(start, end, label) {
		    $('#startDate').text(start.format('YYYY-MM-DD'));
		    $('#endDate').text(end.format('YYYY-MM-DD'));
		    
		    var duration = end.diff(start, 'days') + 1;
		    $('#duration').text(duration + ' days');
		  });
		});
		</script>
		
		<script>
		  function scrollToSection(mltl-mapId) {
			    const section = document.getElementById(mltl-mapId);
			    if (mltl-map) {
			      mltl-map.scrollIntoView({ behavior: 'smooth' });
			    }
			  }
		</script>



    <script type="text/javascript">
 
        //날짜,인원 숨김
        function dis1() {
            var dis1Element = document.getElementById('dis1');
            if (dis1Element.style.display === 'none') {
                dis1Element.style.display = 'block';
            } else {
                dis1Element.style.display = 'none';
            }
        }

        function dis2() {
            var dis2Element = document.getElementById('dis2');
            if (dis2Element.style.display === 'none') {
                dis2Element.style.display = 'block';
            } else {
                dis2Element.style.display = 'none';
            }
        }

        function dis3() {
            var dis3Element = document.getElementById('dis3');
            if (dis3Element.style.display === 'none') {
                dis3Element.style.display = 'block';
            } else {
                dis3Element.style.display = 'none';
            }
        }
        
	        
        
	        document.addEventListener("DOMContentLoaded", function() {
	            var minusBtn = document.querySelector(".minus");
	            var plusBtn = document.querySelector(".plus");
	            var resultSpan = document.querySelector("#result");

	            var count = 1;

	            minusBtn.addEventListener("click", function() {
	                if (count > 1) {
	                    count--;
	                    resultSpan.textContent = count;
	                }
	            });

	            plusBtn.addEventListener("click", function() {
	                count++;
	                resultSpan.textContent = count;
	            });
	        });

    </script>
    
    
	<script>
	
	//날짜, 인원 list
	  var selectedButtons = [];
	
	  function buttonClicked(button) {
	    var buttonValue = button.value;
	
	    var index = selectedButtons.indexOf(buttonValue);
	    if (index === -1) {
	      selectedButtons.push(buttonValue);
	    } else {
	      selectedButtons.splice(index, 1);
	    }
	
	    updateSelectionInfo();
	  }
	
	
	  function updateSelectionInfo() {
	    var selectedInfo = selectedButtons.join(' ');
	    var totalCount = selectedButtons.length;
	    document.getElementById('selectedButtons').textContent = selectedInfo;
	    document.getElementById('totalCount').textContent = totalCount;
	  }
	  
	  
	  //인원 파라미터
	  function chooseRoom(item) {
		  
		document.getElementById("room_seq").value = item;
		
		const su1 = document.getElementById("result").innerText;
		const su2 = document.getElementById("totalCount").innerText;
		const su3 = document.getElementById("selectedButtons").innerText;
		const su4 = document.getElementById("startDate").innerText;
		const su5 = document.getElementById("endDate").innerText;
		const su6 = document.getElementById("duration").innerText;
		const form = document.getElementById("roomForm");
		
		var input1 = document.createElement("input");
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "result");
		input1.setAttribute("value", su1);
		form.appendChild(input1);
		
		var input2 = document.createElement("input");
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "totalCount");
		input2.setAttribute("value", su2);
		form.appendChild(input2);
		
		var input3 = document.createElement("input");
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "selectedButtons");
		input3.setAttribute("value", su3);
		form.appendChild(input3);
		
		var input4 = document.createElement("input");
		input4.setAttribute("type", "hidden");
		input4.setAttribute("name", "startDate");
		input4.setAttribute("value", su4);
		form.appendChild(input4);
		
		var input5 = document.createElement("input");
		input5.setAttribute("type", "hidden");
		input5.setAttribute("name", "endDate");
		input5.setAttribute("value", su5);
		form.appendChild(input5);
		
		var input6 = document.createElement("input");
		input6.setAttribute("type", "hidden");
		input6.setAttribute("name", "duration");
		input6.setAttribute("value", su6);
		form.appendChild(input6);
		
		form.submit();
		
		
		
	}
	  
		//쿠폰 윈도우 팝업창 
	        $(document).ready(function() {
	            $("#popupLink").click(function() {
	                var popupWindow = window.open("${cpath }/admin/member/accom/pensionList", "popupWindow", "width=400,height=300");
	                return false;
	            });
	        });
	  

		
	  
	</script>

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
                    width : 100vw;
                    height : 900vh;
                }
                .inner {
                    box-shadow: 0px 2px 0px 0px #F2F2F2;
                    height : 13vh;
                }
                .hd-in {
                    display : flex;
                    justify-content: space-around;
                    line-height: 13vh;
                }
                .hd-left { 
                    width :25%;
                }
                .hd-mid,.hd-right {
                    width : 33%;
                }
                .hm-1 input {
                    width : 80%;
                    height : 8vh;
                    font-size : 18px;
                    border : 0;
                    border-bottom : 2px solid #929292;
                    
                    
                }
                
                .hm-img {
                    width : 10%;
                    position : relative;
                    top : 2vh;
                    right : 3.5vw;
                }
                .my-page {
                    
                    height : 13vh;
                }
                .my-page a {
                    text-decoration: none;
                }
                .mp-ind {
                    width : 25%;
                    
                    border: 2px solid #E2E2E2;
                    border-radius: 45px;
                    height : 8vh;
                    margin-top : 4%;
                    margin-left : 45%;
                }
                .mp-ind:hover {
                    transition-duration: 0.3s;
                    box-shadow : 0px 4px 3px #adadad;
                }
                .hdr1 {
                    width : 30%;
                    margin-left : 16%;
                    margin-bottom : 4%;
                }
                .hdr2 {
                    width : 30%;
                    margin-bottom : 4%;
                }
                .hl-1 a {
                    text-decoration: none;
                }
                .tit1 {
                    width : 25%;
                    margin-left : 20%;
                    position : relative;
                    top : 2vh;
                }
                .tit2 {
                    width : 5%;
                    position : relative;
                    top : -1vh;
                    right : 0.5vw;
                }
                .main-1,.main-2, .main-3, .main-4, .main-5, .main-6, .main-7 {
                    margin-left : 26%;
                    margin-right : 26%;
                }
                .main-2,.main-3 {
                    border-bottom : 10px solid #CDCDCD;
                    padding-bottom : 4%;
                }
                .main-3 {
                    margin-top : 3%;
                }
                .m1t-tit {
                    margin-top : 2%;
                    font-size : 25px;
                    font-weight : bold;
                }
                .m1t-sc {
                    margin-top : 2%;
                    display : flex;
                    
                }
                .mltsc-1 {
                    width : 30%;
                }
                .mlt-loca {
                    margin-top : 2%;
                }
                .mltl-img {
                    width : 2%;
                }
                .mltl-text {
                    font-size : 13px;
                    font-weight: bold;
                    color :#898989;
                }
                .mltl-map {
                    font-weight: bolder;
                    color : #2987F0;
                    font-size : 12px;
                    margin-left : 1%;
                    position: relative;
                    top : 0.3vh;
                }
                .m1-mid {
                    margin-top : 2%;
                }
                .m1-mid img{
                    width : 100%;
                    height : 60vh;
                    border-radius : 15px;
                }
                .mlstar {
                    margin-top : 4%;
                    width : 47.6%;
                    height : 100%;
                    background-image : url("https://yaimg.yanolja.com/joy/sunny/static/images/icon-score-yayellow-fill.svg");
                    background-repeat: repeat-x;
                }
                .mltsc-1 {
                    display: flex;
                    font-weight : bold;
                }
                .mltsc-1 span {
                    position : relative;
                    right : 1.2vw;
                    bottom : 0.2vh;
                }
                .ml-sect {
                    width : 40%;
                }
                .ml2-img {
                    width : 15%;
                    position : relative;
                    top : 0.3vh;
                }
                .mltsc-2 {
                    font-weight: bold;
                    position : relative;
                    
                    bottom : 0.2vh;
                }
                .mltsc-3 {
                    font-weight: bold;
                    color : #2987F0;
                    font-size : 14px;
                    position: relative;
                    right : 15%;
                    top : 0.2vh;
                }
                .mb-z {
                    border-bottom : 10px solid #CDCDCD;
                    display : flex;
                    justify-content: space-around;
                    height : 10vh;
                    padding-bottom : 2%;
                    padding-left : 5%;
                }
                .mb-img {
                    width : 25%;
                    margin-left : 10%;
                    margin-top : 10%;
                }
                .mb-save h4{
                    font-weight : 500;
                    color : #CDCDCD;
                    font-size : 14px;
                }
                .mb-save a {
                    text-decoration: none;
                    color : #CDCDCD;
                }
                .m2-top {
                    margin-top : 5%;
                }
                .m2t-tit span{
                    font-weight: bold;
                    font-size : 20px;
                }
                .m1-top {
                    border-bottom : 2px solid #CDCDCD;
                    padding-bottom : 3%;
                }
                .m2-select {
                    display : flex;
                    width : 100%;
                    margin-top : 4%;
                    padding-left : 5%;
                    padding-right : 5%;
                    
                }
                .m2-mid {
                    width : 100%;
                }
                .m2-date, .m2-person {
                    border : 1px solid;
                    width : 100%;
                    height : 7vh;
                    text-align: center;
                    line-height: 7vh;
                    border-radius: 5px;
                    border : 2px solid #E2E2E2;
                    font-size : 14px;
                    font-weight: bold;
                }
                .count, .select{
                	cursor: pointer;
                	font-size : 20px;
                }
                .date-margin{
                	width : 30%;
                	
                }
                .m2-ppick {
                	margin-left : 5vw;
                	width : 30%;
                }
                .m2-dmid, .m2-ddmid {
                    width : 72.5%;
                    
                    margin-top : 4%;
                    margin-left : 10%;
                    border-radius: 5px;
                }
                .low-com {
                    margin-top : 1.5%;
                }
                .low-price {
                    display: flex;
                    justify-content: space-between;
                }
                .lc-img1 {
                    width : 45px;
                }
                .lc-img2 {
                    width : 6px;
                    position: relative;
                    top : -1.5vh;
                    left : -0.45vw;
                }
                .lt-1 {
                    font-size : 22px;
                    font-weight: bold;
                }
                .lt-2 {
                    font-weight: bold;
                    font-size : 24px;
                    position: relative;
                    top : -0.3vh;
                }
                .low-how {
                    display: flex;
                    justify-content: space-between;
                    margin-top : 2%;
                }
                .low-date {
                    font-weight: bold;
                    color :#CDCDCD;
                    font-size : 12px;
                }
                .low-cup {
                    margin-right : 5%;
                    font-weight: bold;
                    font-size : 14px;
                    color : #929292;
                }
                .low-red {
                    color : #FA5858;
                }
                .cup-sale {
                    display: flex;
                    justify-content: space-between;
                    padding : 2%;
                    background-color: #F5F5F5;
                    
                }
                .cs-tit span {
                    font-weight: bold;
                    font-size : 13.5px;
                    color : #CDCDCD;
                }
                .ct-red {
                    color : #FA5858 !important;
                }
                .cs-get a {
                    color : #929292;
                    font-size : 13.5px;
                }
                .m3t-tit {
                    
                }
                .m3tit-1 {
                    font-size : 19px;
                    font-weight: bold;
                    
                }
                .m3tit-2 {
                    margin-left : 70%;
                    font-size : 13px;
                    font-weight: bold;
                    color : #CDCDCD;
                }
                .m3t-filter {
                    margin-top : 3%;
                    display: flex;
                    justify-content: space-around;
                }
                .m3-list {
                    border : 2px solid #adadad;
                    border-radius: 5px;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    padding-left : 2%;
                    padding-right : 2%;
                    cursor: pointer;
                    color :#adadad;
                }
                .m3-listz {
                    border : 2px solid white;
                    border-radius: 5px;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    padding-left : 2%;
                    padding-right : 2%;
                    cursor: pointer;
                    color :white;
                    background-color: #2987F0;
                }
                .m3t-room {
                    margin-top : 3%;
                    
                    padding-bottom : 5%;
                    border-bottom: 1px solid #CDCDCD;
                }
                .room-title {
                    
                    padding-top : 2%;
                    padding-left : 2%;
                }
                .room-top  {
                    cursor: pointer;
                }
                .room-img {
                    width : 100px;
                    height : 100px;
                    position : relative;
                    left : 38vw;
                    top : -5vh;
                    border-radius: 5px;
                }
                .room-info h2 {
                    font-size : 20px;
                }
                .room-max {
                    width : 17px;
                    position : relative;
                    top : 0.5vh;
                }
                .room-info span {
                    font-size : 13px;
                }
                .ri-count {
                    position : relative;
                    left : 35vw;
                    top : -7vh;
                    font-weight: bold;
                    color : white;
                }
                .room-down {
                    border-radius: 5px;
                    background-color: #F5F5F5;
                    padding : 2%;
                }
                .rd-tit {
                    color : #2987F0;
                    font-weight: bold;
                    font-size : 14px;
                }
                .rd-1img {
                    width : 10px;
                    border: 1px solid;
                    border-radius: 50%;
                    padding : 0.3%;
                    position: relative;
                    top : 0.4vh;
                }
                .rd-1, .rd-2 {
                    margin-top : 1%;
                    font-size : 12px;
                    font-weight: bold;
                    color : #929292;
                }
                .rd-2img {
                    width : 17px;
                    position: relative;
                    top : 0.4vh;
                }
                .rd-3 {
                    margin-top : 3%;
                }
                .rd-3 span {
                    
                    padding : 0.5%;
                    font-size : 13px;
                    border-radius: 3px;
                    font-weight: bold;
                    color : white;
                    background-color: #FA5858;
                }
                .rd-4 {
                    margin-top : 2%;
                    display: flex;
                }
                .rd4tz {
                    color : #2987F0;
                    font-size : 12px;
                    font-weight: bold;
                }
                .rd4ty {
                    margin-top : 1%;
                    font-weight: bold;
                    font-size : 18px;
                }
                .rd4ty span {
                    color :#FA5858;
                }
                .rd4-select {
                    position: relative;
                    cursor: pointer;
                    left : 29vw;
                    padding-top : 1.5%;
                    padding-bottom: 1.5%;
                    padding-left : 2.5%;
                    padding-right : 3%;
                    border-radius: 5px;
                    width : 70px;
                    height : 40px;
                    background-color: #2987F0;
                    color : white;
                }
                
                .main-4 {
                    margin-top : 3%;
                    padding-bottom : 3%;
                    border-bottom : 10px solid #CDCDCD;
                }
                .m4-h1 {
                    font-size : 28px;
                    font-weight: bold;
                    font-family: 'Jua', sans-serif;
                }
                .m4-tit {
                    margin-bottom : 3%;
                }
                .m4-detail ul {
                    margin-bottom : 4%;
                }
                .m4-detail li {
                    list-style: disc;
                    list-style-position: inside;
                    line-height : 250%;
                    font-size : 16px;
                    
                }
                .m4-img {
                    width : 90%;
                    margin : auto;
                    display: block;
                    border-radius: 8px;
                }
                .m4-detail h2 {
                    margin-top : 5%;
                    font-size : 21px;
                    margin-bottom : 3%;
                    
                }
                .main-5, .main-6 {
                    margin-top : 3%;
                    padding-bottom : 5%;
                    border-bottom : 10px solid #CDCDCD;
                }
                .m5-tit {
                    font-size : 26px;
                    font-weight: bold;
                    margin-bottom : 3%;
                    font-family: 'Jua', sans-serif;
                }
                .m6-tit {
                    font-size : 26px;
                    font-weight: bold;
                    margin-bottom : 3%;
                    font-family: 'Jua', sans-serif;
                    display: flex;
                    justify-content: space-between;
                }
                .m6-tit a img {
                    width : 40px;
                }
                .m6-tit span {
                    color : #2987F0;
                }
                .m5-img {
                    border-radius: 15px;
                }
                .m5d-2 {
                    background-color: #F5F5F5;
                    margin-top : 3%;
                    line-height: 250%;
                    padding : 2%;
                }
                .m5d-2 span {
                    font-weight: bold;
                    font-size : 14px;
                    margin-right : 2%;
                }
                .m5-loca, .m5-tel {
                    font-size : 13px;
                }
                .m5-hpg a {
                    text-decoration: none;
                    color : black;
                    font-size : 13px;
                }
                .m5-btn {
                    width : 100%;
                    margin-top : 2%;
                    padding-top : 2%;
                    padding-bottom : 2%;
                    background-color: #2987F0;
                    border : 0;
                    color : white;
                    font-weight: bold;
                    border-radius: 5px;
                    cursor: pointer;
                }
                .m5d-4, .m5d-7 {
                    margin-top : 4%;
                    padding-bottom: 3%;
                    border-bottom: 1px solid #E2E2E2;
                }
                .m5d-4 h2, .m5d-5 h2, .m5d-6 h2, .m5d-7 h2 {
                    margin-bottom : 2%;
                }
                .m5d-4 span {
                    line-height: 200%;
                    font-size : 15px;
                }
                .m5d-5,.m5d-6 {
                    margin-top : 4%;
                    padding-bottom: 3%;
                    border-bottom: 1px solid #E2E2E2;
                    overflow: hidden;
                }
                .m5d5-text,.m5d6-text {
                    display: -webkit-box;
                    -webkit-line-clamp: 3;
                    -webkit-box-orient: vertical;
                    overflow: hidden;
                }
                .btncover {
                    position: relative;
                    left : 30vw;
                }
                .morebtn {
                    appearance: none;
                    border : 2px solid black;
                    padding: 0.5em;
                    border-radius: 0.25em;
                    cursor: pointer;
                    margin: 1rem; 
                }
                .morebtn::before {
                    content :"자세히 보기";
                    
                    
                }
                .morebtn:checked:before {
                    content: "닫기";
                    
                    
                }
                .m5d5-text:has(+.btncover .morebtn:checked), .m5d6-text:has(+.btncover .morebtn:checked){
                    -webkit-line-clamp: unset;
                }
                .inter, .parking, .health, .activity, .normal {
                    margin-top : 3%;
                }
                .inter-tit img, .parking-tit img, .health-tit img, .activity-tit img, .normal-tit img {
                    width : 2vw;
                    position: relative;
                    top : 0.3vh;
                    left : 0.3vw;
                }
                .inter-tit span, .parking-tit span, .health-tit span, .activity-tit span, .normal-tit span {
                    font-weight: bold;
                    font-size : 14px;
                }
                .inter-list, .parking-list, .health-list,.activity-list, .normal-list {
                    margin-top : 1%;
                    margin-left : 5%;
                }
                .inter-list span, .parking-list span, .health-list span, .activity-list span, .normal-list span {
                    margin-right : 2%;
                    font-size : 13px;
                    font-weight: bold;
                    color : #adadad;
                }
                .review-sel {
                    display: flex;
                    
                    width : 20%;
                    justify-content: space-between;
                }
                .suggest {
                    background-image: url("https://assets.triple.guide/images/img-search-select-off@4x.png");
                    color : rgba(58, 58, 58, 0.3);
                    background-size: 5px 5px;
                    background-position: left 35%;
                    background-repeat: no-repeat;
                    cursor: pointer;
                    padding-left: 9px;
                    font-size: 14px;
                    font-weight: bold;
                    line-height: 22px;
                }
                .suggestz {
                    background-image: url("https://assets.triple.guide/images/img-search-select-on@4x.png");
                    color : rgb(58, 58, 58);
                    background-size: 5px 5px;
                    background-position: left 35%;
                    background-repeat: no-repeat;
                    cursor: pointer;
                    padding-left: 9px;
                    font-size: 14px;
                    font-weight: bold;
                    line-height: 22px;
                }
                .m6-stit {
                    display: flex;
                    justify-content: space-between;
                }
                .fast-img {
                    width : 16px;
                    height: 16px;
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
                    display: block;
                }
                .text-img img {
                    width : 10px;
                    height : 10px;
                    position: absolute;
                    top : 16px;
                    right : 17px;
                    cursor: pointer;
                }
                .sel-check {
                    appearance: none;
                    width : 22px;
                    height : 22px;
                    margin: 3px 8px 3px 4px;
                    border-radius: 5px;
                    position : relative;
                    top : 25%;
                    cursor: pointer;
                    border : 1px solid rgba(58,58,58,0.2);
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
                .review {
                    margin-top : 5%;
                }
                .user-info {
                    display: flex;
                }
                .uimg {
                    width : 36px;
                    height : 36px;
                    border-radius: 19px;
                    object-fit: cover;
                }
                .user-detail {
                    margin-left : 3%;
                    overflow-wrap: break-word;
                }
                .user-name {
                    color: rgb(58, 58, 58);
                    font-size : 15px;
                    font-weight: bold;
                }
                .user-level {
                    color : rgba(58, 58, 58, 0.4);
                    font-size : 12px;
                }
                .rw-sect {
                    width : 40%;
                    height : 2vh;
                    
                }
                .rw-star {
                    margin-top : 4%;
                    width : 51.8%;
                    height : 100%;
                    background-image: url("https://yaimg.yanolja.com/joy/sunny/static/images/icon-score-yayellow-fill.svg");
                    background-repeat: repeat-x;
                }
                .rw-ssea {
                    width : 30%;
                }
                .rw-date {
                    margin-top : 1%;
                }
                .date-img {
                    width : 16px;
                    height : 16px;
                    position: relative;
                    top : 0.25vh;
                }
                .date-text1 {
                    color : #2987F0;
                    font-weight: bold;
                    font-size : 14px;
                    
                }
                .date-text2 {
                    color : rgba(58, 58, 58, 0.7);
                    font-weight: 550;
                    font-size : 13px;
                }
                .rw-text {
                    color :rgb(58, 58, 58);
                    font-weight: 500;
                    font-size : 16px;
                    overflow-wrap: break-word;
                }
                .rw-img {
                    margin-top : 2%;
                }
                .rwi-1 {
                    display : flex;
                    gap : 5px;
                    
                    flex-wrap: wrap;
                    
                }
                .rw-img img {
                    border-radius: 4px;
                    width :  auto;
                    height : 30vh;
                    
                }
                .rw-foot {
                    margin-top : 1%;
                }
                .foot-detail {
                    display: flex;
                    
                    font-weight: bold;
                    color : rgba(58, 58, 58, 0.4);
                    width : 30%;
                }
                .foot-detail img {
                    width : 18px;
                    height : 18px;
                    position: relative;
                    top : 0.4vh;
                    left : 0.2vw;
                    
                }
                .f-good {
                    margin-right :3%; 
                }
                .f-comment {
                    margin-left : 2%;
                }
                .more-img {
                    width : 30px;
                    height : 30px;
                    cursor: pointer;
                }
                .rw-foot {
                    display : flex;
                    justify-content: space-between;
                }
                .foot-date {
                    display: flex;
                    font-weight: bold;
                    font-size : 12px;
                    color : rgba(58, 58, 58, 0.4);
                    
                    width : 30%;
                    justify-content: end;
                }
                .ft-date {
                    line-height : 235%;
                    margin-right : 5%;
                }
                .review {
                    border-bottom : 1px solid rgb(239, 239, 239);
                    padding-bottom : 3%;
                }
                .foot-lastz a {
                    color: rgba(58, 58, 58, 0.8);
                    text-decoration: none;
                    font-weight: 550;
                }
                .foot-last {
                    width: 4vw;
                    background-color: white;
                    border: 1px solid rgba(239,239,239,1);
                    box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 15px;
                    border-radius: 8px;
                    color: rgba(58, 58, 58, 0.8);
                    padding: 15px 37px 15px 15px;
                    font-size: 12px;
                    position: relative;
                    left: 84%;
                    bottom: 1.2vh;
                    display: none;
                    line-height: 150%;
                }
                .foot-lastz {
                    width: 4vw;
                    background-color: white;
                    border: 1px solid rgba(239,239,239,1);
                    box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 15px;
                    border-radius: 8px;
                    color: rgba(58, 58, 58, 0.8);
                    padding: 15px 37px 15px 15px;
                    font-size: 12px;
                    position: relative;
                    left: 84%;
                    bottom: 1.2vh;
                    display: block;
                    line-height: 150%;
                }
                .foot-lastz img {
                    width : 10px;
                    height : 10px;
                    position: absolute;
                    top : 18px;
                    right : 13px;
                    cursor: pointer;
                }
                a {
 					text-decoration: none;
				}
            </style>
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <div class="hl-1">
                                <a href="#">
                                    <img class= "tit1" src="titname.jpg"/>
                                    <img class= "tit2" src="titlogo.jpg"/>
                                </a>
                            </div>
                        </div>
                        <div class="hd-mid">
                            <div class="hm-1">
                                <input type="text" placeholder="어느 도시가 궁금하세요?">
                                <img class="hm-img" src="https://assets.triple.guide/images/btn-com-search@3x.png">
                            </div>
                        </div>
                        <div class="hd-right">
                            <div class="my-page">
                                <a href="#">
                                    <div class="mp-ind">
                                        <img class="hdr1" src="https://cdn-icons-png.flaticon.com/512/3502/3502458.png"/>
                                        <img class="hdr2" src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-my-empty.svg"/>
                                    </div>
                                </a> 
                                
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <div class="main">
                <div class="main-1">
                    <div class="m1-mid">
                        <img src="https://yaimg.yanolja.com/v5/2023/06/20/15/1280/6491c4ed9b8271.60312078.jpg">
                    </div>
                    <div class="m1-top">
                        <div class="m1t-tit">
                            <span>${pen.NAME }</span><br>
                        </div>
                            <h4>${pen.PENSION_ENG_NAME }</h4>
                        <div class="m1t-sc">
                            <div class="mltsc-2">
                                <img class= "ml2-img" src="https://assets.triple.guide/images/ico-save@4x.png">
                                <span>${pen.JJ }</span>
                            </div>
                            <div class="mltsc-1">
                                <div class="ml-sect">
                                    <div class="mlstar">

                                    </div>
                                </div>
                                <span>${pen.SAVG }</span>
                            </div>
                            <div class="mltsc-3">
                                <span><a href="#see_review">리뷰보기 〉</a></span>
                            </div>
                        </div>
                        <div class="mlt-loca">
                            <img class= "mltl-img" src="https://assets.triple.guide/images/ico-end-location@3x.png">
                            <span class="mltl-text">${pen.ADDR1_NAME}`${pen.ADDR2_NAME }</span>
                            <span class="mltl-map" id="map-move"><a href="#see_map">지도보기 〉</a></span>
                        </div>
                    </div>
                    <div class="m1-bot">
                        <div class="mb-z">
                            <div class="mb-save">
                                <a href="#">
                                    <img class= "mb-img"src="https://assets.triple.guide/images/btn-end-save-off@4x.png">
                                    <h4>저장하기</h4>
                                </a>
                            </div>
                            <div class="mb-save">
                                <a href="#">
                                    <img class= "mb-img"src="https://assets.triple.guide/images/btn-end-schedule@4x.png">
                                    <h4>일정추가</h4>
                                </a>
                            </div>
                            <div class="mb-save">
                                <a href="#">
                                    <img class= "mb-img"src="https://assets.triple.guide/images/btn-end-review@4x.png">
                                    <h4>리뷰쓰기</h4>
                                </a>
                            </div>
                            <div class="mb-save" style="margin-top : -0.8%;">
                                <a href="#">
                                    <img class= "mb-img" src="https://assets.triple.guide/images/btn-com-share@4x.png">
                                    <h4 style="margin-left : 3%;">공유하기</h4>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-2">
                    <div class="m2-top">
                        <div class="m2t-tit">
                            <span>최저가 예약</span>
                        </div>
                        <div class="m2-mid">
                            <div class="m2-select">
                                <div class="date-margin">
                                    <span><input type="button" value ="날짜 선택"  class="m2-date" onclick="dis1()"></span>
                                
                                		<div class="num" style="width:800px;">
										<div id='dis1' style="display: none;">
								
										<input type="text" id="dateRangePicker" />
											<div>
											  <p>체크 인 : <span id="startDate"></span></p>
											  <p>체크 아웃: <span id="endDate"></span></p>
											  <p>투숙 기간: <span id="duration"></span></p>
											</div>
										</div>
										</div>
                                </div>
                                
                                

                                <div class="m2-ppick">
                                    <input type="button" value ="인원 선택"  class="m2-person" onclick="dis2()">
                                    
                                    <div class="num" style="width:800px;">
		
										<div id='dis2' style="display: none;">
										<span>성인</span>
										<span class="count">
											<a class="minus">-</a>
											<span id="result">1</span>
											<a class="plus">+</a>
										</span> / 
										<span>아동</span>
										<span class="select">
											<a onclick="dis3();" class="a" >-</a>
											<span id="totalCount">0</span>
											<a onclick="dis3();" class="b">+</a>
										</span>
										</div>
										
										<div id='dis3' style="display: none;">
											<table border='1'>
											  <tr>
											    <td><input type="button" value="만  0세" onclick="buttonClicked(this)"></td>
											    <td><input type="button" value="만  1세" onclick="buttonClicked(this)"></td>
											    <td><input type="button" value="만  2세" onclick="buttonClicked(this)"></td>
											    <td><input type="button" value="만  3세" onclick="buttonClicked(this)"></td>
											    <td><input type="button" value="만  4세" onclick="buttonClicked(this)"></td>
											    <td><input type="button" value="만  5세" onclick="buttonClicked(this)"></td>
											  </tr>
											  <tr>
											    <td><input type="button" value="만  6세" onclick="buttonClicked(this)"></td>
											    <td><input type="button" value="만  7세" onclick="buttonClicked(this)"></td>
											    <td><input type="button" value="만  8세" onclick="buttonClicked(this)"></td>
											    <td><input type="button" value="만  9세" onclick="buttonClicked(this)"></td>
											    <td><input type="button" value="만 10세" onclick="buttonClicked(this)"></td>
											    <td><input type="button" value="만 11세" onclick="buttonClicked(this)"></td>
											  </tr>
											</table>
								
											<p>나이를 선택해주세요: <span id="selectedButtons"></span></p>
											
										</div>
									</div>
                                </div>
                                
                                
                            </div> 
                        </div>
                        <div class="m2-dmid">
                            <div class="low-price">
                                <div class="low-com">
                                    <img class="lc-img1" src="titname.jpg">
                                    <img class="lc-img2" src="titlogo.jpg">
                                </div>
                                <div class="low-tag">
                                	<c:forEach var="room" items="${room }" begin="0" end ="0">
                                    <span class="lt-1" id="roomprice">${room.ROOM_PRICE }원</span>
                                    <span class="lt-2"><a href="#roomlist"> > </a></span>
                                	</c:forEach>
                                </div>
                            </div>
                            
                            
                            <div class="low-how">
                                <div class="low-date">
                                    <span>1박, 세금포함</span>
                                </div>
                                <div class="low-cup">
                                    <span>쿠폰 받으면 최대<span class="low-red"> 4천원</span> 할인</span>
                                </div>
                            </div>
                        </div>
                        <div class="m2-ddmid">
                            <div class="cup-sale">
                                <div class="cs-tit">
                                    <span class="ct-red">쿠폰할인</span>
                                    <span>쿠폰 받고 할인받으세요!</span>
                                </div>
                                <div class="cs-get">
                                    <a href="${pen.WEBSITE }" id="popupLink">
                                        <span>쿠폰받기</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-3">
                    <div class="m3-top">
                        <div class="m3t-tit" id="roomlist">
                            <span class="m3tit-1">객실 목록</span>
                            <span class="m3tit-2">1박, 세금포함</span>
                        </div>
                        <div class="m3t-filter">
                            <div class="m3-list" id="morn" onclick="changeF('morn')">
                                조식 포함
                            </div>
                            <div class="m3-list" id="free" onclick="changeF('free')">
                                무료취소
                            </div>
                            <div class="m3-list" id="now" onclick="changeF('now')"> 
                                지금 결제
                            </div>
                            <div class="m3-list" id="hyun" onclick="changeF('hyun')">
                                현장 결제
                            </div>
                        </div>
                        <div class="m3t-room">
                    <form action="${cpath}/admin/member/accom/detailRoom" method="post" id="roomForm">
						<input type="hidden"id="room_seq" name="room_seq" value="">
					</form>
                        <c:forEach var = "room" items="${room }">
                        <table>
                            <div class="room-title">
                                <div class="room-top">
                                    <div class="room-info">
                                        <h2>${room.ROOM_NAME }</h2>
                                        <img class= "room-max" src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-my-empty.svg">
                                        <span>최대 ${room.MAXPEOPLE }인</span>
                                    </div>
                                    <img class="room-img" src="https://image.goodchoice.kr/resize_490x348/affiliate/2021/12/21/09/lqesREkWab1F.jpg">
                                    <span class="ri-count">+14</span>
                                </div>
                                <div class="room-down">
                                    <span class="rd-tit">무료취소</span>
                                    <div class="rd-1">
                                        <img class="rd-1img" src="https://cdn-icons-png.flaticon.com/512/657/657072.png">  ${room.ROOM_VIEW_NAME }
                                    </div>
                                    <div class="rd-2">
                                        <img class= "rd-2img" src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-my-empty.svg"> 2인 기준 / 최대 ${room.MAXPEOPLE }인
                                    </div>
                                    <div class="rd-3">
                                        <span>쿠폰할인</span>
                                    </div>
                                    <div class="rd-4">
                                        <div class="rd4-tit">
                                            <div class="rd4tz">
                                                ${room.ROOM_CNT }개 남음!
                                            </div>
                                            <div class="rd4ty">
                                                <span>3%</span>
                                            </div>
                                                <span id="roomprice2">${room.ROOM_PRICE }</span> 
                                            <div>
                                            	<span id="formattedPrice"></span>
                                            </div>
                                        </div>
                                        <div>
                                            <input type="button" value="선택"  class="rd4-select"  onclick="chooseRoom(${room.ROOM_SEQ})">
                                        </div>
                                    </div>
                                </div>
                            </div>
                          </table>
					</c:forEach>
                        </div>
                    </div>
                </div>

                
                
                <div class="main-4">
                    <div class="m4-top">
                         ${pen.PR }
                    </div>
                </div>
                <div class="main-5">
                    <div class="m5-top">
                        <div class="m5-tit" id="see_map">
                            <span>기본정보</span>
                        </div>
                        <div class="m5-detail">
                            <div class="m3m-map" >
                            	<div id="map" style="width:735px;height:350px;"></div>
                        	</div>
                            <div class="m5d-2">
                                <div class="m5-loca">
                                    <span>주소</span> ${pen.ADDR}
                                </div>
                                <div class="m5-tel">
                                    <span>전화</span> ${pen.TEL }
                                </div>
                                <div class="m5-hpg">
                                    <span>홈페이지</span> <a href="${pen.WEBSITE }">${pen.WEBSITE }/</a>
                                </div>
                            </div>
                            <div class="m5d-3">
                                <button class="m5-btn">길찾기</button>
                            </div>
                            <div class="m5d-4">
                                <h2>숙소 찾아가는 방법</h2>
                                <span>- ${pen.WAY }<br><br></span>
                            </div>
                            <div class="m5d-5">
                                <h2>공지사항</h2>
                                
                                <span class="m5d5-text">
                                ${pen.PENSION_NOTICE }
                                </span>
                                <div class="btncover"><input type="checkbox" class="morebtn"></div>
                                
                            </div>
                            <div class="m5d-6">
                                <h2>픽업 안내</h2>
                                <span class="m5d6-text">
                                    -${pen.PENSION_PICKUP }
                                </span>
                                <div class="btncover"><input type="checkbox" class="morebtn"></div>
                            </div>
                            <div class="m5d-7">
                                <h2>보건&안전</h2>
                                <div class="inter">
                            <table>
							<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

							<c:forEach var="item" items="${hslist}" varStatus="status">
    						<tr>
						        <td>
						            <c:if test="${status.index > 0 && hslist[status.index-1].HS == item.HS}">
						                
						            </c:if>
						            <c:if test="${status.index == 0 || hslist[status.index-1].HS != item.HS}">
						                <c:out value="❁${item.HS}"/>
						            </c:if>
						        </td>
						    </tr>
						    <tr>
						        <td><c:out value="-${item.HS_SUB_NAME}"/></td>
						    </tr>
							</c:forEach>
							</table>
                                </div><br>
							<hr>
							
                            <b>편의 시설</b>
                            <div class="parking">
							<table>
							<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
							
							<c:forEach var="item" items="${cflist}" varStatus="status">
							    <tr>
							        <td>
							            <c:if test="${status.index > 0 && cflist[status.index-1].CF == item.CF}">
							                
							            </c:if>
							            <c:if test="${status.index == 0 || cflist[status.index-1].CF != item.CF}">
							                <c:out value="❁${item.CF}"/>
							            </c:if>
							        </td>
							    </tr>
							    <tr>
							        <td><c:out value="-${item.CF_SUB_NAME}"/></td>
							    </tr>
							</c:forEach>
							</table>
                                </div>
                                
                                </div>
                            </div>
                            <div class="m5d-6">
                                <h2>숙소 설명</h2>
                                <span class="m5d6-text">
                                    ${pen.PENSION_EXPLANATION}
                                </span>
                                <div class="btncover"><input type="checkbox" class="morebtn"></div>
                            </div>
                            <hr>
                            <div class="m5d-6">
                                <h2>숙소 정책</h2>
                                <c:forEach var="pol" items="${pol }">
                                <span class="m5d6-text">${pol.POLICY_CATE_NAME }</span><br>
                                <span>${pol.POLICY_CONTENT }</span><br><br>
                                </c:forEach>
                                <div class="btncover"><input type="checkbox" class="morebtn"></div>
                            </div>
                            <hr>
                            <div class="m5d-6">
                                <h2>숙소 중요 정보</h2>
                                <c:forEach var="info" items = "${info }">
                                
                                <span class="m5d6-text">${info.INFO_CATE_NAME }</span>
                                <span>${info.INFO_CONTENT }</span>
                                </c:forEach>
                                <div class="btncover"><input type="checkbox" class="morebtn"></div>
                            </div>
                            <hr>
                        </div>
                    </div>
                </div>
                <div class="main-6">
                    <div class="m6-tit" id="see_review">
                        <h2>리뷰 <span>3</span></h2>
                        <a href="#"><img src="https://assets.triple.guide/images/btn-com-write@2x.png"></a>
                    </div>
                    <div class="m6-stit">
                        <div class="review-sel">
                            <div class="suggestz" id="sugges" onclick="changeb('sugges')">
                                추천순
                            </div>
                            <div class="suggest" id="fast" onclick="changeb('fast')">
                                최신순
                            </div>
                        </div>
                        <div class="mon6-sel">
                            <input type="checkbox" class="sel-check">
                            <span style="color : rgb(58, 58, 58); font-size : 14px;">최근 여행</span>
                            <img class="fast-img" onclick="addTip()" src="https://assets.triple.guide/images/ico_tooltip_info_black@4x.png">
                        </div>
                    </div>
                    <div class="sel-text" id="tip-add">
                        최근 6개월 내에 방문한 여행의 리뷰만 모아 볼 수 있습니다.
                        <div class="text-img">
                            <img onclick="XTip()" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
                        </div>
                    </div>
                    <div class="review">
                        <div class="rw-top">
                            <div class="user-info">
                                <div class="user-img">
                                    <img class="uimg" src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_2048,w_2048/80ad1f93-72c0-4799-bba6-fd65bffbba8b.jpeg">
                                </div>
                                <div class="user-detail">
                                    <div class="user-name">거누</div>
                                    <div class="user-level">
                                        <span>LEVEL1 /</span>
                                        <span>17개의 리뷰</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="rw-main">
                            <div class="rw-ssea">
                                <div class="rw-sect">
                                    <div class="rw-star">

                                    </div>
                                </div>
                            </div>
                            <div class="rw-date">
                                <div class="fast-date">
                                    <img class="date-img" src="https://assets.triple.guide/images/ico_recently_badge@4x.png"> 
                                    <span class="date-text1">최근 여행</span>
                                    <span class="date-text2"> 2023년 06월 여행</span>
                                </div>
                            </div>
                            <div class="rw-text">
                                <span>가족들 여행하기 딱 좋아요 입장권 안 아깝고 잘 다녀왔습니다 :) 계곡도 잠깐 있었는데 좋네요  !!</span>
                            </div>
                            <div class="rw-img">
                                <div class="rwi-list">
                                    <div class="rwi-1">
                                        <img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/f206fbcd-24d3-4f1c-8893-169f3d17873f.jpeg">
                                        <img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/f206fbcd-24d3-4f1c-8893-169f3d17873f.jpeg">
                                        <img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/f206fbcd-24d3-4f1c-8893-169f3d17873f.jpeg">
                                        <img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/f206fbcd-24d3-4f1c-8893-169f3d17873f.jpeg">
                                    </div>
                                </div>
                            </div>
                            <div class="rw-foot">
                                <div class="foot-detail">
                                    <div class="f-good">
                                        <img src="https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png">
                                        <span>0</span>
                                    </div>
                                    <span>·</span>
                                    <div class="f-comment">
                                        <img src="https://assets.triple.guide/images/btn-lounge-comment-off@3x.png">
                                        <span>0</span>
                                    </div>
                                </div>
                                <div class="foot-date">
                                    <div class="ft-date">
                                        <span>2023.6.24</span>
                                    </div>
                                    <div class="ft-more">
                                        <img class="more-img" onclick="addTool()" src="https://assets.triple.guide/images/btn-review-more@4x.png">
                                    </div>
                                </div>
                            </div>
                            <div class="foot-last" id="tool-add">
                                <div class="report">
                                    <a href="#"><span>신고하기</span></a>
                                </div>
                                <div class="share">
                                    <a href="#"><span>공유하기</span></a>
                                </div>
                                <img onclick="XTool()" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
                            </div>
                        </div>
                    </div>
                </div>
            
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50a663b98a69e54c2f47df28be00018a&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${pen.ADDR}', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:140px;text-align:center;padding:6px 0;">${pen.NAME}</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>
            
            
            
            <script>
            
            
            
            
                function changeF(item){

                    const cN = document.querySelectorAll('.m3-listz');
                    
                    const mId = document.getElementById(item);
                    const mC = mId.className;
                    if(mC !='m3-listz'){
                        mId.className = 'm3-listz';            
                    }else{
                        mId.className = 'm3-list';
                    }
                 
                }

                function changeb(item) {
                    const sG = document.querySelectorAll('.suggestz');
                    console.log(sG);
                    if(sG.length != 0){
                        for(var i =0; i<sG.length; i++){
                            sG[i].className = "suggest";
                        }
                    }
                    const sId = document.getElementById(item);
                    const sC = sId.className;
                    if(sC !='suggestz') {
                        sId.className = 'suggestz';
                    }else {
                        sId.className = 'suggest';
                    }
                }

                function addTip() {
                    const tip_add = document.getElementById("tip-add");
                    tip_add.className = "sel-textz";
                }
                function XTip() {
                    const tip_add = document.getElementById("tip-add");
                    tip_add.className = "sel-text";
                }

                function addTool() {
                    const tool_add = document.getElementById("tool-add");
                    tool_add.className = "foot-lastz";
                }
                function XTool() {
                    const tool_add = document.getElementById("tool-add");
                    tool_add.className = "foot-last";
                }
                
                
                
                //금액 콤마
				const rp = document.getElementById("roomprice");
				const rp2 = document.querySelectorAll("#roomprice2");
                
				console.log(rp2);
				
                const roomPriceStr = rp.innerText.replace(/,/g, ''); 
				const roomPrice = parseFloat(roomPriceStr); 
				const formattedPrice = roomPrice.toLocaleString('ko-KR');
				
				for(let i=0; i<rp2.length; i++){
					const roomPriceStr2 = rp2[i].innerText.replace(/,/g, ''); 
					const roomPrice2 = parseFloat(roomPriceStr2); 
					const formattedPrice2 = roomPrice2.toLocaleString('ko-KR');
					rp2[i].innerText = formattedPrice2+"원";					
				}
				
				rp.innerText = formattedPrice+"원";
            </script>

            
            
            
        </body>
    </html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
            <c:set var="cpath" value="${pageContext.request.contextPath }" />
            <script type="text/javascript" src="${cpath }/resources/js/httpRequest.js"></script>
            <script
			  src="https://code.jquery.com/jquery-3.7.0.js"
			  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			  crossorigin="anonymous">
			</script>
            <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
            <title>나를 아는 여행 앱, 트리플</title>

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
                .main-1 {
                    border-radius: 15px;
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
                    border-radius: 15px;
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
                    margin-top : 4%;
                    margin-left : 10%;
                }
                .m2-mid {
                    width : 100%;
                }
                .m2-date, .m2-person {
                    border : 1px solid;
                    width : 40%;
                    height : 7vh;
                    text-align: center;
                    line-height: 7vh;
                    border-radius: 5px;
                    border : 2px solid #E2E2E2;
                    font-size : 14px;
                    font-weight: bold;
                }
                .m2-dmid, .m2-ddmid {
                    
                    
                    margin-top : 4%;
                    
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
                    width : 70px;
                    position: relative;
                    top : -1vh;
                    left : 1vw;
                }
                .lc-img2 {
                    width : 10px;
                    position: relative;
                    top : -3vh;
                    left : 0.7vw;
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
                    font-weight: bold;
                    font-size : 13px;
                    color : #929292;
                }
                .low-red {
                    color: rgb(253, 46, 105);
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
                    left : 31vw;
                    padding-top : 1.5%;
                    padding-bottom: 1.5%;
                    padding-left : 3%;
                    padding-right : 3%;
                    border-radius: 5px;
                    background-color: #2987F0;
                    color : white;
                }
                .main-4 {
                    margin-top : 3%;
                    padding-bottom : 3%;
                    border-bottom : 10px solid #CDCDCD;
                }
                .m4-h1 {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgb(58, 58, 58);
                    float: none;
                    font-weight: bold;
                    white-space: pre-line;
                    
                    font-size: 21px;
                    line-height: 1.2;
                    letter-spacing: 0px
                }
                .m4-tit {
                    margin-bottom : 3%;
                }
                .m4-detail ul {
                    margin-bottom : 4%;
                }
                
                .m4-imgsection {
                    padding-top : 3%;
                    padding-bottom : 8%;
                    border-bottom: 2px solid rgb(239, 239, 239);
                }
                .m4-img {
                    width : 100%;
                    margin : auto;
                    display: block;
                    
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
                .rw-img img {
                    border-radius: 4px;
                    
                    
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
                .rwi-list {
                    display: flex;
                    align-items: flex-start;
                    padding: 10px;
                }
                .rwi-1 {
                    flex: 2;
                    margin-right: 10px;
                    overflow: hidden;
                    
                }
                .rwi-1 img {
                    width: 100%;
                    height: 46.5vh;
                    display: block;
                    object-fit: cover;
                }
                .rwi-2 {
                    flex: 1;
                    display: flex;
                    flex-direction: column;
                }
                .rwi-2 img {
                    width: 100%;
                    height : 100% auto;
                    max-height: 15vh;
                    margin-bottom: 5px;
                    object-fit: cover;
                }
                .menu-header {
                    font-size : 20px;
                    font-weight: bold;
                    
                }
                .menu-list {
                    
                    padding-top : 5%;
                }
                .ml-container {
                    padding-bottom: 20px;
                    white-space: nowrap;
                    overflow: scroll hidden;
                    
                }
                .ml-container::-webkit-scrollbar {
                    width: 4px;
                    height : 7px;
                }

                .ml-container::-webkit-scrollbar-thumb {
                    height: 30%;
                    background-color: rgba(33, 122, 244, .1); /* 스크롤바 색상 */
                    border-radius: 10px;
                }

                .ml-container::-webkit-scrollbar-track {
                    background-color: white;
                }
                .list-container {
                    width : 20%;
                    display : inline-block;
                    vertical-align: top;
                }
                .list-container img {
                    object-fit: cover;
                    border-radius: 6px;
                    width: 140px;
                    aspect-ratio: auto 140 / 140;
                    height: 140px;
                    vertical-align: top;
                }
                .menu-title {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgb(58, 58, 58);
                    float: none;
                    font-weight: bold;
                    white-space: pre-line;
                    margin-top : 10px; 
                    font-size: 15px;
                    line-height: 17px;
                    letter-spacing: 0px;
                    padding-right : 0.5vw;
                }
                .menu-detail {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgba(58, 58, 58, 0.7);
                    float: none;
                    font-weight: 500;
                    white-space: pre-line;
                    margin: 5px 0px 0px;
                    font-size: 14px;
                    line-height: 18px;
                    letter-spacing: 0px;
                    padding-right : 0.5vw;
                }
                .menu-price {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgb(58, 58, 58);
                    float: none;
                    font-weight: bold;
                    white-space: pre-line;
                    margin: 5px 0px 0px;
                    font-size: 14px;
                    line-height: 16px;
                    letter-spacing: 0px;
                }
                .slider {
                    border-radius: 15px;
                }
                .slider img {
                    width : 100%;
                    height : 60vh;
                    border-radius: 15px;
                    object-fit: cover;
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
                    top : 17vh;
                    left : 67vw;
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
                .m1t-cate {
                    display : flex;
                    gap : 2%;
                }
                .cate-text {
                    font-size: 12px;
                    font-weight: 700;
                    padding: 0px 6px;
                    height: 24px;
                    opacity: 0.5;
                    line-height: 24px;
                    background-color: rgba(58,58,58,0.05);
                    color : rgba(58,58,58,0.7);
                }
                .m1t-stit {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgba(58, 58, 58, 0.5);
                    float: none;
                    font-weight: 500;
                    
                    font-size: 13px;
                    line-height: 1.2;
                    letter-spacing: 0px;
                }
                .cs-btn {
                    margin-top : 5%;
                    width : 100%;
                    border : 1px solid;
                    box-sizing: border-box;
                    text-align: center;
                    font-weight: bold;
                    font-size: 14px;
                    line-height: 17px;
                    border-radius: 4px;
                    padding: 14px 12px;
                    border: 1px solid rgb(54, 143, 255);
                    background-color: rgb(54, 143, 255);
                    color: white;
                }
                .give-info {
                    padding: 20px;
                    border-radius: 6px;
                    background-color: rgb(250, 250, 250);
                    margin-top : 3%;
                }
                .bout-info, .cancel-info {
                    display : flex;
                }
                .main-section {
                    color: rgb(58, 58, 58);
                    font-size: 14px;
                    font-weight: bold;
                    line-height: 250%;
                    width : 20%;
                }
                .sub-section {
                    color: rgba(58, 58, 58, 0.7);
                    font-size : 14px;
                    
                    line-height: 250%;
                }
                .other-top {
                    display : flex;
                    justify-content: space-between;
                }
                .other-img {
                    width : 45px;
                    position: relative;
                    top : 3vh;
                }
                .other-name {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgb(58, 58, 58);
                    float: none;
                    font-weight: bold;
                    white-space: pre-line;
                    margin: 4px 0px;
                    font-size: 16px;
                    line-height: 1.2;
                    letter-spacing: 0px;
                }
                .other-text {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgba(58, 58, 58, 0.4);
                    float: none;
                    font-weight: 500;
                    font-size: 13px;
                    line-height: 1.2;
                    letter-spacing: 0px;
                    white-space: nowrap;
                    text-overflow: ellipsis;
                    overflow: hidden;
                }
                .other-ask {
                    float: none;
                    font-weight: bold;
                    text-align: center;
                    box-sizing: border-box;
                    width: 100%;
                    display: block;
                    margin: 20px 0px 0px;
                    font-size: 14px;
                    line-height: 17px;
                    border: 1px solid rgba(58,58,58,0.2);
                    border-radius: 4px;
                    background-color: transparent;
                    color: rgb(58, 58, 58);
                    padding: 14px 12px;
                    cursor: pointer;
                }
                .other-ask img {
                    width : 16px;
                }
                .m3-title {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgb(58, 58, 58);
                    float: none;
                    font-weight: bold;
                    white-space: pre-line;
                    font-size: 21px;
                    line-height: 1.2;
                    letter-spacing: 0px;
                }
                .m3-text li, .rule-list li {
                    padding-left: 18px;
                    text-indent: -18px;
                }
                .m3-text li::before, .rule-list li::before {
                    display: inline-block;
                    width: 10px;
                    height: 10px;
                    background-image: url(https://assets.triple.guide/images/img-bullet-oval@3x.png);
                    background-size: 10px 10px;
                    background-position: center center;
                    background-repeat: no-repeat;
                    content: "";
                }
                .m3-text div, .rule-list div {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgba(58, 58, 58, 0.9);
                    float: none;
                    font-weight: 500;
                    white-space: pre-line;
                    margin: 4px 0px 0px;
                    font-size: 16px;
                    line-height: 1.63;
                    letter-spacing: 0px;
                    margin-left: 8px;
                    display: inline;
                }
                .m3-text {
                    padding-top : 3%;
                }
                .m4-location {
                    padding: 3%;
                    border-radius: 6px;
                    background-color: rgb(250, 250, 250);
                }
                .m4l-title {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgb(58, 58, 58);
                    float: none;
                    font-weight: bold;
                    
                    font-size: 14px;
                    line-height: 1.57;
                    letter-spacing: 0px;
                }
                .m4l-detail {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgba(58, 58, 58, 0.8);
                    float: none;
                    font-weight: 500;
                    white-space: pre-line;
                    font-size: 14px;
                    line-height: 1.57;
                    letter-spacing: 0px;
                }
                .m4-rule {
                    padding-top : 3%;
                    
                    border-bottom : 2px solid rgb(239, 239, 239);
                }
                .rule-title {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgb(58, 58, 58);
                    float: none;
                    font-weight: bold;
                    white-space: pre-line;
                    list-style: none;
                    font-size: 16px;
                    line-height: 1.2;
                    letter-spacing: 0px;
                }
                .rule-list {
                    padding-top : 2%;
                }
                .use-info, .care-info {
                    display: flex;
                    justify-content: space-between;
                    border-bottom: 2px solid rgb(239, 239, 239);
                    padding-bottom : 3.5%;
                    padding-top : 1.5%;
                    
                }
                .use-title, .care-title {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgb(58, 58, 58);
                    float: none;
                    font-weight: bold;
                    white-space: pre-line;
                    margin: 0px 0px 5px;
                    font-size: 16px;
                    line-height: 1.2;
                    letter-spacing: 0px;
                }
                .use-img img, .care-img img {
                    width : 24px;
                    position: relative;
                    top : 2.5vh;
                }
                .use-tagz, .care-plsz {
                    position: fixed;
                    bottom : 0;
                    background-color: white;
                    z-index: 999;
                    box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
                    box-sizing: border-box;
                    width : 40%;
                    border-top-right-radius: 25px;
                    border-top-left-radius: 25px;
                    height : 50vh;
                    display : block;
                }
                .use-tag, .care-pls {
                    position: fixed;
                    bottom : 0;
                    background-color: white;
                    z-index: 999;
                    box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
                    box-sizing: border-box;
                    width : 40%;
                    border-top-right-radius: 25px;
                    border-top-left-radius: 25px;
                    height : 50vh;
                    display : none;
                }
                .tag-detail, .pls-detail {
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgba(58, 58, 58, 0.9);
                    float: none;
                    font-weight: 500;
                    white-space: pre-line;
                    margin: 10px 30px 0px;
                    font-size: 16px;
                    line-height: 1.63;
                    letter-spacing: 0px;
                    margin-left : 20%;
                    margin-right : 20%;
                }
                .tag-header img, .care-header img {
                    width : 60px;
                    position : relative;
                    top : 1.3vh;
                    left : 1.3vw;
                }
                .tag-header, .care-header {
                    padding-bottom : 2%;
                    
                }
                .tag-title, .pls-title {
                    margin-left : 20%;
                    margin-right : 20%;
                    padding-top : 2%;
                    padding-bottom : 2%;
                    box-sizing: border-box;
                    overflow-wrap: break-word;
                    color: rgb(58, 58, 58);
                    float: none;
                    font-weight: bold;
                    white-space: pre-line;
                    font-size: 21px;
                    line-height: 1.2;
                    letter-spacing: 0px;
                    border-bottom : 2px solid rgb(239, 239, 239);
                }
                .logoImg{
				    width: 50%;
				    position: relative;
				    right: 55px;
                	bottom: 12px;
                }
                .tkContent{
                	margin-top: 3%;
                }
            </style>
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <div class="hl-1">
                                <a href="${cpath}/">
                                    <img class= "tit1" src="${cpath }/resources/logo/titname.jpg"/>
                                    <img class= "tit2" src="${cpath }/resources/logo/titlogo.jpg"/>
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
                        <div class="slider">
                            <div><img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/d1608537-b5dc-407e-85d5-55497b345cde.jpeg" alt="Image 1"></div>
                            <div><img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/ece69bc1-afbf-4feb-a0dc-c8bc55ed0afc.jpeg" alt="Image 2"></div>
                            <div><img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/495155f0-f0d7-4c2d-913d-887e593018c2.jpeg" alt="Image 3"></div>
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
                    <div class="m1-top">
                        <div class="m1t-cate">
                        	<c:forEach var="c" items="${cates }">
	                            <div class="cate-text">
	                                <span>${c }</span>
	                            </div>
                        	</c:forEach>
                        </div>
                        <div class="m1t-tit">
                            <span>${tk.TICKET_NAME }</span>
                        </div>
                        <div class="m1t-stit">
                            <span>${tk.TICKET_INTRO }</span>
                        </div>
                        <div class="m1t-sc">
                            <div class="mltsc-2">
                                <img class= "ml2-img" src="https://assets.triple.guide/images/ico-save@4x.png">
                                <span>${tk.JJ }</span>
                            </div>
                        </div>
                        <div class="mlt-loca">
                            <img class= "mltl-img" src="https://assets.triple.guide/images/ico-end-location@3x.png">
                            <span class="mltl-text">${tk.ADDR1_NAME } ${tk.ADDR2_NAME }</span>
                        </div>
                    </div>
                    <div class="m1-bot">
                        <div class="mb-z">
                        	<input type="hidden" id="ticket_seq" value="${tk.TICKET_SEQ }">
                        	<input type="hidden" id="lgcheck" value="${lgcheck }">
                            <c:choose>
                               	<c:when test="${!check}">
		                            <div class="mb-save">
		                                <a id="jjimbtn" onclick="javascript:myjjim()" style="cursor: pointer; margin-left : 2%;">
		                                    <img class="mb-img" id="jjimimg" src="https://assets.triple.guide/images/btn-end-save-off@4x.png">
		                                    <h4>저장하기</h4>
		                                </a>
		                            </div>
                                </c:when>
								<c:otherwise>
		                            <div class="mb-save">
										<a id="jjimbtn" onclick="javascript:myjjim()" style="cursor: pointer; position : relative; top : 0.6vh; left : 0.4vw;">
		                                    <img id="jjimimg" style= "width : 32px;"src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4=">
		                                    <h4 style="position : relative; top : 0.2vh; right : 0.4vw;">저장취소</h4>
		                                </a>
	                                </div>
	                            </c:otherwise>
							</c:choose>
                            <div class="mb-save" style="margin-top : -0.8%;">
                                <a onclick="clip();" style="cursor: pointer; margin-left : 3%;">
                                    <img class= "mb-img" src="https://assets.triple.guide/images/btn-com-share@4x.png">
                                    <h4 style="margin-left : 3%;">공유하기</h4>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-2">
                    <div class="m2-top">
                        <div class="m2-dmid">
                            <div class="low-price">
                                 <div class="logoImg">
                                    <img class= "tit1" src="${cpath }/resources/logo/titname.jpg"/>
                                    <img class= "tit2" src="${cpath }/resources/logo/titlogo.jpg"/>
                            	</div>
                                <div class="low-tag">
                                    <span class="lt-1"><fmt:formatNumber value="${tk.MIN_PRICE }" pattern="#,##0" />원</span>
                                </div>
                            </div>
                            <div class="low-how">
                                <div class="low-date">
                                    <span></span>
                                </div>
                                <div class="low-cup">
                                    <span class="low-red">쿠폰할인</span><span>가능</span>
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
                                    <a href="#">
                                        <span>쿠폰받기</span>
                                    </a>
                                </div>
                            </div>
                            <div class="cs-btn">
                                <span>예약하기</span>
                            </div>
                            <div class="give-info">
                                <div class="bout-info">
                                    <div class="main-section">바우처 제공</div>
                                    <div class="sub-section">최대 1시간 소요</div>
                                </div>
                                <div class="cancel-info">
                                    <div class="main-section">취소가능여부</div>
                                    <div class="sub-section">취소 가능</div>
                                </div>
                            </div>
                            <div class="other-site">
                                <div class="other-top">
                                    <div class="other-info">
                                        <div class="other-name" onclick="document.location.href='${cpath}/ticket/t_partner?t_partner_seq=${tk.T_PARTNER_SEQ }'">
                                            <span>${tk.T_PARTNER_NAME }</span>
                                        </div>
                                        <div class="other-text">
                                            <span>${tk.T_PARTNER_INTRO }</span>
                                        </div>
                                    </div>
                                    <div class="other-img">
                                        <img class="uimg" src="${cpath}/common/getImg?path=${tk.T_PARTNER_IMG }&file=${nm }">
                                    </div>
                                </div>
                                <div class="other-bot">
                                    <div class="other-ask">
                                        <img src="https://triple.guide/tna/static/images/btn-com-message-s@3x.png">
                                        <span>투어 파트너에게 문의</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-3">
                    <div class="m3-top">
                        <div class="m3-title">
                            <span>${tk.TITLE }</span>
                        </div>
                        <!-- <ul class="m3-text">
                            <li><div>워터풀, 플라워 등 다양한 테마의 미디어 예술을 감상할 수 있어요.</div></li>
                            <li><div>시각부터 청각까지! 오감을 만족시키는 몰입형 전시를 만나보세요.</div></li>
                            <li><div>다채로운 영상을 배경으로 찍는 인생샷은 필수!</div></li>
                        </ul> -->
                        <div class="tkContent">
							${tk.CONTENT }
                        </div>
                    </div>
                </div>
                <div class="main-4">
                    <div class="m4-top">
                        <div class="m4-tit">
                            <span class="m4-h1">프로그램</span>
                        </div>
                        <div class="m4-detail">
                            <div class="m4-location">
                                <div class="m4l-title">
                                    <span>상품 기본 정보</span>
                                </div>
                                <div class="m4l-detail">・ 판매기간 : ~2030.12.31
                                        ・ 유효기간 : 구매 후 30일
                                        ・ 바코드 수령 1시간 후 이용 가능
                                </div>
                            </div>
                            <div class="m4-imgsection"> <!--이미지 넣는 공간-->
                                <img class="m4-img" src="https://media.triple.guide/triple-cms/f_auto,q_auto/73204206-3040-4508-9502-75a0d662a4df.jpeg">
                                <img class="m4-img" src="https://media.triple.guide/triple-cms/f_auto,q_auto/f28da67f-4e8a-4e61-921e-230f4dc8b605.jpeg">
                            </div>
                            <div class="m4-rule">
                                <div class="rule-title">
                                    <span>취소/환불규정</span>
                                </div>
                                <ul class="rule-list">
                                    <li><div>유효기간 당일까지 취소 시, 100% 환불</div></li>
                                    <li><div>이후 취소 및 환불불가</div></li>
                                    <li><div>유효기간: 구매일로부터 30일까지</div></li>
                                    <li><div>단, 취소 처리는 영업일 기준 09:00 ~ 17:00 이며, 토, 일요일 및 공휴일은 제외입니다.</div></li>
                                    <li><div>17:00 이후 요청된 건은 다음날 접수로 간주되며 주말 및 공휴일에 접수된 건은 다음 영업일에 접수 처리됩니다.</div></li>
                                </ul>
                            </div>
                            <div class="use-info">
                                <div class="use-title">
                                    <span>사용방법</span>
                                </div>
                                <div class="use-img"> <!--온클릭시 클릭 되는 곳-->
                                    <img src="https://assets.triple.guide/images/ico-arrow-right-black@3x.png">
                                </div>
                                <div class="use-tag">
                                    <div class="tag-header">
                                        <img src="https://assets.triple.guide/images/btn-com-close@3x.png"> <!--온클릭시 끄는 버튼-->
                                    </div>
                                    <div class="tag-text">
                                        <div class="tag-title">
                                            <span>사용방법</span>
                                        </div>
                                        <div class="tag-detail">
                                            <span>* 1. 티켓구매
                                                * 2. SMS OR 카카오 알림톡 수신
                                                  - (20~30분내 바코드 발송)
                                                * 3. 현장방문하여 바코드 제시 또는 구매자 확인 후 이용</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="care-info">
                                <div class="care-title">
                                    <span>꼭 알아두세요</span>
                                </div>
                                <div class="care-img">
                                    <img src="https://assets.triple.guide/images/ico-arrow-right-black@3x.png">
                                </div>
                                <div class="care-pls">
                                    <div class="care-header">
                                        <img src="https://assets.triple.guide/images/btn-com-close@3x.png">
                                    </div>
                                    <div class="pls-text">
                                        <div class="pls-title">
                                            <span>사용방법</span>
                                        </div>
                                        <div class="pls-detail">
                                            <span>* 1. 티켓구매
                                                * 2. SMS OR 카카오 알림톡 수신
                                                  - (20~30분내 바코드 발송)
                                                * 3. 현장방문하여 바코드 제시 또는 구매자 확인 후 이용</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                
                function clip(){
                	var url = '';
                	var textarea = document.createElement("textarea");
                	document.body.appendChild(textarea);
                	url = window.document.location.href;
                	textarea.value = url;
                	textarea.select();
                	document.execCommand("copy");
                	document.body.removeChild(textarea);
                	alert("URL이 복사되었습니다.");
                	
                }
                
                function myjjim(){
				 	const lgcheck = document.getElementById("lgcheck").value;
					console.log(lgcheck);
					if(lgcheck == "false"){
						alert("로그인이 필요한 서비스 입니다. ");
						return;
					}
					var jjimbtn = document.getElementById("jjimbtn");
					var url = null;
					var jjimimg = document.getElementById("jjimimg");
					
					if(jjimimg.src === "https://assets.triple.guide/images/btn-end-save-off@4x.png"){
						url = "${cpath}/member/doTKjjim";			
					}else{
						url = "${cpath}/member/noTKjjim";
					}
							
					console.log(jjimimg.src)
							
					var ticket_seq = document.getElementById("ticket_seq").value;
					var param = "ticket_seq=" + ticket_seq;
					
					sendRequest(url, param, function() {
						console.log(xhr.readyState)
						console.log(xhr.status)
						
						if(xhr.readyState === 4 && xhr.status === 200){
							var data = xhr.responseText;
							var jjimsrc = jjimimg.src;
							jjimimg.src = '';
							
							if(data == '찜!' && jjimsrc == 'https://assets.triple.guide/images/btn-end-save-off@4x.png'){
								jjimsrc = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4=';
							}else if(data != '찜!' && jjimsrc == 'https://assets.triple.guide/images/btn-end-save-off@4x.png'){
								jjimsrc = 'https://assets.triple.guide/images/btn-end-save-off@4x.png';
							}else if(data == '찜!' && jjimsrc == 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4='){
								jjimsrc = 'https://assets.triple.guide/images/btn-end-save-off@4x.png';
							}else{
								jjimsrc = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4=';
							}
							console.log(jjimsrc)
							
							var ticket_seq = document.getElementById("ticket_seq").value;
							var param = "ticket_seq" + ticket_seq;
							var url = "${cpath}/member/tkjjimcnt";
							
							sendRequest(url, param, function(){
								if(xhr.readyState === 4 && xhr.status === 200){
									var data = xhr.responseText;
									var jjimcnt = document.getElementById("jjimcnt");
									
									jjimcnt.innerText = data;
								}
							}, "POST");
						}
					}, "POST");
					location.reload();
				} 
            </script>
        </body>
    </html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${cpath }/resources/js/httpRequest.js"></script>
<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap"
	rel="stylesheet">
	
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

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
	width: 100vw;
	height: 900vh;
}

.inner {
	box-shadow: 0px 2px 0px 0px #F2F2F2;
	height: 13vh;
}

.hd-in {
	display: flex;
	justify-content: space-around;
	line-height: 13vh;
}

.hd-left {
	width: 25%;
}

.hd-mid, .hd-right {
	width: 33%;
}

.hm-1 input {
	width: 80%;
	height: 8vh;
	font-size: 18px;
	border: 0;
	border-bottom: 2px solid #929292;
}

.hm-img {
	width: 10%;
	position: relative;
	top: 2vh;
	right: 3.5vw;
}

.my-page {
	height: 13vh;
}

.my-page a {
	text-decoration: none;
}

.mp-ind {
	width: 25%;
	border: 2px solid #E2E2E2;
	border-radius: 45px;
	height: 8vh;
	margin-top: 4%;
	margin-left: 45%;
}

.mp-ind:hover {
	transition-duration: 0.3s;
	box-shadow: 0px 4px 3px #adadad;
}

.hdr1 {
	width: 30%;
	margin-left: 16%;
	margin-bottom: 4%;
}

.hdr2 {
	width: 30%;
	margin-bottom: 4%;
}

.hl-1 a {
	text-decoration: none;
}

.tit1 {
	width: 25%;
	margin-left: 20%;
	position: relative;
	top: 2vh;
}

.tit2 {
	width: 5%;
	position: relative;
	top: -1vh;
	right: 0.5vw;
}

.main-1, .main-2, .main-3, .main-4, .main-5, .main-6, .main-7 {
	margin-left: 26%;
	margin-right: 26%;
}

.main-1 {
	border-radius: 15px;
}

.main-2, .main-3 {
	border-bottom: 10px solid #CDCDCD;
	padding-bottom: 4%;
}

.main-3 {
	margin-top: 3%;
}

.m1t-tit {
	margin-top: 2%;
	font-size: 25px;
	font-weight: bold;
}

.m1t-sc {
	margin-top: 2%;
	display: flex;
}

.mltsc-1 {
	width: 30%;
}

.mlt-loca {
	margin-top: 2%;
}

.mltl-img {
	width: 2%;
}

.mltl-text {
	font-size: 13px;
	font-weight: bold;
	color: #898989;
}

.mltl-map {
	font-weight: bolder;
	color: #2987F0;
	font-size: 12px;
	margin-left: 1%;
	position: relative;
	top: 0.3vh;
}

.m1-mid {
	margin-top: 2%;
	border-radius: 15px;
}

.mlstar {
	margin-top: 4%;
	width: 47.6%;
	height: 100%;
	background-image:
		url("https://yaimg.yanolja.com/joy/sunny/static/images/icon-score-yayellow-fill.svg");
	background-repeat: repeat-x;
}

.mltsc-1 {
	display: flex;
	font-weight: bold;
}

.mltsc-1 span {
	position: relative;
	right: 1.2vw;
	bottom: 0.2vh;
}

.ml-sect {
	width: 40%;
}

.ml2-img {
	width: 15%;
	position: relative;
	top: 0.3vh;
}

.mltsc-2 {
	font-weight: bold;
	position: relative;
	bottom: 0.2vh;
}

.mltsc-3 {
	font-weight: bold;
	color: #2987F0;
	font-size: 14px;
	position: relative;
	right: 15%;
	top: 0.2vh;
}

.mb-z {
	border-bottom: 10px solid #CDCDCD;
	display: flex;
	justify-content: space-around;
	height: 10vh;
	padding-bottom: 2%;
	padding-left: 5%;
}

.mb-img {
	width: 25%;
	margin-left: 10%;
	margin-top: 10%;
}

.mb-save h4 {
	font-weight: 500;
	color: #CDCDCD;
	font-size: 14px;
}

.mb-save a {
	text-decoration: none;
	color: #CDCDCD;
}

.m2-top {
	margin-top: 5%;
}

.m2t-tit span {
	font-weight: bold;
	font-size: 20px;
}

.m1-top {
	border-bottom: 2px solid #CDCDCD;
	padding-bottom: 3%;
}

.m2-select {
	display: flex;
	margin-top: 4%;
	margin-left: 10%;
}

.m2-mid {
	width: 100%;
}

.m2-date, .m2-person {
	border: 1px solid;
	width: 40%;
	height: 7vh;
	text-align: center;
	line-height: 7vh;
	border-radius: 5px;
	border: 2px solid #E2E2E2;
	font-size: 14px;
	font-weight: bold;
}

.m2-dmid, .m2-ddmid {
	width: 72.5%;
	margin-top: 4%;
	margin-left: 10%;
	border-radius: 5px;
}

.low-com {
	margin-top: 1.5%;
}

.low-price {
	display: flex;
	justify-content: space-between;
}

.lc-img1 {
	width: 45px;
}

.lc-img2 {
	width: 6px;
	position: relative;
	top: -1.5vh;
	left: -0.45vw;
}

.lt-1 {
	font-size: 22px;
	font-weight: bold;
}

.lt-2 {
	font-weight: bold;
	font-size: 24px;
	position: relative;
	top: -0.3vh;
}

.low-how {
	display: flex;
	justify-content: space-between;
	margin-top: 2%;
}

.low-date {
	font-weight: bold;
	color: #CDCDCD;
	font-size: 12px;
}

.low-cup {
	margin-right: 5%;
	font-weight: bold;
	font-size: 14px;
	color: #929292;
}

.low-red {
	color: #FA5858;
}

.cup-sale {
	display: flex;
	justify-content: space-between;
	padding: 2%;
	background-color: #F5F5F5;
}

.cs-tit span {
	font-weight: bold;
	font-size: 13.5px;
	color: #CDCDCD;
}

.ct-red {
	color: #FA5858 !important;
}

.cs-get a {
	color: #929292;
	font-size: 13.5px;
}

.m3tit-1 {
	font-size: 19px;
	font-weight: bold;
}

.m3tit-2 {
	margin-left: 70%;
	font-size: 13px;
	font-weight: bold;
	color: #CDCDCD;
}

.m3t-filter {
	margin-top: 3%;
	display: flex;
	justify-content: space-around;
}

.m3-list {
	border: 2px solid #adadad;
	border-radius: 5px;
	padding-top: 1%;
	padding-bottom: 1%;
	padding-left: 2%;
	padding-right: 2%;
	cursor: pointer;
	color: #adadad;
}

.m3-listz {
	border: 2px solid white;
	border-radius: 5px;
	padding-top: 1%;
	padding-bottom: 1%;
	padding-left: 2%;
	padding-right: 2%;
	cursor: pointer;
	color: white;
	background-color: #2987F0;
}

.m3t-room {
	margin-top: 3%;
	padding-bottom: 5%;
	border-bottom: 1px solid #CDCDCD;
}

.room-title {
	padding-top: 2%;
	padding-left: 2%;
}

.room-top {
	cursor: pointer;
}

.room-img {
	width: 100px;
	height: 100px;
	position: relative;
	left: 38vw;
	top: -5vh;
	border-radius: 5px;
}

.room-info h2 {
	font-size: 20px;
}

.room-max {
	width: 17px;
	position: relative;
	top: 0.5vh;
}

.room-info span {
	font-size: 13px;
}

.ri-count {
	position: relative;
	left: 35vw;
	top: -7vh;
	font-weight: bold;
	color: white;
}

.room-down {
	border-radius: 5px;
	background-color: #F5F5F5;
	padding: 2%;
}

.rd-tit {
	color: #2987F0;
	font-weight: bold;
	font-size: 14px;
}

.rd-1img {
	width: 10px;
	border: 1px solid;
	border-radius: 50%;
	padding: 0.3%;
	position: relative;
	top: 0.4vh;
}

.rd-1, .rd-2 {
	margin-top: 1%;
	font-size: 12px;
	font-weight: bold;
	color: #929292;
}

.rd-2img {
	width: 17px;
	position: relative;
	top: 0.4vh;
}

.rd-3 {
	margin-top: 3%;
}

.rd-3 span {
	padding: 0.5%;
	font-size: 13px;
	border-radius: 3px;
	font-weight: bold;
	color: white;
	background-color: #FA5858;
}

.rd-4 {
	margin-top: 2%;
	display: flex;
}

.rd4tz {
	color: #2987F0;
	font-size: 12px;
	font-weight: bold;
}

.rd4ty {
	margin-top: 1%;
	font-weight: bold;
	font-size: 18px;
}

.rd4ty span {
	color: #FA5858;
}

.rd4-select {
	position: relative;
	cursor: pointer;
	left: 31vw;
	padding-top: 1.5%;
	padding-bottom: 1.5%;
	padding-left: 3%;
	padding-right: 3%;
	border-radius: 5px;
	background-color: #2987F0;
	color: white;
}

.main-4 {
	margin-top: 3%;
	padding-bottom: 3%;
	border-bottom: 10px solid #CDCDCD;
}

.m4-h1 {
	font-size: 28px;
	font-weight: bold;
	font-family: 'Jua', sans-serif;
}

.m4-tit {
	margin-bottom: 3%;
}

.m4-detail ul {
	margin-bottom: 4%;
}

.m4-detail li {
	list-style: disc;
	list-style-position: inside;
	line-height: 250%;
	font-size: 16px;
}

.m4-img {
	width: 90%;
	margin: auto;
	display: block;
	border-radius: 8px;
}

.m4-detail h2 {
	margin-top: 5%;
	font-size: 21px;
	margin-bottom: 3%;
}

.main-5, .main-6 {
	margin-top: 3%;
	padding-bottom: 5%;
	border-bottom: 10px solid #CDCDCD;
}

.m5-tit {
	font-size: 26px;
	font-weight: bold;
	margin-bottom: 3%;
	font-family: 'Jua', sans-serif;
}

.m6-tit {
	font-size: 26px;
	font-weight: bold;
	margin-bottom: 3%;
	font-family: 'Jua', sans-serif;
	display: flex;
	justify-content: space-between;
}

.m6-tit a img {
	width: 40px;
}

.m6-tit span {
	color: #2987F0;
}

.m5-img {
	border-radius: 15px;
}

.m5d-2 {
	background-color: #F5F5F5;
	margin-top: 3%;
	line-height: 250%;
	padding: 2%;
}

.m5d-2 span {
	font-weight: bold;
	font-size: 14px;
	margin-right: 2%;
}

.m5-loca, .m5-tel {
	font-size: 13px;
}

.m5-hpg a {
	text-decoration: none;
	color: black;
	font-size: 13px;
}

.m5-btn {
	background-color: white;
	border-radius: 5px;
	padding: 1%;
	font-weight: bold;
	cursor: pointer;
}

.m5d-4, .m5d-7 {
	margin-top: 4%;
	padding-bottom: 3%;
	border-bottom: 1px solid #E2E2E2;
}

.m5d-4 h2, .m5d-5 h2, .m5d-6 h2, .m5d-7 h2 {
	margin-bottom: 2%;
}

.m5d-4 span {
	line-height: 200%;
	font-size: 15px;
}

.m5d-5, .m5d-6 {
	margin-top: 4%;
	padding-bottom: 3%;
	border-bottom: 1px solid #E2E2E2;
	overflow: hidden;
}

.m5d5-text, .m5d6-text {
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.btncover {
	position: relative;
	left: 30vw;
}

.morebtn {
	appearance: none;
	border: 2px solid black;
	padding: 0.5em;
	border-radius: 0.25em;
	cursor: pointer;
	margin: 1rem;
}

.morebtn::before {
	content: "자세히 보기";
}

.morebtn:checked:before {
	content: "닫기";
}

.m5d5-text:has(+.btncover .morebtn:checked), .m5d6-text:has(+.btncover .morebtn:checked)
	{
	-webkit-line-clamp: unset;
}

.inter, .parking, .health, .activity, .normal {
	margin-top: 3%;
}

.inter-tit img, .parking-tit img, .health-tit img, .activity-tit img,
	.normal-tit img {
	width: 2vw;
	position: relative;
	top: 0.3vh;
	left: 0.3vw;
}

.inter-tit span, .parking-tit span, .health-tit span, .activity-tit span,
	.normal-tit span {
	font-weight: bold;
	font-size: 14px;
}

.inter-list, .parking-list, .health-list, .activity-list, .normal-list {
	margin-top: 1%;
	margin-left: 5%;
}

.inter-list span, .parking-list span, .health-list span, .activity-list span,
	.normal-list span {
	margin-right: 2%;
	font-size: 13px;
	font-weight: bold;
	color: #adadad;
}

.review-sel {
	display: flex;
	width: 20%;
	justify-content: space-between;
}

.suggest {
	background-image:
		url("https://assets.triple.guide/images/img-search-select-off@4x.png");
	color: rgba(58, 58, 58, 0.3);
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
	background-image:
		url("https://assets.triple.guide/images/img-search-select-on@4x.png");
	color: rgb(58, 58, 58);
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
	width: 16px;
	height: 16px;
	cursor: pointer;
}

.sel-text {
	width: 9vw;
	background-color: white;
	border: 1px solid rgba(239, 239, 239, 1);
	box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 15px;
	border-radius: 8px;
	color: rgba(58, 58, 58, 0.8);
	font-weight: 500;
	padding: 15px 37px 15px 15px;
	font-size: 12px;
	position: relative;
	left: 74%;
	bottom: 1.2vh;
	display: none;
}

.sel-textz {
	width: 9vw;
	background-color: white;
	border: 1px solid rgba(239, 239, 239, 1);
	box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 15px;
	border-radius: 8px;
	color: rgba(58, 58, 58, 0.8);
	font-weight: 500;
	padding: 15px 37px 15px 15px;
	font-size: 12px;
	position: relative;
	left: 74%;
	bottom: 1.2vh;
	display: block;
}

.text-img img {
	width: 10px;
	height: 10px;
	position: absolute;
	top: 16px;
	right: 17px;
	cursor: pointer;
}

.sel-check {
	appearance: none;
	width: 22px;
	height: 22px;
	margin: 3px 8px 3px 4px;
	border-radius: 5px;
	position: relative;
	top: 25%;
	cursor: pointer;
	border: 1px solid rgba(58, 58, 58, 0.2);
}

.sel-check:checked {
	background-color: #2987F0;
	border: none;
}

.sel-check::after {
	content: "";
	display: block;
	width: 100%;
	height: 100%;
	background-image:
		url("https://assets.triple.guide/images/ico-check@3x.png");
	background-size: 100% 100%;
}

.review {
	margin-top: 5%;
}

.user-info {
	display: flex;
}

.uimg {
	width: 36px;
	height: 36px;
	border-radius: 19px;
	object-fit: cover;
}

.user-detail {
	margin-left: 3%;
	overflow-wrap: break-word;
}

.user-name {
	color: rgb(58, 58, 58);
	font-size: 15px;
	font-weight: bold;
}

.user-level {
	color: rgba(58, 58, 58, 0.4);
	font-size: 12px;
}

.rw-sect {
	width: 40%;
	height: 2vh;
}

.rw-star {
	margin-top: 4%;
	width: 51.8%;
	height: 100%;
	background-image:
		url("https://yaimg.yanolja.com/joy/sunny/static/images/icon-score-yayellow-fill.svg");
	background-repeat: repeat-x;
}

.rw-ssea {
	width: 30%;
}

.rw-date {
	margin-top: 1%;
}

.date-img {
	width: 16px;
	height: 16px;
	position: relative;
	top: 0.25vh;
}

.date-text1 {
	color: #2987F0;
	font-weight: bold;
	font-size: 14px;
}

.date-text2 {
	color: rgba(58, 58, 58, 0.7);
	font-weight: 550;
	font-size: 13px;
}

.rw-text {
	color: rgb(58, 58, 58);
	font-weight: 500;
	font-size: 16px;
	overflow-wrap: break-word;
}

.foot-detail {
	display: flex;
	font-weight: bold;
	color: rgba(58, 58, 58, 0.4);
	width: 30%;
}

.foot-detail img {
	width: 18px;
	height: 18px;
	position: relative;
	top: 0.4vh;
	left: 0.2vw;
}

.f-good {
	margin-right: 3%;
}

.f-comment {
	margin-left: 2%;
}

.more-img {
	width: 30px;
	height: 30px;
	cursor: pointer;
}

.foot-date {
	display: flex;
	font-weight: bold;
	font-size: 12px;
	color: rgba(58, 58, 58, 0.4);
	width: 30%;
	justify-content: end;
}

.ft-date {
	line-height: 235%;
	margin-right: 5%;
}

.foot-lastz a {
	color: rgba(58, 58, 58, 0.8);
	text-decoration: none;
	font-weight: 550;
}

.foot-last {
	width: 4vw;
	background-color: white;
	border: 1px solid rgba(239, 239, 239, 1);
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
	border: 1px solid rgba(239, 239, 239, 1);
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
	width: 10px;
	height: 10px;
	position: absolute;
	top: 18px;
	right: 13px;
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
	height: 100% auto;
	max-height: 15vh;
	margin-bottom: 5px;
	object-fit: cover;
}

.menu-header {
	font-size: 20px;
	font-weight: bold;
}

.menu-list {
	padding-top: 5%;
}

.ml-container {
	padding-bottom: 20px;
	white-space: nowrap;
	overflow: scroll hidden;
}

.ml-container::-webkit-scrollbar {
	width: 4px;
	height: 7px;
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
	width: 20%;
	display: inline-block;
	vertical-align: top;
}

.list-container img {
	object-fit: cover;
	border-radius: 6px;
	width: 140px;
	aspect-ratio: auto 140/140;
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
	margin-top: 10px;
	font-size: 15px;
	line-height: 17px;
	letter-spacing: 0px;
	padding-right: 0.5vw;
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
	padding-right: 0.5vw;
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
	width: 100%;
	height: 60vh;
	border-radius: 15px;
}

.counter {
	position: absolute;
    padding-left: 2%;
    padding-right: 2%;
    padding-top: 0.5%;
    padding-bottom: 0.5%;
    border-radius: 15px;
    background-color: rgba(0, 0, 0, 0.2);
    color: white;
    top: 17%;
    left: 67vw;
    font-size: 19px;
    font-weight: bold;
}

.slider-controls {
    height: 0px;
    text-align: center;
}

.slider-controls button {
    background-color : transparent;
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
.prev-button {
    position: relative;
    bottom: 35vh;
    right: 19.5vw;
}                
.next-button {
    position: relative;
    bottom: 35vh;
    left: 19.5vw;
} 
.m5t-amend {
    margin-top : 1%;
    text-align: right;
}
.m5t-amend a {
    text-decoration: none;
    color : black;
    font-weight: bold;
    font-size : 14px;
}
#today{
	cursor: pointer; 
	display: flex;
}  
.main-7 {
	margin-top: 2%;
	padding-bottom: 4%;
	border-bottom: 10px solid #EFEFEF;
}
.real-btn1 {
	width : 65px;
	transform: rotate(180deg);
}                
.real-btn2 {
	width : 65px;
} 
.main-6  {
    margin-top : 2%;
    padding-bottom : 2%;
    border-bottom :1px solid #F3F3F3;
}
.t-m6-tit {
    font-size : 25px;
    font-weight: bold;
    margin-bottom : 3%;
    font-family: 'Jua', sans-serif;
    display: flex;
    justify-content: space-between;
}
.t-m6-tit a img {
    width : 40px;
}
.t-m6-tit span {
    color : #2987F0;
}
.t-m6-stit {
    display: flex;
    justify-content: space-between;
}
.t-review-sel {
    display: flex;
    
    width : 20%;
    justify-content: space-between;
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
.review {
    margin-top : 5%;
    padding-bottom: 2%;
    border-bottom: 2px solid #EFEFEF;
}
.review0 {
    margin-top : 5%;
    padding-bottom: 2%;
    border-bottom: 2px solid #EFEFEF;
}
.review1 {
    margin-top : 5%;
    padding-bottom: 2%;
    border-bottom: 2px solid #EFEFEF;
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
    margin-left : 1%;
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
.rw-date {
    margin-top : 1%;
    margin-bottom: 1%;
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
.rw-img {
    margin-top : 1%;
}
.rw-img img {
    border-radius: 4px;
    width :  auto;
    height : 30vh;
}
.rwi-1 {
    display : flex;
    gap : 5px;
    flex-wrap: wrap;
    
}
.rw-text {
    color :rgb(58, 58, 58);
    font-weight: bold;
    font-size : 16px;
    overflow-wrap: break-word;
    padding-top: 1%;
}
.rw-foot {
    margin-top : 1%;
    display : flex;
    justify-content: space-between;
}
</style>
</head>
<body>
	<input type="hidden" id="lgcheck" value="${lgcheck }">
	<header class="header">
		<div class="inner">
			<div class="hd-in">
				<div class="hd-left">
					<div class="hl-1">
						<a href="#"> <img class="tit1" src="titname.jpg" /> <img
							class="tit2" src="titlogo.jpg" />
						</a>
					</div>
				</div>
				<div class="hd-mid">
					<div class="hm-1">
						<input type="text" placeholder="어느 도시가 궁금하세요?"> <img
							class="hm-img"
							src="https://assets.triple.guide/images/btn-com-search@3x.png">
					</div>
				</div>
				<div class="hd-right">
					<div class="my-page">
						<a href="#">
							<div class="mp-ind">
								<img class="hdr1"
									src="https://cdn-icons-png.flaticon.com/512/3502/3502458.png" />
								<img class="hdr2"
									src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-my-empty.svg" />
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
					<div>
						<img src="${cpath}/common/getImg?path=${h.MAIN_IMG }&file=${main}"
							alt="Image 1">
					</div>
					<c:if test="${sub !=null }">
						<c:forEach var="pho" items="${sub }" varStatus="i">
							<div>
								<img src="${cpath}/common/getImg?path=${h.H_IMG }&file=${pho}"
									alt="Image ${i.count +1}">
							</div>
						</c:forEach>
					</c:if>
				</div>

				<span class="counter"><span class="current-slide">1</span>/<span class="total-slides">${length }</span></span>
				<div class="slider-controls">
	                <button class="prev-button">
	                	<img class="real-btn1" src="https://www.vodafone.co.uk/cs/groups/public/documents/webcontent/img_800x800_chevronrightshadow.png">
	                </button>
	                <button class="next-button">
	                	<img class="real-btn2" src="https://www.vodafone.co.uk/cs/groups/public/documents/webcontent/img_800x800_chevronrightshadow.png">
	                </button> 
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
				<div class="m1t-tit">
					<span>${h.NAME }</span>
				</div>
				<div class="m1t-sc">
					<div class="mltsc-1">
						<div class="ml-sect">
							<div class="mlstar" style="width:${savg}%"></div>
						</div>
						<span>${h.RV }&nbsp;</span>
					</div>
					<div class="mltsc-2">
						<img class="ml2-img"
							src="https://assets.triple.guide/images/ico-save@4x.png"> <span
							id="jjimcnt">${h.JJ }</span>
					</div>
				</div>
				<div class="mlt-loca">
					<img class="mltl-img"
						src="https://assets.triple.guide/images/ico-end-location@3x.png">
					<span class="mltl-text">${h.ADDR2_NAME }</span>
				</div>
			</div>
			<div class="m1-bot">
               <div class="mb-z">
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
                   
                   <div class="mb-save">
                       <a onclick="addPlan()" style="cursor: pointer; margin-left : 3%;">
                           <img class= "mb-img"src="https://assets.triple.guide/images/btn-end-schedule@4x.png">
                           <h4>일정추가</h4>
                       </a>
                   </div>
                   <div class="mb-save">
                       <a href="${cpath }/member/review/write?f_seq=${tour.F_SEQ}" style="cursor: pointer; margin-left : 3%;">
                           <img class= "mb-img"src="https://assets.triple.guide/images/btn-end-review@4x.png">
                           <h4>리뷰쓰기</h4>
                       </a>
                   </div>
                   <div class="mb-save">
                       <a onclick="clip();" style="cursor: pointer; margin-left : 3%;">
                           <img class= "mb-img" src="https://assets.triple.guide/images/btn-com-share@4x.png">
                           <h4>공유하기</h4>
                       </a>
                   </div>
               </div>
            </div>   
		</div>
		<div class="main-4">
			<div class="m4-top">
				<div class="m4-tit">
					<span class="m4-h1">${h.intro }</span>
				</div>
				<c:if test="${mlist != null }">
					<div class="m4-menu">
						<div class="menu-header">
							<span>대표메뉴</span>
						</div>
						<div class="menu-list">
							<ul class="ml-container">
								<c:forEach var="m" items="${mlist }" varStatus="i">
									<li class="list-container">
										<div>
											<img
												src="${cpath}/common/getImg?path=${m.menu_img }&file=${mname[i.index]}">
										</div>
										<div class="menu-title">
											<span>${m.name }</span>
										</div>
										<div class="menu-detail">
											<span>${m.info }</span>
										</div>
										<div class="menu-price">
											<span><fmt:formatNumber value="${m.price}" pattern="#,##0" />원 
											<c:if test="${m.price_detail!= null }">
													(${m.price_detail })
												</c:if> </span>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<div class="main-5">
			<div class="m5-top">
				<div class="m5-tit">
					<span>기본정보</span>
				</div>
				<div class="m5t-amend">
					<a href="${cpath}/member/revision/form?f_seq=${param.f_seq}"> 정보수정 제안 〉 </a>
				</div>
			</div>
			<div class="m5-detail">
 				<div class="m5d-1">
					<div id="map" style="width: 100%; height: 350px;"></div>
				</div>
                <div class="m5d-2">
                    <div class="m5-loca">
						<span>주소</span><a onclick="location.reload();"
							style="cursor: pointer;">${h.ADDR }</a>
					</div>
					<c:if test="${h.TEL!= null }">
						<div class="m5-tel">
							<span>전화</span> ${h.TEL }
						</div>
					</c:if>
					<c:if test="${h.WEBSITE!= null }">
						<div class="m5-hpg">
							<span>홈페이지</span> <a href="${h.WEBSITE }" target="_blank">${h.WEBSITE }</a>
						</div>
					</c:if>
				</div>
				<c:if test="${h.WAY != null }">
					<div class="m5d-4">
						<h2>가는 방법</h2>
						<span>${h.WAY }</span>
					</div>
				</c:if>
			</div>
		</div>
		<div class="main-5">
			<div class="m5-tit">
				<span>이용가능시간, 휴무일</span>
			</div>
			<br>
			<c:if test="${!empty hours }">
				<div id="today" onclick="detail()" style="cursor: pointer;">
					<font color="#3691FF"><b>오늘&nbsp;&nbsp; 
					<c:forEach var="h" items="${hours }">
						<c:if test="${today == h.day_name }">
		                    	${h.time }
		                    <c:if test="${h.hours_cate_seq == 2 || h.hours_cate_seq == 3}">
								<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    </c:if>
							<c:if test="${h.hours_cate_seq == 1}">
		                    		~
		                    	</c:if>
						</c:if>
					</c:forEach>
					</b></font>
					<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;〉</span>
				</div>
				<br>
				<div id="weektime" style="display: none;">
					<br>
					<c:forEach var="d" items="${day }">
                   		• ${d.day_name }&nbsp;&nbsp;
                    		<c:forEach var="h" items="${hours }" varStatus="i">
                    			<c:if test="${d.day_seq == h.day_seq }">
                    				 <c:if test="${h.hours_cate_seq == 2 && (h.time < '12:00')}">
                    					다음 날
                    				</c:if>
			                    		${h.time }
                    				<c:if test="${h.hours_cate_seq == 2 || h.hours_cate_seq == 3}">
                    					<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                    	</c:if>
			                    	<c:if test="${h.hours_cate_seq == 1}">
			                    		~
			                    	</c:if>
                    			</c:if>
                    		</c:forEach>
                    		<br>
                   	</c:forEach>
				</div>
			</c:if>

			<c:if test="${h.H_RUNTIME != null }">
				<div class="m5-check">
					<button class="m5-btn" onclick="window.open('${cpath}/member/hotple/runInfo?f_seq=${param.f_seq}','기간별 운영시간','width = 300px, height=400px, top=300px, left=300px, scrollbars=yes')">기간별 운영시간 확인하기</button>
				</div>
			</c:if>
		</div>
		<c:if test="${tlist != null }">
	        <div class="main-7">
	            <div class="m7-tit">
	                <span>이곳의 이용팁</span>
	            </div>
	            <c:forEach var="m" items="${tlist }">
	             <div class="m7-info" style="margin-top:1%; margin-left:1%;">
	                	<span>· ${m.TIP }</span>
	                 <div style="margin-left:50px;">
	                 	<span>${m.F_TIP }</span>
	                 </div>
	             </div>
	            </c:forEach>
	        </div>
	   </c:if>
	</div>
	
	<div class="main-6">
		<input type="hidden" id="filter" value="${filter }">
            <div class="t-m6-tit">
                <h2>리뷰 <span><c:if test="${rvcnt != null }">${rvcnt }</c:if></span></h2>
                <a href="${cpath }/member/review/write?f_seq=${param.f_seq}"><img src="https://assets.triple.guide/images/btn-com-write@2x.png"></a>
            </div>
            <div class="t-m6-stit">
                <div class="t-review-sel">
                    <div class="${filter == 1 || filter == null ? 'suggestz' : 'suggest' }" id="1" onclick="changeb(1)">
                        최신순
                    </div>
                    <div class="${filter == 0 ? 'suggestz' : 'suggest' }" id="0" onclick="changeb(0)">
                        추천순
                    </div>
                </div>
                <div class="mon6-sel">
                    <input type="checkbox" id="recentT" class="sel-check" onclick="recent()">
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
            
            <c:choose>
            	<c:when test="${empty rvlist }">
            		 <div class="review"><div class="rw-top" align="center">작성된 리뷰가 없습니다.</div></div>
            	</c:when>
            	<c:otherwise>
            		 <c:forEach var="rv" items="${rvlist }" varStatus="i">
            		 	<input type="hidden" name="rv_seq" id="rv_seq${i.count }" value="${rv.RV_SEQ }">
            		 	<c:if test="${rv.REPORT_STATUS == 0 }">
		                <div class="review${rv.recent }">
		                    <div class="rw-top">
		                        <div class="user-info">
		                            <div class="user-img">
		                            	<img src="${cpath}/common/getImg?path=${rv.M_PROFILE }&file=${rv.m_profileNM }" style="width:45px; height :45px; border-radius: 100%; cursor: pointer;" onclick="document.location.href='${cpath}/member/memberinfo?m_seq=${rv.M_SEQ }'"/>
		                            </div>
		                            <div class="user-detail">
		                                <div class="user-name"><a onclick="document.location.href='${cpath}/member/memberinfo?m_seq=${rv.M_SEQ }'" style="cursor: pointer; text-decoration: none; color: #000;">${rv.M_NICKNAME }</a></div>
		                                <div class="user-level">
		                                    <span>LEVEL${rv.M_LEVEL } /</span>
		                                    <span>${rv.MRV_CNT }개의 리뷰</span>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="rw-main">
		                        <div class="rw-ssea">
		                            <div class="rw-sect">
		                                <div class="rvstars">
			                                <c:forEach begin="1" end="${rv.STARS }" step="1">
			                                	<img src="https://yaimg.yanolja.com/joy/sunny/static/images/icon-score-yayellow-fill.svg"/>
			                                </c:forEach>
		                                </div>
		                            </div>
		                        </div>
		                        <c:if test="${!empty rv.date }">
			                        <div class="rw-date">
			                            <div class="date-area">
				                        	<c:if test="${rv.recent == 1}">
			                                	<div class="fast-date">
					                                <img class="date-img" src="https://assets.triple.guide/images/ico_recently_badge@4x.png"> 
					                                <span class="date-text1">최근 여행</span>
					                            </div>
				                            </c:if>
			                                <div class="real-date">
			                                	<span class="date-text2">${rv.year }년 ${rv.month }월 여행</span>
			                                </div>
			                            </div>
			                        </div>
		                        </c:if>
		                        <div class="rw-text" onclick="document.location.href='${cpath}/member/review/selectRV?rv_seq=${rv.RV_SEQ }'" style="cursor: pointer;">
		                            <span>${rv.CONTENT }</span>
		                        </div>
		                        <div class="rw-img" onclick="document.location.href='${cpath}/member/review/selectRV?rv_seq=${rv.RV_SEQ }'" style="cursor: pointer;">
		                            <div class="rwi-list">
		                                <div class="rwi-1">
		                                	<c:forEach var="ri" items="${rv.rv_imgNM }" varStatus="i">
		                                		<img src="${cpath}/common/getImg?path=${rv.RV_IMG }&file=${ri }">
		                                    </c:forEach>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="rw-foot">
		                            <div class="foot-detail">
		                            	<c:choose>
		                            		<c:when test="${!rv.checkRVL }">
				                                <div class="f-good" onclick="addlike(${rv.RV_SEQ})" style="cursor: pointer;">
				                                    <img id="likebtn${rv.RV_SEQ }" src="https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png">
				                                    <span id="rlcnt">${rv.RL_CNT }</span>
				                                </div>
			                                </c:when>
			                                <c:otherwise>
				                                <div class="f-good" onclick="addlike(${rv.RV_SEQ})" style="cursor: pointer;">
				                                    <img id="likebtn${rv.RV_SEQ }" src="${pageContext.request.contextPath }/resources/like/like.jpg">
				                                    <span id="rlcnt">${rv.RL_CNT }</span>
				                                </div>
			                                </c:otherwise>
		                                </c:choose>
                                
		                                <span>·</span>
		                                <div class="f-comment">
		                                    <img src="https://assets.triple.guide/images/btn-lounge-comment-off@3x.png">
		                                    <span>${rv.RC_CNT }</span>
		                                </div>
		                            </div>
		                            <div class="foot-date">
		                                <div class="ft-date">
		                                    <span>${rv.YMD }</span>
		                                </div>
		                                <div class="ft-more">
		                                    <img class="more-img"  onclick="addTool(${rv.RV_SEQ})" src="https://assets.triple.guide/images/btn-review-more@4x.png">
		                                </div>
		                            </div>
		                        </div>
                        
		                        <c:choose>
		                        	<c:when test="${rv.isMyRV == true }">
		                        		<div class="foot-last" id="tool-add${rv.RV_SEQ }">
				                            <div class="share">
				                                <a onclick="share(${rv.RV_SEQ });"><span>공유하기</span></a>
				                            </div>
				                            <img onclick="XTool(${rv.RV_SEQ })" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
				                            <div class="update">
				                                <a href="${cpath }/member/review/updateRV?rv_seq=${rv.RV_SEQ}"><span>수정하기</span></a>
				                            </div>
				                            <div class="delete">
				                                <a onclick="deleteRV(${rv.RV_SEQ})"><span>삭제하기</span></a>
				                            </div>
				                        </div>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<div class="foot-last" id="tool-add${rv.RV_SEQ }">
				                            <div class="share">
				                                <a onclick="share(${rv.RV_SEQ });"><span>공유하기</span></a>
				                            </div>
				                            <div class="report">
				                                <a style="cursor: pointer;" onclick="window.open('${cpath}/member/report/review?kind=0&rv_seq=${rv.RV_SEQ }','신고하기','width = 800px, height=600px, top=80px, left=300px, scrollbars=yes')"><span>신고하기</span></a>
				                            </div>
				                            <img onclick="XTool(${rv.RV_SEQ })" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
				                        </div>
		                        	</c:otherwise>
		                        </c:choose>
                   			 </div>
                			</div>
               			</c:if>
               			<hr>
              		</c:forEach>
            	</c:otherwise>
            </c:choose>
        </div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc12c4a684add82a89a4d0e579d39bfc&libraries=services"></script>
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
	geocoder.addressSearch('${h.ADDR}', function(result, status) {
	
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${h.NAME}</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>

	<script type="text/javascript">
		const f_seq = ${param.f_seq};

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
				url = "${cpath}/member/dojjim";			
			}else{
				url = "${cpath}/member/nojjim";
			}
					
			console.log(jjimimg.src)
					
			var param = "f_seq=" + f_seq;
			
			sendRequest(url, param, function() {
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
					
					var f_seq = document.getElementById("f_seq").value;
					var param = "f_seq" + f_seq;
					var url = "${cpath}/member/jjimcnt";
					
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
		 
		function addPlan() {				
			const lgcheck = document.getElementById("lgcheck").value;
			console.log(lgcheck);
			if(lgcheck == "false"){
				alert("로그인이 필요한 서비스 입니다. ");
				return;
			}else{
				const check = window.confirm("일정에 추가 하시겠습니까 ? ");
				if(check){
					var width = 600;
					var height = 650;
					console.log(f_seq);
					
					var windowFeatures = 'width=' + width + ',height=' + height;
					
					var url = '${pageContext.request.contextPath}/schedule/sche/chooseSche?f_seq='+f_seq;
					
					window.open(url, '_blank', windowFeatures);
					
				}else{
					return;
				}
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
		
		function detail() {
			const weektime = document.getElementById("weektime");

			if (weektime.style.display == 'none') {
				weektime.style.display = 'block';
			} else {
				weektime.style.display = 'none';

			}

		}
	</script>
</body>
</html>
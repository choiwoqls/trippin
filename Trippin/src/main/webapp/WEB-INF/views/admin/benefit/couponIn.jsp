<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script src="${cpath}/resources/js/httpRequest.js"></script>

<link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">
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
    padding-top : 5%;
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
.mi-name {
    width : 30%;
    padding-left : 2%;
    font-weight: bold;
 font-size: 17px;
}
.input-one, .input-two {
    width : 80%;
}
.input-one input {
    width : 50%;
    height : 6.5vh;
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
    margin-top : -1vh;
    color : #CDCDCD;
    font-weight: bold;
    padding-left : 1%;
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
</style>

<script>
function check(f){
		var name = f.name;
	var kind = f.kind;
	var val = f.valid_date;
	var type = f.type;
	var amo = f.amount;
	var use = f.use;
	var more = document.getElementById("more");
	var addr1 = f.addr1_seq;
	var no = f.board_no;
	var mm = f.max_min;
	
	if(name.value == ""){
		alert("쿠폰명을 입력하세요!");
		name.focus();
		return false;
	}
	if(kind.value == ""){
		alert("쿠폰 유형을 선택하세요!");
		return false;
	}
	if(val.value == ""){
		alert("혜택 기간을 설정하세요!");
		return false;
	}
	if(type.value == ""){
		alert("혜택 유형을 선택하세요!");
		return false;
	}
	if(amo.value == ""){
		alert("혜택 금액을 입력하세요!");
		return false;
	}
	if(mm.value==''){
		alert("최대할인액 또는 최소사용액을 입력하세요!");
		return false;
	}s
	if(use.value == ""){
		alert("발급 대상을 선택하세요!");
		return false;
	}
	if(more.checked && addr1.value=='0' && no.value=='0'){
		alert("특정 쿠폰의 상세 항목을 선택하세요!");
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
				<div class="hd-left">
					<img
						src="https://business.yanolja.com/common/kr/web/img/icon-home.png"
						onclick="document.location.href='${cpath}/admin/main'"> > 관리자 > 혜택관리 
						> <a href="${cpath }/admin/benefit/couponList">쿠폰관리</a> 
						> <a href="${cpath }/admin/benefit/couponIn">기본쿠폰</a>
				</div>
			</div>
		</div>
		<div class="title">
			<div class="mtitle">쿠폰 등록</div>
			<div class="stitle">
				나를 아는 여행앱 &nbsp; <span class="stitle-logo">Trippin'</span>
			</div>
		</div>
		<div class="back-btn">
			<input type="button" value="목록으로" onclick="location.href='${cpath}/admin/benefit/couponList'">
		</div>
	</header>
	<div class="main">
		<div class="main-detail">
			<form action="${cpath }/admin/benefit/cInsert" method="post" onsubmit="return check(this)">
			<div class="mi-one">
				<div class="mi-name">쿠폰명</div>
				<div class="input-one" style="margin-top : 1.3%;">
					<input type="text" name="name" value="${vo.name }">
				</div>
			</div>
			<div class="mi-one"> 
				<div class="mi-name">쿠폰 유형</div>
				<div class="input-two">
					<input type="radio" name="kind" value="0" id="wel" ${vo.kind == 0 ? 'checked':'' }><label for="wel">웰컴</label>
					<input type="radio" name="kind" value="1" id="month" ${vo.kind == 1 ? 'checked':'' }><label for="month">월</label>
					<input type="radio" name="kind" value="2" id="event" ${vo.kind == 2 ? 'checked':'' }><label for="event">이벤트</label>
				</div>
			</div>
			<div class="mi-one">
				<div class="mi-name">혜택 기간</div>
				<div class="input-one">
					<input type="number" name="valid_date" min="0" value="${vo.valid_date }"><span class="date-check">일 또는 월</span>
					<div class="io-info">
						<span>*</span> n일 또는 n월의 내용을 작성해주세요.
					</div>
				</div>
			</div>
			<div class="mi-one">
				<div class="mi-name">혜택 유형</div>
				<div class="input-two">
					<input type="radio" name="type" value="0" id="per" ${vo.type==0?'checked':'' }><label for="per">비율</label>
					<input type="radio" name="type" value="1" id="mon" ${vo.type==1?'checked':'' }><label for="mon">금액</label>
				</div>
			</div>
			<div class="mi-one">
				<div class="mi-name">혜택 금액</div>
				<div class="input-one">
					<input type="number" name="amount" min="1" value="${vo.amount }"><span class="date-check">원 또는 %</span>
					<div class="io-info">
						<span>*</span> 혜택 비율 또는 금액을 작성해주세요.
					</div>
				</div>
			</div>
			<div class="mi-one">
				<div class="mi-name">최대 할인 및 최소 사용</div>
				<div class="input-one">
					<input type="number" name="max_min" value="${vo.max_min }"><span class="date-check">원</span>
				</div>
			</div>
			<div class="mi-one">
				<div class="mi-name">발급 대상</div>
				<div class="input-two">
					<input type="radio" name="use" value="0" id="all" ${vo.use==0?'checked':'' } onclick="useWhere()"><label for="all">공통</label>
					<input type="radio" name="use" value="1" id="accom" ${vo.use==1?'checked':'' } onclick="useWhere()"><label for="accom">숙소</label>
					<input type="radio" name="use" value="2" id="ticket" ${vo.use==2?'checked':'' } onclick="useWhere()"><label for="ticket">티켓</label>
				</div>
			</div>
			<div class="mi-one" id="moreCheck" style="display:none;">
				<div class="mi-name">	
					<span class="info-tcheck"><span class="info-check">*</span> 특정 지역의 쿠폰인가요?</span>
					<input class="icheck-input" type="checkbox" onclick="moreDetail()" id="more" >
				</div>
				<div class="input-one" style="display : flex; padding-top : 3%;">
					<div>
						<select name="addr1_seq" style="display:none;" id="addr1">
							<option value="0" selected="selected">지역 옵션</option>
							<c:forEach var="a" items="${addr1 }">
								<option value="${a.addr1_seq }">${a.addr1_name }</option>
							</c:forEach>
						</select>
					</div>
					<div style="padding-left : 3%;">
						<select name="board_no" id="accom_cate" style="display:none;" id="accom_cate">
							<option value="0" selected="selected">숙소 옵션</option>
							<c:forEach var="accom" items="${a_cate }">
								<option value="${accom.a_cate_seq }">${accom.a_cate_name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="foot">
				<div class="ft-submit">
					<input class="fts-one" type="submit" value="등록하기"> 
				</div>
			</div>
		</form>
	</div>
</div>
	
	<script>

		$(function(){
			var use = $("input[name='use']:checked").val();
			if(use!=null){
				useWhere();
			}
		});
	
		function useWhere(){
			var all = document.getElementById("all");
			var accom = document.getElementById("accom");
			var ticket = document.getElementById("ticket");
			
			var more = document.getElementById("more");
			var moreCk = document.getElementById("moreCheck");
			
			if(all.checked || accom.checked || ticket.checked){
				more.checked=false;
				moreCk.style.display="flex";
			}else{
				moreCk.style.display="none";
			}
			
			moreDetail();
		}
	
		function moreDetail(){
			var all = document.getElementById("all");
			var accom = document.getElementById("accom");
			var ticket = document.getElementById("ticket");
			
			var more = document.getElementById("more");
			var addr1 = document.getElementById("addr1");
			var a_cate = document.getElementById("accom_cate");
			
			if(more.checked){
				if(all.checked || ticket.checked){
					addr1.style.display="block";
					a_cate.style.display="none";
				}else if(accom.checked){
					addr1.style.display="block";
					a_cate.style.display="block";
				}
			}else{
				addr1.style.display="none";
				a_cate.style.display="none";
			}
			
		}
	</script>
	
</body>
</html>




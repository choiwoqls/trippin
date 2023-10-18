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
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script src="${cpath}/resources/js/httpRequest.js"></script>

<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap"
	rel="stylesheet">

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

table {
	border-collapse: collapse;
}

input, select {
	outline: none;
	font-family: inherit
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
a{
	text-decoration: none;
	color:#929292;
}
.minfo {
	border-top: 2px solid;
	border-bottom: 2px solid;
}
.main {
	margin-bottom : 7%; 
	margin-left: 10%;
	margin-right: 10%;
}
.search-one{
	display: flex;
}
th {
    background-color: #f2f2f2;
    font-weight: bold;
    padding: 10px; 
}
td {
    text-align: center;
    padding: 8px;
}

table td, table th {
    text-align: center; 
    vertical-align: middle; 
}
.one-hp{
	cursor: pointer;
}

.one-hp:hover {
	cursor: pointer;
	color: rgba(58, 58, 58, 0.7);
}
.make-btn{
	margin-bottom: 2%;
	display: flex;
	justify-content: space-between;
}

input[type=button], input[type=submit]{
	border-radius: 2px;
	background-color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	border: 2px solid;
}

input[type=button]:hover, input[type=submit]:hover {
	border: 2px solid #50E3C2;
	background-color: #50E3C2;
	color: white;
}
.paging{
	margin-top:2%;
	margin-bottom:10%;
}
.coupn-1 {
	display: flex;
	gap: 5%;
}
.coupn-2 {
	display: flex;
    gap: 4%;
    width: 29vh;
}
.search-form {
	display: flex;
	flex-direction: row;
	padding:20px;
	width : 50%;
}
.select-section {
	width : 50vh;
}
.select-section select {
	width : 30%;
	height : 5vh;
	border : 0;
	border-bottom : 2px solid;
	text-align : center;
}
.input-section {
	width : 70vh;
}
.input-section input {
	height : 5vh;
	border : 2px solid silver;
}
#key {
	width : 70%;
}
.all-search {
	height : 5vh;
}
.all-section {
	line-height : 5.7;
}
</style>

<script>
function selectAllRows() {
	  var checkboxes = document.getElementsByClassName("selectRow");
	  var checkAll = document.getElementById("selectAll");

	  for (var i = 0; i < checkboxes.length; i++) {
	    checkboxes[i].checked = checkAll.checked;
	  }
	}
	
function checkSelectAll(){
	  var checkboxes = document.getElementsByClassName("selectRow");
	  var checkAll = document.getElementById("selectAll");
	  
	  let allChecked = true;

	  for (var i = 0; i < checkboxes.length; i++) {
	    if(!checkboxes[i].checked){
	    	allChecked = false;
	    	break;
	    }
	  }
	  checkAll.checked = allChecked;
	}

function check(f){
	var what = document.getElementById("what").value;
	var use = document.getElementById("use").value;
	var status = document.getElementById("status").value;
	var key = document.getElementById("key").value;
	
	if(what=='' && use=='' && status=='' && key==''){
		window.location = "${cpath}/admin/benefit/couponList";
		return false;
	}
	return ture;
}
</script>

</head>
<body style="overflow-x: hidden">
	<header class="header">
		<div class="inner">
			<div class="hd-in">
				<div class="hd-left">
					<img
						src="https://business.yanolja.com/common/kr/web/img/icon-home.png"
						onclick="document.location.href='${cpath}/admin/main'"> > 관리자 > 혜택관리 
						> <a href="${cpath }/admin/benefit/couponList">쿠폰관리</a>
				</div>
			</div>
		</div>
		<div class="title">
			<div class="mtitle">쿠폰 목록</div>
			<div class="stitle">
				나를 아는 여행앱 &nbsp;
				<span class="stitle-logo">Trippin'</span>
			</div>
		</div>
	</header>
	<div class="main">
		<div class="search-one">
			<form action="${cpath }/admin/benefit/searchCoupon" method="post" onsubmit="return check(this)" class="search-form">
				<div class="select-section">
					<select name="what" id="what">
						<option value="">쿠폰 유형</option>
						<option value="0" ${what==0 && what!=""? 'selected':'' }>기본쿠폰</option>
						<option value="1" ${what==1? 'selected':'' }>레벨쿠폰</option>
					</select>
					<select name="use" id="use">
						<option value="">사용처</option>
						<option value="0" ${use==0 && use!=""? 'selected':'' }>공통</option>
						<option value="1" ${use==1? 'selected':'' }>숙소</option>
						<option value="2" ${use==2? 'selected':'' }>티켓</option>
					</select>
					<select name="status" id="status">
						<option value="">발급 상태</option>
						<option value="0" ${status==0 && status!=""? 'selected':'' }>발급중</option>
						<option value="1" ${status==1? 'selected':'' }>중단</option>
						<option value="2" ${status==2? 'selected':'' }>종료</option>
					</select>
				</div>
				<div class="input-section">
					<input type="text" name="key" id="key" value="${key }">
					<input type="submit" value="필터검색">
				</div>
			</form>
			<div class="all-section">
				<input class="all-search" type="button" value="전체검색" onclick="location.href='${cpath}/admin/benefit/couponList'">
			</div>
		</div>

		<div class="make-btn">
			<div class="coupn-1">
				<input type="button" value="쿠폰 생성" onclick="location.href='${cpath}/admin/benefit/couponIn'">
				<input type="button" value="레벨업 쿠폰 생성" onclick="location.href='${cpath }/admin/benefit/lcouponIn'">
			</div>
			<div class="coupn-2">
				<input type="button" value="중단 해제" onclick="changeStatus(0)">
				<input type="button" value="발급 중단" onclick="changeStatus(1)">
				<input type="button" value="발급 종료" onclick="changeStatus(2)">
			</div>
		</div>
		<div class="minfo" id="dataTable">
			<table width="100%" border="1">
				<tr>
					<th><input type="checkbox" id="selectAll" onchange="selectAllRows()"></th>
					<th>No</th>
					<th>쿠폰명</th>
					<th>기한</th>
					<th>사용처</th>
					<th>상태</th>
				</tr>
				<c:if test="${clist == null }">
					<th colspan="6">쿠폰이 존재하지 않습니다.</th>
				</c:if>
				<c:forEach var="c" items="${clist }">
					<tr>
						<td><input type="checkbox" value="${c.coupon_seq }${c.table_type}" class="selectRow" name="selectRow" onchange="checkSelectAll()"></td>
						<td>${c.coupon_seq }${c.table_type }</td>
						<td class="one-hp" onclick="location.href='${cpath }/admin/benefit/c_detail/${c.coupon_seq}?type=${c.table_type==0? 0 : 1 }'">
							${c.name }
						</td>
						<td>
							<c:if test="${c.table_type==0 }">
								<c:if test="${c.kind==0 || c.kind==2 }">
									발급일로부터 ${c.valid_date }일
								</c:if>
								<c:if test="${c.kind!=0 && c.kind !=2 }">
									${c.valid_date }월 대상
								</c:if>
							</c:if>
							<c:if test="${c.table_type==1 }">
								발급일로부터 ${c.valid_date }일
							</c:if>
						</td>
						<td>
							${c.use == 0? '공통' : c.use == 1 ? '숙소' : '티켓'}
						</td>
						<td>${c.status == 0 ? '발급중' : c.status == 1 ? '중단' : '종료'}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<c:if test="${clist !=null && url != '/admin/benefit/searchCoupon'}">
			<div align="center" class="paging">
				<c:if test="${paging.prev }">
					<a hreSf="${cpath }${url }?page=${paging.begin - 1}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }" step="1">
					<c:choose>
						<c:when test="${i == paging.page }">
							<strong>[${i}]</strong>
						</c:when>
						<c:otherwise>
							<a href="${cpath }${url }?page=${i}" style="width:20.37px;">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.next }">
					<a href="${cpath }${url }?page=${paging.end + 1}">[다음]</a>
				</c:if>
			</div>
		</c:if>
		<c:if test="${clist !=null && url== '/admin/benefit/searchCoupon'}">
			<div align="center" class="paging">
				<c:if test="${paging.prev }">
					<a href="${cpath }${url }?what=${what }&use=${use }&status=${status }&key=${key }&page=${paging.begin - 1}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }" step="1">
					<c:choose>
						<c:when test="${i == paging.page }">
							<strong>[${i}]</strong>
						</c:when>
						<c:otherwise>
							<a href="${cpath }${url }?what=${what }&use=${use }&status=${status }&key=${key }&page=${i}" style="width:20.37px;">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.next }">
					<a href="${cpath }${url }?what=${what }&use=${use }&status=${status }&key=${key }&page=${paging.end + 1}">[다음]</a>
				</c:if>
			</div>
		</c:if>
	</div>
	
	<script>
	
		function changeStatus(num){
			var checkboxes = document.getElementsByClassName("selectRow");
			var selectedRows = [];
			
			for (var i = 0; i < checkboxes.length; i++) {
				  if(checkboxes[i].checked){
					  selectedRows.push(checkboxes[i].value);
				  }
		 	}
			
			if(selectedRows.length != 0){
				$.ajax({
					url : "${cpath}/admin/benefit/couponStatus",
					type:"post",
					data:JSON.stringify({ list: selectedRows, num: num }),
					dataType:"json",
					contentType:"application/json; charset=utf-8",
					success : function(data){
						if(data == true){
							alert("처리가 완료되었습니다.");
							document.location.reload();
						}else{
							alert("처리에 실패했습니다.\r\n* 이미 종료된 쿠폰의 상태는 변경 불가*");
						}
					}
				});
			}else{
				alert("선택된 항목이 없습니다.");
			}
		}
	</script>
</body>
</html>


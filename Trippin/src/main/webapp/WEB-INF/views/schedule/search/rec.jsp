<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
	body{
		margin:0;
        width : 1000px;
        height : 700px;
	}
	
	.top{
		background-color: #04CFD4;
        padding-left : 3%;
	}
	
	.top1{
		color: white;
		width: 100%;
        position : relative;
        top : 4.5vh;
        font-weight: bold;
        font-family: Arial, Helvetica, sans-serif;
        font-size : 16px;
	}

	.jug{
		background-color: #04CFD4;
		
		width: 100%;
		height: 50px;
	}
	
	.jug1{
		display: flex;
		margin-left: 30%;
        flex-wrap : nowrap;
	}
	
	.jitem{
		text-align: center;
		cursor: pointer;
		line-height : 35px;
		height : 35px;
		border: 2px solid;
		border-radius: 25px;
		margin-right: 3%;
		background-color: white;
        padding-left : 1.5%;
        padding-right : 1.5%;
        font-weight : bold;
        font-size : 16px;
	}
	
	.jitem2{
		text-align: center;
		cursor: pointer;
		line-height : 35px;
		height : 35px;
		border: 2px solid;
		border-radius: 25px;
		margin-right: 3%;
		background-color: silver;
        padding-left : 1.5%;
        padding-right : 1.5%;
        font-weight : bold;
        font-size : 16px;
	}
	
	.select{
		cursor: pointer;
		outline : 2px solid;
		padding-left : 1.5%;
		padding-right : 1.5%;
		font-weight : bold;
		height : 35px;
		border-radius: 25px;
		margin-right: 3%;
        border : 0;	
        font-size : 16px;
	}

	.mid{
		
		width: 100%;
		height: 100%;
	}
	
	.mid1{
		display: flex;
		height: 150px;
		margin-top: 1%;
		margin-bottom: 1%;
	}
	
	.list{
		cursor: pointer;
		border: 2px solid;	
		width: 850px;
		height: 150px;
		margin-left: 3%;
		margin-right: 2.5%;
        border-radius: 5px;
	}
	
	.fbtn{
		text-align: center;
		padding-top:1%;
		padding-left:0.5%;
		padding-right:0.5%;
		border-radius: 25px;
		cursor: pointer;
		border: 2px solid;	
		width : 70px;
		height : 35px;
		margin-top: 5%;
		margin-left : -1.2%;
		font-weight : bold;
	}	
		
	.fbtnz{
		text-align: center;
		padding-top:1%;
		padding-left:0.5%;
		padding-right:0.5%;
		border-radius: 25px;
		cursor: pointer;
		border: 2px solid;	
		width : 70px;
		height : 35px;
		margin-top: 5%;
		background-color: silver;
		margin-left : -1.2%;
		font-weight : bold;
	}		
	
	.bin{
		height: 15vh;
		display : block;
	}
	
	.fix{
		width : 100%;
		position : fixed;
		bottom : 0;
		background-color : white;
		padding-right : 14%;
		box-shadow : 0 -1px 4px rgba(0, 0, 0, 0.3);
	}
	
	.bot{
		gap : 1.5%;
		margin-top: 1%;
		margin-bottom : 1%;
		display: flex;	
		flex-wrap : wrap;
		padding-left : 2%;
		padding-right : 2%;
	}
	
	.nodis{
	display: none;
	}

	.bitem{
		margin-top: 0.5%;
		min-width: 15%;
		height: 40px;
		border: 2px solid;
		font-weight : bold;
		padding-left : 1%;
		padding-right : 1%;
		padding-top : 0.5%;
		padding-bottom : 0.5%;	
		border-radius : 5px;
		line-height : 40px;	
		text-align : center;
	}
	
	.sbmBtn{
		cursor: pointer;
		border: 1px solid;	
		width: 100%;
		height: 45px;
		background-color: #04CFD4;
		color: white;
		border-radius : 5px;
		line-height : 45px;
		font-weight : bold;
		margin-top : 1.5%;
	}
	
	.hd{
		width: 100vw;
	}

</style>
<script>

	function changeCity() {
		const form = document.getElementById("recForm");
		var city = document.getElementById("city");
		console.log(form);
		
		const adv = city.options[city.selectedIndex].value;
		console.log(adv);
		
		const as = document.getElementById("addr1_seq");
		as.value = adv;
		
		form.submit();
		
	}
	
 	function changeCate(i) {
		const form = document.getElementById("recForm");
		const cate_seq = document.getElementById("cate_seq");
		const Btn = document.getElementById("cate"+i);
		console.log(Btn);
		
		if(cate_seq.value == i){
			cate_seq.value = -1;
		}else{
			cate_seq.value = i;			
		}
		
		
		form.submit();
	}
 	
 	var fArr = new Array();
 	
 	function addForm(i,name) {
 		if(fArr.length == 10){
 			alert("한번에 최대 10개만 입력하실 수 있습니다");
 			return;
 		}
		// 추가 리스트
 		const bdv = document.getElementById("bot");
 		// 선택 버튼
 		const dv = document.getElementById("fBtn"+i);
 		// 선택 버튼 클래스 이름
 		const dvC = dv.className;

 		if(dvC == "fbtn"){//form 추가
 			if(fArr.length == 0 ){
 				bdv.className = "bot";
 			}
 			dv.className = "fbtnz";
 		
 			fArr.push(i);
  			const ndv = document.createElement("div");//새로운 div 영역 
 			ndv.setAttribute("class", "bitem");
 			ndv.setAttribute("id", "bitem"+i);
 			ndv.innerText = name;
 			bdv.appendChild(ndv); 			
 			
 		}else{//form 제거
 			dv.className = "fbtn";
 			for(var k=0; k<fArr.length; k ++){
 				if(fArr[k]==i){
 					delete fArr[k];
 					fArr = fArr.filter(item => item !== undefined && item !== null && item !== '');
 					 var deldv = document.getElementById("bitem"+i);
 					 bdv.removeChild(deldv);
 				}
 			}
 		if(fArr.length == 0 ){
 			bdv.className = "nodis";
 		}	
 		}
	console.log(fArr);
	}
	
	function addPlan() {
		if(fArr.length == 0){
			alert("최소 1개 이상의 장소를 선택하여 주세요");
			return;
		}
		const day_no = document.getElementById("day_no").value;
		const check = window.confirm("선택하신 장소를 DAY-"+day_no+" 일정에 추가 하시겠습니까 ? ");
		if(!check){
			return;
		}
		const form = document.getElementById("recForm");
		form.action = "${pageContext.request.contextPath}/schedule/plan/addFormList";
		form.method = "post";
		var input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "fArr");
		input.setAttribute("value", JSON.stringify(fArr));
		form.appendChild(input);
		form.submit();
	}
	
</script>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<title>트리핀 추천 장소</title>
</head>
<body>
<form action="${cpath }/schedule/search/rec" method="get" id="recForm">
	<input type="hidden"  id="day_no" name="day_no" value="${map.day_no }">
	<input type="hidden"  id="s_seq" name="s_seq" value="${map.s_seq }">
	<input type="hidden"  id="addr1_seq" name="addr1_seq" value="${map.addr1_seq }">
	<input type="hidden"  id="cate_seq" name="cate_seq" value="${map.cate_seq }">
</form>
<div class="top">
	<div class="top1">추천 장소</div>
</div>
<div class="jug">
	<div class="jug1">
		
		<select id="city" class="select"  onchange="changeCity()">
			<option value="-1">전체</option>
		<c:forEach var="city" items="${map.clist }">
			<c:choose>
				<c:when test="${map.addr1_seq == city.ADDR1_SEQ }">
					<option selected="selected" value="${city.ADDR1_SEQ  }" >${city.ADDR_NAME }</option>
				</c:when>
				<c:otherwise>
					<option value="${city.ADDR1_SEQ  }" >${city.ADDR_NAME }</option>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</select>
		
		<!-- 카테고리 리스트 for 문으로 나오면 좋음 -->
		<c:forEach var="cate" items="${map.ctlist }">
			<c:choose>
				<c:when test="${map.cate_seq == cate.cate_seq }">
					<div id="cate${cate.cate_seq }" class="jitem2" onclick="changeCate(${cate.cate_seq})"><span>${cate.cate_name }</span></div>
				</c:when>
				<c:otherwise>
					<div id="cate${cate.cate_seq }" class="jitem" onclick="changeCate(${cate.cate_seq})"><span>${cate.cate_name }</span></div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
<div class="mid">
	<!-- for -->
<c:forEach var="form" items="${map.flist }" varStatus="i">
	<div class="mid1">
		<div class="list">
		<c:choose>
				<c:when test="${form.CATE_SEQ == 1 }">
					<table border="0" cellspacing="5px" class="hd"  onclick="document.location.href='${cpath}/member/tour/selectTour?f_seq=${form.F_SEQ }'">
				</c:when>
				<c:otherwise>
					<table border="0" cellspacing="5px" class="hd"  onclick="document.location.href='${cpath}/member/hotple/selectHotple?f_seq=${form.F_SEQ }'">
				</c:otherwise>
			</c:choose>					
								<tr width="400px">
									<th rowspan="4" valign="top" width="8%" style="color : blue;">${i.count }</th>
									<td width="63%"><b>${form.NAME }</b></td>
									<td rowspan="4" valign="top" width="29%"><img src="${cpath}/common/getImg?path=${form.MAIN_IMG }&file=${form.FILE }" style="width:130px; height : 130px;"/></td>
								</tr>
								<tr>
									<td>${form.INTRO }</td>
								</tr>
								<tr>
									<td><font color="#F0DA49">★</font>${form.SAVG }<span style="color : #BABABA;">(${form.RV })</span>·<font color="red">♥</font>${form.JJ }</td>
								</tr>
								<tr>
									<td style="color : #BABABA;">${form.KIND_NAME }·${form.ADDR2_NAME }</td>
								</tr>
							</table>				
		</div>
		<div id="fBtn${form.F_SEQ }" class="fbtn" onclick="addForm(${form.F_SEQ},'${form.NAME}')">선택</div>
	</div>
</c:forEach>
	<!-- for -->	
	
</div>
<div class="bin">
	<div class="fix">
		<div class="nodis" id="bot">

		</div>
		<div align="center" class="sbmBtn" onclick="addPlan()">(day)일정에 담기 </div>
	</div>
</div>

</body>
</html>
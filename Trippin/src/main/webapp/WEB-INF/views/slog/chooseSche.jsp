<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
                .nomal {
                    border : 0;
                    cursor: pointer;
                    padding-top : 0.6%;
                    padding-bottom : 0.6%;
                    padding-left : 1.2%;
                    padding-right : 1.2%;
                    border-radius: 25px;
                    margin-right : 0.5%;
                    font-weight : bold;
                    background-color : 04CFD4;
                    color : white;	
                }
                .choose {
                    border : 0;
                    cursor: pointer;
                    padding-top : 0.6%;
                    padding-bottom : 0.6%;
                    padding-left : 1.2%;
                    padding-right : 1.2%;
                    border-radius: 25px;
                    margin-right : 0.5%;
                    font-weight : bold;
                    background-color : #04CFD4;
                    filter : brightness(100%);
                    color : white;
                }
                .basic{
                	display: none;
                }
                .select{
                	display: block;
                }
	

</style>
</head>
<body>
<script>
  	var next = false;
  	
  	function chooseSche(i) {
  		const dayDv = document.getElementById("dayDv"+i);
  		const ddvC = dayDv.className;
  		console.log(ddvC);
  		
  		if(ddvC =='basic'){
  			if(document.querySelector('.select') != null){
				document.querySelector('.select').className = 'basic';
			}
				dayDv.className = 'select';  			
  		}else{
  			dayDv.className ='basic';
  		}
		
	}
 
	function addPlan(i, j) {
		console.log(j);
		console.log(i);
		const adBtn = document.getElementById("adBtn"+i+',' +j);
		const btCs = adBtn.className;
		console.log(btCs);
		if(btCs == 'nomal'){
			if(document.querySelector('.choose') != null){
				document.querySelector('.choose').className = 'nomal';
			}			
			adBtn.className = 'choose';
			document.getElementById("day_no").value = j;
			document.getElementById("s_seq").value = i;
			next = true;	
		}else{
			adBtn.className = 'nomal';			
			document.getElementById("day_no").value = '';
			document.getElementById("s_seq").value = '';
			next = false;
		}
	}
	
		function nextPg() {
			const nextval = document.getElementById("day_no").value;
			console.log(nextval);
			if(next && nextval !=''){
				const check = window.confirm("선택하신 일정에 추가하시겠습니까 ? ");
				if(check){
					document.getElementById("copyPlanForm").submit();
				}else{
					return;
				}
			}else{
				alert("1개의 일정을 선택하여 주세요");
				return;
			}
		}
</script>
<div align="center">
	<div>
		<h3>일정 리스트</h3>
	</div>
	<div>
		<c:forEach var="map" items="${list }" varStatus="i">
			<table border="0" cellspacing="5px"  width="230px" onclick="chooseSche(${i.index})" style="cursor: pointer;">
				<tr>
					<th width="5px" align="center">${i.index+1 }</th>
					<th>${map.TITLE }</th>	
				</tr>
				<tr>
					<td colspan="2" align="center">
					<c:choose>
						<c:when test="${map.FIRSTDAY == map.LASTDAY }">
						${map.FIRSTDAY },
							당일치기
						</c:when>
						<c:otherwise>
							${map.FIRSTDAY } - ${map.LASTDAY }
						</c:otherwise>
					</c:choose>
					</td>	
				</tr>				
			</table>
			<br>
			<div class="basic" id="dayDv${i.index }">
				<c:forEach begin="1" end="${map.DAY }" step="1" varStatus="j">
					<button class="nomal" onclick="addPlan(${map.S_SEQ },${j.index })" type="button" id="adBtn${map.S_SEQ },${j.index}">DAY - ${j.index }</button>
				</c:forEach>				
				<form action="${pageContext.request.contextPath }/slog/copyPlan"  method="post" id="copyPlanForm">
					<input type="hidden" id="day_no" name="day_no"  value="">
					<input type="hidden" id="day_slog_seq" name="day_slog_seq"  value="${day_slog_seq }">					
					<input type="hidden" id="slog_seq" name="slog_seq"  value="${slog_seq }">					
					<input type="hidden" id="s_seq" name="s_seq"  value="">
				</form>
			</div>
			<br>			
		</c:forEach>
				<button type="button" onclick="nextPg()">선택 완료</button>
	</div>
</div>

</body>
</html>
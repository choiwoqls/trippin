<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="${cpath }/resources/js/httpRequest.js"></script>
<script
			  src="https://code.jquery.com/jquery-3.7.0.js"
			  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			  crossorigin="anonymous">
			</script>

<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	
		function term(){
    	
        var url = "${cpath}/member/tour/term/f_seq/${tour.F_SEQ}";
        var name = "term";
        var option = "width = 900, height = 700, top = 100, left = 400, location = no";
        window.open(url, name, option);
     	}
		
		
		 function myjjim(){
			var jjimbtn = document.getElementById("jjimbtn");
			var url = null;
			var jjimimg = document.getElementById("jjimimg");
			
			if(jjimimg.src == "https://assets.triple.guide/images/btn-end-save-off@4x.png"){
				url = "${cpath}/member/dojjim";			
			}else{
				url = "${cpath}/member/nojjim";
			}
					
			console.log(jjimimg.src)
					
			var f_seq = document.getElementById("f_seq").value;
			var param = "f_seq=" + f_seq;
			
			sendRequest(url, param, function() {
				console.log(xhr.readyState)
				console.log(xhr.status)
				
				if(xhr.readyState === 4 && xhr.status === 200){
					console.log("여기??");
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
					var f_seq = document.getElementById("f_seq").value;
					console.log(f_seq);
					
					var windowFeatures = 'width=' + width + ',height=' + height;
					
					var url = '${pageContext.request.contextPath}/schedule/sche/chooseSche?f_seq='+f_seq;
					
					window.open(url, '_blank', windowFeatures);
					
				}else{
					return;
				}
				
			}

		}
	
	</script>
	


	<div style="width:800px;">
		<h2>${tour.NAME }</h2>
	</div>
	
	<div style="width:800px;">
		${tour.RV }&nbsp;<font color="red">♥</font><span id="jjimcnt">${tour.JJ }</span>
	</div>

	<div style="width:800px;">
		${tour.ADDR2_NAME }
	</div>
	<br>
	<div>
		<img src="${cpath }/resources/${tour.CATE_NAME }/Main/${tour.F_SEQ }/${tour.MAIN_IMG}" height="430px" width="800px">
	</div>
	
	<div>
		<input type="hidden" id="f_seq" value="${tour.F_SEQ }">
		<input type="hidden" id="lgcheck" value="${lgcheck }">
	</div>
	
	<div>
		<table width="800px" cellspacing="10px">
			<tr width="800px">
				<td align="center" width="25%" style="cursor: pointer;" id="jjimbtn" onclick="javascript:myjjim()">
					<c:choose>
						<c:when test="${!check}">
							<img id="jjimimg" src="https://assets.triple.guide/images/btn-end-save-off@4x.png" height="20%" width="20%">
							<br>
							저장하기
						</c:when>
						<c:otherwise>
							<img id="jjimimg" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4=" height="15%" width="15%">
							<br>
							저장 취소
						</c:otherwise>
					</c:choose>
				</td>
				<td align="center" width="25%" onclick="addPlan()" style="cursor: pointer;">
					<img src="https://assets.triple.guide/images/btn-end-schedule@4x.png" height="20%" width="20%">
					<br>
					일정추가
				</td>
				<td align="center" width="25%" style="cursor: pointer;">
					<img src="https://assets.triple.guide/images/btn-end-review@4x.png" height="20%" width="20%">
					<br>
					리뷰쓰기
				</td>
				<td align="center" width="25%" style="cursor: pointer;">
					<img src="https://assets.triple.guide/images/btn-com-share@3x.png" height="20%" width="20%">
					<br>
					공유하기
				</td>
			</tr>
		</table>
	</div>
	<hr width="800px" align="left">
		<div style="width:800px;">
			<h3>${tour.INTRO }</h3>
		</div>
	<br>
		<div style="width:800px;">
			${tour.INFO }
		</div>		
	<br>
	<hr size="10px" width="800px" align="left" color="#E4E4E6">
	
		<div style="width:800px;">
			<h3>기본 정보</h3>
			<span style="float: right;"><font color="#969798" size="3px"><a href="${cpath }/member/revisionform?f_seq=${tour.F_SEQ}">정보수정 제안 ></a></font></span>
		</div>
		<div>
			<!-- <p style="margin-top:-12px">
			    <em class="link">
			        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
			            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
			        </a>
			    </em>
			</p> -->
			<div id="map" style="width:800px;height:350px;"></div>
		</div>
	<br>
		<div style="background-color: #F7F7F7; width: 775px; padding: 5px; padding-left: 20px">
			<p><b>주소</b>  <a onclick="location.reload();" style="cursor: pointer;">${tour.ADDR }</a></p>
			<p><b>전화</b>  ${tour.TEL }</p>
			<p><b>홈페이지</b>  <a href="${tour.WEBSITE }" target="_blank">${tour.WEBSITE }</a></p>
		</div>
	<br>
		<c:if test="${tour.WAY != null }">
			<div>
				<b>가는 방법</b>
				<br>
				${tour.WAY }
			</div>
		
		<hr width="800px" align="left">
		</c:if>
	
		<div>
			<b>이용가능시간, 휴무일</b>
		</div>
		<br>
		
		<c:if test="${tour.RUN_INFO != null }">
			<div>
				${tour.RUN_INFO }
			</div>
		</c:if>
		
		<c:if test="${tour.TERM_HOURS != null }">
			<br>
			<div>
				<input type="button" value="기간별 운영시간 확인하기" onclick="term();">
			</div>
		</c:if>
		
	<hr width="800px" align="left">
		<div>
			<c:choose>
				<c:when test="${tour.USE_FEE == null }">
					<b>이용료 <font color="#4772FF">무료</font></b>
				</c:when>
				<c:otherwise>
					<b>이용료 <font color="#4772FF">유료</font></b>
					<br>
					${tour.USE_FEE }
				</c:otherwise>
			</c:choose>
		</div>
		
	<hr width="800px" align="left">

		<%-- <c:if test="${}"> --%>
			<div>	
				<b>이곳의 이용팁</b>
			</div>
		<%-- </c:if> --%>

	<hr width="800px" align="left">
	
	
	
	
	
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
	geocoder.addressSearch('${tour.ADDR}', function(result, status) {
	
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${tour.NAME}</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>
</body>
</html>
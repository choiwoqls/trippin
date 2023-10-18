<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<title>Motel</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js"></script>
</head>
<body>

		
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
	    var selectedInfo = selectedButtons.join(', ');
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
	  
	</script>



<div align="left">
	<div>
		<h4>${mot.KIND }<br></h4>
		<b>${mot.NAME }</b><br>
		${mot.MOTEL_ENG_NAME }<br>
		♥${mot.JJ } ★${mot.SAVG }
		${mot.ADDR1_NAME}`${mot.ADDR2_NAME }
	</div>
	<hr>
	<div>
	<form action="${cpath}/admin/member/accom/detailRoom" method="post" id="roomForm">
		<input type="hidden"id="room_seq" name="room_seq" value="">
	</form>
		<c:forEach var = "room" items="${room }">
		<!-- 밑에꺼 쓰면 날짜가 안됨.. -->
		<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
	<table onclick="chooseRoom(${room.ROOM_SEQ})">

			<tr>
				<td><h4>@숙소선택@  ${room.ROOM_NAME }/</h4></td>
				<td>최대 ${room.MAXPEOPLE }인/</td>
				<td>${room.RP }/</td>
				<td>${room.ROOM_VIEW_NAME }/</td>
				<td>${room.ROOM_PRICE }원/</td>
				<td>${room.ROOM_CNT }개 남음!</td>
			</tr>
	</table>
		</c:forEach>
	</div>
	
	
	
	<button id='showDate' onclick="dis1()">날짜 선택</button>
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
		
		
		<button id='showPerson' onclick="dis2()">인원 선택</button>
		<div class="num" style="width:800px;">
		
		<div id='dis2' style="display: none;">
		<span>성인</span>
		<span class="count">
			<a href="#" class="minus">-</a>
			<span id="result">1</span>
			<a href="#" class="plus">+</a>
		</span> / 
		<span>아동</span>
		<span class="select">
			<a href="#" onclick="dis3();" class="a" >-</a>
			<span id="totalCount">0</span>
			<a href="#" onclick="dis3();" class="b">+</a>
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

		${mot.MOTEL_PR }
	<hr>
	
	<div class="m3m-map">
		<div id="map" style="width:735px;height:350px;"></div>
	</div>
	
	<div>
		<b>주소</b>${mot.ADDR}<br>
		<b>전화</b>${mot.TEL }<br>
		<b>홈페이지</b>${mot.WEBSITE }<br>
	</div>
	<hr>
<h4>편의 시설</h4>
<table>

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

<c:if test="${hslist eq null }">

<hr>
<h4>보건&안전</h4>
		<table>


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
	</c:if>

	<div>
		<c:if test="${mot.MOTEL_NOTICE eq null}">
		<hr>
		<b>공지사항</b><br>
		${mot.MOTEL_NOTICE }
		</c:if>
		<div>
		<c:if test="${hslist eq null }">
			<c:forEach var="hslist" items="${hslist }">
		<hr>
		<b>보건&안전</b><br><br>
				<li>${hslist.HS}</li>
				${hslist.HS_SUB_NAME }<br>
			</c:forEach>
		<hr>
		</c:if>
		

		</div>
		<hr>
		<b>숙소 설명</b><br>
		${mot.MOTEL_EXPLANATION}
		<hr>
		<div>

		
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
			geocoder.addressSearch('${mot.ADDR}', function(result, status) {
			
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
			            content: '<div style="width:140px;text-align:center;padding:6px 0;">${mot.NAME}</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>

</body>
</html>


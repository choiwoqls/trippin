<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
</head>
<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<form onsubmit="searchAddress(); return false;">
    <input type="text" id="addressInput" placeholder="주소를 입력하세요">
    <input type="submit" value="주소 검색">
</form>

<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54edfe10e632867778f01053322746d0&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'),
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 3
    };

var map = new kakao.maps.Map(mapContainer, mapOption);
var geocoder = new kakao.maps.services.Geocoder();
var marker;

function searchAddress() {
    var address = document.getElementById('addressInput').value;

    geocoder.addressSearch(address, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            if (marker) {
                // 기존 마커가 있으면 삭제
                marker.setMap(null);
            }

            marker = new kakao.maps.Marker({
                position: coords,
                draggable: true, // 마커를 드래그 가능하도록 설정
                map: map
            });

            // 마커 드래그 이벤트 처리
            kakao.maps.event.addListener(marker, 'dragend', function() {
                var latlng = marker.getPosition();
                console.log("마커 이동 후 위도: " + latlng.getLat() + ", 경도: " + latlng.getLng());
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
            });
            infowindow.open(map, marker);

            map.setCenter(coords);
        } else {
            alert("주소 검색에 실패하였습니다.");
        }
    });
}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
 	.map-location {
 				padding-top : 2%;
 				background-color: white;
 				margin-left : 25%;
        		margin-right : 25%;
 				}
	.map_wrap, .map_wrap * {
				margin:0;
				padding:0;
				font-family:'Malgun Gothic',dotum,'돋움',sans-serif;
				font-size:12px;
				}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{
				color:#000;
				text-decoration: none;
				}
	.map_wrap {
				position:relative;
				width:100%;
				height:500px;
				
				}
	#menu_wrap {
				position:absolute;
				top:3%;
				bottom:0;
				width:250px;
				margin:10px 0 30px 10px;
				padding:5px;
				overflow-y:auto;
				background:rgba(255, 255, 255, 0.7);
				z-index: 1;
				font-size:12px;
				border-radius: 10px;
				}
	.bg_white {
				background:#fff;
				}
	#menu_wrap hr {
				display: block; 
				height: 1px;
				border: 0; 
				border-top: 2px solid #5F5F5F;
				margin:3px 0;
				}
	#menu_wrap .option{
				text-align: center;
				}
	#menu_wrap .option p {
				margin:10px 0;
				}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
	
	.info1-location {
		text-align : center;
		text-align : right;
		padding-top : 1%;
	}
	.info-form {
		text-align : center;
	}
	
	
	body {
        background-color: #F2F2F2;
        height: auto;
    }
    .header {
        margin-left : 25%;
        margin-right : 25%;
        background-color: white;
        
        border-bottom : 1px solid #F2F2F2;
    }
    .hd-in {
        padding-bottom : 2%;
        padding-top : 2%;
        display : flex;
        height : 5vh;
    }
    .hd-left {
    	width : 10%;
    	padding-left : 5%;
    }
    .hd-mid {
    	width: 70%;
	    line-height: 4.2vh;
	    font-size: 18px;
	    font-weight: bold;
    }
    .hd-in a {
        text-decoration: none;
    }
    .hd-in a img {
        width : 25px;
        margin-top : 2%;
    }
	.back-white {
		background-color : white;
		margin-left : 25%;
        margin-right : 25%;
        padding-top : 3%;
	}
	.search-btn {
		background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    	color: white;
    	border: none;
    	padding: 5px 15px;
	    border-radius: 5px;
	    font-family: "paybooc-Light", sans-serif;
	    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	    text-decoration: none;
	    font-weight: 600;
	}
	.select-btn {
		background-size: 400% 400% !important;
   		animation: gradient1 5s ease infinite;
    	background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
    	color: white;
    	border: none;
    	padding: 5px 15px;
	    border-radius: 5px;
	    font-family: "paybooc-Light", sans-serif;
	    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	    text-decoration: none;
	    font-weight: 600;
	}
	@keyframes gradient1 {
	    0% {
	        background-position: 0% 50%;
	    }
	    50% {
	        background-position: 100% 50%;
	    }
	    100% {
	        background-position: 0% 50%;
	    }
	}
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50a663b98a69e54c2f47df28be00018a&libraries=services"></script>
</head>
<body>
	<header class="header">
        <div class="inner">
            <div class="hd-in">
            	<div class="hd-left">
	                <a href="#">
	                    <img src="https://cdn.icon-icons.com/icons2/1462/PNG/512/134leftarrow_100014.png">
	                </a>
                </div>
                <div class="hd-mid">
                	<span>새로운 장소 추가</span>
                </div>
            </div>
        </div>
    </header>
	<div class="map-location">
		<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			<!-- <div id="mapii" style="width:50%;height:100%;position:relative;overflow:hidden;"></div> -->
		
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		                <form onsubmit="searchMyplace(); return false;">
		                    키워드 : <input type="text" placeholder="키워드 입력" id="keyword" size="15"> 
		                    <button class="search-btn" type="submit">검색</button> 
		                </form>
		            </div>
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div>
	</div>
		<div>
	<script>
	
	function searchMyplace(){
		// 마커를 담을 배열입니다
		var markers = [];
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();  
		
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		// 키워드로 장소를 검색합니다
		searchPlaces();
		
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
		
		    var keyword = document.getElementById('keyword').value;
		
		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }
		
		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		    
		    
		    ps.keywordSearch(keyword, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            clearMarkers();
		            var listEl = document.createElement('ul');
		            
		            for (var i = 0; i < result.length; i++) {
		                var place = result[i];
		                
		                var marker = new kakao.maps.Marker({
		                    position: new kakao.maps.LatLng(place.y, place.x),
		                    map: map
		                });
		                markers.push(marker);
		                
		                var placeLi = getListItem(i, place);
		                listEl.appendChild(placeLi);
		                
		                // 클릭 이벤트 추가
		                placeLi.addEventListener('click', (function(place) {
		                    return function() {
		                        showPlaceAddress(place.road_address_name);
		                    };
		                })(place));
		                
		             // 마커 클릭 이벤트 추가
		                kakao.maps.event.addListener(marker, 'click', (function(marker, placeLi) {
		                    return function() {
		                        showPlaceAddressInInputFromListItem(placeLi);
		                    };
		                })(marker, placeLi));
		            }
		            
		            container.innerHTML = '';
		            container.appendChild(listEl);
		            
		            var bounds = new kakao.maps.LatLngBounds();
		            
		            for (var i = 0; i < result.length; i++) {
		                bounds.extend(new kakao.maps.LatLng(result[i].y, result[i].x));
		            }
		            
		            map.setBounds(bounds);
		        }
		    });
		    
		}
		
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);
		
		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);
		
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		
		        alert('검색 결과가 존재하지 않습니다.');
		        return;
		
		    } else if (status === kakao.maps.services.Status.ERROR) {
		
		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;
		
		    }
		}
		
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
		
		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);
		
		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {
		    	
		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);
		            
		    	
		
		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });
		
		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
		
		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };
		
		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].place_name);
		
		        fragment.appendChild(itemEl);
		    }
		
		    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;
		
		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}
		
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
			
		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.place_name + '</h5>';
		
		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           
		
		    el.innerHTML = itemStr;
		    el.className = 'item';
		    
		    // 클릭 이벤트 추가
		    el.addEventListener('click', function() {
		        showPlaceAddressInInput(places.road_address_name);
		    });
		    
		    function showPlaceAddressInInput(address) {
		        var addressInput = document.getElementById('thisplace');
		        addressInput.value = address;
		    }
		    
		    function clearMarkers() {
		        for (var i = 0; i < markers.length; i++) {
		            markers[i].setMap(null);
		        }
		        markers = [];
		    }
		
		    return el;
		}
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
		
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		    
		    return marker;
		}
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		
		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 
		
		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }
		
		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;
		
		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }
		
		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}
		
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
		
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}
		
		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		
	}
	</script>
</div>

<div>
	<script>
		function selectMyplace(){
			
			//var map = document.getElementById('map');
			var menu_wrap = document.getElementById('menu_wrap');
			//map.style.display = 'hidden';
			menu_wrap.style.display = 'none';
			
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 10 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
			// 지도를 클릭한 위치에 표출할 마커입니다
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			}); 
			// 지도에 마커를 표시합니다
			marker.setMap(map);
			
			// 마커가 드래그 가능하도록 설정합니다 
			marker.setDraggable(true); 
	
			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    var latlng = mouseEvent.latLng; 
			    
			    // 마커 위치를 클릭한 위치로 옮깁니다
			    marker.setPosition(latlng);
			});    
			
		
			// Geocoder 객체를 생성합니다
		    var geocoder = new kakao.maps.services.Geocoder();

		    // 지도 클릭 이벤트 처리
		    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		        // 클릭한 위도, 경도 정보를 가져옵니다 
		        var latlng = mouseEvent.latLng; 
		        
		        // 마커 위치를 클릭한 위치로 옮깁니다
		        marker.setPosition(latlng);
		        
		        // 클릭한 위치의 주소 정보를 가져옵니다
		        geocoder.coord2Address(latlng.getLng(), latlng.getLat(), function(result, status) {
		            if (status === kakao.maps.services.Status.OK) {
		                var addressInput = document.getElementById('thisplace');
		                addressInput.value = result[0].road_address.address_name;
		            }
		        });
		    });  
			
		}
	</script>
</div>


<div class="back-white">
	<div class="info1-location">
		찾는 장소가 없으신가요? 
		<input type="button" class="select-btn" value="지도에서 직접 선택하기" onclick="selectMyplace();">
	</div>
</div>

<div class="back-white">

	<form class="info-form" action="${pageContext.request.contextPath }/member/newplace/insertForm" method="post">
		선택한 주소: <input type="text" name="addr" readonly="readonly" id="thisplace" size="50px">
		<input class="search-btn" type="submit" value="확인">
	</form>
</div>










</body>
</html>
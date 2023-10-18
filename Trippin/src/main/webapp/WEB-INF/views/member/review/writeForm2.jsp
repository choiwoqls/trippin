<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
            <c:set var="cpath" value="${pageContext.request.contextPath }" />
            <script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
			<script
			  src="https://code.jquery.com/jquery-3.7.0.js"
			  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			  crossorigin="anonymous">
			</script>
            <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">

<title>Insert title here</title>

<style type="text/css">
	
	#place-area{
		padding-left : 15%;
	}
	#place{
		text-align: center;
	}
	#place td{
		padding: 0.5em;
	}
	#place td a{
		color: #000;
		text-decoration: none;
	}
	/* .mb-save h4{
        font-weight : 500;
        color : #CDCDCD;
        font-size : 14px;
    }
    .mb-save {
    	width : 20%;
    }
    .mb-save a {
        text-decoration: none;
        color : #CDCDCD;
    } */
   /*  .rw-star {
        margin-top : 4%;
        width : 51.8%;
        height : 100%;
        background-image: url("https://yaimg.yanolja.com/joy/sunny/static/images/icon-score-yayellow-fill.svg");
    } */
    
    #star1, #star2, #star3, #star4, #star5{
    	cursor: pointer;
    }
    body {
    	margin : 0 auto;
    	width : 100vw;
    }
    #rv-area {
    width : 50vw;
    margin-top : 5% !important;
    margin :  auto;
    text-align : center;
    }
    textarea {
    	resize : none;
    	outline : none;
    }
    .s-area {
    	text-align : center;
    }
</style>

</head>
<body>


<div id="rv-area">
	<div id="place-area">
		<table id="place">
			<tr>
				<td rowspan="2">
					<img src="${cpath}/common/getImg?path=${fvo.main_img }&file=${main_imgNM }" style="width:5em; height: 5em;"/>
				</td>
				<td style="font-size: large;">
					<a href="${cpath }/member/tour/selectTour?f_seq=${fvo.f_seq}" target="_blank"><b>${fvo.name }</b></a>
				</td>
				<td rowspan="2">
					<c:choose>
                         <c:when test="${!check}">
	                           <div class="mb-save">
	                               <a id="jjimbtn" onclick="javascript:myjjim()" style="cursor: pointer; margin-left : 2%;">
	                                   <img class="mb-img" id="jjimimg" style="width: 35%;" src="https://assets.triple.guide/images/btn-end-save-off@4x.png">
	                               </a>
	                           </div>
                          </c:when>
						  <c:otherwise>
	                           <div class="mb-save">
									<a id="jjimbtn" onclick="javascript:myjjim()" style="cursor: pointer; position : relative; top : 0.6vh; left : 0.4vw;">
	                                    <img id="jjimimg" style= "width : 32px;"src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4=">
	                                </a>
	                           </div>
	                      </c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td style="color: #BABABA;">
					${fvo.addr }
				</td>
			</tr>
		</table>
	</div>
	<div>
		<form method="post" enctype="multipart/form-data">
			<input type="hidden" name="f_seq" id="f_seq" value="${fvo.f_seq }">
				<div class="s-area">
					<div class="star">
						<img id="star1" src="${cpath }/resources/star/graystar.jpg" style="width:3%;" onclick="checkstars(1);">
						<img id="star2" src="${cpath }/resources/star/graystar.jpg" style="width:3%;" onclick="checkstars(2);">
						<img id="star3" src="${cpath }/resources/star/graystar.jpg" style="width:3%;" onclick="checkstars(3);">
						<img id="star4" src="${cpath }/resources/star/graystar.jpg" style="width:3%;" onclick="checkstars(4);">
						<img id="star5" src="${cpath }/resources/star/graystar.jpg" style="width:3%;" onclick="checkstars(5);">
						<input type="hidden" name="stars" id="stars">
					</div>
					<div id="starcmt">별점을 선택해주세요!</div>
				</div>
			<div>
				<input type="month" name="visitday"> 
			</div>
			<br>
			<div>
				<textarea name="content" rows="20em" cols="80em" placeholder="- 직접 경험한 솔직한 리뷰를 남겨주세요.&#13;&#10;- 사진도 첨부할 수 있어요."></textarea>
			</div>
			<div>
				<input type="file" name="files" multiple="multiple">
			</div>
			<div>
				<input type="button" value="등록하기" onclick="checkRV(this.form);">
			</div>
		</form>
	</div>
	
	
</div>

<script type="text/javascript">

	function myjjim(){
	 	
		var jjimbtn = document.getElementById("jjimbtn");
		var url = null;
		var jjimimg = document.getElementById("jjimimg");
		
		if(jjimimg.src === "https://assets.triple.guide/images/btn-end-save-off@4x.png"){
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
				location.reload();
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
	
	function checkstars(v){
		var stars = document.getElementById("stars");
		var star1 = document.getElementById("star1");
		var star2 = document.getElementById("star2");
		var star3 = document.getElementById("star3");
		var star4 = document.getElementById("star4");
		var star5 = document.getElementById("star5");
		var starcmt = document.getElementById("starcmt");
		console.log(starcmt);
	
		if(v == 1){
			star1.src = "${cpath}/resources/star/yellowstar.jpg";
			star2.src = "${cpath}/resources/star/graystar.jpg";
			star3.src = "${cpath}/resources/star/graystar.jpg";
			star4.src = "${cpath}/resources/star/graystar.jpg";
			star5.src = "${cpath}/resources/star/graystar.jpg";
			stars.value = 1;
			starcmt.innerText = "별로예요";
		};
		if(v == 2){
			star1.src = "${cpath}/resources/star/yellowstar.jpg";
			star2.src = "${cpath}/resources/star/yellowstar.jpg";
			star3.src = "${cpath}/resources/star/graystar.jpg";
			star4.src = "${cpath}/resources/star/graystar.jpg";
			star5.src = "${cpath}/resources/star/graystar.jpg";
			stars.value = 2;
			starcmt.innerText = "조금 아쉬워요";
		};
		if(v == 3){
			star1.src = "${cpath}/resources/star/yellowstar.jpg";
			star2.src = "${cpath}/resources/star/yellowstar.jpg";
			star3.src = "${cpath}/resources/star/yellowstar.jpg";
			star4.src = "${cpath}/resources/star/graystar.jpg";
			star5.src = "${cpath}/resources/star/graystar.jpg";
			stars.value = 3;
			starcmt.innerText = "주위에 있다면 가볼만해요";
		};
		if(v == 4){
			star1.src = "${cpath}/resources/star/yellowstar.jpg";
			star2.src = "${cpath}/resources/star/yellowstar.jpg";
			star3.src = "${cpath}/resources/star/yellowstar.jpg";
			star4.src = "${cpath}/resources/star/yellowstar.jpg";
			star5.src = "${cpath}/resources/star/graystar.jpg";
			stars.value = 4;
			starcmt.innerText = "꽤 가볼만해요";
		};
		if(v == 5){
			star1.src = "${cpath}/resources/star/yellowstar.jpg";
			star2.src = "${cpath}/resources/star/yellowstar.jpg";
			star3.src = "${cpath}/resources/star/yellowstar.jpg";
			star4.src = "${cpath}/resources/star/yellowstar.jpg";
			star5.src = "${cpath}/resources/star/yellowstar.jpg";
			stars.value = 5;
			starcmt.innerText = "꼭 가야 하는 곳이에요";
		};
	}
	
	
	function checkRV(f){
		var stars = f.stars.value;
		var content = f.content.value;
		
		if(stars == ''){
			alert("별점을 선택해주세요!");
			return;
		}else if(content == ''){
			alert("내용을 입력해주세요!");
			f.content.focus();
			return;
		}else{
			f.action = "${cpath}/member/review/insertCheck";
			f.submit();
		}
		
	}
	
	
	

</script>




</body>
</html>
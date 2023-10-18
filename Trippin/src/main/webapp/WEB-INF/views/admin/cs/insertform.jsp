<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	<!--////////////////////////////// summernotes////////////////////////////////////////// -->
	<script
	  src="https://code.jquery.com/jquery-3.7.0.js"
	  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	  crossorigin="anonymous"></script>
	  


	  
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>


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

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

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

.inner {
	position: relative;
	width: 100%;
	height: 90px;
}

.hd-in {
	width: 100%;
	display: flex;
	justify-content: space-between;
	position: fixed;
	background-color: white;
	border-bottom: 1px solid #E8E8E8;
	height: 80px;
	line-height: 80px;
	box-shadow: 0px 2px 0px 0px #F2F2F2;
}

.hd-left {
	font-weight: bold;
	font-size: 24px;
	margin-left: 4%;
	font-family: 'Jua', sans-serif;
}

.hd-left a {
	text-decoration: none;
	color: black;
}

.hd-right a {
	text-decoration: none;
	color: #797979;
}

.hd-right {
	font-weight: bold;
	font-size: 20px;
	margin-right: 6%;
}

.main-top {
	margin-left: 26%;
	height: 60px;
}

.main-title {
	font-size: 25px;
	font-weight: bold;
	color: #3A3A3A;
	line-height: 60px;
	margin-left: 1.5%;
}

.main-mid {
	margin-left: 26%;
	margin-right: 26%;
	margin-top: 3%;
	width: 50%;
}

.footer {
	margin-top: 2%;
	padding-top: 1%;
	background-color: rgb(250, 250, 250);
}

.foot-top {
	margin-left: 26.74%;
	margin-right: 24.82%;
}

.kakaot {
	font-weight: bold;
	margin-bottom: 2%;
}

.kakaot span, .telk span {
	color: #368FFF;
	margin-left: 1%;
}

.telk {
	font-weight: bold;
	margin-bottom: 1%;
}

.telf {
	font-weight: bold;
	margin-bottom: 2%;
}

.ft-info {
	font-weight: bold;
	color: #9A9A9A;
	line-height: 2.1;
	margin-bottom: 5%;
	padding-bottom: 3%;
	border-bottom: 1px solid #EFEFEF;
}

.foot-foot {
	margin-left: 26.74%;
	margin-right: 24.82%;
}

.ff {
	font-weight: 500;
	font-size: 11px;
	color: rgba(58, 58, 58, 0.5);
}

.ff2 {
	font-weight: 500;
	font-size: 11px;
	color: rgba(58, 58, 58, 0.5);
	margin-top: 2%;
	margin-bottom: 7%;
}

strong {
	font-weight: bold;
}
</style>
<script type="text/javascript">

 
	function checkWrite() {
		
		const w = document.getElementById("w");
		
		
		formData = new FormData(w);

		if(document.write.title.value == ""){
			alert("제목을 입력하십시오!");
			return;
		}else if(document.write.content.value == ""){
			alert("내용을 입력하십시오!")
			return;
		}
	

		var appendTag = "";		
		for(var i = 0; i<jsonArray.length; i++){
		    var str = jsonArray[i];
		    
		    // str의 값 : common/getImg.do?savedFileName=bc395afe-2324-438d-ae68-1a0a75d0a431.png 
		    // '='를 기준으로 자른다.
		    
		    var result = str.toString().split('=');
		    console.log(result[i])
		    var newInput = document.createElement('input');
		    newInput.setAttribute("type","hidden");
		    newInput.setAttribute("name","fileList");
		    newInput.setAttribute("value",result[1]);
		    //appendTag+='<input type="hidden" name="fileList" value="' + result[i] + '">'
		    // result[1] : bc395afe-2324-438d-ae68-1a0a75d0a431.png
		    w.appendChild(newInput);
		}
		
		//console.log(w);
		document.write.submit();
	}
</script>
<script type="text/javascript">
function selectOption(f) {
  var target = document.getElementById("selectShow");
  var param = "cs_cate_seq=" + f.value;
  var url = "${pageContext.request.contextPath}/admin/cs/optionChange";
	
  target.innerHTML = '<option value="0">선택하세요</option>';
	
  sendRequest(url, param, function(){
    if (xhr.readyState === 4 && xhr.status === 200) {
      var data = xhr.responseText;

      if (data !== '0') {
        const result = JSON.parse(data);
				
        for (var i = 0; i < result.length; i++) {
          var option = document.createElement("option");
          option.value = result[i]["cs_subcate_seq"];
          option.text = result[i]["cs_subcate_name"];
          target.appendChild(option);
        }
      }
    }
  },
  "POST");
}
</script>
    




</head>
<body>

<div align="center" id="datatable">
  <form action="${pageContext.request.contextPath}/admin/cs/insert" method="post" id="w" name="write" enctype="multipart/form-data">

      <input type="hidden" name="cs_seq" value="${cs_seq}" id="cs_seq">
      
    
    <table>
      <tr>
        <th width="70">카테고리</th>
        <td>
          <select name="cs_cate_seq" onchange="selectOption(this);">
           <option value="">선택하세요</option>
          <c:forEach var="cc" items="${csCateList}"> 
            <option value="${cc.cs_cate_seq}">${cc.cs_cate_name }</option>
            </c:forEach>
            <!-- 추가적인 카테고리 옵션들을 필요에 맞게 작성 -->
          </select>
        </td>
      </tr>
      <tr>
        <th width="60">유형</th>
        <td>
        <div>
         
          <select name="cs_subcate_seq"  id="selectShow">
          
          <option value="">선택하세요</option>
   
          </select>
          </div> 
        </td>
      </tr>
      <tr>
        <th width="60">제목</th>
        <td><input type="text" name="title" size="53"></td>
      </tr>

      <tr>
        <td colspan="2">
          <textarea id="summernote" rows="15" cols="65" name="content"></textarea>
        </td>
      </tr>
     
    </table>
    <div class="btnBox">
      <input type="button" value="쓰기" onclick="javascript:checkWrite()">
      <input type="button" value="목록" onclick="history.back();">
    </div>
  </form>
</div>
<script type="text/javascript">
//summernote 부분 
function textEdit(){
   jsonArray = [];

   $('#summernote').summernote({
         height: 500,                 // 에디터 높이
         minHeight: null,             // 최소 높이
         maxHeight: null,             // 최대 높이
         focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
         lang: "ko-KR",					// 한글 설정
        toolbar: [
           // [groupName, [list of button]]
           ['fontname', ['fontname']],
           ['fontsize', ['fontsize']],
           ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
           ['color', ['forecolor','color']],
           ['table', ['table']],
           ['para', ['ul', 'ol', 'paragraph']],
           ['height', ['height']],
           ['insert',['picture','link','video']],
           ['view', ['fullscreen', 'help']]
         ],
       fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
       fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
       callbacks: {
         onImageUpload : function(files){
        	   console.log("onImageUpload", JSON.stringify(files));
               // 파일 업로드(다중업로드를 위해 반복문 사용)
               for (var i = files.length - 1; i >= 0; i--) {
                   uploadSummernoteImageFile(files[i], this);
               }
          }
    } 
 });

   $('#summernote').summernote('fontSize', '24');

   function uploadSummernoteImageFile(file, el) {
       var data = new FormData();	
       var cs_seq = document.getElementById("cs_seq").value;
       console.log(cs_seq);
      
       console.log(cs_seq);
       data.append("file",file);
           $.ajax({
             url: '${ pageContext.request.contextPath }/summer_image?cs_seq='+cs_seq,
             type: "POST",
             enctype: 'multipart/form-data',
             data: data,
             cache: false,
             contentType : false,
             processData : false,
             success : function(data) {
                       var json = JSON.parse(data);
                       console.log(json);
                       $(el).summernote('editor.insertImage',json["url"]);
                           jsonArray.push(json["url"]);
                           jsonFn(jsonArray);
                   },
                   error : function(e) {
                       console.log(e);
                   }
               });
           }

}

function jsonFn(jsonArray){
	console.log(jsonArray);
}

$(document).ready(textEdit());	

</script>
	<header class="header">

		<div class="footer">
			<div class="foot-top">
				<div class="kakaot">
					카카오톡<span>@트리핀재비빙</span>
				</div>
				<div class="telk">
					국내 <span>1588-1111</span>
				</div>
				<div class="telf">해외에서&nbsp;(+82)1-1588-1111</div>
				<div class="ft-info">
					오전 9시 - 오후 6시 (한국 시간 기준, 연중 무휴) <br>
					<span>단, 항공문의는 주말/공휴일 제외</span>
				</div>
			</div>
			<div class="foot-foot">
				<div class="ff">
					(주)인턴파크 트리핀 | 대표 구현지 부대표 정희락 기술고문 박건태 <br>사업자 등록번호 202-30-209
					<br>서울특별시 강남구 테헤란로 146 현익빌딩 4층
				</div>
				<div class="ff2">㈜인턴파크트리핀은 통신판매중개로서 통신판매의 당사자가 아니며 상품 거래정보 및
					거래등에 대해 책임을 지지 않습니다.</div>
			</div>
		</div>
</body>
</html>








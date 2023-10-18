<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">

<c:set var="cpath" value="${pageContext.request.contextPath }" />

<style>
html,body,div,span,object,iframe,h1,h2,h3,h4,h5,h6,p,
blockquote,pre,abbr,address,cite,code,del,dfn,em,img,
ins,kbd,q,samp,small,strong,sub,sup,var,b,i,dl,dt,dd,ol,ul,li,
fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,
article,aside,canvas,details,figcaption,figure,footer,header,hgroup,
menu,nav,section,summary,time,mark,audio,video,fieldset {margin:0; padding:0; }




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
    background-color: #F2F2F2;
    height: auto;
}
.header {
    margin-left : 30%;
    margin-right : 30%;
    background-color: white;
    
    border-bottom : 1px solid #F2F2F2;
}
.hd-in {
    padding-left : 10%;
    padding-top : 2%;
}
.hd-in a {
    text-decoration: none;
}
.hd-in a img {
    width : 25px;
    margin-top : 2%;
}
.hd-bot {
    padding-top : 5%;
    padding-bottom : 5%;
    padding-left : 15%;
    font-weight: bold;
    font-size : 22px;
}
.main {
    margin-left : 30%;
    margin-right : 30%;
    background-color: white;
    font-family: Arial, Helvetica, sans-serif;
}
.caution, .select {
    padding-top : 7%;
    padding-left : 3%;
    padding-right : 3%;
    padding-bottom : 7%;
}
.cau-section {
    background-color: #FCF4F2;
    padding : 2%;
}
.red-text {
    color : #DC0328;
    font-weight: bold;
    font-size: 14px;
    padding-bottom : 1%;
}
.red-info {
    filter: invert(10%) sepia(68%) saturate(7086%) hue-rotate(342deg) brightness(100%) contrast(110%);
    width : 15px;
    position: relative;
    top : 0.15vh;
}
.text-detail {
    color : #919191;
    font-weight: bold;
    font-size : 13px;
}
.select-title {
    font-weight: bold;
    font-size : 18px;
}
.select-detail {
    width : 100%;
    padding-top : 2%;
}
.select-sec {
    width : 100%;
    height : 5vh;
    padding-left : 2%;
    border-radius: 4px;
    font-weight: bold;
    border : 2px solid #F2F2F2;
}
.select-area {
    padding-top : 2%;
    width : 100%;
}
.textarea1 {
    border : 2px solid #F2F2F2;
    resize: none;
    border-radius: 4px;
    width : 100%;
    box-sizing: border-box; /* 패딩 사이즈 고려해서 부모사이즈에 맞cnj*/
    outline: none;
    height : 15vh;
    padding : 2%;
    font-size : 14px;
    font-weight: bold;
    font-family: Arial, Helvetica, sans-serif;
    background-color: #F8F8F8;
}
.textarea1:focus {
    border : 2px solid#4285F4;
}
.foot-btn {
    padding-left : 3%;
    padding-right : 3%;
    width : 100%;
    padding-bottom : 3%;
    box-sizing: border-box;
}
.accept-btn {
    background-color: #2987F0;
    border-radius: 4px;
    height : 6vh;
    text-align: center;
    line-height: 6vh;
    font-weight: bold;
    color : white;
    cursor: pointer;
    opacity: 0.5;
    border : 0;
    width : 100%;
}
.accept-btnz {
    background-color: #2987F0;
    border-radius: 4px;
    height : 6vh;
    text-align: center;
    line-height: 6vh;
    font-weight: bold;
    color : white;
    cursor: pointer;
    opacity: 1;
    border : 0;
    width : 100%;
}
</style> 

<script type="text/javascript">
	function realCancel(form){
		var cate = form.cancel_cate_seq;
		var content form.content;
		
		if(cate.value == 0){
			alert("사유를 선택해주세요!");
			return false;
		}
		if(content.value == 0){
			alert("사유를 입력해주세요!");
			content.focus();
			return false;
		}
		
	}
</script>

    </head>
    <body>
    	<form method="post" onsubmit="javascript:return realCancel(this)">
     	<input type="hidden" name="purchase_no" value="${param.purchase }">
     	<input type="hidden" name="kind" value="${kind }">
         <header class="header">
             <div class="inner">
                 <div class="hd-in">
                     <a href="#" onclick="history.back()">
                         <img src="https://cdn-icons-png.flaticon.com/512/109/109602.png">
                     </a>
               		</div>
                 <div class="hd-bot">
                 	<span>${map.percent == 100 ? '전체 환불 ' : '일부 환불 ' } 취소가 가능합니다.(${map.percent }% 환불)</span>
                 </div>
             </div>
         </header>
         <div class="main">
			<div class="caution">
                 <div class="cau-section">
                     <div class="red-text">
                         <img class="red-info" src="https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_info_outline_48px-512.png">
                         <span>한 번 취소된 예약은 되돌릴 수 없습니다.</span>
                     </div>
                     <div class="text-detail">
                         <span>취소까지 최소 1~7영업일이 소요될 수 있습니다.</span>
                     </div>
                 </div>
             </div>
			<div class="select">
                 <div class="select-title">
                     <span>취소 사유 선택</span>
                 </div>
                 <div class="select-detail">
                     <select class="select-sec" id="selectSection" name="cancel_cate_seq">
                         <option value="">선택해주세요.</option>
                         <c:forEach var="cc" items="${clist }">
                         	<option value = "${cc.cancel_cate_seq }">${cc.cancel_cate_name }</option>
                         </c:forEach>
                     </select>
                 </div>
                 <div class="select-area">
                     <textarea name="content" placeholder="취소 사유를 입력해주세요.&#13;&#10;상품과 서비스 개선에 큰 도움이 됩니다." class="textarea1"></textarea>
                 </div>
            	</div>
             <div class="foot-btn">
                 <button class="accept-btn" id="buttonSection" onclick="submitThis(this.form)" disabled>
                     <span>예약취소</span>
                 </button>
             </div>
        	</div>
        </form>
        
        <script>
            const selectElement = document.getElementById('selectSection');
            const buttonElement = document.getElementById('buttonSection');
            
            selectElement.addEventListener('change', function() {
            
	            const selectedOption = selectElement.value;
	
	            if (selectedOption != '') {
	                buttonElement.disabled = false;
	                buttonElement.className = 'accept-btnz';
	            } else {
	                buttonElement.disabled = true;
	                buttonElement.className = 'accept-btn';
	            }
            });
            
            function submitThis(f){
            	confirmation = confirm("취소 후에는 되돌릴 수 없습니다.\r\n취소하시겠습니까?");
				if(confirmation){
	             	f.action = "${cpath }/member/ticket/cancel?purchase="+${param.purchase};
	             	f.submit();
				}else{
					return;
				}
            }
        </script>
    </body>
</html>

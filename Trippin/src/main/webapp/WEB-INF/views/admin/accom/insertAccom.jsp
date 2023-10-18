<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
            
            <!--  -->
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
			<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lzc8p76rjy&submodules=geocoder"></script>
			<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
			<meta charset="utf-8">
			
			<!-- include summernote css/js -->
			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
			
			<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
			<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
			
			<c:set var="cpath" value="${pageContext.request.contextPath }" />
			<script src="${cpath}/resources/js/httpRequest.js"></script>
			
			<link rel="shorcut icon"
				href="https://triple.guide/icons/favicon-152x152.png">
	
           <!--  -->
            <c:set var="cpath" value="${pageContext.request.contextPath }" />
            
            <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
            <title>나를 아는 여행 앱, 트리플</title>

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">

            <style>
               html,body,div,span,object,iframe,h1,h2,h3,h4,h5,h6,p,
                blockquote,pre,abbr,address,cite,code,del,dfn,em,img,
                ins,kbd,q,samp,small,strong,sub,sup,var,b,i,dl,dt,dd,ol,ul,li,
                fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,
                article,aside,canvas,details,figcaption,figure,footer,header,hgroup,
                menu,nav,section,summary,time,mark,audio,video,fieldset {margin:0; padding:0; }


                ol,ul{list-style:none}
                li { list-style-type:none; }
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

                .inner {
                    width : 100%;
                    height : 50px;
                }
                .hd-in {
                    margin-top : 0.5%;
                    height : 40px;
                }
                .hd-left {
                    font-weight : bold;
                    color : #929292;
                    font-size : 13px;
                    margin-left : 2%;
                }
                .title {
                    width : 100%;
                    height : 200px;
                }
                .mtitle {
                    font-weight: bold;
                    font-size : 35px;
                    margin-left : 42%;
                    margin-top : 5%;
                }
                .stitle {
                    font-weight: bold;
                    color : #9B9D9B;
                    margin-left: 43%;
                    margin-top : 2%;
                    display: flex;
                }
                .stitle-p {
                    font-family: 'Jua', sans-serif;
                    color : #50E3C2;
                    font-size : 25px;
                    margin-top : -0.5%;
                }
                .minfo {
                    border-top :2px solid;
                    margin-left : 10%;
                    margin-right : 10%;
                    
                    border-bottom : 2px solid;
                }
                .mi-one, .mi-two, .mi-thr {
                    border-bottom : 1px solid #EDEDED;
                    padding : 1%;
                    display : flex;
                }
                .mi-name, .exp, .licens {
                    font-weight: bold;
                    font-size : 16px;
                    padding : 2%;
                }
                .input-one {
                    padding : 1%;
                    width : 50%;
                    margin-left : 19%;
                }
                .input-one input, .input-thr input {
                    border : 2px solid #E8E8E8;
                    width : 50%;
                    height : 90%;
                }
                .input-one input:focus, .input-thr input:focus {
                    border : 1px solid #50E3C2;
                    box-shadow: #50E3C2 0px 0px 0px 1px;
                }
                .input-one input, .input-thr input  {
                    font-size : 16px;
                    color : #9B9D9B;
                    font-weight: bold;
                }
                .input-two {
                    margin-left : 10%;
                    padding : 1%;
                    margin-top : 1%;
                    width : 50%;
                    font-size : 16px;
                    font-weight: 600;
                    color : #666666;
                }
                
                .lab-one {
                    padding-left : 5%;
                    accent-color: gray;
                    
                }
                .lab-two {
                    padding-left : 10%;
                    accent-color: gray;
                }
                .input-thr {
                    padding : 1%;
                    width : 50%;
                    margin-left : 17.7%;
                }
                .check-title {
                    margin-left : 10%;
                    margin-top : 2%;
                    font-weight: bolder;
                    font-size : 20px;
                }
                .check-list {
                    margin-top : 2%;
                    border : 1px solid #cccccc;
                    margin-left : 10%;
                    margin-right : 10%;
                    padding-left : 2%;
                    padding-top : 2%;
                }
                #check1 {
                    margin-bottom :2%;
                    
                }
               
                .cl-one, .cl-two {
                    font-weight: bold;
                    font-size : 14px;
                }
                .ch-sp {
                    color : #FF4080;
                }
                .ft-submit {
                    
                    margin-top : 3%;
                    margin-left : 38%;
                    margin-right : 35%;
                    margin-bottom : 5%;
                    border :0px;
                    background-color: #50E3C2;
                    
                    padding : 1%;
                    border-radius : 45px;
                }
                .ft-submit:hover {
                    border : 2px solid #04CFD4;
                }
                .fts-one {
                    padding : 2%;
                    border : 0px;
                    margin-left : 39%;
                    background-color: #50E3C2;
                    color : white;
                    font-weight: bold;
                    font-size : 20px;
                }
                .fts-two {
                    margin-left : 23%;
                    font-size : 20px;
                    font-weight : bold;
                    color : white;
                }
                .emailbtn {
                    margin-left: -25.5%;
                    background-color: #EFEFEE;
                    color : silver;
                    border : 0px;
                    height : 46.2px;
                    margin-top : 1%;
                }
                input[type=checkbox] {
                    accent-color: #50E3C2;
                    
                }
                .uploadbtn {
                    width : 150px;
                    height : 40px;
                    background : white;
                    border : 1px solid rgb(77,77,77);
                    border-radius : 15px;
                    font-weight: bold;
                    cursor : pointer;
                    display : flex;
                    align-items: center;
                    justify-content: center;
                    margin-top : 7%;
                }
                .uploadbtn:hover {
                    background: rgb(77,77,77);
                    color : #fff;
                }
                input[type=file]::file-selector-button {
                    width: 150px;
                    height: 30px;
                    background: #fff;
                    border: 1px solid rgb(77,77,77);
                    border-radius: 10px;
                    cursor: pointer;
                    margin-bottom : 2%;
                }
                input[type=file]::file-selector-button:hover {
                    background: rgb(77,77,77);
                    color : #fff;
                }
                #file {
                    display : flex;
                }
                select::-ms-expand { 
                    display: none;
                }
                .scity {
                -o-appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                width : 150px;
                height : 35px;
                background: url('https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png') calc(100% - 5px) center no-repeat;
                background-size: 20px;
                padding : 5px 30px 5px 10px;
                border : 0px;
                outline : 0 none;
                }
                
                .sbox {
                    position : relative;
                    width : 150px;
                    height : 35px;
                    border-radius: 4px;
                    border : 2px solid #50E3C2;
                }
                .sobx .scity {
                    width : inherit;
                    height : inherit;
                    background : transparent;
                    border : 0 none;
                    outline : 0 none;
                    padding : 0 5px;
                    position : relative;
                    z-index : 3;

                }
                .sbox .scity option {
                    background : gray;
                    color : #fff;
                    padding : 3px 0;
                    font-size : 15px;
                }
                .sbox .sarrow {
                    position : absolute;
                    top : 0;
                    right : 0;
                    z-index: 1;
                    width : 35px;
                    height: inherit;
                    border-left : 2px solid #50E3C2;
                    display : flex;
                    justify-content: center;
                    align-items: center;
                }
                .sbox .sarrow img{
                    width : 50%;
                    transition: 0.5s;
                    background-color: white;
                }
                .sbox .scity:focus + .sarrow img {
                    transform: rotate(180deg);
                }
/*                 #roomstar {
                    display: none;
                } */
                textarea {
                    width: 100%;
                    height: 6.25em;
                    border: 2px solid #cccccc;
                    resize: none;
                    outline: none;
                }
                textarea:hover {
                    border : 2px solid #04CFD4;
                }
            </style>
        </head>
        <body>
        
        <script>

        function check(f){
        	var kind = f.kind.value;
        	var name = f.name;
        	var addr1 = f.addr1_seq.value;
        	var addr2 = f.addr2_seq.value;
        	var addr = f.addr;
        	
        	if (kind == "0"){
        		alert("카테고리를 선택해주세요.");
        		return false;
        	}
        	if (name.value == ""){
        		alert("매장명을 입력해주세요.");
        		name.focus();
        		return false;
        	}
        	if (addr1 == "0" || addr2 == "0"){
        		alert("지역을 선택해주세요.");
        		return false;
        	}
        	if (addr.value == ""){
        		alert("주소를 검색하여 확인해주세요.");
        		addr.focus();
        		return false;
        	}
        </script>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <img src="https://business.yanolja.com/common/kr/web/img/icon-home.png"> > 관리자 > 업체등록 > 신규 업체 등록
                        </div>
                    </div>
                </div>
                <div class="title">
                    <div class="mtitle">
                        신규 업체 등록
                    </div>
                    <div class="stitle">
                        나를 아는 여행앱 &nbsp;<p class="stitle-p">Trippin'</p>
                    </div>
                </div>
            </header>
            <div class="main">
                <form action="${cpath }/admin/accom/insert" method="post" enctype="multipart/form-data" onsubmit="return check(this)">
                    <input type="hidden" name="cate_seq" value="3">
					<input type="hidden" id="f_seq" name="f_seq" value="${f_seq }">
                    <div class="minfo">
                        <div class="mi-one">
                            <div class="mi-name">
                                숙소 한글이름
                            </div>
                            <div class="input-one" style="margin-left : 17.7%;">
                                <input type="text" name="name">
                            </div>
                            
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                숙소 영문이름
                            </div>
                            <div class="input-one" style="margin-left : 17.72%;">
                                <input type="text">
                            </div>
                        </div>
                        <div class="mi-two">
                            <div class="exp">
                                숙소 종류 시퀀스 
                            </div>
                            <div class="input-two" style="margin-left : 10.5%;">
                                <label class="lab-two"><input type="radio" name="kind" value="1">펜션</label>
                                <label class="lab-one"><input type="radio" name="kind" value="2">캠핑</label>
                                <label class="lab-one"><input type="radio" name="kind" value="3">모텔</label>
                                <label class="lab-one"><input type="radio" name="kind" value="4">호텔</label>
                            </div>
                        </div>
                        <div class="mi-two" id="roomstar">
                            <div class="exp">
                                숙소 등급 
                            </div>
                            <div class="input-two" style="margin-left : 14.4%;">
                                <label class="lab-two"><input type="radio" name="star" value="1"> 1성</label>
                                <label class="lab-one"><input type="radio" name="star" value="2"> 2성</label>
                                <label class="lab-one"><input type="radio" name="star" value="3"> 3성</label>
                                <label class="lab-one"><input type="radio" name="star" value="4"> 4성</label>
                                <label class="lab-one"><input type="radio" name="star" value="5"> 5성</label>
                                
                            </div>
                        </div>
                        <div class="mi-two">
                            <div class="exp">
                                숙소 베스트 여부 
                            </div>
                            <div class="input-two" style="margin-left : 10.5%;">
                                <label class="lab-two"><input type="radio" name ="best" value="1"> 해당 없음</label>
                                <label class="lab-one"><input type="radio" name="best" value="2"> 베스트 숙소</label>
                                
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                숙소 주소
                            </div>
                            <div class="input-one" style="margin-left : 20.4%;">
                                <input type="text" name="addr">
                                <input type="hidden" id="wi" name="wi">
								<input type="hidden" id="kyung" name="kyung">
								<input type="hidden" id="addr_detail" name="addr_detail">
								<input type="hidden" id="main_img" name="main_img">
                            </div>
                        </div>
                    <div class="mi-one">
					<div class="mi-name">지역</div>
					<div class="input-one" style="margin-left: 27.3%; display: flex;">
						<div class="sbox">
							<select class="scity" name="addr1_seq" id="citykindz" onchange="citykindchange(this)">
								<option value="0">선택하세요</option>
								<c:forEach var="a1" items="${addr1list }">
									<option value="${a1.addr1_seq }">${a1.addr1_name }</option>
								</c:forEach>
							</select> 
							<span class="sarrow">
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3-ywUVHBNam3DS8gXfLDGYf7lpS98npeAhw&usqp=CAU" alt="">
							</span>
						</div>
						<div class="sbox" style="margin-left: 2%;">
							<select class="scity" id="citykindy" name="addr2_seq">
								<option value="0">선택하세요</option>
							</select> 
							<span class="sarrow">
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3-ywUVHBNam3DS8gXfLDGYf7lpS98npeAhw&usqp=CAU" alt="">
							</span>
						</div>
						<script>
						
						function  citykindchange(e) {
						$.ajax({
								url:"${pageContext.request.contextPath}/admin/area",
								type:"post",
								data:{addr1_seq:e.value},
								success: function sc(data) {
									let sity = document.querySelector('#citykindy');
									sity.innerHTML = '';
									data.forEach(s => {
										let newOp = document.createElement("option");
										newOp.value = s.addr2_seq;
										newOp.innerText = s.addr2_name;
										sity.appendChild(newOp);
									})
								}
								
							})
							 
						}
							
						</script>
					</div>
				</div>
                        
                        <div class="mi-one">
                            <div class="mi-name">
                                숙소 전화번호
                            </div>
                            <div class="input-one" style="margin-left : 17.67%;">
                                <input type="text" name="tel">
                            </div>
                        </div>
                        
                        <div class="mi-thr">
                            <div class="licens">
                                숙소 홈페이지
                            </div>
                            <div class="input-thr">
                                <input type="text" name="website">
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                찾아가는 법
                            </div>
                            <div class="input-one" style="margin-left : 19.05%;">
                                <input type="text" name="way">
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                픽업 안내
                            </div>
                            <div class="input-one" style="margin-left : 20.39%;">
                                <input type="text" name="intro">
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                보건&안전 카테고리 [세부 카테고리만 있으면 될것 같은데]
                            </div>
                            <div class="" style="margin-left : 14.67%; margin-top : 2%;">
                                <label class=""><input type="checkbox" name ="expe"> 1</label>
                                <label class=""><input type="checkbox" name ="expe"> 2</label>
                                <label class=""><input type="checkbox" name ="expe"> 3</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                보건&안전 세부 카테고리
                            </div>
                            <div class="" style="margin-left : 11.47%; margin-top : 2%;">
                        <c:forEach var="hs" items="${hssublist }">
                                <label class=""><input type="checkbox" name ="hssub" value="${hs.hs_sub_seq }"> ${hs.hs_sub_name }</label><br>
                        </c:forEach>

                            </div>
                        </div>

                        <div class="mi-one">
                            <div class="mi-name">
                                편의시설 카테고리  [세부 카테고리만 있으면 될것 같은데]
                            </div>
                            <div class="" style="margin-left : 15.77%; margin-top : 2%;">
                                <label class=""><input type="checkbox" name ="expe"> 1</label>
                                <label class=""><input type="checkbox" name ="expe"> 2</label>
                                <label class=""><input type="checkbox" name ="expe"> 3</label>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                편의시설 세부 카테고리
                            </div>
                            <div class="" style="margin-left : 12.61%; margin-top : 2%;">
                           	<c:forEach var="cf" items="${cfsublist }">
                                <label class=""><input type="checkbox" name ="cfsub" value="${cf.cf_sub_seq }"> ${cf.cf_sub_name }</label><br>
                           	</c:forEach>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                숙소PR 제목
                            </div>
                            <div class="input-one" style="margin-left : 18.75%;">
                                <input type="text">
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                숙소PR 내용
                            </div>
                            <div class="input-one" style="margin-left : 18.75%;">
                                <input type="text">
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                숙소 설립연도
                            </div>
                            <div class="input-one" style="margin-left : 17.79%;">
                                <input type="text">
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                숙소 설명
                            </div>
                            <div class="input-one" style="margin-left : 20.42%;">
                                <textarea></textarea>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                숙소 중요정보
                            </div>
                            <div class="input-one" style="margin-left : 17.74%;">
                                <textarea></textarea>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                숙소 정책
                            </div>
                            <div class="input-one" style="margin-left : 20.42%;">
                                <textarea></textarea>
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                숙소 입실시간
                            </div>
                            <div class="input-one" style="margin-left : 17.79%;">
                                <input type="text">
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                숙소 퇴실시간
                            </div>
                            <div class="input-one" style="margin-left : 17.79%;">
                                <input type="text">
                            </div>
                        </div>
                        
                        <div class="mi-one" style="display : flex;">
                            <div class="mi-name">
                                이미지 업로드
                            </div>
                            <div class="" style="margin-left : 19.09%; margin-top : 1.5%;">
                                
                                <input type="file" name="file" id="file" multiple/>
                                
                            </div>
                            
                        </div>
                    </div>
                    <div class="foot">
                        <div class="ft-submit">
                            <input class="fts-one" type="submit" value="업체 등록">
                            <span class="fts-two">⭧</span>    
                        </div>
                    </div>    
                </form>
            </div>
        </body>
    </html>
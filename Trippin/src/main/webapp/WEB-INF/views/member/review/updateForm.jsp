<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <html lang="kr">
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
            <title>나를 아는 여행 앱, 트리플</title>

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">

			<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
		    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
		  
		    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		  
		    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
			
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

                body {
                    background-color: #F2F2F2;
                    height : auto;
                }
                .header {
                    margin-left : 30%;
                    margin-right : 30%;
                    padding-top : 0.5%;
                    background-color: white;
                    height: 10vh;
                    border-bottom : 1px solid #F2F2F2;
                }
                .hd-in a {
                    text-decoration: none;
                }
                .hd-in a img {
                    width : 40px;
                    margin-top : 2%;
                }
                .hd-in img {
                    width : 40px;
                    margin-top : 3%;
                    border-radius: 50%;
                    margin-left : 3%;
                }
                .hd-sp {
                    position: relative;
                    bottom : 1.5vh;
                    left : 2vw;
                    font-size :24px;
                    font-family: 'Jua', sans-serif;
                }
                .main {
                    margin-left : 30%;
                    margin-right : 30%;
                    padding-top : 0.5%;
                    background-color: white;
                    border-bottom : 1px solid #F2F2F2;
                }
                .custom {
                	align-items: center;
                    align-content: center;
                    padding-top : 4%;
                    padding-left : 4%;
                }
                .custom-info {
                    display: flex;
                    width : 70%;
                    position: relative;
                }
                .custom-img img {
                    width : 10vw;
                    height : auto;
                    border-radius: 10px;
                    margin-left : 40%;
                }
                .custom-name {
                    font-weight: bold;
                    font-size: 20px;
                    margin-left : 12%;
                    margin-top : 3%;
                    width : 60%;
                    
                }
                .custom-name a{
                	color: #000;
					text-decoration: none;
                }
                .custom-jjim {
                    width : 40px;
                    cursor: pointer;
                    position: relative;
                    top : 1vh;
                }
                .custom {
                    display : flex;
                }
                .main-mid {
                    padding-top : 2%;
                    text-align: center;
                }
                .star {
                    margin-left : 15%;
                    margin-right : 15%;
                }
                .star-info {
                    margin-left : 15%;
                    margin-right : 15%;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    font-family: 'Jua',sans-serif;
                }
                input[type='month'] {
                    border: none; 
                    position: relative; 
                    width: 25%;
                    padding: 10px;
                    background: url('https://o.remove.bg/downloads/169075d3-ec5c-4b17-b59d-64fb1db6452b/75624-removebg-preview.png') no-repeat right 10px center /
                        35px auto; 
                    background-color: #F2F2F2;
                    box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
                    border-radius: 8px;
                    text-align: center;
                    font-size: 100%;
                    margin-bottom: 1%;
                    margin-top : 1%;
                    font-family: 'Jua', sans-serif;
                }
                input[type='month']::-webkit-calendar-picker-indicator {
                    position: absolute; 
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    background: transparent; 
                    color: transparent; 
                    cursor: pointer;
                }
                input[type='month']::before {
                    content: attr(placeholder); 
                    width: 100%;
                    height: 100%;
                }
                input[type='month']:valid::before {
                    display: none; 
                }
                .area {
                    margin-top : 5%;
                }
                textarea {
                    width : 90%;
                    height : 50vh;
                    resize: none;
                    outline: none;
                    border : 2px solid #F2F2F2;
                    font-size : 15px;
                    font-weight: bold;
                    padding-top : 2%;
                    padding-left : 2%;
                    line-height: 150%;
                    font-family: Arial, Helvetica, sans-serif;
                }
                textarea::placeholder {
                    font-size : 12px;
                    font-weight: bold;
                    color : #897E7F;
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
                    background : white;
                }
                .main-foot {
                    margin-top : 2%;
                    margin-left : 4%;
                    padding-bottom : 5%;
                    display: flex;
                }
                .submit {
                    text-align: center;
                    padding-bottom : 5%;
                }
                .submit input {
                    padding-left : 2%;
                    padding-right : 2%;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    cursor: pointer;
                    background-color: white;
                    border-radius: 5px;
                    box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
                    border : 2px solid rgb(77,77,77);
                }
                .submit input:hover {
                    background: rgb(77,77,77);
                    color : #fff;
                }
                .addre{
                	color: rgba(0, 0, 0, 0.2);
                	font-size: 15px;
                	padding-top: 3%;
                }
                #star1, #star2, #star3, #star4, #star5{
			    	cursor: pointer;
			    	
			    }
			    .rvimg{
			    	object-fit: cover;
			    	width: 110px;
			    	height: 110px;
			    }
			    .photo{
			    	padding-right: 2%;
			    	padding-top: 1%;
			    }
			    .addFilesBtn{
			    	padding-left: 4%;
			    	padding-top: 2%;
			    }
			    .deleteBtn{
			    	width: 5%;
				    height: 5%;
				    right: 6.5%;
				    position: relative;
				    border-radius: 50%;
				    border: 1px solid darkgray;
				    cursor: pointer;
			    }
            </style>
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <a onclick="history.back()" style="cursor: pointer;">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU">
                        </a>
                        <span class="hd-sp">리뷰 수정</span>
                    </div>
                </div>
            </header>
            <div class="main">
                
                   <div class="main-top">
                       <div class="custom">
                           <div class="custom-info">
                               <div class="custom-img">
                                   <img src="${cpath}/common/getImg?path=${rv.MAIN_IMG }&file=${main_imgNM }" style="width:5em; height: 5em;"/>
                               </div>
                               <div class="custom-name">
                                   <span><a href="${cpath }/member/tour/selectTour?f_seq=${rv.F_SEQ}" target="_blank"><b>${rv.NAME }</b></a></span>
	                               <div class="addre">${rv.KIND_NAME } · ${rv.ADDR1_NAME }(${rv.ADDR2_NAME })</div>
                               </div>
                           </div>
                       </div>
                   </div>
                <form method="post" enctype="multipart/form-data">
                    <input type="hidden" name="f_seq" id="f_seq" value="${rv.F_SEQ }">
                    <input type="hidden" name="rv_img" value="${rv.RV_IMG }">
                    <input type="hidden" name="rv_seq" id="rv_seq" value="${rv.RV_SEQ }">
                    <div class="main-mid">
                        <div class="star">
							<c:forEach begin="1" end="5" step="1" varStatus="i">
								<img id="star${i.count }" src="${cpath }/resources/star/graystar.jpg" style="width:6%;" onclick="checkstars(${i.count});">
                        	</c:forEach>
							<input type="hidden" name="stars" id="stars">
                        </div>
                        <div class="star-info">
                            <span id="starcmt">별점을 선택해주세요!</span>
                        </div>
                        <div class="date">
                            <input type="month" name="visitday" value="${rv.VISITDAY }" placeholder="날짜를 선택해주세요." required value={props.date} onchange={props.changeHandler} id="dateSelect" min="{props.isFullRange ? undefined : getDate()}">
                        </div>
                        <div class="area">
                            <textarea name="content" placeholder="- 직접 경험한 솔직한 리뷰를 남겨주세요.&#13;&#10;- 사진도 첨부할 수 있어요.">${rv.newContent }</textarea>
                        </div>
                    </div>
                    <div class="addFilesBtn">
                   		<input type="file" name="files" id="addFiles" multiple="multiple">
                   	</div>
                    <div class="main-foot">
                    	<c:forEach var="ri" items="${rv_imgNM}" varStatus="i">
	                        <div class="photo">
	                        	<img class="rvimg" id="imgChange${i.count }" src="${cpath }/common/getImg?path=${rv.RV_IMG}&file=${ri}">
	                            <input type="file" name="files" id="myRVImgs${i.count }" style="display: none;" onchange="readURL(this, ${i.count });"/>
	                        </div>
	                        <img class="deleteBtn" id="deleteBtn${i.count }" onclick="deleteImg(${i.count })" src="${cpath }/resources/deleteBtn/엑스버튼 누끼.png">
                        </c:forEach>
                        <img onclick="">
                    </div>
                    <div class="submit">
                        <input type="button" value="등록하기" onclick="checkRV(this.form);">
                    </div>
                </form>
            </div>
            
            <script type="text/javascript">

				function checkstars(v){
					var stars = document.getElementById("stars");
					var starcmt = document.getElementById("starcmt");
					
					for(let i = 1; i <= 5; i++){
						var star = document.getElementById("star"+i);
						if(i <= v){
							star.src = "${cpath}/resources/star/yellowstar.jpg";
						}else{
							star.src = "${cpath}/resources/star/graystar.jpg";
						}
						
					}
					stars.value = v;
					
					if(v == 1){
						starcmt.innerText = "별로예요";
					}else if(v == 2){
						starcmt.innerText = "조금 아쉬워요";
					}else if(v == 3){
						starcmt.innerText = "주위에 있다면 가볼만해요";
					}else if(v == 4){
						starcmt.innerText = "꽤 가볼만해요";
					}else{
						starcmt.innerText = "꼭 가야 하는 곳이에요";
					}
					
				}
				
				$(function(){
					checkstars(${rv.STARS});
				})
		
				
				function readURL(v, c){
            		if(v.files && v.files[0]){
            			var reader = new FileReader();
            			reader.onload = function(e){
            				console.log(document.getElementById('imgChange'+c));
            				document.getElementById('imgChange'+c).src = e.target.result;
            			};
            			reader.readAsDataURL(v.files[0]);
            		}else{
            			document.getElementById("imgChange"+c).src = "";
            		}
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
						f.action = "${cpath}/member/review/updateCheck";
						f.submit();
					}
				}
				
				function deleteImg(v){
					var deleteImg = document.getElementById("imgChange"+v).src;
					console.log(deleteImg);
					var str = deleteImg.split("&file=")
					console.log(str[0]);
					console.log(str[1]);
					
					var rv_seq = document.getElementById("rv_seq").value;
					
					
					$.ajax({
						type: 'post',
						url: "${cpath}/member/review/deleteImg?file="+str[1] +"&rv_seq="+rv_seq,
						success: function(data){
							if(data == 'deleteImg'){
								location.reload();
							}else{
								alert("오류로 인해 사진 삭제에 실패하였습니다.");
							}
						}
					});
					
					
				}		
				
				
				
			
			</script>
            
        </body>
    </html>
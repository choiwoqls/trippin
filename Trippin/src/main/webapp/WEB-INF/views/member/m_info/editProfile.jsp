<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
            <c:set var="cpath" value="${pageContext.request.contextPath }" />
            <script type="text/javascript" src="${cpath }/resources/js/httpRequest.js"></script>
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
                /* hr{display:none;} */
                hr{
                	background: #e7e7e7;
                	height: 1px;
                	border: 0;
                	width: 76%;
                }
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
                    
                    box-shadow: 0px 2px 0px 0px #BAC0C4;
                    
                }
                
                .hd-in {
                    display: flex;
                    height : 9vh;
                    
                }
                .inner-fix {
                    position: fixed;
                    box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 15px;
                    background-color: white;
                    z-index : 300;
                    width : 40%;
                    border-bottom-left-radius: 5px;
                    border-bottom-right-radius: 5px;
                    padding-bottom : 1%;
                }
                .hd-in a {
                    text-decoration: none;
                }
                .hd-in a img {
                    width : 40px;
                    cursor: pointer;
                }
                .hd-in span {
                    position: relative;
                    bottom : 1.5vh;
                    left : 1vw;
                    font-size : 18px;
                    font-weight: 500;
                }
                .main-user {
                    padding-top: 2%;
				    padding-bottom: 5%;
				    text-align: -webkit-center;
                }
                .uimg {
                    width : 80px;
                    height : 80px;
                    border-radius: 40px;
                    object-fit: cover;
                }
                .user-name {
                    font-weight: bold;
                    font-size: 18px;
                    margin-top: 1%;
                }
                .user-level {
                    color : rgba(58, 58, 58, 0.4);
                    font-size : 12px;
                    font-weight: bold;
                    padding-bottom : 2%;
                }
                .input1 {
                    width : 60%;
                    
                    border-top : none;
                    border-left : none;
                    border-right : none;
                    border-bottom : 2px solid #F1F1F1;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    text-align: center;
                    font-size: 20px;
                    font-weight: bold;
                }
                .input1:focus{
                    border-bottom : 2px solid #50E3C2;
                }
                input::placeholder {
                    color : rgba(58, 58, 58, 0.4);
                }
                
                .nickname-area img{
                	cursor: pointer;
                }
                .closeImg {
				    align-self: center;
				    width: 20px;
				    padding-top: 2%;
				    position : relative;
				    right : 1.7vw;
				    bottom : 0.7vh;
				}
				.formto {
					display : flex;
					width : 100%;
					padding-left : 20%;
					padding-right : 20%;
				}
				.user-info {
					padding-top : 2%;
					padding-bottom : 5%;
				}
				.user-info2{
					padding-top : 10%;
					padding-bottom : 5%;
					
				}
				.saveBtn {
					width : 60%;
					padding-top : 2%;
					padding-bottom : 2%;
					border : 0;
					font-weight : bold;
					cursor : pointer;
					border-radius : 4px;
					background-color : #50E3C2;
					color : white;
					opacity : 1;
				}
				.saveBtnz {
					width : 60%;
					padding-top : 2%;
					padding-bottom : 2%;
					border : 0;
					font-weight : bold;
					cursor : pointer;
					border-radius : 4px;
					background-color : #CDCDCD;
					color: rgba(58, 58, 58, 0.7);
					opacity : 0.5;
				}
				.back-btn {
					position : relative;
					top : 1vh;
					left : 1vw;
				}
				.tel-top{
					display: flex;
				}
				.pw-top{
					display: flex;
				}
				.hidden{
					display: none;
				}
				.block{
					display: block;
					border: 0;
					outline: none;
					border-bottom: 2px solid rgb(54, 143, 255);
					font-size: 16px;
					padding-bottom: 1%;
				}
				.email-area, .tel-area, .pw-area {
					padding-top : 4%;
					padding-bottom : 4%;
					border-bottom : 2px solid #F1F1F1;
					text-align : start;
					margin-left : 10%;
					margin-right : 10%;
				}
				.email-area {
					border-top : 2px solid #F1F1F1;
				}
				.tel-top, .pw-top {
					display : flex;
					justify-content : space-between;
				}
				.email, .tel, .pw {
					font-weight : bold;
					font-size : 20px;
				}
				.m_emailArea, .m_telArea {
					padding-top : 2%;
					color: rgba(58, 58, 58, 0.8);
				}
				.telBtn, .pwBtn {
					border : 0;
					background-color : white;
					color: rgb(54, 143, 255);
					font-size : 16px;
					font-weight : 500;
					cursor: pointer;
				}
				.tel-area{
					height: 7vh;
				}
            </style>
            


        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="content">
                   		<div class="hd-in">
                   			<div class="historyBack">
		                        <a onclick="history.back();">
		                        	<img class="back-btn" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU">
		                        </a>
	                        </div>
	                    </div>
					    <div class="main-user">
					    	<form method="post" enctype="multipart/form-data">
					    	<input type="hidden" name="m_seq" value="${vo.m_seq }">
		                        <div class="user-img">
		                        	<a onclick="$('#imgUpload').trigger('click')" class="imgUploadBtn" style="cursor: pointer;">
										<img class="uimg" id="imgChange" src="${cpath}/common/getImg?path=${vo.m_profile }&file=${m_profileNM }">
									</a>
									<input type="file" id="imgUpload" name="photo" style="display: none;" onchange="readURL(this);">
		                        </div>
		                        <div class="user-info">
		                        	<div class="user-level">
		                                <span>LEVEL${vo.m_level }</span>
		                            </div>
		                        	<div class="nickname-area">
			                        	<div class="formto" id="formto">
				                            <input type="text" id="m_nickname" class="input1" name="m_nickname" placeholder="닉네임을 입력하세요" value="${vo.m_nickname }">
					                   		<img class="closeImg" onclick="rename();" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWxNQPZdQPH2FqOb6H1RKHDMdedRZJYQoaVw&usqp=CAU">
					                    </div>
		                        	</div>
		                        	<div class="user-info2">
			                        	<div class="email-area">
			                        		<div class="email">
			                        			트리핀 계정 이메일
			                        		</div>
			                        		<div class="m_emailArea">
			                        			${vo.m_email }
			                        		</div>
			                        	</div>
			                        	<div class="tel-area">
			                        		<div class="tel-top">
			                        			<div class="tel">
			                        				휴대폰 번호
			                        			</div>
			                        			<div class="tel-edit">
			                        				<input type="button" value="변경" class="telBtn" onclick="updateTel()">
			                        			</div>
			                        		</div>
			                        		<div class="m_telArea">
			                        			<div class="mtel_origin" id="mtel_originID">
			                        				${vo.m_tel }
			                        			</div>
			                        			<input type="text" name="m_tel" id="m_tel" class="hidden" value="${vo.m_tel }" maxlength="11">
			                        		</div>
			                        	</div>
			                        	<div class="pw-area">
			                        		<div class="pw-top">
			                        			<div class="pw">
			                        				비밀번호
			                        			</div>
			                        			<div class="pw-edit">
			                        				<input type="button" value="재설정" class="pwBtn" onclick="updatePW()">
			                        			</div>
			                        		</div>
			                        	</div>
		                        	</div>
		                            
		                        </div>
		                        <div>
		                        	<input type="button" value="수정완료" class="saveBtnz" id="saveBtn" onclick="save(this.form);" disabled="disabled">
		                        </div>
	                        </form>
	                    </div>
					</div>
                    
                </div>
            </header>
            
            
            <script type="text/javascript">
            	
            	function readURL(v){
            		if(v.files && v.files[0]){
            			var reader = new FileReader();
            			reader.onload = function(e){
            				document.getElementById('imgChange').src = e.target.result;
            			};
            			reader.readAsDataURL(v.files[0]);
            		}else{
            			document.getElementById("imgChange").src = "";
            		}
            	}
            
            	
            	function rename(){
            		var m_nickname = document.getElementById("m_nickname");
            		m_nickname.value = "";
            	}
            	
            	
            	
            	
				var fileInput = document.getElementById("imgUpload");
				var textInput = document.getElementById("m_nickname");
				var saveBtn = document.getElementById("saveBtn");
				var m_tel = document.getElementById("m_tel");
				
				var initialFileValue = fileInput.value;
				var initialTextValue = textInput.value;
				var initialM_TelValue = m_tel.value;
				
				fileInput.addEventListener("change", function () {
				    if (fileInput.value !== initialFileValue) {
				        saveBtn.disabled = false;
				        saveBtn.className = "saveBtn";
				    } else {
				        saveBtn.disabled = true;
				        saveBtn.className = "saveBtnz";
				    }
				});
				
				textInput.addEventListener("input", function () {
				    if (textInput.value !== initialTextValue) {
				        saveBtn.disabled = false;
				        saveBtn.className = "saveBtn";
				    } else {
				        saveBtn.disabled = true;
				        saveBtn.className = "saveBtnz";
				    }
				});
				
				m_tel.addEventListener("input", function(){
					if(m_tel.value !== initialM_TelValue){
						saveBtn.disabled = false;
						saveBtn.className = "saveBtn";
					}else{
						saveBtn.disabled = true;
						saveBtn.className = "saveBtnz";
					}
				});
				
				
				function popConfirm(){
					
                	var url = "${cpath}/member/editProfile/confirm?m_seq=${vo.m_seq}";
    		        var name = "confirm";
    		        
    		       /*  var popX = (document.body.offsetWidth/2) - (800/2); */
    		        var popX = (window.screen.width/2) - (400/2);
    		        var popY = (window.screen.height/2) - (300/2);
    		        
    		        var option = "width = 400, height = 300, top ="+ popY + ", left ="+ popX;
    		        let parent = window.open(url, name, option);
	                	
				}
				
				function updateTel(){
					var mtel_origin = document.getElementById("mtel_originID");
					var mtel = document.getElementById("m_tel");
					
					mtel_origin.className = 'hidden';
					mtel.className = 'block';
				}
				
				function updatePW(){
					
					var url = "${cpath}/member/editProfile/rePw?m_seq=${vo.m_seq}";
					var name = "repw";
					
					var popX = (window.screen.width/2) - (600/2);
    		        var popY = (window.screen.height/2) - (176/2);
    		        
    		        var option = "width = 600, height = 176, top ="+ popY + ", left ="+ popX;
    		        let parent = window.open(url, name, option);
				}
				
				
				function save(f){
					var m_nickname = f.m_nickname.value;
					var m_tel = f.m_tel.value;
					
					if(m_nickname.length > 10){
						alert("닉네임은 10글자까지 가능합니다.");
						f.m_nickname.focus();
						return;
					}else if(m_nickname == ''){
						alert("닉네입을 입력해주세요.");
						f.m_nickname.focus();
						return;
					}else if(m_tel == ''){
						alert("전화번호를 입력해주세요.");
						f.m_tel.focus();
						return;
					}else{
						f.action = "${cpath}/member/editProfile/updateM_info";
						f.submit();
					}
					
				}
            	
            	
            </script>
            
        </body>
    </html>
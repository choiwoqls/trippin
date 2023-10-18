<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
            <c:set var="cpath" value="${pageContext.request.contextPath }" />
            <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
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
                    font-weight: bold;
                    color : #929292;
                    font-size : 13px;
                    margin-left : 2%;
                }
                .title {
                    width : 100%;
                    height : 200px;
                }
                .mtitle {
                    font-weight : bold;
                    font-size : 35px;
                    margin-left : 45%;
                    margin-top : 5%;
                }
                .stitle {
                    font-weight : bold;
                    color : #9B9D9B;
                    margin-left : 43%;
                    margin-top : 2%;
                    display : flex;
                }
                .stitle-p {
                    font-family: 'Jua', sans-serif;
                    color : black;
                    font-size : 25px;
                    margin-top : -0.5%;
                }
                .tinfo {
                    text-align : right;
                    color : #B1B1AF;
                    font-weight : bold;
                    font-size : 14px;
                    margin-right : 10%;
                    margin-top : 5%;
                }
                .tinfo span {
                    color : #FF3478;
                    font-weight: bold;
                    
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
                .all-span {
                    color : #FF3478;
                    font-weight: bold;
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
                    padding-left : 15%;
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
                .checkMail{
                	position: relative;
                	top: 60px;
                	right: 445px;
                }
                .checkPw{
             	   position: relative;
                	top: 65px;
                	right: 760px;
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
                    background-color: #EFEFEE;
                    
                    padding : 1%;
                    border-radius : 45px;
                }
                .fts-one {
                    padding : 2%;
                    border : 0px;
                    margin-left : 39%;
                    background-color: #EFEFEE;
                    color : silver;
                    font-weight: bold;
                    font-size : 20px;
                }
                .ft-submit2 {
                    
                    margin-top : 3%;
                    margin-left : 38%;
                    margin-right : 35%;
                    margin-bottom : 5%;
                    border :0px;
                    background-color: #50E3C2;
                    
                    padding : 1%;
                    border-radius : 45px;
                }
                .ft-submit2:hover {
                    border : 2px solid #04CFD4;
                }
                .fts-one2 {
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
                .emailbtn1 {
                    margin-left: -25.5%;
                    background-color: #50E3C2;
                    color : white;
                    border : 0px;
                    height : 46.3px;
                    margin-top : 0.9%;
                    cursor : pointer;
                }
                input[type=checkbox] {
                    accent-color: #50E3C2;
                    
                }
                .ithr-btn {
                    
                    margin-left : -6.2%;
                    padding-left : 3%;
                    padding-right : 3%;
                    padding-top : 2%;
                    padding-bottom: 2%;
                    border-radius: 5px;
                    background-color: white;
                    border : 2px solid #D8D8D8;
                    font-size : 12px;
                    font-weight: bold;
                    cursor : pointer;
                    transition-duration: 0.3s;
                }
                .ithr-btn-new {
                    
                    margin-left : -6.2%;
                    padding-left : 3%;
                    padding-right : 3%;
                    padding-top : 2%;
                    padding-bottom: 2%;
                    border-radius: 5px;
                    background-color: white;
                    border : 2px solid #D8D8D8;
                    font-size : 12px;
                    font-weight: bold;
                    cursor : pointer;
                    box-shadow: 3px 3px 3px #D8D8D8;
                    transition-duration: 0.3s;
                }
                .ithr-btn:active {
                    margin-left : -5.2%;
                    
                    box-shadow: none;
                }
                .formto {
                    display : none;
                    width : 100%;
                }
                input::placeholder {
                    color : #D7D7D7;
                }
                .input1 {
                    width : 40%;
                    height : 50px;
                    border-top : none;
                    border-left : none;
                    border-right : none;
                    border-bottom : 2px solid #F1F1F1;
                    margin-left : 30%;
                    margin-top : 3%;
                    
                }
                .input1:focus, .input2:focus {
                    border-bottom : 2px solid #50E3C2;
                }
                .input2 {
                    width : 40%;
                    height : 50px;
                    border-top : none;
                    border-left : none;
                    border-right : none;
                    border-bottom : 2px solid #F1F1F1;
                    margin-left : 30%;
                    margin-top : 3%;
                }
				.input-btnz {
                    position : relative;
                    right : 94px;
                    background-color: #D8D8D8;
                    color : white;
                    border : 0;
                    padding-top : 0.7%;
                    padding-bottom : 0.7%;
                    padding-left : 1%;
                    padding-right : 1%;
                    border-radius: 5px;
                    font-weight: bold;
                    font-size : 14px;
                }
                .login {
                    width : 40%;
                    height : 50px;
                    margin-left : 30%;
                    margin-top : 3%;
                    border-radius: 5px;
                    border : none;
                    background-color: #50E3C2;
                    border-radius: 10px;
                    box-shadow:.8rem .5rem 1.4rem  #BEC5D0, -.3rem -.4rem .8rem #FBFBFB;
                }
                .login:active {
                    box-shadow: inset -.3rem -.1rem 1.4rem  #FBFBFB, inset .3rem .4rem .8rem #BEC5D0; 
                    cursor: pointer;
                }
                .checkMsg{
                	margin-left: 30%;
                }
            </style>            
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <a href="${cpath }"><img src="https://business.yanolja.com/common/kr/web/img/icon-home.png"></a> > 
                            <a href="${cpath }/login/loginForm" style="text-decoration: none; color: #929292;">로그인</a> > 
                            회원가입
                        </div>
                    </div>
                </div>
                <div class="title">
                    <div class="mtitle">
                        SIGN UP 
                    </div>
                    <div class="stitle">
                        나를 아는 여행앱 &nbsp;<p class="stitle-p">Trippin'</p>
                    </div>
                    <div class="tinfo">
                        <span>*</span>필수입력사항
                    </div>
                </div>
            </header>
            <div class="main">
                <form method="POST">
                    <div class="minfo">
                        <div class="mi-one">
                            <div class="mi-name">
                                이메일<span class="all-span">*</span>
                            </div>
                            <div class="input-one" style="margin-left : 17.7%;">
                                <input type="text" name="m_email" id="m_email" placeholder="이메일을 입력해주세요." onkeyup="signup(this)" autocomplete="off">
                            </div>
                           
                            <input type="button" id="inpemail" class="emailbtn" onclick="checkEmail(this.form)" disabled="disabled" value="중복확인"><br>
                            <div class="checkMail"><span id="result"></span></div>
                        </div>
                        <div class="mi-thr" style="display: block;">
                        	<div style="display: flex;">
	                            <div class="licens">
	                                이메일 인증<span class="all-span">*</span>
	                            </div>
	                            <div class="input-thr">
	                                <input type="button" id="confirmbtn" class="ithr-btn" value="이메일 인증" onclick="emailConfirm()" disabled="disabled">
	                            </div>
                            </div>
                            <div class="formto" id="formto">
	                            <input class="input1" id="emailCode" type="text" onkeyup="emailC(this)" placeholder="인증코드"/>
	                            <input type="button" value="인증하기" id="inputCheck" class="input-btnz">
	                            <br>
	                            <div class="checkMsg">
	                            	<span id="mail-check-warn"></span>
	                            </div>
		                    </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                이름<span class="all-span">*</span>
                            </div>
                            <div class="input-one">
                                <input type="text" name="m_name">
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                비밀번호<span class="all-span">*</span>
                            </div>
                            <div class="input-one" style="margin-left : 16.25%;">
                                <input type="password" name="m_pw" id="m_pw" placeholder="특수문자 포함 영문자 대소문자 8~20글자 이내로 입력해주세요." autocomplete="off">
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                비밀번호 확인<span class="all-span">*</span>
                            </div>
                            <div class="input-one" style="margin-left : 13.1%;">
                                <input type="password" name="repw"  id="repw" placeholder="특수문자 포함 영문자 대소문자 8~20글자 이내로 입력해주세요." autocomplete="off" >
                            </div>
                            <div class="checkPw"><span><font id="chkNotice" size="2"></font></span></div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                전화번호<span class="all-span">*</span>
                            </div>
                            <div class="input-one">
                                <input type="text" name="m_tel" placeholder="-없이 숫자만 입력" onkeyup="chrCheck(this)" onkeydown="chrCheck(this)" maxlength="11">
                            </div>
                        </div>
                        <div class="mi-thr">
                            <div class="licens">
                                닉네임<span class="all-span">*</span>
                            </div>
                            <div class="input-thr">
                                <input type="text" name="m_nickname" placeholder="2~10글자로 입력해주세요." maxlength="10" onkeyup="nnCheck(this)">
                            </div>
                        </div>
                       
                    </div>
                    <div class="main-check">
                        <div class="check-title">
                            약관 동의
                        </div>
                        <div class="check-list">
                            <div class="cl-one">
                                <input type="checkbox" id="check1">
                                <label class="ckeck-two" for="check1"><span class="ch-sp">&#40;필수&#41; </span>본인은 만 14세 이상입니다.</label>
                            </div>
                            <div class="cl-one">
                                <input type="checkbox" id="check2">
                                <label class="ckeck-two" for="check1"><span class="ch-sp">&#40;필수&#41; </span>개인정보 수집에 동의합니다.</label>
                            </div>
                            <div class="cl-one">
                                <input type="checkbox" id="check3">
                                <label class="ckeck-two" for="check1"><span class="ch-sp">&#40;필수&#41; </span>이용약관에 동의합니다.</label>
                            </div>
                            <div class="cl-two">
                                <input type="checkbox" id="check4">
                                <label class="ckeck-two" for="check1"><span class="ch-sp">&#40;선택&#41; </span>트리핀 소식 및 정보 등 마케팅 수신보다는 보노보노 PPT 발표에 동의합니다.</label>
                            </div>
                        </div>
                    </div>
                
                    <div class="foot">
                        <div class="ft-submit">
                            <input class="fts-one" type="button" id="join" value="회원가입" disabled="disabled" onclick="check(this.form)">
                            <span class="fts-two">⭧</span>    
                        </div>
                    </div>    
                </form>
            </div>
        </body>
        <script type="text/javascript">
        
	        function checkEmail(f){
	    		var url = "${pageContext.request.contextPath}/join/checkEmail";
	    		var param = "m_email=" + f.m_email.value;
	    		sendRequest(url, param, resultFn, "POST");
	    	}
        
	    	
	    	function resultFn(){
	    		var m_email = document.getElementById("m_email").value;
	    		const result = document.getElementById("result");
    			const join = document.getElementById("join");
    			const confirmbtn = document.getElementById("confirmbtn");
	    		$.ajax({
					url: "${pageContext.request.contextPath}/join/checkEmail",
					type: "POST",
					data: {m_email: m_email},
					success: function show(data){
						if(data === '사용 가능한 Email입니다.'){
		    				result.style.cssText = "color:blue; font-size:10px;";
		    				/* join.disabled = false; */
		    				confirmbtn.disabled = false;
		    				confirmbtn.className= "ithr-btn-new";
		    			}else{
		    				result.style.cssText = "color:red; font-size:10px;";
		    				join.disabled = true;
		    			}
		    			result.innerText = data;
					},
					error: function(xhr, status, error){
						console.log("status: "+ status + ", error: "+ error);
					}
	    		});
	    	}
	    	
	    	
			function signup(t) {
			   	const emBtn = document.getElementById("inpemail");
			   	const result = document.getElementById("result");                             
			    let email = t.value;
			   	const email_p = /^[a-z0-9A-Z]{1,15}@[a-z]{1,7}[.][a-z]{1,3}$/;
			    console.log(email_p.test(email));
			    check_email = email_p.test(email);
			    if(check_email) {
			     	result.innerText ='';
			     	emBtn.disabled = false;
			 		let dom = document.querySelector('#inpemail')
					dom.className = "emailbtn1";
			    }else {
			     	emBtn.disabled = true;
			     	result.style.cssText = "color:red; font-size:10px;";
			     	result.innerText = '이메일 형식을 확인하세요';
			        let dom = document.querySelector('#inpemail');
			        dom.className = "emailbtn";
			    }
			}
   

			function emailConfirm(){
				
				var m_email = document.getElementById("m_email").value;
			    var formto = document.getElementById("formto");
			    
			    const thisEmail = window.confirm("입력하신 이메일로 인증번호를 전송하시겠습니까?");
			    
			    if(thisEmail){
				    formto.style.display = 'block';
				    
				    $.ajax({
				    	type: 'get',
				    	url: '${pageContext.request.contextPath}/join/sendEmail?m_email='+ m_email,
				    	success: function(data){
				    		console.log("data: " + data);
				    		code = data;
				    		alert("인증번호가 전송되었습니다.");
				    	}
				    });
			    }
			 }
			
			
			
			$('.input1').blur(function(){
				const inputCode = document.getElementById("emailCode").value;
				const $resultMsg = $('#mail-check-warn');
				
				if(inputCode === code){
					$resultMsg.html('인증번호가 일치합니다.');
					$resultMsg.css('color', 'green');
					$('#confirmbtn').attr('disabled', true);
					$('#m_email').attr('readonly', true);
					$('#join').attr('disabled', false);
					$('.ft-submit').attr('class', 'ft-submit2');
					$('.fts-one').attr('class', 'fts-one2');
				}else{
					$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요.');
					$resultMsg.css('color', 'red');
					$('.ft-submit').attr('class', 'ft-submit');
					$('.fts-one').attr('class', 'fts-one');
				}
			});
	             
        
			function check(f){
        		var m_email = f.m_email.value;
        		var m_name = f.m_name.value;
        		var m_pw = f.m_pw.value;
        		var repw = f.repw.value;
        		var m_nickname = f.m_nickname.value;
        		var m_tel = f.m_tel.value;
        		
        		const namerg = /^[가-힣]+$/;
        		/* const pwrg = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9]{8,20}$/; */
        		const pwrg = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
        		const nicknamerg = /^[가-힣a-zA-Z]{2,10}$/;
        		
        		if(m_email == ''){
        			alert("이메일을 입력해주세요.");
        			f.m_email.focus();
        			return;
        		}else if(m_name == ''){
        			alert("이름을 입력해주세요.");
        			f.m_name.focus();
        			return;
        		}else if(!namerg.test(m_name)){
        			alert("이름은 한글만 입력 가능합니다.");
        			f.m_name.focus();
        			return;
        		}else if(m_pw == ''){
        			alert("비밀번호를 입력해주세요.");
        			f.m_pw.focus();
        			return;
        		}else if(!pwrg.test(m_pw)){
        			alert("비밀번호는 특수문자 포함 영문자 8~20글자로 이루어져야 합니다.\n특수문자는 !, @, #, $, %, ^, &, * 만 사용 가능합니다.");
        			f.m_pw.focus();
        			return;
        		}else if(m_pw != repw){
        			alert("비밀번호가 일치하지 않습니다.");
        			f.repw.focus();
        			return;
        		}else if(m_tel == ''){
        			alert("전화번호를 입력해주세요.");
        			f.m_tel.focus();
        			return;
        		}else if(m_nickname == ''){
        			alert("닉네임을 입력해주세요.");
        			f.m_nickname.focus();
        			return;
        		}else if(!nicknamerg.test(m_nickname)){
        			alert("닉네임은 한글 영문 상관없이 2~10글자로 이루어져야 합니다.");
        			f.m_nickname.focus();
        			return;
        		}else{
        			f.action = "${cpath}/join/joinCheck";
        			f.submit();
        		}
        	}
	

			$(function(){
			    $('#m_pw').keyup(function(){
			    	$('#chkNotice').html('');
			    });
			    $('#repw').keyup(function(){
			
			        if($('#m_pw').val() != $('#repw').val() && $('#m_pw').val() != ''){
				        $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
				        $('#chkNotice').attr('color', '#f82a2aa3');
			        } else if($('#m_pw').val() != "" && $('#repw').val()!=""){
				        $('#chkNotice').html('비밀번호 일치함<br><br>');
				        $('#chkNotice').attr('color', '#199894b3');
			        }
			    });
			});
	
        
            function emailC(t) {
                let email = t.value
                const email_p = /^[a-z0-9A-Z]{1,15}@[a-z]{1,6}[.][a-z]{1,3}$/;
                console.log(email_p.test(email))
                if(email_p.test(email)){
                   let dom = document.querySelector('#inpemail')
                    dom.className = "input-btnz1";
                }else {
                    let dom = document.querySelector('#inpemail')
                    dom.className = "input-btnz";
                }
            }
            
            
            function chrCheck(v){
            	var chr = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
            	
            	if(chr.test(v.value)){
            		v.value = v.value.substring(0, v.value.length - 1);
            	}
            }
			
			
            function nnCheck(v){
            	if(v.value.length > 10){
            		alert("닉네임은 2~10글자 입니다.");
            	} 
            }
        
        </script>
    </html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
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

                @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');


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

                input::placeholder {
                    color : #D7D7D7;
                }
                ::-ms-value {
                    color : white;
                }
                .inner {
                    position : relative;
                    width : 100%;
                    height : 50px;
                }
                .hd-in {
                    display : flex;
                    justify-content: space-between;
                    margin-top :1%;
                    border-bottom : 1px solid;
                    border-color : #E8E8E8;
                    height : 40px;
                }
                .hd-left {
                    font-weight: bolder;
                    font-size : 20px;
                    margin-left : 12%;
                    font-family: 'Jua', sans-serif;
                }
                .hd-left a {
                text-decoration : none;
                color : black;
                }
                .hd-right {
                    font-weight : bold;
                    font-size : 20px;
                    margin-right : 49%;
                }
                .main-input {
                    position :relative;
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
                    border-bottom : 2px solid black;
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
                .login {
                    width : 40%;
                    height : 50px;
                    margin-left : 30%;
                    margin-top : 5%;
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
                .main-sub {
                    position : relative;
                }
                .msub {
                    margin-top : 1%;
                    display : flex;
                    justify-content: center;
                }
                .sub1 {
                    
                    margin-right : 2%;
                    padding-right: 2%;
                    border-right : 2px solid;
                    border-color : #D2D2D2;
                    font-weight: 400;
                    font-size : 12px;
                }
                .sub2 {
                    font-weight : 400;
                    font-size : 12px;
                }
                .msub a {
                    text-decoration: none;
                }
                .sub1 a, .sub2 a {
                    color : black;
                }
                .sub1 a:visited, .sub2 a:visited {
                    color : black;
                }
                .sub1 a:hover, .sub2 a:hover {
                    border-bottom : 1px solid #50E3C2;
                    transition: 1s;
                }
                select {
                    -moz-appearance : none;
                    -webkit-appearance: none;
                    appearance: none;
  
                    font-family: "Noto Sansf KR", sans-serif;
                    font-size: 1rem;
                    font-weight: 400;
                    line-height: 1.5;
  
                    color: #444;
                    background-color: #fff;
  
                    padding: .6em 1.4em .5em .8em;
                    margin: 0;
  
                    border: 1px solid #aaa;
                    border-radius: .5em;
                    box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
                }
                select:hover {
                    border-color : #888;
                }
                label {
                    font-family : "Noto Sans KR", sans-serif;
                    font-size : 1rem;
                    font-weight : 600;
                    line-height : 1.3;
                    color : #444;
                    margin-right : 0.5em;
                }
                .main-input1 {
                    position : relative;
                }
                .formto {
                    
                    
                    width : 100%;
                }
                .label1 {
                    width : 40%;
                    margin-left : 20%;
                }
				
				input[type=checkbox] {
                    accent-color: #50E3C2;
                    
                }
				.input3 {
                    width : 40%;
                    height : 50px;
                    border-top : none;
                    border-left : none;
                    border-right : none;
                    font-size : 14px;
                    margin-left : 30%;
                    margin-top : 3%;
                    
                    
                }
				
            </style>
            
        <script type="text/javascript">
        	
        	function check(f){
        		var m_email = f.m_email.value;
        		var m_pw = f.m_pw.value;
        		
        		if(m_email == ''){
        			alert("이메일을 입력해주세요.");
        			f.m_email.focus();
        			return;
        		}
        		if(m_pw == ''){
        			alert("비밀번호를 입력헤주세요.");
        			f.m_pw.focus();
        			return;
        		}
        		
        		f.action = "${pageContext.request.contextPath}/login/check";
        		f.submit();
        	}
        </script>
        
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <a href="${pageContext.request.contextPath}">Trippin'</a>
                        </div>
                        <div class="hd-right">
                            로그인
                        </div>
                    </div>
                </div>
            </header>
            <div class="main">
                <div class="main-input1">
                    
                    <div class="formto">
                        <form method ="POST" class="inputform">
                        	
                            <input class="input1" type="text" name="m_email" placeholder="이메일" value="${m_email}"/>
                            <input class="input2" type="password" name="m_pw" placeholder="비밀번호"/>
                            <br><br>
                            <c:choose>
                            	<c:when test="${check }">
		                            <label class="input3"><input type="checkbox" name ="ckid" value="true" checked="checked">이메일 기억하기</label>
                            	</c:when>
                            	<c:otherwise>
		                            <label class="input3"><input type="checkbox" name ="ckid" value="true">이메일 기억하기</label>
                            	</c:otherwise>
                            </c:choose>
                            <input class="login" type="button" value="로그인" style="color : white; font-weight : bold; font-size : 14px;" onclick="check(this.form)"/>
                        </form>
                    </div>
                </div>
                <div class="main-sub">
                    <div class="msub">
                        <div class="sub1">
                            <a href="#">비밀번호 찾기></a>
                        </div>
                        <div class="sub2">
                            <a href="${pageContext.request.contextPath}/join/joinForm">이메일로 회원가입></a>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                    height : 80px;
                }
                .hd-left {
                    font-weight: bolder;
                    font-size : 28px;
                    line-height: 60px;
                    margin-left : 12%;
                    font-family: 'Jua', sans-serif;
                }
                .hd-left a{
                    text-decoration: none;
                    color : black;
                }
                .hd-right {
                    line-height: 60px;
                    font-weight : bold;
                    font-size : 21px;
                    margin-right : 47%;
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
                .main-sub {
                    position : relative;
                }
                .msub {
                    margin-top : 2%;
                    display : flex;
                    
                }
                .sub1 {
                    margin-left : 30.5%;
                    margin-right : 2%;
                    padding-right: 2%;
                    color : #D8D8D8;
                    
                    font-weight: 400;
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
                    transition: 0.5s;
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
                    
                    display : block;
                    width : 100%;
                }
                .label1 {
                    width : 40%;
                    margin-left : 20%;
                }
                input[type=checkbox] {
                    accent-color: #50E3C2;
                    
                }
                .mi-title {
                    margin-top : 5%;
                    margin-left : 30%;
                    color: rgba(58, 58, 58, 0.8);
                    font-size : 15px;
                    font-weight : 500;
                    
                }
                .mi-title h2 {
                    margin-bottom : 1.3%;
                    font-size : 24px;
                    color : black;
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
                .input-btnz1 {
                    position : relative;
                    right : 94px;
                    background-color: #50E3C2;
                    color : white;
                    border : 0;
                    padding-top : 0.7%;
                    padding-bottom : 0.7%;
                    padding-left : 1%;
                    padding-right : 1%;
                    border-radius: 5px;
                    font-weight: bold;
                    font-size : 14px;
                    cursor: pointer;
                }
            </style>
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <a href="#">Trippin'</a>
                        </div>
                        <div class="hd-right">
                            이메일 인증
                        </div>
                    </div>
                </div>
            </header>
            <div class="main">
                <div class="main-input1">
                    <div class="mi-title">
                        <h2>이메일 인증하기</h2>트리핀에서는 고객님의 안전한 거래 및 회원 정보 보호를 위해 본인 인증(최초 1회)를 하고 있습니다.
                    </div>
                    <div class="formto">
                        <form action="form_ok.php" method ="POST" class="inputform">
                            <input class="input1" type="email" onkeyup="signup(this)" placeholder="이메일"/>
                            <button id = "inpemail" class="input-btnz" type="button" onclick="document.location.href='${pageContext.request.contextPath }/join/registerEmail'">인증하기</button>
                            <input class="input2" type="password" placeholder="인증코드"/>
                            
                            <input class="login" type="submit" value="인증완료" style="color : white; font-weight : bold; font-size : 14px;"/>
                            <script>
                                function signup(t) {
                                    let email = t.value
                                    const email_p = /^[a-z0-9A-Z]{1,15}@[a-z]{1,7}[.][a-z]{1,3}$/;
                                    console.log(email_p.test(email))
                                    if(email_p.test(email)){
                                       let dom = document.querySelector('#inpemail')
                                        dom.className = "input-btnz1";
                                    }else {
                                        let dom = document.querySelector('#inpemail')
                                        dom.className = "input-btnz";
                                    }
                                }
                            </script>
                        </form>
                    </div>
                </div>
                <div class="main-sub">
                    <div class="msub">
                        <div class="sub1">
                            10분 이내로 인증코드(n자리)를 입력해주세요.
                        </div>
                        
                    </div>
                </div>
            </div>
        </body>
    </html>
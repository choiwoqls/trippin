<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
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
                

            </style>
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <a href="${cpath }"><img src="https://business.yanolja.com/common/kr/web/img/icon-home.png"></a> > 
                            <a href="${cpath }/login/loginForm">로그인</a> > 
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
                <form>
                    <div class="minfo">
                        <div class="mi-one">
                            <div class="mi-name">
                                이메일<span class="all-span">*</span>
                            </div>
                            <div class="input-one" style="margin-left : 17.7%;">
                                <input type="text">
                            </div>
                            <button class="emailbtn">중복확인</button>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                이름<span class="all-span">*</span>
                            </div>
                            <div class="input-one">
                                <input type="text">
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                비밀번호<span class="all-span">*</span>
                            </div>
                            <div class="input-one" style="margin-left : 16.25%;">
                                <input type="password">
                            </div>
                        </div>
                        <div class="mi-one">
                            <div class="mi-name">
                                비밀번호 확인<span class="all-span">*</span>
                            </div>
                            <div class="input-one" style="margin-left : 13.1%;">
                                <input type="password">
                            </div>
                        </div>
                        <div class="mi-two">
                            <div class="exp">
                                여행어플 사용 여부 
                            </div>
                            <div class="input-two">
                                <label class="lab-two"><input type="radio" name ="expe"> 유</label>
                                <label class="lab-one"><input type="radio" name="expe"> 무</label>
                            </div>
                        </div>
                        <div class="mi-thr">
                            <div class="licens">
                                닉네임<span class="all-span">*</span>
                            </div>
                            <div class="input-thr">
                                <input type="text">
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
                                <input type="checkbox" id="check1">
                                <label class="ckeck-two" for="check1"><span class="ch-sp">&#40;필수&#41; </span>개인정보 수집에 동의합니다.</label>
                            </div>
                            <div class="cl-one">
                                <input type="checkbox" id="check1">
                                <label class="ckeck-two" for="check1"><span class="ch-sp">&#40;필수&#41; </span>이용약관에 동의합니다.</label>
                            </div>
                            <div class="cl-two">
                                <input type="checkbox" id="check1">
                                <label class="ckeck-two" for="check1"><span class="ch-sp">&#40;선택&#41; </span>트리핀 소식 및 정보 등 마케팅 수신보다는 보노보노 PPT 발표에 동의합니다.</label>
                            </div>
                        </div>
                    </div>
                
                    <div class="foot">
                        <div class="ft-submit">
                            <input class="fts-one" type="submit" value="회원가입">
                            <span class="fts-two">⭧</span>    
                        </div>
                    </div>    
                </form>
            </div>
        </body>
    </html>
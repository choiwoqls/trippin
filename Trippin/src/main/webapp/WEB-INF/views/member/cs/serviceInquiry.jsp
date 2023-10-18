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
        .main {
                background-color: white;
                margin-left : 10%;
                margin-right : 10%;
                font-family : -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
                padding-bottom : 3%;
            }
            .table {
                padding-bottom : 3%;
                padding-top : 3%;
            }
            .tb-1 {
                display : flex;
                border-bottom : 1px solid #CDCDCD;
                min-height : 6vh;
                line-height: 6vh;
                margin-bottom : 2%;
                padding-bottom : 1.5%;
                height : auto;
            }
            .tb-2 {
                padding-top : 1%;
                padding-left : 2%;
                padding-right : 2%;
                padding-bottom : 2%;
            }
            .tb-3 {
                padding-top : 1%;
                padding-left : 3%;
                padding-right : 2%;
                padding-bottom : 2%;
                border : 2px solid;
                text-align: left;
                font-weight: bold;

            }
            .pop-info1 {
                font-size : 16px;
            }
            .pop-info2, .pop-info3 {
                font-size : 12px;
                padding-top : 2%;
            }
            .t2-text textarea {
                width : 95%;
                height : 50vh;
                resize: none;
                outline: none;
                border : 1px solid #CDCDCD;
                font-size : 15px;
                padding-top : 1%;
                padding-left : 1%;
                font-family: Arial, Helvetica, sans-serif;
            }
            .t1-title {
                width : 30%;
                font-weight: bold;
                color : rgba(58, 58, 58, 0.4);
                font-size : 17px;
                border-right : 2px solid #CDCDCD;
            }
            .t1-text {
                width : 70%;
                text-align: left;
                padding-left : 3vw;
                font-size : 15px;
                color : rgb(58, 58, 58);
            }
            .header span {
                border-bottom : 2px solid #9A9A9A;
                color :#606060;
                padding-bottom : 1%;
                
            }
            .header {
                padding-top : 2%;
                padding-left : 3%;
                padding-bottom : 3%;
                font-size : 20px;
                font-weight: bold;
            }
            .text-info {
                font-size : 12px;
                color :rgba(58, 58, 58, 0.4);
            }
            .text-info span {
                color : #F11D32;
            }
            .t1-text input {
                width : 90%;
                height : 6vh;
                border : 0;
            }
            #email {
                border-bottom : 2px solid #9A9A9A;
            }
            .t1-text select {
                width : 90%;
                border : 0;
                padding-top : 2%;
                padding-bottom : 3%;
                border-bottom : 2px solid #9A9A9A;
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
            input[type=checkbox] {
                width : 3vw;
                height : 2.5vh;
                position: relative;
                top : 0.2vh;
            }
            input[type=file]::file-selector-button:hover {
                    background: rgb(77,77,77);
                    color : #fff;
            }
            .btn-list {
                
                display: flex;
            }
            .main-btn {
                width : 50%;
                
                padding-left : 30%;
            }
            .main-btn input {
                width: 150px;
                height: 30px;
                background: #fff;
                border: 2px solid rgb(77,77,77);
                border-radius: 10px;
                cursor: pointer;
                font-weight: bold;
                font-size : 14px;
            }
            .main-btn input:hover {
                background: rgb(77,77,77);
                color : #fff;
            }
            .sub-btn {
                width : 30%;
                text-align: right;
                position : absolute;
                top :1vh;
                left : 58vw;
            }
            .sub-btn input {
                border:0;
                border-bottom : 2px solid;
                background-color: white;
                cursor: pointer;
                font-weight: bold;
            }
        </style>
        <script type="text/javascript">
        function openPopup(url) {
            
            window.open(url,'popWindow', 'width=800, height=600,scrollbars=yes')
            
            
        }
        </script>

        <script type="text/javascript">
        function insert(f) {
            var title = document.getElementById("title").value;
            var content = document.getElementById("content").value;
            var cateKind = document.getElementById("cateKind").value; 
            var email = document.getElementById("email").value;
            var tel = document.getElementById("tel").value;
            var termsCheck = document.getElementById("termsCheck");
            
            if(cateKind === ''){
                alert("문의 유형을 선택하세요!");
                return false;
            
            }else if(email === ''){
                alert("이메일을 입력하세요!");
                return false;
            
            }else if(tel === ''){
                    alert("핸드폰 번호를 입력하세요!");
                    return false;
            
            }else if(title===''){
                alert("제목을 입력하세요!");
                return false;
            }else if(content === ''){
                alert("내용을 입력하세요!");
                return false;
            }else if(!termsCheck.checked){
                alert("동의사항에 체크 해주세요!");
                return false;
                
            }
            
            return true;
            
        }
        </script>

        </head>
        <body>
            <div class="header">
                <span>서비스 일반 1:1문의 페이지</span>
            </div>
            <form action="${cpath}/member/cs/sInsert" method="post" enctype="multipart/form-data" onsubmit="return insert(this)">
                <div class="main" align="center">
                <input type="hidden" name="cs_cate_seq" value="3">
                <input type="hidden"  name="m_seq" value="${mvo.m_seq }">
                
                


                    <div class="table">  
                        <div class="tb-1">
                            <div class="t1-title">
                                <label for="subcate">문의유형</label>
                            </div>
                            <div class="t1-text">
                                <select name="cs_subcate_seq" id="cateKind">
                                <option value="">--선택하세요--</option>
                                <c:forEach var="sl" items="${csSubCateList3 }" >
                                <option value="${sl.cs_subcate_seq }">${sl.cs_subcate_name}</option>
                                </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="tb-1" style="height : auto;">
                            <div class="t1-title">
                                <label>이메일 주소</label>
                            </div>
                            <div class="t1-text">
                                <input type="text" value="${mvo.m_email}" name ="email" id="email" >
                                <div class="text-info"><span>* </span>이메일로 답변이 전송될 예정이므로, 정확한 이메일을 입력해주세요.</div>
                            </div>
                        </div>
                        <div class="tb-1">
                            <div class="t1-title">
                                <label>핸드폰 번호</label><br>
                            </div>
                            <div class="t1-text">
                                <input type="text" value="${mvo.m_tel }" name="tel" id="tel">
                            </div>
                        </div>
                        <div class="tb-1">
                            <div class="t1-title">
                                <label>문의 내용</label>
                            </div>
                            <div class="t1-text">
                                <input type="text" name="title" id="title" placeholder="제목을 입력하세요(최대 25자)">
                            </div>	
                        </div>
                        <div class="tb-2">
                            <div class="t2-text">
                                <textarea rows="15" cols="63" placeholder="문의내용을 입력해주세요" id="content" name="content"></textarea>
                            </div>
                        </div>
                        <div class="tb-1" id="photos">
                            <div class="t1-title">
                                <label>사진등록</label>
                            </div>
                            <div class="t1-text">		
                                <input type="file" name="photos" id="file" multiple />
                            </div>	
                        </div>
                        
                    
                                    
                        <div class="tb-3">
                            <div class="pop-info1">트리플 고객센터 정보수정 규정을 모두 읽었으며 이에 동의합니다.<input type="checkbox" name="termsCheck" id="termsCheck"></div>
                            <div class="pop-info2"><a href= "javascript:void(0);" onclick="openPopup('${cpath }/member/cs/terms1')">개인정보 수집 및 활용</a>에 동의합니다.</div>
                            <div class="pop-info3"><a href="javascript:void(0);" onclick="openPopup('${cpath }/member/cs/terms2')">제3자(토스트)제공</a>에 동의합니다.</div>
                        </div>
                    </div>
                    <div class="btn-list">
                        <div class="main-btn">   
                            <input type="submit" value="접수하기" id="submitBtn">
                        </div>
                        <div class="sub-btn"> 
                        <input type="button" value="Home" onclick ="document.location.href='${cpath}/'">
                        <input type="button" value="Back" onclick ="history.back();">
                        </div>
                    </div> 
                </div>
            </form>


                
        </body>
    </html>
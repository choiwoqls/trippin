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
            <script src="http://code.jquery.com/jquery-1.6.4.min.js"> </script>

            <link rel="shorcut icon"
                href="https://triple.guide/icons/favicon-152x152.png">



            <title>나를 아는 여행 앱, 트리플</title>


            <style>
            html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p,
                blockquote, pre, abbr, address,  cite, code, del, dfn, em, img, ins, kbd,
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
            }
            .table {
                padding-bottom : 3%;
                padding-top : 3%;
            }
            .tb-1 {
                display : flex;
                border-bottom : 1px solid #CDCDCD;
                height : 5vh;
                line-height: 5vh;
                margin-bottom : 2%;
                padding-bottom : 1.5%;
            }
            .tb-2 {
                padding-top : 1%;
                padding-left : 2%;
                padding-right : 2%;
                padding-bottom : 2%;
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
            .table-foot {
                
                padding-bottom : 3% ;
            }
            .check-point {
                
                padding-top : 2%;
                padding-bottom : 2%;
            }
            .ex-text input {
                cursor: pointer;
                background-color: white;
                border-radius: 5px;
                box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
                border: 2px solid rgb(77,77,77);
                font-weight: bold;
                font-size: 14px;
                margin-top : 1%;
                margin-bottom : 1%;
                padding : 1%;
            }
            .ex-text input:hover {
                background-color: rgb(77,77,77);
                color : white;
            }
            .back-page input {
                background-color: white;
                border : 0;
                text-decoration: underline;
                font-size : 14px;
                margin-top : 2%;
                cursor: pointer;
            }
            .ex-text textarea{
                width : 95%;
                height : 30vh;
                resize: none;
                outline: none;
                border : 1px solid #CDCDCD;
                font-size : 15px;
                padding-top : 1%;
                padding-left : 1%;
            }
            #image-area a {
                color :rgb(58, 58, 58);
                text-decoration: none;
            }
            .header {
                padding-top : 2%;
                padding-left : 3%;
                padding-bottom : 3%;
                font-size : 20px;
                font-weight: bold;
            }
            .header span {
                border-bottom : 2px solid #9A9A9A;
                color :#606060;
                padding-bottom : 1%;
                
            }
            </style>
            <script>



            function closePopup() {
                
                window.close();
                
            }

            function update(f) { //라디오 버튼 체크 여부 확인
            	
            	var as = f.do_answer;
            	if(as.value === ''){
            		alert("답변을 입력해주세요!");
            		return false;
            	}
            	
            	f.submit();

                
            }


            
            function opner(url) {
				window.opener.location.href = url;
			}

            </script>
            </head>
            <body>
            	<c:if test="${admin!=null}">
                <div class="header">
                    <span>관리자 1:1문의 상세페이지</span>
                </div>
                </c:if>
                	<c:if test="${admin==null}">
                <div class="header">
                    <span>1:1문의 상세페이지</span>
                </div>
                </c:if>
                <div class="main" align="center">
                    <form action="${cpath}/admin/cs/answer" method="post"   target="_parents"  onsubmit="return update(this);">
                        <input type ="hidden" value="${iqvo.m_seq}" name="m_seq">
                        <input type ="hidden" value="${iqvo.inquiry_seq}" name="inquiry_seq">
                        <div class="table">
                            <div class="tb-1">
                                <div class="t1-title">회원닉네임</div>
                                <div class="t1-text"><a href ="javascript:void(0);" onclick="opner('${cpath}/admin/member/content?m_seq=${iqvo.m_seq}')" style="color: black; ">${iqvo.m_nickname }</a></div>
                            </div>
                            <div class="tb-1">
                                <div class="t1-title">유형</div>
                                <div class="t1-text">${iqvo.cs_cate_name} </div>
                            </div>
                            <div class="tb-1">
                                <div class="t1-title">문의유형</div>
                                <div class="t1-text">${iqvo.cs_subcate_name} </div>
                            </div>
                           
                            <c:if test="${iqvo.purchase_no!=0 && kind!=0 && admin !=null}">
                           <!--투어티켓  -->
                            <div class="tb-1">
                                <div class="t1-title">예약번호</div>
                                <div class="t1-text"><a href ="javascript:void(0);" onclick="opner('${cpath}/admin/purchase/ticketOne?purchase=${iqvo.purchase_no}')" style="color: black; ">${tpvo.serial_no}</a></div>
                            </div>
                            </c:if>
                            <c:if test="${iqvo.purchase_no!=0 && kind==0 && admin !=null}">
                           <!--숙소  -->
                            <div class="tb-1">
                                <div class="t1-title">예약번호</div>
                                <div class="t1-text"><a href ="javascript:void(0);" onclick="opner('${cpath}/admin/purchase/accomOne?purchase=${iqvo.purchase_no}')" style="color: black; ">${pmvo.R_NUMBER}</a></div>
                            </div>
                            </c:if>
                         
                     
                            <div class="tb-1">
                                <div class="t1-title">상태</div>
                                <div class="t1-text">${iqvo.answer == 1?'답변완료':'미응답'} </div>
                            </div>
                            <div class="tb-1">
                                <div class="t1-title">제목</div>
                                <div class="t1-text">${iqvo.title } </div>
                            </div>	
                            <div class="tb-2">
                                <div class="t2-text">
                                    <textarea name="content" readonly >${iqvo.content}</textarea>
                                </div>
                            </div>
                            <div class="tb-1" style="height : auto !important;">
                                <div class="t1-title">첨부파일</div>
                                <div class="t1-text">
                                    <c:choose>
                                    <c:when test="${photos==null }">
                                    첨부파일이 없습니다.
                                    </c:when>
                                    <c:otherwise>
                                    <div id="image-area">
                                    <c:forEach var="file" items="${photos }" >  
                                    
                                    <a href="${cpath}/admin/download?file=${file}&folder=${folder}&path=${iqvo.inquiry_img}" download>${file}</a><br>
                                    
                                    <%--  <img src="${cpath}/common/getImg?path=${revoOne.revision_img}&file=${file}" style="width: 100px;"> --%>
                                    </c:forEach>
                                    </div>
                                    </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </table>
                        
                        

                        <div class="table-foot">
                            <div class="ex-text">
                                <c:if test="${iqvo.answer==0 && admin!=null}">
                                <textarea rows="10" cols="55" id="do_answer" name="do_answer"></textarea>
                                <input type="submit" value="답변등록" id="submitBtn">
                                </c:if>
                            </div>
                            <div class="ex-text">
                                 <c:if test="${iqvo.answer==1 && admin!=null}">
                                <textarea rows="15" cols="55" id="do_answer" name="do_answer">${iqvo.do_answer}</textarea>
                                <input type="submit" value="답변수정하기"  id="answerUpdate">
                                </c:if>
                            </div>
                             <div class="ex-text">
                                <c:if test="${admin == null}">
                                <textarea rows="15" cols="55" id="do_answer" name="do_answer" readonly="readonly">${iqvo.do_answer}</textarea>
                               
                                </c:if>
                            </div>
                        </div>
                        <div class="back-page">
                            <input type="button" value="목록으로" onclick="closePopup();">
                        </div>
                    </form>
                </div>
            </body>
        </html>
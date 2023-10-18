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
            body {
                                background-color: #F2F2F2;
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
            .check-submit input {
                cursor: pointer;
                background-color: white;
                border-radius: 5px;
                box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
                border: 2px solid rgb(77,77,77);
                font-weight: bold;
                font-size: 14px;
                margin-top : 1%;
                margin-bottom : 1%;
            }
            .check-submit input:hover {
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
            .textarea-section {
            	height : 20px;
            	box-sizing : border-box;
            	width : 70%;
   				outline : none;
   				resize : none;
   				border : 0;
   				font-size : 14px;
            }
            </style>
            <script>
            function check(f) {
            	var status = document.getElementById("reportstatus").value;
            	var memo =  document.getElementById("adminMemo").value;
            	
            	if(status===''){
            		alert('리뷰 상태를 선택하세요!');
            		return false;
            		
            		
            	}
            	
            	f.submit();
            	window.close();
            	
            }

            function ChangeStatus(){
            	var statusApp = document.getElementById("stautsApp");
                var stautsNon = document.getElementById("stautsNon");
            	var submitBtn = document.getElementById("submitBtn");
            	
            	statusApp.disabled = false;
                stautsNon.disabled = false;
            	submitBtn.disabled =false;
            }
            
            function opner(url) {
            	window.opener.location.href=url;
				
			}

            </script>
            

        </head>
        <body>
            <div class="main" align="center">

                <form action="${cpath}/admin/report/reUpdate" method="post" onsubmit="return check(this);" target="_parents"  onsubmit="return check(this);">
             
                <input type="hidden" value="${rep.REPORT_SEQ }" name="report_seq">
				<input type="hidden" value="${rep.BOARD_NO }" name="board_no">
				<input type="hidden" value="${report_cate_seq }" name="report_cate_seq">
				<input type="hidden" value="${kind }" name="kind">

                    <div class="table">
                        <div class="tb-1">
                            <div class="t1-title">리뷰 작성자:</div>
                            <div class="t1-text"><a href="javascript:void(0);" onclick="opner('${cpath}/admin/member/content?m_seq=${rep.M_SEQ}')"  style="color: black;">${rep.M_NICKNAME }</a></div>
                        </div>
                        <div class="tb-1">
                            <div class="t1-title">신고사유</div>
                            <div class="t1-text">${rep.REPORT_CATE_NAME} </div>
                        </div>
                           <div class="tb-1">
                            <div class="t1-title">신고점수</div><!--매핑 경로 이동 물어보기(히지/현지)  -->
                            <div class="t1-text">${rep.SCORE} </div>
                        </div>
                        <div class="tb-1">
                            <div class="t1-title">이메일</div>
                            <div class="t1-text">${rep.M_EMAIL} </div>
                        </div>
                        <c:if test="${kind==1}">
                         <div class="tb-1">
                            <div class="t1-title"><a href="javascript:void(0);"   onclick="opner('${cpath }/member/review/selectRV?rv_seq=${rep.RV_SEQ}')" style="text-decoration: none; color: gray;">리뷰/리뷰댓글</a></div>
                            <div class="t1-text">${content}</div>
                        </div>
                        </c:if> 
                       <c:if test="${kind!=1}">
                        <div class="tb-1">
                            <div class="t1-title"><a href="javascript:void(0);"   onclick="opner('${cpath }/member/review/selectRV?rv_seq=${rep.RV_SEQ}')" style="text-decoration: none; color: rgba(58, 58, 58, 0.4);">리뷰/리뷰댓글</a></div>
                             <div class=t1-text><textarea name="travel_comments" readonly class="textarea-section">${content}</textarea></div>
                            
<%--                             <div class="t1-text"><a href="javascript:void(0);"   onclick="opner('${cpath }/member/review/selectRV?rv_seq=${rep.RV_SEQ}')" style="text-decoration: none; color: black">${content}</a> </div>
 --%>                        </div>
                  	</c:if>
                        
                        <div class="tb-1">
                            <div class="t1-title">상태</div>
                            <div class="t1-text">${rep.RESULT == '0' ? '미승인' : (rep.RESULT == '1'?'승인':'부적격')} </div>
                        </div>
                        
                         	<div class="tb-2">
                            <div class="t2-text">
                                <textarea name="content" readonly >${rcontent}</textarea>
                            </div>
                        </div>

                    </div>
            
                    <div class="table-foot">
                        <c:if test="${rep.RESULT==0 }">
                        <div class="check-point">
                            <input type="radio" id="stautsApp"  name="result" value="1" onchange="showMemo();"  >승인
                            <input type="radio" id="stautsNon" name="result" value="2" onchange="showMemo();"  >부적격
                        </div>
                        <input type="hidden" name="result" id="result" >
                        <div class="check-submit">
                            <input type="submit" value="완료" >
                        </div>
                        </c:if>
                            <c:if test="${rep.RESULT==1 || rep.RESULT==2 }">
                        <div class="check-point">
                            <input type="radio" id="stautsApp"  name="result" value="1"  disabled="disabled" >승인
                            <input type="radio" id="stautsNon" name="result" value="2"  disabled="disabled" >부적격
                        </div>
                        <input type="hidden" name="result" id="result" > 
                        <div class="check-submit">
                            <input type="submit" value="완료" disabled="disabled"  id="submitBtn">
                            <input type="button" value="상태변경하기" onclick="ChangeStatus();">
                        </div>
                        </c:if>
                        <div class="back-page">
                            <input type="button" value="목록으로" onclick="closePopup();">
                        </div>
                          <div class="ex-text">
                            <textarea  id="memo" name="memo"  placeholder="승인/부적격 사유를 입력해주세요">${rep.MEMO}</textarea>
                          </div>
                  
                        </div>	
                        </form>
                    </div>
              
        </body>
    </html>
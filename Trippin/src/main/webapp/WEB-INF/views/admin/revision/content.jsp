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
            </style>
            <script>
            function openPopup(url){
                window.open(url,'popupWindow','width=800, height=600, scrollbars=yes')
            } 

            function showMemo() {
                const nonCheck = document.getElementById("stautsNon");
                const appCheck = document.getElementById("stautsApp");
                

                
                const memo = document.querySelector('textarea[name="memo"]');
                
                //var isChecked=false;
                
                if (nonCheck.checked) {
                    memo.style.display = "block";
                    appCheck.cheked=false;
                    
                } else {
                    memo.style.display = "none";
                }
            }

            function closePopup() {
                
                window.close();
                
            }

            function update(f) { //라디오 버튼 체크 여부 확인
                
                var statusApp = document.getElementById("stautsApp");
                var stautsNon = document.getElementById("stautsNon");
                const memo = document.querySelector('textarea[name="memo"]');
                var status = document.getElementById("status");
                
                
                if(!(statusApp.checked || stautsNon.checked)){
                    alert("승인/미승인을 선택해 주세요!");
                    return false;
                }else if(stautsNon.checked){
                    if(memo.value ===''){
                        alert("부적격 체크 시 메모를 작성해 주세요!");
                        return false;
                    }
                    status.value= parseInt("2");
                    
                }else {
                    status.value= parseInt("1");
                }
                
                //리스트페이지에서 controller로 이동
                //window.opener.location.href = '${cpath }/admin/revision/update';
                
                //window.close();
                return true;
                
            }

            function ChangeStatus(){
                var statusApp = document.getElementById("stautsApp");
                var stautsNon = document.getElementById("stautsNon");
                const memo = document.querySelector('textarea[name="memo"]');
                var status = document.getElementById("status");
                var submitBtn = document.getElementById("submitBtn");
                
                statusApp.disabled = false;
                stautsNon.disabled = false;
                submitBtn.disabled=false;
                

                
                
            }
            
            function closePopupu(url){
            
            	window.opener.location.href=url;
            	//window.close();
            }
            

            </script>




        </head>
        <body>
            <div class="main" align="center">

                <form action="${cpath}/admin/revision/update" method="post" id="update"  target="_parents"  onsubmit="return update(this);">
                <input type ="hidden" value="${revoOne.m_seq}" name="m_seq">
                <input type ="hidden" value="${revoOne.revision_seq}" name="revision_seq">
                    <div class="table">
                        <div class="tb-1">
                            <div class="t1-title">회원닉네임</div>
                            <div class="t1-text"><a href= "javascript:void(0);" onclick="closePopupu('${cpath}/admin/member/content?m_seq=${revoOne.m_seq}') " style="color: black; text-decoration:underline;">${revoOne.m_nickname }</a></div>
                            
                        </div>
                        <div class="tb-1">
                            <div class="t1-title">유형</div>
                            <div class="t1-text">${revoOne.cate_seq=='1'?'관광지':'맛집'} </div>
                        </div>
                           <div class="tb-1">
                            <div class="t1-title">게시글</div>
                            <c:if test="${revoOne.cate_seq ==1 }">
                               <div class="t1-text"><a href="javascript:void(0);" onclick="closePopupu('${cpath }/member/ticket/selectTicket?f_seq=${revoOne.f_seq }')" style="color: black; text-decoration:underline;">${revoOne.intro}</a> </div>
                            </c:if>
                            <c:if test="${revoOne.cate_seq ==2 }">
                               <div class="t1-text"><a href= "javascript:void(0);" onclick="closePopupu('${cpath }/member/hotple/selectHotple?f_seq=${revoOne.f_seq }')" style="color: black; text-decoration:underline;">${revoOne.intro}</a> </div>
                        	</c:if>
                        </div>
                        <div class="tb-1">
                            <div class="t1-title">수정 유형</div>
                            <div class="t1-text">${revoOne.revision_cate_name} </div>
                        </div>
                        
                        <div class="tb-1">
                            <div class="t1-title">상태</div>
                            <div class="t1-text">${revoOne.status == 0 ? '미승인' : (revoOne.status == 1?'승인':'부적격')} </div>
                        </div>

                        <div class="tb-2">
                            <div class="t2-text">
                                <textarea name="content" readonly >${revoOne.content}</textarea>
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
                                
                                    <a href="${cpath}/admin/download?file=${file}&path=${revoOne.revision_img}" download>${file}</a><br>
                                
                                <%--  <img src="${cpath}/common/getImg?path=${revoOne.revision_img}&file=${file}" style="width: 100px;"> --%>
                                </c:forEach>
                                </div>
                                </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    
                    
                
                    <div class="table-foot">
                        <c:if test="${revoOne.status==0 }">
                        <div class="check-point">
                            <input type="radio" id="stautsApp"  name="stautss" value="1" onchange="showMemo();"  >승인
                            <input type="radio" id="stautsNon" name="stautss" value="2" onchange="showMemo();"  >부적격
                        </div>
                        <input type="hidden" name="status" id="status" >
                        <div class="check-submit">
                            <input type="submit" value="완료" id="submitBtn">
                        </div>
                        </c:if>
                            <c:if test="${revoOne.status==1 || revoOne.status==2 }">
                        <div class="check-point">
                            <input type="radio" id="stautsApp"  name="stautss" value="1" onchange="showMemo();" disabled="disabled" >승인
                            <input type="radio" id="stautsNon" name="stautss" value="2" onchange="showMemo();" disabled="disabled" >부적격
                        </div>
                        <input type="hidden" name="status" id="status" > 
                        <div class="check-submit">
                            <input type="submit" value="완료" disabled="disabled"  id="submitBtn">
                            <input type="button" value="상태변경하기" onclick="ChangeStatus();">
                        </div>
                        </c:if>
                        <div class="back-page">
                            <input type="button" value="목록으로" onclick="closePopup();">
                        </div>
                          <div class="ex-text">
                        <c:if test="${revoOne.status==0 || revoOne.status==1 }">
                      
                            <textarea  id="memo" name="memo" style="display: none;">${revoOne.memo}</textarea>
                            </c:if>
                            
                            <c:if test="${revoOne.status==2 }">
                            <textarea  id="memo" name="memo" style="display: block;">${revoOne.memo}</textarea>
                          
                            </c:if>
                           </div>
                  
                        </div>	
                        </form>
                    </div>
              
        </body>
    </html>
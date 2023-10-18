<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
    <title>User Profile</title>
    
     <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
            <title>나를 아는 여행 앱, 트리플</title>
    <style>
        table {
            border-collapse: collapse;
            width: 60%;
            margin: auto;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        
          .inner {
                    height : 80px;
                    box-shadow: 0 4px 4px -4px gray;
                    display: flex;
                    justify-content: space-between;
                    
                }
                .left {
                    display : flex;
                    
                }
                
                .left a  {
                    line-height: 100px;
                    margin-left : 7%;
                    color : black;
                    text-decoration: none;
                    font-family: 'Jua', sans-serif;
                    font-size : 28px;
                    font-weight: bold;
                }
                .mid a{
                    left : 410px;
                    position : relative;
                    line-height : 110px;
                    text-decoration: none;
                    color : #797979;
                    font-size : 30px;
                    font-family: 'Jua', sans-serif;
                }
                .right {
                    margin-right: 5%;
                    font-size: 30px;
                    line-height : 110px;
                    
                    color : #797979;
                    font-family: 'Jua', sans-serif;
                }
                .right a{
                	text-decoration:none;
                	color: #797979;
                }
                .menu {
                    width: 300px;
                    overflow: hidden;
                    font-family: 'Jua', sans-serif;
                    box-shadow: 0 4px 4px -4px gray;
                    border-top-right-radius: 15px;
                    border-bottom-right-radius: 15px;
                    font-size : 23px;
                }

                .menu > li {
                    width: 100%;
                    
                    text-align: center;
                    line-height: 40px;
                    background-color: #50E3C2;
                }

                .menu a {
                    color: #fff;
                    font-size: 20px;
                    text-decoration: none;
                }

                .submenu > li {
                    line-height: 50px;
                    background-color: #04CFD4;
                }
                
                .submenu > li > a{
               		color: #000;
               		font-size: 17px;
                    line-height: 50px;
                    background-color: #04CFD4;
                }

                .submenu {
                    height: 0; 
                    overflow: hidden;
                    font-size : 14px;
                    
                }
                
                .submenu li:hover {
                    border : 2px solid white;
                    border-radius : 15px;
                    
                    
                }
                .lastli:hover {
                    margin-top : -1% !important;
                }
                .menu > li:hover {
                    background-color: #04CFD4;
                    transition-duration: 0.5s;
                    
                }

                .menu > li:hover .submenu {
                    height: 250px; 
                    transition-duration: 1s;
                    
                }
                .main {
                    height : 1000px;
                    width : 100%;
                    
                }
                .menusec {
                    display: flex;
                    width : 100%;
                }
                .menu-info {
                    display : flex;
                    position : relative;
                    width : 100%;
                    height : 560px;
                    
                }
                .user-info {
                    width : 300px;
                    height : 60px;
                    line-height: 60px;
                    text-align: center;
                    display: flex;
                    color : white;
                    background-color: #50E3C2;  
                    border-bottom : 1px solid white;
                    
                }
                
                .user-img {
                    margin-left: 20%;
                    margin-top : 3%;
                    
                }
                .user-img img {
                    height : 45px;
                }
                .user-name {
                    margin-left : 5%;
                    margin-top : 1%;
                    
                }
                .mimg-one  {
                    height : 560px;
                    width : 100%;
                    background-color: rgb(54, 102, 255);
                    z-index : 1;
                    flex: 1 0 auto;
                }
                .mimg-two {
                    height : 300px;
                    position : relative;
                    z-index : 2;
                    right: 750px;
                    top : 50px;
                    
                }
                .mi-text {
                    
                    position : absolute;
                    display : flex;
                    top : 420px;
                    right : 500px;
                    z-index : 3;
                    color : white;
                    
                    font-family: 'Jua', sans-serif;
                }
                .mi-text p {
                    color : red;
                    text-decoration: underline;
                    margin-top : 0.5%;
                }
                .miimg-thr {
                    height : 40px;
                    position : absolute;
                    top : 400px; 
                    right : 450px;
                    
                    z-index: 3;
                    filter: invert(20%) sepia(96%) saturate(7479%) hue-rotate(3deg) brightness(109%) contrast(118%);
                }
                .miimg-thr:hover {
                    animation: vibration .1s infinite;
                }
                @keyframes vibration {
                    from {
                        transform: rotate(4deg);
                    }
                    to {
                        transform: rotate(-4deg);
                    }
                }
                
                ol,ul{list-style:none}
               li { list-style-type:none; }
               
              .menu {
                    width: 300px;
                    overflow: hidden;
                    font-family: 'Jua', sans-serif;
                    box-shadow: 0 4px 4px -4px gray;
                    border-top-right-radius: 15px;
                    border-bottom-right-radius: 15px;
                    font-size : 23px;
                }

                .menu > li {
                    width: 100%;
                    
                    text-align: center;
                    line-height: 40px;
                    background-color: #50E3C2;
                }

                .menu a {
                    color: #fff;
                    font-size: 20px;
                    text-decoration: none;
                }

                .submenu > li {
                    line-height: 50px;
                    background-color: #04CFD4;
                }
                
                .submenu > li > a{
               		color: #000;
               		font-size: 17px;
                    line-height: 50px;
                    background-color: #04CFD4;
                }

                .submenu {
                    height: 0; 
                    overflow: hidden;
                    font-size : 14px;
                    
                }
                
                .submenu li:hover {
                    border : 2px solid white;
                    border-radius : 15px;
                    
                    
                }                
    </style>
</head>
<body>

  <header class="header">
                <div class="inner">
                    <div class="left">
                        <a href="${cpath }/admin/main">
                            Trippin'&nbsp;Administrator
                        </a>
                    </div>
                    <div class="mid">
                        <a href="${cpath }">메인 페이지</a>
                    </div>
                    <div class="right">
                       | <a href="${cpath }/admin/main">관리자 페이지</a>
                    </div>
                </div>
            </header>
            
        <%--     <div class="main">
                <div class="menusec">
                    <div class="menu-bar">
                        <ul class="menu">
                            <div class="user-info">
                                <div class="user-img">
                                    <img src="https://triple.guide/icons/favicon-152x152.png">
                                </div>
                                <div class="user-name">
                                    트리핀 관리자
                                </div> 
                            </div>
                            <li style="padding-bottom : 10%; padding-top : 10%;">
                              <a href="#">업체 등록</a>
                              <ul class="submenu">
                                <li><a href="${pageContext.request.contextPath }/admin/tour/insertForm">관광지 등록</a></li>
                                <li>
	                                <img src="${cpath }/resources/admin/수저2.png" width="10%" height="10%" style="background-color: transparent; ">
	                                <a href="${pageContext.request.contextPath }/admin/hotple/insertForm">맛집 등록</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath }/admin/accom/insertForm">숙소 등록</a></li>
                                <li><a href="${cpath }/admin/revision/list">정보수정제안</a></li>
                                <li class="lastli"><a href="${cpath }/admin/newplace/applicationList">새로운장소등록</a></li>
                              </ul>
                            </li>
                            <li style="padding-bottom : 10%; padding-top : 10%;">
                              <a href="#">회원 관리</a>
                              <ul class="submenu">
                                <li><a href="${cpath }/admin/member/list">회원 목록</a></li>
                                <li><a href="${cpath }/admin/report/mlist">회원 신고 접수 내역</a></li>
                                <li><a href="${cpath }/admin/report/mrlist">리뷰 신고 접수 내역</a></li>
                                <li><a href="${cpath }/admin/sreport/srlist">여행기 신고 접수 내역</a></li>
                                <li><a href="#">회원 예매/예약 관리</a></li>
                                <li class="lastli"><a href="#">상세메뉴야</a></li>
                              </ul>
                            </li>
                            <li style="padding-bottom : 10%; padding-top : 10%;">
                              <a href="#">이용자 요구사항</a>
                              <ul class="submenu">
                                <li><a href="#">상세메뉴야</a></li>
                                <li><a href="#">상세메뉴야</a></li>
                                <li><a href="#">상세메뉴야</a></li>
                                <li><a href="#">상세메뉴야</a></li>
                                <li class="lastli"><a href="#">상세메뉴야</a></li>
                              </ul>
                            </li>
                            <li style="padding-bottom : 10%; padding-top : 10%;">
                              <a href="#">나는메뉴야</a>
                              <ul class="submenu">
                                <li><a href="#">상세메뉴야</a></li>
                                <li><a href="#">상세메뉴야</a></li>
                                <li><a href="#">상세메뉴야</a></li>
                                <li><a href="#">상세메뉴야</a></li>
                                <li class="lastli"><a href="#">상세메뉴야</a></li>
                              </ul>
                            </li>
                            <li style="padding-bottom : 10%; padding-top : 10%;">
                              <a href="#">고객센터</a>
                              <ul class="submenu">
                                <li><a href="${cpath }/admin/cs/all">자주묻는 질문 관리</a></li>
                                <li><a href="${cpath }/admin/cs/inquiry">1:1문의 관리</a></li>
                                <li><a href="#">상세메뉴야</a></li>
                                <li><a href="#">상세메뉴야</a></li>
                                <li class="lastli"><a href="#">상세메뉴야</a></li>
                              </ul>
                            </li>
                          </ul>
                    </div>
                    </div>
                    </div> --%>

    <h1>User Profile</h1>

    <h2>회원 정보</h2>
    <table>
        <tr>
            <th>항목</th>
            <th>내용</th>
        </tr>
        <tr>
            <td>이름</td>
            <td>${member.M_NAME}</td>
        </tr>
        <tr>
            <td>닉네임</td>
            <td>${member.M_NICKNAME}</td>
        </tr>
        <tr>
            <td>이메일</td>
            <td>${member.M_EMAIL}</td>
        </tr>
        <tr>
            <td>가입일</td>
            <td>${member.M_JOINDATE}</td>
        </tr>
        <tr>
            <td>레벨</td>
            <td>${member.M_LEVEL}</td>
        </tr>
        <tr>
            <td>활동상태</td>
            <td>${member.M_STATUS=='0'?'활동중':(member.M_STATUS=='1'?'탈퇴':'영구정지')}</td>
        </tr>
    </table>

    <h2>활동 내역</h2>
    <table>
        <tr>
            <th>항목</th>
            <th>수</th>
        </tr>

        <tr>
            <td>여행기</td>
            <td><a href="${cpath}/member/memberinfo?m_seq=${member.M_SEQ}">${member.SCOUNT}</a></td>
        </tr>
        <tr>
            <td>리뷰</td>
            <td><a href="${cpath}/member/memberinfo?m_seq=${member.M_SEQ}">${member.RCOUNT}</a></td>
        </tr>
        <tr>
            <td>댓글</td>
            <td><a href="${cpath}/admin/reviewCmtList?m_seq=${member.M_SEQ}">${member.RCVCOUNT}</a></td>
        </tr>
    </table>
    
    <h2>신고 내역</h2>
    <table>
        <tr>
            <th>항목</th>
            <th>수</th>
        </tr>

        <tr>
            <td>회원신고</td>
            
            <td><a href="${cpath}/admin/report/mlist?type=m_nickname&word=${member.M_NICKNAME}">${member.MRCNT}</a></td>
        </tr>
        <tr>
            <td>리뷰</td>
            
            <td><a href="${cpath}/admin/report/mrlist?type=m_nickname&word=${member.M_NICKNAME}">${member.RVCNT}</a></td>
        </tr>
        <tr>
            <td>댓글</td>
            <td><a href="${cpath}/admin/report/mrlist?type=m_nickname&word=${member.M_NICKNAME}">${member.RVCCNT}</a></td>
        </tr>
        <tr>
            <td>여행기</td>
            <td><a href="${cpath}/admin/sreport/srlist?type=m_nickname&word=${member.M_NICKNAME}">${member.SLCNT}</a></td>
        </tr>
        <tr>
            <td>여행기 댓글</td>
            <td><a href="${cpath}/admin/sreport/srlist?type=m_nickname&word=${member.M_NICKNAME}">${member.SLCCNT}</a></td>
        </tr>
    </table>

    <h2>쿠폰 및 포인트</h2>
    <table>
        <tr>
            <th>항목</th>
            <th>내용</th>
        </tr>
        <tr>
            <td>쿠폰</td>
            <td><a href="#">쿠폰내역(${member.CPCNT})</a></td>
        </tr>
        <tr>
            <td>포인트</td>
            <td>${member.POINT}p</td>
        </tr>
        <tr>
            <td>캐쉬</td>
            <td>$${member.CASH}</td>
        </tr>
    </table>

    <h2>결제/예매 내역</h2>
    <p><%-- <a href="#">숙소(${member.PAYMENTCNT})</a>/ --%><a href="${cpath}/admin/purchase/ticketSearch?page=1&type=m_name&word=${member.M_NAME}">관광지(${member.TICKETCNT})</a> 결제내역 보기</a></p>
    <input type="button" value="back" onclick="history.back();">
</body>
</html>
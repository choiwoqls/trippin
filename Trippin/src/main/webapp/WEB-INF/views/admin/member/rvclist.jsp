<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
  <c:set var="cpath" value="${pageContext.request.contextPath }" />
    <title>댓글 목록</title>
    <style>
        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        /* 테이블 헤더 스타일 */
        th {
            background-color: #f2f2f2;
            text-align: left;
            padding: 10px;
        }

        /* 짝수 행 스타일 */
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* 홀수 행 스타일 */
        tr:nth-child(odd) {
            background-color: #ffffff;
        }

        /* 셀 스타일 */
        td {
            padding: 10px;
        }

        /* 점수(신고) 스타일 */
        .score {
            color: red;
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
    <h1>댓글 목록</h1>
    
  
    <table>
        <thead>
            <tr>
            	<th>번호</th>
                <th>닉네임</th>
                <th>댓글 내용</th>
                <th>작성 시간</th>
                <th>댓글 점수(신고)</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="rvc" items="${map}">
            <c:if test="${rvc == null }">
            작성한 댓글이 없습니다.
            </c:if>
            <c:if test="${rvc != null }">
            <tr>
            	 <td><a href="${cpath}/member/review/selectRV?rv_seq=${rvc.RV_SEQ}" style="text-decoration: none; color: black;">${rvc.RV_CMT_SEQ }</a></td>
                <td>${rvc.M_NICKNAME }</td>
                <td>${rvc.CONTENT }</td>
                <td>${rvc.DATETIME }</td>
                <td class="score">${rvc.RV_CMT_SCORE }</td>
                <td>${rvc.REPORT_STATUS=='0'?'정상':(rvc.REPORT_STATUS=='1'?'숨김':'삭제') }</td>
            </tr>
            </c:if>
     </c:forEach>
        </tbody>
    </table>
    <div align="center">
		<c:if test="${paging.prev }">
			<a
				href="${cpath }/admin/reviewCmtList?page=${paging.begin - 1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }"
			step="1">
			<c:choose>
				<c:when test="${i == paging.page }">
					<strong>[${i }]</strong>
				</c:when>
				<c:otherwise>
					<a
						href="${cpath }/admin/reviewCmtList?page=${i}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next }">
			<a
				href="${cpath }/admin/reviewCmtList?page=${paging.end + 1}">[다음]</a>
		</c:if>
	</div>
	<div align="center">
	<input type="button" value="Back" onclick="history.back();">
	</div>
    
</body>
</html>

  
  



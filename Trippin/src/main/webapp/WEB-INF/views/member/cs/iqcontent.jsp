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




<script type="text/javascript">

var last =0;
function CateInqList(f) {

	var m_seq = document.getElementById("m_seq").value;
	var target = document.getElementById("iqList");
	
	
	if(f.id ==='moreButton'){
		last +=5;
	}else if(f.id =='hiddenButton'){
		last -=5;
		if(last <5){
			last +=5;
			alert('숨길 목록이 없습니다!');
		}
	}else {
		last +=5;
		if(document.querySelector(".list-inputz") != null){
			document.querySelector(".list-inputz").className = "list-input";			
		}
		document.getElementById(f.id).className = "list-inputz";
	}
	

	
	var param = "what="+f.id+"&m_seq="+m_seq+"&last="+last;
	var url = "${pageContext.request.contextPath}/member/cs/selectInqList";
	
	target.innerHTML='';
 	
	sendRequest(url,param,function(){
		
		if(xhr.readyState === 4 && xhr.status === 200){
			var data = xhr.responseText;
			
			if(data.length !=0){
				const result = JSON.parse(data);
				
			
				
				for(var i=0; i<result.length; i++){
					
					var iqDiv = document.createElement("div");
					iqDiv.className="abc";
					
					var iqasde = document.createElement("div");
					iqasde.className="de";
					
					var iqcateListDiv = document.createElement("div");
					iqcateListDiv.className="ccc";
			
					
					var iqTitle = document.createElement("a");
					 iqTitle.href ="javascript:void(0);";
					 iqTitle.style.color="black";
					 iqTitle.style.textDecoration="none";
					 iqTitle.style.fontWeight = "bold";
					 iqTitle.innerText=result[i]["title"];
					 iqcateListDiv.appendChild(iqTitle);
					 iqDiv.appendChild(iqcateListDiv);
					
					
					(function(inquiry_seq){
						iqTitle.addEventListener("click", function () {
							var popUrl = "${pageContext.request.contextPath}/admin/cs/content?inquiry_seq="+inquiry_seq;
							window.open(popUrl,"width=800, height=600");
						});
						
					})(result[i]["inquiry_seq"]);
					target.appendChild(iqDiv);
			
					
					var iqasStatus = document.createElement("div");
					iqasStatus.className ="ddd";
					iqasStatus.innerText = result[i]["answer"] === 0 ? "답변대기" : "답변완료";
					iqasStatus.style.fontSize="15px";
					if(result[i]["answer"]===0){
						iqasStatus.className="ddd1";
					}else {
						iqasStatus.className="ddd2";
					}
					
					iqasde.appendChild(iqasStatus);
					iqDiv.appendChild(iqasde);
					target.appendChild(iqDiv);
					
					
					
					var iqdate = document.createElement("div");
					iqdate.className ="eee";
					var originalDate = result[i]["datetime"];
					var dateOnly = originalDate? new Date(originalDate).toISOString().split('T')[0]:'';
					iqdate.innerText = dateOnly;
					iqdate.style.fontSize="15px";
					iqasde.appendChild(iqdate);
					iqDiv.appendChild(iqasde);
					target.appendChild(iqDiv);
		
					
				}
			}else {
				
				var nonmsg2 = document.createElement("div");
				nonmsg2.className="abc";
				
				var nonmsg = document.createElement("div");
				nonmsg.className="ccc";
				nonmsg.style.fontWeight ="bold";
				nonmsg.innerText = "문의하신 내역이 없습니다.";
				
				var nonmsg1 = document.createElement("div");
				nonmsg1.className="eee";
				nonmsg1.innerText ="궁금한 내용은 상단의 문의하기를 클릭하여 문의해주세요.";
				
				nonmsg2.appendChild(nonmsg);
				nonmsg2.appendChild(nonmsg1);
				target.appendChild(nonmsg2);
			}
		}
	},
		"POST");
	
}

function inquiryCate() {
	  const ctz_z = document.getElementById("ctz-z");
      ctz_z.className = "ctz-zz";
	
	
}

function closeCate() {
	const ctz_z = document.getElementById("ctz-z");
    ctz_z.className = "ctz-z";
	
}


function CateInqListOninit() {
    var allButton = document.getElementById("all");
    	//moreButton = document.getElementById("all");
    	
    if (allButton) {
       allButton.click(); // '더보기' 버튼을 자동으로 클릭
    }
}

window.onload = CateInqListOninit;


</script>
<style>

	.ctz-z {
		padding-top: 10%;
		border: 1px solid;
		margin-left: 10%;
		margin-right: 10%;
		border-radius: 5px;
		height: 70vh;
		display: none;
	}
	
	.ctz-zz {
		background-color:rgb(250, 250, 250);
		margin-bottom: 10%;
	    margin-top: 10%;
		margin-left: 10%;
		margin-right: 10%;
		border-radius: 5px;
		height: 20vh;
		position : relative;
		display: block;
	}
	.ctz-q{
	margin-bottom: 10%;
	}
	.hd-in {
		display:flex;
	    height: 9vh;
	    padding-left: 2%;
	    padding-top: 0.5%;
	    
	}
	
	.hd-in img {
		height: 25px;
		width: 25px;
		margin-top: 2%;
	}
	.eee1 {
		
		    font-weight: bold;
		    color: rgb(58, 58, 58, 0.4);
		    text-align: center;
		    width: 100%;
		    margin-top: 2%;
	}

	.inner {
		display : flex;
	}
	.hd-left img {
		width : 40px;
		position : relative;
		top : 2.2vh;
		left : 2vw;
	}
	.header {
		margin-left : 20%;
		margin-right : 20%;
		height : 10vh;
	}
	.main {
		margin-left : 20%;
		margin-right : 20%;
		
	}
	.hd-left {
		width : 10%;
	}
	.hd-right {
		font-size: 24px;
	    font-weight: bold;
	    line-height: 10vh;
	    right: 20%;
   		position: absolute;
   		color: #2987F0;
   		
 		
	}
	.hd-right a{
		color: #2987F0;
		text-decoration: none;
	}
	.hd-mid {
		font-size : 24px;
		font-weight : bold;
		line-height : 10vh;
		height : 10vh;
	}
	.cate-list {
		display : flex;
		
	}
	.list-input {
		flex-grow : 1;
		background-color : white;
		font-size : 18px;
		font-weight : bold;
		color : rgb(58, 58, 58, 0.4);
		padding-top : 1%;
		padding-bottom : 1%;
		border : 0;
		border-bottom : 3px solid silver;
	}
	.list-inputz {
		flex-grow : 1;
		background-color : white;
		font-size : 18px;
		font-weight : bold;
		padding-top : 1%;
		padding-bottom : 1%;
		border : 0;
		border-bottom : 3px solid #2987F0; 
		color : black;
	}
	.abc {
		padding-top : 2%;
		padding-bottom : 2%;
		margin-left : 2%;
		margin-right : 2%;
		border-bottom : 2px solid rgb(249, 249, 249);
	}
	.ccc {
		padding-bottom : 2%;
	}
	.de {
		display : flex;
		justify-content : space-between;
	}
	.eee {
		font-weight : bold;
		color : rgb(58, 58, 58, 0.4);
	}
	.ddd1 {
		    font-size: 15px;
		    background-color: rgb(250, 250, 250);
		    padding: 1%;
		    font-weight: bold;
		    border-radius: 4px;
		    color: rgb(58, 58, 58, 0.4);
	}
	.ddd2 {
			font-size: 15px;
		    background-color: #2987F0; 
		    padding: 1%;
		    font-weight: bold;
		    border-radius: 4px;
		    color: white;
	}
	.main-mid {
            margin-left : 26%;
            margin-right : 26%;
            margin-top : 3%;
            width : 50%;
            display: none;
   }
   .mm-one {
           display: flex;
           justify-content: space-around;
    }
   .rask a, .task a, .sask a {
       text-decoration: none;
       font-weight: bold;
       text-align: center;
       border-radius: 5px;
       background-color: #3A3A3A;
       color : white;
       width :30%;
       padding-top : 1.5%;
       padding-bottom : 1.5%;
       font-size : 13px;
    }
    .rask, .task, .sask{
	    background-color: rgb(58, 58, 58, 0.4);
	    color: white;
	    border-radius: 5px;
	    padding: 1.5%;
    }
    .rask:hover, .task:hover, .sask:hover{
    	background-color: rgb(58, 58, 58, 0.6);
    }
</style>
</head>
<body>
	<header class="header">
		<div class="inner">
			<div class="hd-left">
				<img onclick="history.back();"  src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU">
			</div>
			<div class="hd-mid">
				<span>내 문의 내역</span>
			</div>
			<div class="hd-right" onclick="inquiryCate();" >
				<a href="#ctz-z">문의하기</a>
			</div>
		</div>
	</header>
		<div class="main">
			<input type ="hidden" name="m_seq" id="m_seq" value="${login}">
			
			
		    <div class="cate-section">
		    	<div class="cate-list">
				     <input class="list-input" type="button" value="전체"  id="all"  onclick="CateInqList(this)">
				   	 <input class="list-input" type="button" value="숙소"  id="accom"  onclick="CateInqList(this)">
				     <input class="list-input" type="button" value="투어/티켓" id="ticket" onclick="CateInqList(this)">
				     <input class="list-input" type="button" value="서비스 일반" id="service"  onclick="CateInqList(this)">
				</div>
				<div id="iqList" class="inquiryContent">
				<!-- 카테고리별 문의 리스트  -->
			
			
				</div>
	    	</div>
	    	<div class="ctz-z" id="ctz-z">
	    		<div class="ctz-q">
		    		<div class="hd-in">
		    		
		    	 		<img src="https://cdn-icons-png.flaticon.com/512/109/109602.png"  onclick="closeCate();">
		    	 		<div class="eee1">
		    	 			<문의유형 선택>
		    	 		</div>
			    	</div>	
			    	 <div class="mm-one">
	                     <div class="rask" onclick="document.location.href='${cpath }/member/cs/accomInquiry'">
		                    <%-- <a href="${cpath }/member/cs/accomInquiry" > --%>
	                            숙소 예약 문의
							<!-- </a> -->
	                     </div>
	                     <div class="task" onclick="document.location.href='${cpath }/member/cs/ticketInquiry'">
	                     	<%-- <a href ="${cpath }/member/cs/ticketInquiry"> --%>
	                            투어・티켓 문의
	                     	<!-- </a> -->
	                     </div>
	                     <div class="sask" onclick="document.location.href='${cpath }/member/cs/serviceInquiry'">
	                     	<%-- <a href="${cpath }/member/cs/serviceInquiry"> --%>
	                            서비스 일반 문의
	                     	<!-- </a> -->
	                     </div>
	                 </div>
             	</div>
	    	</div>
	
		</div>
	
	
</body>
</html>
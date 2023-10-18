<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script src="${cpath}/resources/js/httpRequest.js"></script>

<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap"
	rel="stylesheet">
	
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style type="text/css">
*{
	margin:0;
	padding:0;	
}

.main{
	margin-top:5%;
	margin-left:2%;
	width:90%;
}

.search{
	margin-left:1%;
	margin-bottom:3%;
}

.headList{
	margin-top:3%;
}

.s-input{
	border: 2px solid #E8E8E8;
	height: 30px;
	width: 82%;
	font-size: 16px;
	color: #9B9D9B;
	font-weight: bold;
	text-align: center;
}

.s-input:focus{
	border: 1px solid #50E3C2;
	box-shadow: #50E3C2 0px 0px 0px 1px;
}

.s-inbtn, .s-outbtn{
	background: #fff;
	border: 1px solid rgb(77, 77, 77);
	border-radius: 5px;
	cursor: pointer;
	width: 12%;
    height: 28px;
}

.s-inbtn:hover, .s-outbtn:hover {
	background: rgb(77, 77, 77);
	color: #fff;
}

.s-inbtn{
	margin-left:2%;
}

.s-outbtn{
	margin-top:2%;
	margin-left:85%;
}

.hl-one{
	display: flex;
	margin-left: 1%;
	margin-bottom:2%;
}

.hl-inner{
	margin-left:3%;
}

.hl-name{
	font-size: 20px;
	font-weight: bold;
	margin-right:2%;
}

.no-search{
	text-align: center;
	margin-top: 10%;
    margin-right: 10%;
}

</style>

</head>
<body style="overflow-x: hidden">
	<div class="main">
		<form method="post">
			<div class="search">
				<div>
					<input class="s-input" type="text" name="name" id="head" placeholder="본점 매장을 검색하세요.">
					<input class="s-inbtn" type="button" value="본점 찾기" onclick="javascript:findHead()">
				</div>
			</div>
			<hr>
			<input class="s-outbtn" type="button" value="등록하기" onclick="moreCheck(this.form)">
			<div class="headList">
				
			</div>
		</form>
	</div>

	<script>
		function findHead() {
			var name = document.getElementById('head').value;
			var headList = document.querySelector('.headList');
			
			if(name != ''){
				$.ajax({
					url:"${cpath}/admin/hotple/headList",
					type:"post",
					data : {name:name},
					success:function show(data){
						headList.innerHTML = '';

						if(data != ''){
							data.forEach(d=>{
								let div = document.createElement('div');
								div.className="hl-one";
								div.innerHTML = `
									<input type="radio" name="main_seq" value="`+d.F_SEQ+`" id="`+d.F_SEQ+`">
									<label for="`+d.F_SEQ+`">
										<div class="hl-inner">
											<div class="hl-name">`+d.NAME+`</div>
											<div style="width:150%;">` + d.ADDR +`</div>
										</div>
									</label>`;
								headList.appendChild(div);
							})
							
						}else{
							headList.innerHTML=`<div class="no-search">
													<h3>검색한 맛집이 존재하지 않습니다.</h3>
													<br>* 본점으로 지정된 매장만 조회됩니다.
												</div>`;
						}
					}
					
				})
			}else{
				alert("본점을 검색해주세요.");
			}
		}
		
		/* <div>(`+d.ADDR1_NAME + ' ' + d.ADDR2_NAME+ `)</div> */
		
		function moreCheck(f){
			var main_seq = document.querySelectorAll("input[name^='main_seq']");
			var check = 0;
			
			for(var i = 0; i<main_seq.length; i++){
				if(main_seq[i].checked){
					var main = main_seq[i].value;
					check = 1;
				}
			}
			
			if(check == 0){
				alert("본점을 검색하여 선택해주세요.");
				return;
			}
			
			f.action = "${cpath}/admin/hotple/register?main="+main+"&f_seq="+${param.f_seq};
			f.submit();
		}
	</script>
</body>
</html>
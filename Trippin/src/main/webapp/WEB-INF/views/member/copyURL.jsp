<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.url-area{
		display: flex;
	}
	#urlHere{
		font-size: 20px;
		border: solid 1px;
    	padding: 1%;
    	width: fit-content;
	}

</style>
</head>
<body>
	<div class="url-area">
		<div id="urlHere"></div>
		<input type="button" value="복사" onclick="copy();">
	</div>

<script type="text/javascript">
	var urlHere = document.getElementById("urlHere");
	var parentURL = window.opener.location.href;
	
	urlHere.innerText = parentURL;
	
	
	function copy(){
		var valueOfDiv = document.getElementById("urlHere").textContent;
		const textarea = document.createElement('textarea');
		document.body.appendChild(textarea);
		
		textarea.value = valueOfDiv;
		textarea.select();
		
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.");
		window.close();
	}
</script>

</body>
</html>
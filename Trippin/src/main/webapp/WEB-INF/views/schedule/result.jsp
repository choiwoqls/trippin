<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input type="hidden" id="url" value="${url }"></input>
   <form id="scheduleForm" action="${url}" method="post">
        <input type="hidden" name="s_seq" id="s_seq" value="${s_seq }" />
        <input type="hidden" name="addr1_seq1" id="addr1_seq1" value="${addr1_seq1 }" />
        <input type="hidden" name="day_no" id="day_no" value="${day_no }" />
        <input type="hidden" name="alone" id="alone" value="${alone }" />
    </form>
<script type="text/javascript">
	
		const form = document.getElementById("scheduleForm");
		const url = document.getElementById("url");
	 	
		const sn = document.getElementById("s_seq");
		const an = document.getElementById("addr1_seq1");
		const dn = document.getElementById("day_no");
		const aln = document.getElementById("alone");
		
		if(url.value == "/trippin/"){
			form.method = 'get';
			form.removeChild(sn);
			form.removeChild(an);
			form.removeChild(dn);
			form.removeChild(aln);
		}
        form.submit(); // 폼 자동 제출
		alert('${msg}');
        
</script> 

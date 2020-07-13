<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<style>
section {
	color: black;
	font-size: 13px;
	font-family: 'nanum gothic', sans-serif;
	margin:auto !important;
}
form{
	width: 80%!important;
}
</style>
<script>
		var result='${msg}';
		if(result.length>0)
			alert(result);
		</script>
<script>
$(function(){
	$("form").submit(function(){
		pass=$("#pwd").val();
		email="${login.u_email}";
		$.ajax({
		    data : {
		        pw : pass
		        },
		    url : "/main/getHash",
            async: false,
			type:"post",
		    success : function(data) {
		    	//console.log(data);
		    	$("#hash").val(data);
		    }
		});
		var isPwd=false;
		$.ajax({
		    data : {
		        email : email
		        },
		    url : "/main/getPwd",
            async: false,
			type:"post",
		    success : function(data) {
		    	if(data==$("#hash").val())
		    		isPwd= true;
		    	else{
		    		alert("비밀번호를 확인해주세요");
		    		isPwd= false;
		    	}
		    }
		});
		return isPwd;
	});
});
</script>
<section class="s-content s-content--narrow container al_center" >
	
	<div align="center">
	<form method="post" action="/main/userPage">
		<input type="hidden" value="${login.u_no}" name="uno">
		<label>비밀번호를 입력해주세요.</label>
		<p><input type="password" id="pwd" placeholder="PASSWORD" class="form-control" required></p>
		<input type="hidden" name="u_pwd" value="n" id="hash">
		<p><button type="submit" class="btn btn-default">확인</button>
	</form>
	</div>
</section>





<%@include file="../include/footer.jsp"%>
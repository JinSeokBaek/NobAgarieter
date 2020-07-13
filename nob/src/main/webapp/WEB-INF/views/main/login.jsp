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
	background-color: pink;
}
form{
	width: 35%!important;
}
input{
	color: black;
	background-color: pink;
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
	});
});
</script>
<c:if test="${not empty login}">
	<script>
		alert("잘못된 접근입니다.");
		location.href="/";
	</script>
</c:if>
<section class="s-content s-content--narrow container al_center" >
	
	<div align="center">
	<form method="post" action="/main/loginPost">
		<input type="text" name="u_email" id="email" placeholder="EMAIL" class="form-control" required>
		<p><input type="password" id="pwd" placeholder="PASSWORD" class="form-control" required></p>
		<input type="hidden" name="u_pwd" value="n" id="hash">
		<!-- <div class="checkbox icheck">
			<label><input type="checkbox" name="useCookie" value="useCookie"> 이메일 기억하기</label>
		</div> -->
		<p><button type="submit" class="btn btn-default">로그인</button><button class="btn btn-default" onclick="location.href='/main/signup'" type="button">회원가입</button>
		<!-- <button class="btn btn-default" onclick="location.href='/main/resetPwd'" type="button">비밀번호를 잊으셨나요?</button></p>-->
	</form>
	</div>
</section>





<%@include file="../include/footer.jsp"%>
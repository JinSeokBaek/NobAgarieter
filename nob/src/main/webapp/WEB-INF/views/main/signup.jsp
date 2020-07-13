<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<script src="/resources/nob/js/main/signup.js"></script>
<style>
section {
	color: black;
	font-size: 13px;
	font-family: 'nanum gothic', sans-serif;
	text-align: center;
}
label{
	float:left;
}
#wrap>form{
	width:80%;
}
.form-group>label{
	cursor: pointer;
}
.alert{
	color:red;
	weight:bold;
	display: none;
}
.show{
	display: block!important;
}
.error{
	border-color:red !important;
}
.correct{
	border-color:green !important;
}
</style>
<c:if test="${not empty login}">
	<script>
		alert("잘못된 접근입니다.");
		location.href="/";
	</script>
</c:if>
<section class="s-content s-content--narrow container al_center">
	<div align="center" id="wrap">
		<form method="post">
			<div class="box-body">
				<div class="form-group">
					<label for="email">이메일(아이디)</label>
					<input type="text" class="form-control"id="email" name="u_email" size="40" placeholder="EMAIL(ID)" required>
					<label class="alert">경고</label>
				</div>
				<div class="form-group">
					<label for="pwd">비밀번호(영문과 숫자를 조합하여 6자리 이상)</label>
					<input type="password" class="form-control" id="pwd" size="40" placeholder="PASSWORD" required>
					<label class="alert">경고</label>
				</div>
				<div class="form-group">
					<label for="pwd2">비밀번호 확인(비밀번호를 한번 더 입력하세요)</label>
					<input type="password" class="form-control" id="pwd2" size="40" placeholder="PASSWORD" required>
					<label class="alert">경고</label>
				</div>
				<input type="hidden" name="u_pwd" id="hash" value="0">
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" class="form-control" id="name" name="u_name" size="40" placeholder="NAME" required>
					<label class="alert">경고</label>
				</div>
				<div class="form-group">
					<label for="nickname">닉네임</label>
					<input type="text" class="form-control" id="nickname" name="u_nickname" size="40" placeholder="NICKNAME" required>
					<label class="alert">경고</label>
				</div>
			</div>
			<div class="box-body">
				<label>BMI</label><br>
				<div><p>BMI계산용으로 필요합니다. 회원님의 키와 몸무게는 저장 되지 않습니다.</p></div>
				<div><label>성별</label></div><br><br>
				<div class="form-group">
					<label class="radio-inline"><input type="radio"  class="gender" name="u_gender" value="M" >남</label>
					<label class="radio-inline"><input type="radio"  class="gender" name="u_gender" value="F" >여</label>
				</div>
					<label class="alert" id="radio_alert">경고</label><br><br>
				<div class="form-group">
					<label for="height">키</label>
					<input type="text" class="form-control" id="height" size="40" placeholder="HEIGHT" >
					<label class="alert">경고</label>
				</div>
				<div class="form-group">
					<label for="weight">몸무게</label>
					<input type="text" class="form-control" id="weight" size="40" placeholder="WEIGHT" >
					<label class="alert">경고</label>
				</div>
					<input type="hidden" id="bmi" name="u_bmi" value="0">
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-primary" style="background-color:#ED4C57;border:#ED4C57">가입하기</button>
			</div>
		</form>
	</div>
</section>
<%@include file="../include/footer.jsp"%>
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
				text-align: center;
			}
			form{
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
		<script>
		var result='${msg}';
		if(result.length>0)
			alert(result);
		</script>
		 <c:if test="${empty login}">
       	<script>
       		alert("로그인을 해주세요.");
       		location.href="/main/login";
       	</script>
       </c:if>
		<script src="/resources/nob/js/main/userPage.js"></script>
		<script>
		function getbmi(bmi){
			if(bmi<18.5)
				return "저체중";
			else if(bmi<22.9)
				return "정상";
			else if(bmi<24.9)
				return "비만 전단계";
			else if(bmi<29.9)
				return "1단계 비만";
			else if(bmi<34.9)
				return "2단계 비만";
			else
				return "3단계 비만";
		}
		$(function(){
	  		$("#delUser").click(function(){
	  			if(confirm("정말 탈퇴하시겠습니까?")){
		  			var uno=${userInfo.u_no};
		  			$.post("/main/delUser",{uno:uno},function(){
			 				alert("탈퇴가 완료되었습니다.");
			 				location.href="/";
						});
	  			}
	  		});
	  		$("#bmi_alert").html(getbmi(${userInfo.u_bmi}));
		});
		
		</script>
<section class = "s-content s-content--narrow container al_center">
       	<h1>유저 페이지</h1>
	<div align="center" id="wrap">
       	<ul class="nav nav-pills">
		  <li class="active"><a data-toggle="tab" href="#home">BMI 변경</a></li>
		  <li><a data-toggle="tab" href="#menu1">비밀번호 변경</a></li>
		  <li><a data-toggle="tab" href="#menu2">회원탈퇴</a></li>
		  <li><a data-toggle="tab" href="#menu3">닉네임 변경</a></li>
		</ul>
		
		<div class="tab-content">
		  <div id="home" class="tab-pane fade in active">
		    <h3>BMI 변경</h3>
		    <form method="post" id="bmiForm" action="/main/updateUser">
				<input type="hidden" name="u_no" value="${userInfo.u_no}">
				<input type="hidden" name="u_nickname" value="${userInfo.u_nickname}">
				<input type="hidden" name="u_email" value="${userInfo.u_email}">
				<input type="hidden" name="u_pwd" value="${userInfo.u_pwd}">
		    	<div class="box-body">
					<p>BMI계산용으로 필요합니다. 회원님의 키와 몸무게는 저장 되지 않습니다.</p>
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
						<input type="text" id="bmi2" name="u_bmi" value="${userInfo.u_bmi}" readonly="readonly" class="form-control">
						<label id="bmi_alert"></label>
				</div>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">수정하기</button>
				</div>
		    </form>
		  </div>
		  <div id="menu1" class="tab-pane fade">
		    <h3>비밀번호 변경</h3>
		    <form method="post" id="passForm" action="/main/updateUser">
				<input type="hidden" name="u_no" value="${userInfo.u_no}">
				<input type="hidden" name="u_nickname" value="${userInfo.u_nickname}">
				<input type="hidden" name="u_email" value="${userInfo.u_email}">
				 <input type="hidden" name="u_bmi" value="${userInfo.u_bmi}"> 
		    	<div class="box-body">
					<div class="form-group">
						<label for="pwd">비밀번호(영문과 숫자를 조합하여 6자리 이상)</label>
						<input type="password" class="form-control" id="pwd" size="40" placeholder="PASSWORD" >
						<label class="alert">경고</label>
					</div>
					<div class="form-group">
						<label for="pwd2">비밀번호 확인(비밀번호를 한번 더 입력하세요)</label>
						<input type="password" class="form-control" id="pwd2" size="40" placeholder="PASSWORD" >
						<label class="alert">경고</label>
					</div>
					<input type="hidden" name="u_pwd" id="hash" value="0">
				</div>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">수정하기</button>
				</div>
		    </form>
		  </div>
		  <div id="menu2" class="tab-pane fade" align="center" style="width:70%">
		    <h3>회원탈퇴</h3>
		   	 회원탈퇴를 신청하기 전에 아래 사항을 꼭 확인해주세요.
		   	 <br>
		   	 <div align="left">
			<ul>
				<li>탈퇴 신청시 즉시 탈퇴 처리됩니다.</li>
				<li>탈퇴 전 사용한 닉네임은 다시 사용할수없습니다.</li>
				<li>탈퇴 전 작성된 게시물이나 댓글 등은 탈퇴 후에도 유지됩니다.</li>
				<li>게시물 삭제 등을 원하는 경우 반드시 삭제 처리 후 탈퇴를 신청해주세요.</li>
				<li>아래 확인 버튼을 누르면 탈퇴가 진행됩니다.</li>
			</ul></div>
			<br>
			<p><b>정말 탈퇴하시겠습니까?</b></p>
			<p><button class="btn btn-default" id="delUser">예</button><button class="btn btn-default" onclick="location.reload()">아니오</button></p>
		  </div>
		  <div id="menu3" class="tab-pane fade">
		    <h3>닉네임 변경</h3>
		    <c:choose>
			    <c:when test="${updatedate <'30'}">
			    	<p>닉네임 변경은 마지막 변경 이후 30일 후에 변경이 가능합니다.</p>
			    </c:when>
		    	<c:otherwise>
		    		<form method="post" id="nickForm" action="/main/updateNick">
						<input type="hidden" name="u_no" value="${userInfo.u_no}">
						<input type="hidden" name="u_bmi" value="${userInfo.u_bmi}">
						<input type="hidden" name="u_email" value="${userInfo.u_email}">
						<input type="hidden" name="u_pwd" value="${userInfo.u_pwd}">
						<div class="box-body">
						    <div class="form-group">
									<label for="nickname">닉네임</label>
									<input type="text" class="form-control" id="nickname" name="u_nickname" size="40" placeholder="NICKNAME" >
									<label class="alert">경고</label>
							</div>
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">수정하기</button>
						</div>
					</form>
		    	</c:otherwise>
		    </c:choose>
		  </div>
</div>
</div>
    </section>

<%@include file="../include/footer.jsp"%>
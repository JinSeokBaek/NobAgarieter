<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>




<!--- basic page needs
    ================================================== -->
<meta charset="utf-8">
<title>NOB</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- mobile specific metas
    ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
    ================================================== -->
<link rel="stylesheet" href="/resources/nob/css/base.css">
<link rel="stylesheet" href="/resources/nob/css/vendor.css">
<link rel="stylesheet" href="/resources/nob/css/main.css">
<link rel="stylesheet" href="/resources/nob/css/tak.css">
<link rel="stylesheet"
	href="/resources/nob/ionicons/css/ionicons.min.css">

<!-- script
    ================================================== -->
<script src="/resources/nob/js/modernizr.js"></script>
<script src="/resources/nob/js/pace.min.js"></script>

<!-- favicons
    ================================================== -->
<link rel="shortcut icon" href="favicon.ico"
	type="/resources/nob/image/x-icon">
<link rel="icon" href="favicon.ico" type="/resources/nob/image/x-icon">


<!--  bootstrap -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  jquery -->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.1/handlebars.js"></script>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<style>
.fa, .far, .fas {
    font-family: "Font Awesome 5 Free" !important;
}
.far{
		font-weight:400 !important;
	}
</style>
</head>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
*{

font-family: ‘Noto Sans KR’ !important;
font-weight: 550 !important;
}
</style>
<script>
$(function(){
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
	var bmi=${login.u_bmi};
	
	$("#bmi").html(bmi.toFixed(2)+"("+getbmi(bmi)+")");
	$("#user a").click(function(){
		$("#user").submit();
	});
});
</script>
<body id="top">
			<div class="container" >
				<div class="col" style="float:left;">
					<div class="top_bar_content d-flex flex-row justify-content-start" style="float:left;width:100%">
						<ul class="top_bar_contact_list">
						<li>
							 <c:if test="${empty login}">
									<div style="right:0"><a href="/main/login"><strong>로그인</strong></a></div>
									<div style="right:0"><a href="/main/login"><strong>회원가입</strong></a></div>
							</c:if>
							 <c:if test="${not empty login}">
    							   <div style="right:0"><a href="/main/logout"><strong>LOGOUT</strong></a></div>
    					   </c:if>
								
						</li>
						<c:if test="${not empty login}">
							<li><div class="question" style="color:#338FD0">${login.u_nickname} 님 반가워요.</div></li>
						
							<li>
								<div style="color:#338FD0">BMI : <span id="bmi"></span></div>
							</li>
							<li><i class="fa fa-envelope-o" aria-hidden="true"></i>
								<div>
									<form method="post" action="/main/checkPwd" id="user">
							       		<input type="hidden" value="${login.u_no}" name="uno">
							       		<p style="width:90px"><a style="cursor: pointer;">유저페이지</a></p>
							       	</form>
						       	</div>
						       </li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
	<!-- pageheader
    ================================================== -->
	<div class="s-pageheader s-pageheader--home" style="height:auto">

		<header class="header" style="height:auto">
			<div class="header__content">

				<div class="header__logo">
					<a class="logo" href="/"> <img
						src="/resources/nob/images/logo.png" alt="Homepage">
					</a>
				</div>
				<!-- end header__logo -->

			<!-- 	<ul class="header__social">
					<li><a href="#0"><i class="fa fa-facebook"
							aria-hidden="true"></i></a></li>
					<li><a href="#0"><i class="fa fa-twitter"
							aria-hidden="true"></i></a></li>
					<li><a href="#0"><i class="fa fa-instagram"
							aria-hidden="true"></i></a></li>
					<li><a href="#0"><i class="fa fa-pinterest"
							aria-hidden="true"></i></a></li>
				</ul> -->
				<!-- end header__social -->
				<!-- end header__search -->


				<a class="header__toggle-menu" href="#0" title="Menu"><span style="color:#888888">Menu</span></a>

				<nav class="header__nav-wrap container">

			<ul class="header__nav" style="vertical-align: middle;background-color: #ED4C57;height: 55px;top: 0;">
						<li class="">
						<a href="/board/notice">공지사항</a>
							 <!-- <ul class="sub-menu">
								<li><a href="/board/notice">공지</a></li>
								<li><a href="/board/event">이벤트</a></li>

							</ul>  --></li>
						<li class="has-children"><a href="communitymain.html"
							title="">커뮤니티</a>
							<ul class="sub-menu">
								<li><a href="/board/listAll?tbl_name=tbl_freeboard">잡담</a></li>
								<li><a href="/board/listAll?tbl_name=tbl_tipboard">팁</a></li>
								<li><a href="/board/listAll?tbl_name=tbl_stiboard">자극사진</a></li>
								<li><a href="/board/listAll?tbl_name=tbl_qaboard">Q&amp;A</a></li>
							</ul></li>
						<li><a href="/group/groupMain" title="">그룹방</a></li>
						<li class="has-children"><a href="#" title="">개인서비스</a>
							<ul class="sub-menu">
								<li><a href="/service/calorie">칼로리 사전</a></li>
								<li><a href="/service/video">홈트레이닝</a></li>
							</ul></li>

					</ul>
					<!-- end header__nav -->

				 	<a href="#0" title="Close Menu"
						class="header__overlay-close close-mobile-menu">Close</a>
				</nav>
				<div style="border:solid 0.5px #EDEDED"></div>
				<!-- end header__nav-wrap -->
			</div>
			<!-- header-content -->
		</header>
		<!-- header -->
	</div>
	<!-- end s-pageheader -->
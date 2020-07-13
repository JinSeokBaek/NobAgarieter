<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<!-- script
    ================================================== -->
<script src="/resources/nob/js/modernizr.js"></script>
<script src="/resources/nob/js/pace.min.js"></script>

<!-- favicons
    ================================================== -->
<link rel="shortcut icon" href="favicon.ico" type="/resources/nob/image/x-icon">
<link rel="icon" href="favicon.ico" type="/resources/nob/image/x-icon">


<!--  bootstrap -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--  handlebar -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.1/handlebars.js"></script>


<!-- Font Jua -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic+Coding" rel="stylesheet">
<style>
body{
font-family: 'Nanum Gothic Coding', monospace;
}
a{
font-family: 'Nanum Gothic Coding', monospace;
}
div{
font-family: 'Jua', sans-serif;
}
</style>
</head>

<body id="top">

	<!-- pageheader
    ================================================== -->
	<div class="s-pageheader">

		<header class="header">
			<div class="header__content">

				<div class="header__logo">
					<a class="logo" href="/"> <img src="/resources/nob/images/logo.png"
						alt="Homepage">
					</a>
				</div>
				<!-- end header__logo -->

				<ul class="header__social">
					<li><a href="#0"><i class="fa fa-facebook"
							aria-hidden="true"></i></a></li>
					<li><a href="#0"><i class="fa fa-twitter"
							aria-hidden="true"></i></a></li>
					<li><a href="#0"><i class="fa fa-instagram"
							aria-hidden="true"></i></a></li>
					<li><a href="#0"><i class="fa fa-pinterest"
							aria-hidden="true"></i></a></li>
				</ul>
				<!-- end header__social -->

				<a class="header__search-trigger" href="#0"></a>

				<div class="header__search">

					<form role="search" method="get" class="header__search-form"
						action="#">
						<label> <span class="hide-content">Search for:</span> <input
							type="search" class="search-field" placeholder="Type Keywords"
							value="" name="s" title="Search for:" autocomplete="off">
						</label> <input type="submit" class="search-submit" value="Search">
					</form>

					<a href="#0" title="Close Search" class="header__overlay-close">Close</a>

				</div>
				<!-- end header__search -->


				<a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>

				<nav class="header__nav-wrap">

					<h2 class="header__nav-heading h6">Site Navigation</h2>

					<ul class="header__nav">
						<li><a href="index.html" title="">Home</a></li>
						<li class="has-children"><a href="gongzimain.html" title="">공지사항</a>
							<ul class="sub-menu">
								<li><a href="g_gongzi.html">공지</a></li>
								<li><a href="g_event.html">이벤트</a></li>

							</ul></li>
						<li class="has-children"><a href="communitymain.html"
							title="">커뮤니티</a>
							<ul class="sub-menu">
								<li><a href="/board/listAll?tbl_name=tbl_freeboard">잡담</a></li>
								<li><a href="/board/listAll?tbl_name=tbl_tipboard">팁</a></li>
								<li><a href="/board/listAll?tbl_name=tbl_stiboard">자극사진</a></li>
								<li><a href="/board/listAll?tbl_name=tbl_qaboard">Q&amp;A</a></li>
							</ul></li>
						<li><a href="group.html" title="">그룹방</a></li>
						<li class="has-children"><a href="service.html" title="">개인서비스</a>
							<ul class="sub-menu">
								<li><a href="s_calorie.html">칼로리 사전</a></li>
								<li><a href="s_training.html">홈트레이닝</a></li>

							</ul></li>

					</ul>
					<!-- end header__nav -->

					<a href="#0" title="Close Menu"
						class="header__overlay-close close-mobile-menu">Close</a>

				</nav>
				<!-- end header__nav-wrap -->

			</div>
			<!-- header-content -->
		</header>
		<!-- header -->




	</div>
	<!-- end s-pageheader -->
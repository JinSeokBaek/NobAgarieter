<%@ page session="true"%>
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
<link rel="stylesheet" href="/resources/nob/css/tak2.css">
<!-- script
    ================================================== -->
<script src="/resources/nob/js/modernizr.js"></script>
<script src="/resources/nob/js/pace.min.js"></script>

<!-- favicons
    ================================================== -->
<link rel="shortcut icon" href="favicon.ico"
	type="nob/image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">


<!--  bootstrap -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Icon -->
<link rel="stylesheet"
	href="/resources/nob/ionicons/css/ionicons.min.css">
</head>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
*{

font-family: ‘Noto Sans KR’ !important;
font-weight: 550 !important;
}
</style>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<style>
.fa, .far, .fas {
    font-family: "Font Awesome 5 Free" !important;
}
.far{
		font-weight:400 !important;
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
							       		<p><a style="cursor: pointer;">유저페이지</a></p>
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

				<nav class="header__nav-wrap container" >

					<h2 class="header__nav-heading h6">Site Navigation</h2>

			<ul class="header__nav" style="vertical-align: middle;background-color: #ED4C57;height: 55px;top: 0;width: 100%;">
						<li><a href="#"></a>
						<a href="/board/notice">공지사항</a>
							<!-- <ul class="sub-menu">
								<li><a href="/board/notice">공지 사항</a></li>
								<li><a href="/board/event">이벤트</a></li>

							</ul> --></li>
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

				<!-- 	<a href="#0" title="Close Menu"
						class="header__overlay-close close-mobile-menu">Close</a> -->
				</nav>
				<div style="border:solid 0.5px #EDEDED"></div>
				<!-- end header__nav-wrap -->
			</div>
			<!-- header-content -->
		<!-- header -->
		<div class="pageheader-content al_center " style="width: 100%;">
			<div class="col-full container" style="float:none">
				<div class="featured" style="padding:0;margin:0;">
					<div class="featured__column featured__column--big">
						<div class="entry"
							style="background-image: url('/resources/nob/images/thumbs/featured/one.png');">

							<div class="entry__content">
								<div class="entry__info">
									<a href="#0" class="entry__profile-pic">
                                        <img
										class="avatar" src="/resources/nob/images/thumbs/one.png"
										alt="">
									</a>

									<ul class="entry__meta">
										<li><a href="#0">John Doe</a></li>
										<li>December 29, 2017</li>
									</ul>
								</div>
							</div>
							<!-- end entry__content -->

						</div>
						<!-- end entry -->
					</div>
					<!-- end featured__big -->

					<div class="featured__column featured__column--small">

						<div class="entry"
							style="background-image: url('/resources/nob/images/thumbs/featured/two.png');">

							<div class="entry__content">
								

								<div class="entry__info">
									<a href="#0" class="entry__profile-pic"> <img
										class="avatar" src="/resources/nob/images/avatars/user-03.jpg"
										alt="">
									</a>

									<ul class="entry__meta">
										<li><a href="#0">John Doe</a></li>
										<li>December 27, 2017</li>
									</ul>
								</div>
							</div>
							<!-- end entry__content -->

						</div>
						<!-- end entry -->

						<div class="entry"
							style="background-image: url('/resources/nob/images/thumbs/featured/three.png');">

							<div class="entry__content">
							<!--	<span class="entry__category"><a href="#0">LifeStyle</a></span>-->

								<h1>
									<a href="#0" title=""></a>
								</h1>

								<div class="entry__info">
									<a href="#0" class="entry__profile-pic"> <img
										class="avatar" src="/resources/nob/images/avatars/user-03.jpg"
										alt="">
									</a>

									<ul class="entry__meta">
										<li><a href="#0">John Doe</a></li>
										<li>December 21, 2017</li>
									</ul>
								</div>
							</div>
							<!-- end entry__content -->

						</div>
						<!-- end entry -->

					</div>
					<!-- end featured__small -->
				</div>
				<!-- end featured -->
			</div>
			<!-- end col-full -->
		</div>
		<!-- end pageheader-content row -->
		</header>
	</div>
	<style>
	a{
		padding:0;
		margin:0;
		
	}
	img{
		width:100%;
		padding:0;
		margin:0;
		box-shadow: 0 2px 3px rgba(0, 0, 0, 0.15);
	}
	</style>
	<script>
		$(function(){
			$("#mypage").click(function(){
				$("#page").append($('<input type="hidden" value="${login.u_no}" name="uno">'))
				$("#page").submit();
			});
		});
	</script>
	<form action="/main/userPage" method="POST" id="page">
	</form>
	<div class= "container"style="margin-top:500px">
	<div class="iconForm">
		<a id="mypage" class="icon"> 
		<img class="avatar" src="/resources/nob/images/icons/33.jpg" alt=""></a>
		<a href="/service/calorie" class="icon "> 
		<img class="avatar" src="/resources/nob/images/icons/11.jpg" alt=""></a>
		<a href="board/listAll?tbl_name=tbl_tipboard" class="icon "> 
		<img class="avatar" src="/resources/nob/images/icons/22.jpg" alt=""></a>
		<a href="board/listAll?searchType=ca&keyword=before/after&tbl_name=tbl_stiboard" class="icon "> 
		<img class="avatar" src="/resources/nob/images/icons/44.jpg" alt=""></a>
		<a href="service/video" class="icon"> 
		<img class="avatar" src="/resources/nob/images/icons/55.jpg" alt=""></a>
    		<a href="board/listAll?tbl_name=tbl_stiboard" class="icon"> 
		<img class="avatar" src="/resources/nob/images/icons/66.jpg" alt=""></a>
		<a href="/board/listAll/?searchType=ca&keyword=후기&tbl_name=tbl_stiboard" class="icon "> 
		<img class="avatar" src="/resources/nob/images/icons/77.jpg" alt=""></a>
		<a href="board/listAll?searchType=ca&keyword=식단&tbl_name=tbl_tipboard" class="icon "> 
		<img class="avatar" src="/resources/nob/images/icons/88.jpg" alt=""></a>
    </div>
	
	<style>
        .iconForm{
            width: 100%;
             float: left; 
             margin:0;
             /* padding:20px 290px; */
        }
        .avatar{
            width: 12%;
            padding:0;
            margin:0;
        }
        .avatar:hover{
        box-shadow: 0px 5px 40px rgba(0,0,0,0.15);
        }
    </style>




	<!-- Content -->

<section class="s-content s-content--narrow container" style="height: auto;width: 100%;">
		<div style="width: 100%;" >
  <div class="col-seven"> 
			<div>
			<div>
				<h2 style="float:left"><strong>자극 사진</strong></h2>
				<h5 style="float:right;padding-top:30px"><a href="/board/listAll?tbl_name=tbl_stiboard">더보기</a></h5>
			</div>
				<hr>
				<div class="col-sm-12 col-lg-12 col-md-12"> 
			<c:forEach items="${sti_list}" var="boardVO">
				  <article class="article col-sm-4 col-lg-4 col-md-4">
										<div class="inner">
											<figure style="height:150px">
												<a href='/board/readPage?tbl_name=tbl_stiboard&b_no=${boardVO.b_no}'>
													<img src="${boardVO.thumbnailimage}" style='height: 100%; width: 100%; object-fit: cover' alt="Sample Article">
												</a>
											</figure>
											<div class="padding">
												<div class="l_title col-xs-12" style="height:auto;padding-top:0px;" align="left">
												<h4><a href='/board/readPage?tbl_name=tbl_stiboard&b_no=${boardVO.b_no}'>${boardVO.b_title}<strong
							style="color: red"> [${boardVO.b_replycnt}]</strong></a></h4>
												</div>
												<div>
												<div class="col-xs-12" align="left">
													<div class="time col-xs-12" style="padding:10px">
													</div>
												</div>
												
													
												<div style="padding:40px 0;vertical-align: middle" align="left">
												<div class="col-xs-8">
												<fmt:formatDate pattern="yyyy.MM.dd" value="${boardVO.b_regdate}" />
												</div>
							<div class="col-xs-4" style="float:left">
													<i class="far fa-heart" style="color:red;"></i><span>${boardVO.total}</span>
												</div>
											</div>
										</div>
										</div>
										</div>
									</article>		
							</c:forEach>
		</div>
			</div>

</div>
    <div class="col-five"> 
			<div>
				<h2 style="float:left"><strong>최신 글</strong></h2>
				<h5 style="float:right;padding-top:30px"></h5>
				<hr>
				<table>
					<tr>
						<th style="width: 100px">게시판</th>
						<th>글 제목</th>
						<th style="width: 100px">등록일</th>
					</tr>
					<c:forEach items="${newAll}" var="boardVO">
						<tr style="height: 40px;">
							<td>
							<c:set var ="tbl_name" value ="${boardVO.b_name}"/>
							<c:choose>     
       							<c:when test ="${tbl_name eq 2}">팁</c:when>  
        						<c:when test = "${tbl_name eq '3'}">Q&A</c:when>    
       							<c:when test = "${tbl_name eq '1'}">자극사진</c:when> 
      					   		<c:when test = "${tbl_name eq '4'}">자유게시판</c:when> 
     					    </c:choose>
     					    </td>
							<td>
							<c:choose>     
       							<c:when test ="${tbl_name eq 2}"><c:set var="tbl_name2" value="tbl_tipboard"/></c:when>  
        						<c:when test = "${tbl_name eq '3'}"><c:set var="tbl_name2" value="tbl_qaboard"/></c:when>    
       							<c:when test = "${tbl_name eq '1'}"><c:set var="tbl_name2" value="tbl_stiboard"/></c:when> 
      					   		<c:when test = "${tbl_name eq '4'}"><c:set var="tbl_name2" value="tbl_freeboard"/></c:when> 
     					    </c:choose>
							<a href="/board/readPage?b_no=${boardVO.b_no}&tbl_name=${tbl_name2}">
     					    ${boardVO.b_title} </a><span
								style="color: red;">new</span></td>
							<td><span><fmt:formatDate
										pattern="MM-dd HH:mm" value="${boardVO.b_regdate}" /></span></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div >
				<h2 style="float:left"><strong>인기 글</strong></h2>
				<h5 style="float:right;padding-top:30px"></h5>
				<hr>
				<table>
					<tr>
						<th style="width: 100px">게시판</th>
						<th>글 제목</th>
						<th style="width: 100px">추천수</th>
					</tr>
					<c:forEach items="${likeTotalAll}" var="boardVO">
							<tr style="height: 40px;">
								<td>
								<c:set var ="tbl_name" value ="${boardVO.b_name}"/>
								<c:choose>     
       							<c:when test ="${tbl_name eq 2}">팁</c:when>  
        						<c:when test = "${tbl_name eq '3'}">Q&A</c:when>    
       							<c:when test = "${tbl_name eq '1'}">자극사진</c:when> 
      					   		<c:when test = "${tbl_name eq '4'}">자유게시판</c:when>
     					  		</c:choose>
								</td>
								<td>
								<c:choose>     
       							<c:when test ="${tbl_name eq 2}"><c:set var="tbl_name2" value="tbl_tipboard"/></c:when>  
        						<c:when test = "${tbl_name eq '3'}"><c:set var="tbl_name2" value="tbl_qaboard"/></c:when>    
       							<c:when test = "${tbl_name eq '1'}"><c:set var="tbl_name2" value="tbl_stiboard"/></c:when> 
      					   		<c:when test = "${tbl_name eq '4'}"><c:set var="tbl_name2" value="tbl_freeboard"/></c:when> 
     					    </c:choose>
							<a href="/board/readPage?b_no=${boardVO.b_no}&tbl_name=${tbl_name2}">
								${boardVO.b_title} </a><span
									style="color: red;">HOT</span></td>
								<td><span class="badge bg-pink">${boardVO.total}</span></td>
							</tr>
						</c:forEach>
				</table>
			</div>
</div>
</div>
			
		
		

	</section>
	<!-- end s-extra -->
	</div>
<div><hr></div>

<%@include file="include/footer.jsp"%>
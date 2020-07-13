<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet"
	href="/resources/nob/ionicons/css/ionicons.min.css">
	 <c:if test="${empty login}">
       	<script>
       		alert("로그인을 해주세요.");
       		location.href="/main/login";
       	</script>
       </c:if>
<style>
.article p, article p, .most-popular p {
	font-family: 'Merriweather', sans-serif;
	font-weight: 400;
	color: rgba(0, 0, 0, 0.85);
}

.article .time, .article .category, article .time, article .category,
	.most-popular .time, .most-popular .category {
	font-size: 10px;
	letter-spacing: .5px;
	font-weight: 500;
	text-transform: uppercase;
}

.article {
	margin-bottom: 35px;
}

article figure {
	height: 150px;
	width: 100%;
	overflow: hidden;
	margin-bottom: 10px;
	display: inline-block;
}

article figure img {
	width: 100%;
}

article .detail {
	display: flex;
	display: -webkit-box;
	display: -moz-box;
}

.article .inner {
	box-shadow: 0 1px 2px #ddd;
}

.article .padding {
	/* padding: 15px; */
	padding-top: 0;
}

.article h2 {
	text-transform: capitalize;
	font-size: 20px;
	margin: 0;
	line-height: 28px;
	margin-bottom: 10px;
}

.article h2 a {
	color: #333;
	text-decoration: none;
}

.article h2 a:hover {
	color: #F73F52;
}

.article p {
	line-height: 24px;
	font-size: 14px;
}

article .detail {
	display: flex;
	margin-bottom: 5px;
	font-size: 12px;
}

article .time, article .category {
	/* margin: 0 10px; */
	color: #191E21;
}

article .category {
	/* margin: 0 10px; */
}

article .category a {
	color: #F73F52;
}

article .time {
	margin: 0;
}

article footer {
	text-align: right;
}

article footer .btn-primary {
	background-color: transparent;
	border-color: #F73F52;
	color: #F73F52;
	/* padding-left: 15px;
	padding-right: 15px; */
	position: relative;
	overflow: hidden;
	transition: all .5s;
	-moz-transition: all .5s;
	-o-transition: all .5s;
	-webkit-transition: all .5s;
}

article footer .btn-primary:after {
	position: absolute;
	content: ' ';
	bottom: 0;
	/* left: 20px; */
	width: 5px;
	height: 5px;
	border-radius: 50%;
	transition: all .5s;
	-moz-transition: all .5s;
	-webkit-transition: all .5s;
	-o-transition: all .5s;
	z-index: -1;
}

article footer .btn-primary:hover {
	color: #fff;
}

article footer .btn-primary:hover:after {
	transform: scale(20);
	-moz-transform: scale(20);
	-webkit-transform: scale(20);
	-o-transform: scale(20);
	background-color: #F73F52;
}

article footer .btn-primary:focus {
	outline: 0;
}

.article-list {
	margin-bottom: 50px;
	position: relative;
	height :130px;
	padding:0 10px;
}

.article-list:last-child {
	margin-bottom: 0;
}

.article-list .badge {
	position: absolute;
	top: 0;
	right: 15px;
	border-radius: 0;
	background-color: #F73F52;
}

.article-list .inner {
	display: inline-block;
	width: 100%;
}

.article-list figure {
	width: 300px;
	height: 150px;
	overflow: hidden;
	background-color: transparent;
	float: left;
	display: inline-block;
	margin-bottom: 0;
}

.article-list figure img {
	width: 100%;
}

.article-list .details {
	/* padding: 5px; */
	/*  margin-left: 315px;*/
}

.article-list .details .detail .category, .article-list .details .detail .time
	{
	margin: 0 10px;
}

.article-list .details .detail .category {
	margin: 0;
}

.article-list .details h1 {
	margin: 0;
	margin-top: 5px;
	margin-bottom: 10px;
	font-size: 20px;
	line-height: 28px;
}

.article-list .details h1 a {
	color: #000;
	text-decoration: none;
	transition: all .5s;
	-moz-transition: all .5s;
	-webkit-transition: all .5s;
	-o-transition: all .5s;
}

.article-list .details h1 a:hover {
	color: #F73F52;
}

.article-list .details p {
	line-height: 26px;
}

.article-list footer {
	margin-top: 0;
}

.inner {
	border: solid 0.5px #DDDDDD;
	background-color: #H2H2H2;
	padding:0 20px;
	height : 130px;
}
.more{
	width:95px;
	}
	.btnCover{
	padding-top:10px;
	}
</style>




  <style>
  .inner {
  box-shadow: 0 2px 3px rgba(0, 0, 0, 0.15);
  }
  .inner:hover{
  	box-shadow: 0px 5px 40px rgba(0,0,0,0.15);
  }
  .btn{
   box-shadow: 0 2px 3px rgba(0, 0, 0, 0.15);	
  }
  
  </style>
<style>
section {
	color: black;
	font-size: 13px;
	font-family: 'nanum gothic', sans-serif;
	text-align: center;
}
</style>
<script>
	var result = '${msg}';
	if (result.length > 0)
		alert(result);
</script>
<script>
	$(function() {
		$(".tab-pane").on("click", ".join", function() {
			var gid = $(this).data('id');
			var uno = ${login.u_no};
			console.log(gid + " " + uno);

			var isJoined = false;

			$.ajax({
				data : {
					gid : gid,
					uno : uno
				},
				url : "/group/isGroupMember",
				async : false,
				type : "post",
				success : function(data) {
					// console.log(data);
					if (data != "0")
						isJoined = false;
					else
						isJoined = true;
				}
			});
			if (isJoined) {
				$.post("/group/joinGroup", {
					gid : gid,
					uno : uno
				}, function(result) {
					location.href = "/group/group?gid=" + result;
				});
			} else
				alert("이미 가입한 그룹입니다.");

		});
		$(".tab-pane")
				.on("click",".manage",function() {
							var gid = $(this).data('id');
							var uno = ${login.u_no};
							console.log(gid);
							$("form").append($('<input type="hidden" value="' + gid + '" name="gid">'));
							$("form").append($('<input type="hidden" value="' + uno + '" name="uno">'));
							$("form").submit();
						});

	});
</script>

	

<div class="s-content s-content--narrow al_center container" style="height:auto;padding-top:0">
	<div class="col-sm-12 col-lg-12 col-md-12">
		<div>
			<h1 style="float:left;">그룹방</h1>
			<hr>
		</div>
	</div>
</div>


<section class="s-content s-content--narrow container" style="height:auto;padding-top:0">
<div align="right">
<a class="btn r_btn" href="/group/makeGroup" style="text-align:right">그룹 만들기</a>
</div>

<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">그룹방 전체 리스트(최신순)</a></li>
    <li><a data-toggle="tab" href="#menu1">인기 그룹방</a></li>
    <li><a data-toggle="tab" href="#menu2">카테고리별</a></li>
    <li><a data-toggle="tab" href="#menu3">내 그룹방</a></li>
  </ul>
  

  <div class="tab-content" style="padding-top:20px">
   <div id="home" class="tab-pane fade in active">
<c:forEach items="${grouplist}" var="groupVO">
	<article class="col-sm-6 col-md-6 col-lg-6 article-list">
		<div class="inner">
			<div class="details">
			<div  class="col-sm-8 col-md-8 col-lg-8">
				<div class="detail col-sm-12 col-md-12 col-lg-12" style="padding-top:10px">
					<div class="category">
						<a href="#">생성일</a>
					</div>
					<div class="time">
<fmt:formatDate pattern="yyyy-MM-dd"
							value="${groupVO.g_regdate}" />
					</div>
					<div style="text-align:right;float:right">
					<i style="color: black"
						class="ion-ios-contact-outline"></i> <span style="color: black">${groupVO.m_total}</span>
					</div>
				</div>
				<div class="col-sm-12 col-md-12 col-lg-12" style="text-align:left;padding-top:5px;">
				<span style="font-size:14px;">
					[${groupVO.g_category}]<br>
				</span>
				<span style="font-size:17px"> 
					${groupVO.g_name}
				</span>
				<p style="text-align:left;padding-top:5px;">${groupVO.g_subcategory}</p>
				</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4" style="padding-top:20px">
					<div>
						<c:if test="${groupVO.gm_grant eq 'A' || groupVO.gm_grant eq 'M'}">
						<div class='btnCover'>
						<button class="btn btn-warning more manage"  data-id="${groupVO.g_id}"> <span>그룹관리</span>
						</button>
						</div>
						</c:if>
						<c:if test="${groupVO.gm_grant eq null}">
						<div class='btnCover'>
						<button class="btn btn-danger more join"  data-id="${groupVO.g_id}"> <span>그룹가입</span>	
						</button>
						</div>
						</c:if>	
						<c:if test="${groupVO.gm_grant ne null}">
						<div class='btnCover'>
						<a class="btn btn-primary more go" data-id="${groupVO.g_id}" href="/group/group?gid=${groupVO.g_id}"> <span>참여</span>
							<span><i class="ion-ios-arrow-thin-right"></i></span>
						</a>
						</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</article>
</c:forEach>
</div>

<div id="menu1" class="tab-pane fade">
	<c:forEach items="${grouplist2}" var="groupVO">
	<article class="col-sm-6 col-md-6 col-lg-6 article-list">
		<div class="inner">
			<div class="details">
			<div  class="col-sm-8 col-md-8 col-lg-8">
				<div class="detail col-sm-12 col-md-12 col-lg-12" style="padding-top:10px">
					<div class="category">
						<a href="#">생성일</a>
					</div>
					<div class="time">
<fmt:formatDate pattern="yyyy-MM-dd"
							value="${groupVO.g_regdate}" />
					</div>
					<div style="text-align:right;float:right">
					<i style="color: black"
						class="ion-ios-contact-outline"></i> <span style="color: black">${groupVO.m_total}</span>
					</div>
				</div>
				<div class="col-sm-12 col-md-12 col-lg-12" style="text-align:left;padding-top:5px;">
				<span style="font-size:14px;">
					[${groupVO.g_category}]<br>
				</span>
				<span style="font-size:17px"> 
					${groupVO.g_name}
				</span>
				<p style="text-align:left;padding-top:5px;">${groupVO.g_subcategory}</p>
				</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4" style="padding-top:20px">
					<div>
						<c:if test="${groupVO.gm_grant eq 'A' || groupVO.gm_grant eq 'M'}">
						<div class='btnCover'>
						<button class="btn btn-warning more manage"  data-id="${groupVO.g_id}"> <span>그룹관리</span>
						</button>
						</div>
						</c:if>
						<c:if test="${groupVO.gm_grant eq null}">
						<div class='btnCover'>
						<button class="btn btn-danger more join"  data-id="${groupVO.g_id}"> <span>그룹가입</span>	
						</button>
						</div>
						</c:if>	
						<c:if test="${groupVO.gm_grant ne null}">
						<div class='btnCover'>
						<a class="btn btn-primary more go" data-id="${groupVO.g_id}" href="/group/group?gid=${groupVO.g_id}"> <span>참여</span>
							<span><i class="ion-ios-arrow-thin-right"></i></span>
						</a>
						</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</article>
</c:forEach>
</div>



<div id="menu2" class="tab-pane fade">
<button type="button" class="btn btn-default r_btn g_cate_btn">10대</button>
<button type="button" class="btn btn-default r_btn g_cate_btn">20대</button>
<button type="button" class="btn btn-default r_btn g_cate_btn">30대</button>
<button type="button" class="btn btn-default r_btn g_cate_btn">40대</button>
<button type="button" class="btn btn-default r_btn g_cate_btn">경기도</button>
<button type="button" class="btn btn-default r_btn g_cate_btn">인천</button>
<button type="button" class="btn btn-default r_btn g_cate_btn">강원도</button>
<button type="button" class="btn btn-default r_btn g_cate_btn">충남</button>
<button type="button" class="btn btn-default r_btn g_cate_btn">충북</button>
<button type="button" class="btn btn-default r_btn g_cate_btn">전북</button>
<button type="button" class="btn btn-default r_btn g_cate_btn">전남</button>
<button type="button" class="btn btn-default r_btn g_cate_btn">경북</button>
<button type="button" class="btn btn-default r_btn g_cate_btn">경남</button>
<hr>
<div id="CAgroupList" >
카테고리를 선택해주세요
</div>
</div>

 <div id="menu3" class="tab-pane fade">
 	<c:forEach items="${grouplist}" var="groupVO">
 	<c:if test="${groupVO.gm_grant ne null}">
	<article class="col-sm-6 col-md-6 col-lg-6 article-list">
		<div class="inner">
			<div class="details">
			<div  class="col-sm-8 col-md-8 col-lg-8">
				<div class="detail col-sm-12 col-md-12 col-lg-12" style="padding-top:10px">
					<div class="category">
						<a href="#">생성일</a>
					</div>
					<div class="time">
<fmt:formatDate pattern="yyyy-MM-dd"
							value="${groupVO.g_regdate}" />
					</div>
					<div style="text-align:right;float:right">
					<i style="color: black"
						class="ion-ios-contact-outline"></i> <span style="color: black">${groupVO.m_total}</span>
					</div>
				</div>
				<div class="col-sm-12 col-md-12 col-lg-12" style="text-align:left;padding-top:5px;">
				<span style="font-size:14px;">
					[${groupVO.g_category}]<br>
				</span>
				<span style="font-size:17px"> 
					${groupVO.g_name}
				</span>
				<p style="text-align:left;padding-top:5px;">${groupVO.g_subcategory}</p>
				</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4" style="padding-top:20px">
					<div>
						<c:if test="${groupVO.gm_grant eq 'A' || groupVO.gm_grant eq 'M'}">
						<div class='btnCover'>
						<button class="btn btn-warning more manage"  data-id="${groupVO.g_id}"> <span>그룹관리</span>
						</button>
						</div>
						</c:if>
						<c:if test="${groupVO.gm_grant eq null}">
						<div class='btnCover'>
						<button class="btn btn-danger more join"  data-id="${groupVO.g_id}"> <span>그룹가입</span>	
						</button>
						</div>
						</c:if>	
						<c:if test="${groupVO.gm_grant ne null}">
						<div class='btnCover'>
						<a class="btn btn-primary more go" data-id="${groupVO.g_id}" href="/group/group?gid=${groupVO.g_id}"> <span>참여</span>
							<span><i class="ion-ios-arrow-thin-right"></i></span>
						</a>
						</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</article>
	</c:if>
</c:forEach>
 </div>
</div>
</section>
<section class="s-content s-content--narrow container al_center">
<form method="post" action="/group/groupUser">
</form>
</section>

<!-- 카테고리별  Ajax-->

<script>
	$(document).ready(function(){
		$(".g_cate_btn").on("click",function(){
			var g_category=$(this).html();
			  $.getJSON("/replies/category/"+g_category+"", function(data){
			        var str="";
			        $.each(data.gVO, function (index,item){
			        	console.log("item:"+item.g_grant);
			        	console.log(item.g_id);
			        	
			        	str +='<article class="col-sm-6 col-md-6 col-lg-6 article-list">'
			        	+'<div class="inner">'
			        	+'<div class="details">'
			        	+'<div class="col-sm-8 col-md-8 col-lg-8">'
			        	+'<div class="detail col-sm-12 col-md-12 col-lg-12" style="padding-top:10px">'
			        	+'<div class="category">'
			        	+'<a href="#">생성일</a>'
			        	+'</div>'
			        	+'<div class="time">'
			        	+''+item.g_regdate+''
			        	+'</div>'
			        	+'<div style="text-align:right;float:right">'
			        	+'<i style="color: black" class="ion-ios-contact-outline"></i>'
			        	+'<span style="color: black">'+item.m_total+'</span>'
			        	+'</div></div>'
			        	+'<div class="col-sm-12 col-md-12 col-lg-12" style="text-align:left;padding-top:5px;">'
	    				+'<span style="font-size:14px;">'
	    				+'['+item.g_category+']<br></span>'
	    				+'<span style="font-size:17px"> '
	    				+''+item.g_name+'</span>'	
	    				+'<p style="text-align:left;padding-top:5px;">'+item.g_subcategory+'</p>'
			    		+'</div></div>'
			    		+'<div class="col-sm-4 col-md-4 col-lg-4" style="padding-top:20px">'	
			    		+'<div>';
			    		 if((item.gm_grant == 'A')||(item.gm_grant =='M')){
			    			str+='<div class="btnCover">'
			    				+'<button class="btn btn-warning more manage"  data-id="'+item.g_id+'"> <span>그룹관리</span>'
			    				+'</button></div>';
			    		}
			    		if(item.gm_grant == null){
			    			str+='<div class="btnCover">'
			    				+'<button class="btn btn-danger more join"  data-id="'+item.g_id+'"> <span>그룹가입</span>	'
			    				+'</button></div>';
			    		}			
			    		if(item.gm_grant != null){
			    			str+='<div class="btnCover">'
			    				+'<a class="btn btn-primary more go" data-id="'+item.g_id+'" href="/group/group?gid='+item.g_id+'"> <span>참여</span>'
			    				+'</a></div>';
			    		}		
			    		str+='</div></div></div></div></article>';	 
			    		
			        });
			        if(str==""){
			        	str+="<h3>해당 그룹방이 존재하지 않습니다.</h3>"
			        }
			        $("#CAgroupList").html(str);
			    }); 	
			  
		});
		
	})
</script>
<!-- 카테고리별  Ajax 끝-->
<%@include file="../include/footer.jsp"%>
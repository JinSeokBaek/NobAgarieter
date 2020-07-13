<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/nob/css/tak.css">
<link rel="stylesheet"
	href="/resources/nob/ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="/resources/nob/css/tak2.css">
 <c:if test="${empty login}">
       	<script>
       		alert("로그인을 해주세요.");
       		location.href="/main/login";
       	</script>
       </c:if>
       
<style>
        .iconForm{
            width: 100%;
             float: left; 
             margin:0;
             padding:20px 0;
        }
        .avatar{
            width: 12%;
            padding:0;
            margin:0;
        }
    </style>
    <script>
$(document).ready(
			function() {

				$("#searchBtn").on(
						"click",
						function(event) {
							self.location = "listAll"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val())
									+ "&tbl_name="+$("#tbl_name").val()+"";
						});

				$("#newBtn").on("click", function(evt) {
					self.location = "register";
				});
			});

var result = '${msg}';
if (result == 'SUCCESS') {
	alert('처리가 완료되었습니다.');
}
</script>
<style>
	/*********************************
7. Blog
*********************************/

.blog
{
	width: 100%;
	background: #FFFFFF;
	padding-top: 100px;
	padding-bottom: 100px;
}
.blog_post_container
{
	width: 100%;
}
.blog_post
{
	width:100%;
	border-radius: 6px;
	overflow: hidden;
	box-shadow: 0px 1px 10px rgba(29,34,47,0.1);
	margin-bottom: 30px;
}
.blog_post:hover
{
	box-shadow: 0px 5px 40px rgba(29,34,47,0.15);
}
.blog_post_image
{
	width: 100%;
}
.blog_post_image img
{
	max-width: 100%;
}
.blog_post_video_container
{
	width: 100%;
}
.video-js
{
	width: 100%;
}
.video-js .vjs-big-play-button
{

}
.vjs-control-bar
{
	display: -webkit-box !important;
	display: -moz-box !important;
	display: -ms-flexbox !important;
	display: -webkit-flex !important;
	display: flex !important;
}
.blog_post_body
{
	padding-left: 32px;
	padding-right: 30px;
	padding-top: 23px;
	padding-bottom: 23px;
}
.blog_post_title a
{
	font-family: 'Roboto Slab', serif;
	font-size: 20px;
	line-height: 1.4;
	font-weight: 700;
	color: #384158;
	-webkit-transition: all 200ms ease;
	-moz-transition: all 200ms ease;
	-ms-transition: all 200ms ease;
	-o-transition: all 200ms ease;
	transition: all 200ms ease;
}
.blog_post_title a:hover
{
	color: #14bdee;
}
.blog_post_meta
{
	margin-top: 11px;
}
.blog_post_meta ul li
{
	display: inline-block;
	position: relative;
}
.blog_post_meta ul li:not(:last-of-type)::after
{
	display: inline-block;
	position: relative;
	content: '|';
	margin-left: 14px;
	margin-right: 11px;
}
.blog_post_meta ul li a
{
	font-size: 14px;
	font-weight: 400;
	color: #b5b8be;
	text-transform: uppercase;
	-webkit-transition: all 200ms ease;
	-moz-transition: all 200ms ease;
	-ms-transition: all 200ms ease;
	-o-transition: all 200ms ease;
	transition: all 200ms ease;
}
.blog_post_meta ul li a:hover
{
	color: #14bdee;
}
.blog_post_text
{
	margin-top: 12px;
}
.blog_post_text p
{
	font-size: 14px;
	font-weight: 400;
	color: #76777a;
	line-height: 2;
}
.load_more
{
	width: 150px;
	height: 46px;
	border-radius: 3px;
	background: #14bdee;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
}
.load_more:hover
{
	box-shadow: 0px 5px 40px rgba(0,0,0,0.15);
}
.load_more a
{
	display: block;
	line-height: 46px;
	font-size: 14px;
	color: #FFFFFF;
	text-transform: uppercase;
	font-weight: 500;
}


</style>
<form>
	<input type="hidden" name="tbl_name" id="tbl_name" value="tbl_event">
</form>
<div class="s-content s-content--narrow al_center container" style="padding-top:0px;height:auto">
<div class="col-sm-12 col-lg-12 col-md-12">
	<div>
	<h1 style="float:left;">
	Event
	</h1>
	<hr>
	</div>	
		<div class="blog">
			<div class="blog_post_container">
						<!-- Blog Post -->
			<c:forEach items="${list}" var="boardVO">
				<div class="blog_post col-sm-12 col-md-12 col-lg-12">
					<div class="blog_post_image"><img src="${boardVO.thumbnailimage}" alt=""></div>
					<div class="blog_post_body">
						<div class="blog_post_title">${boardVO.b_title}<a href="blog_single.html"></a></div>
						<div class="blog_post_meta">
							<ul>
								<li><a href="#">작성자 : ${boardVO.b_title}</a></li>
								<li><a href="#">이벤트 기간 : ${boardVO.b_date}</a></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	
	   </div>
		<div class="text-center col-sm-12 col-md-12 col-lg-12">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a
						href="listAll${pageMaker.makeSearch(pageMaker.startPage-1)}&tbl_name=${tbl_name}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li <c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
						<a href="listAll${pageMaker.makeQuery(idx)}&tbl_name=${tbl_name}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage>0}">
					<li><a
						href="listAll${pageMaker.makeSearch(pageMaker.endPage+1)}&tbl_name=${tbl_name}">&raquo;</a></li>
				</c:if>
				<c:if test="${login.u_nickname eq 'admin'}">
				<span style="position: absolute;right:0;">
				<a href='/board/registerNE?tbl_name=tbl_event'><button type="button" class="btn btn-default" style="background-color:#C3C3C3; border:#C3C3C3;color:white" id="newBtn">글쓰기</button></a>
				</span>
				</c:if>
			</ul>
		</div>

		
		<!-- <div class='box-body'> -->
		<div class="text-center col-sm-12 col-lg-12 col-md-12" style="background-color:#F6F6F6;height:60px" >
		<div class="row" style="padding-left:20%;padding-top:15px;vertical-align:middle;" align="center">
			<select name="searchType" class="btn-default col-sm-4 col-lg-4 col-md-4" style="height:30px;wdith:60px;">
				<option value="n"
					<c:out value="${cri.searchType==null?'selected':''}"/>>
					선택</option> 
				<option value="t"
					<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
					제목</option>
				<option value="c"
					<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
					내용</option>
				<option value="w"
					<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
					글쓴이</option>
				<option value="tc"
					<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
					제목+내용</option>
				<option value="cw"
					<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
					내용+글쓴이</option>
				<option value="tcw"
					<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
					제목+내용+글쓴이</option>
				<option value="hash"
					<c:out value="${cri.searchType eq 'hash'?'selected':''}"/>>
					#해시태그</option>
				</select>
			
				<input type="text" name='keyword' class="col-sm-3 col-lg-3 col-md-3" style="width:auto;height:30px;background-color:white;border:solid 1px #C3C3C3;padding-left:10px" id="keywordInput"
				value='${cri.keyword}' />
			
				<button type="button" id="searchBtn" class="btn btn-default col-sm-3 col-lg-3 col-md-3" style="width:auto;background-color:#C3C3C3; border:#C3C3C3;height:30px;"><p style="font-size:12px;color:white;">검색<p></button>
		</div>																																
	</div>																															
	</div>
</div>

<script>
var hashList=function(){
	$(".details").each(function(){
		var a = $(this).find(".hash_bno").val();	
		var that= $(this).find(".hash_content");
		console.log(a);
		$.getJSON("/replies/tip_hash/"+a,function(data){
			var str="";
			$(data).each(function(){
			str+='<a href="/board/listAll?page=1&perPageNum=20 &tbl_name=tbl_tipboard&searchType=hash&keyword='+this.h_name+'">'
				+'#'+this.h_name+'</a>';
			});
			console.log(str);
			that.html(str);
		});

	})
}
window.onload=hashList();

</script>
<%@include file="../include/footer.jsp"%>
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

<form>
	<input type="hidden" name="tbl_name" id="tbl_name" value="tbl_notice">
</form>

<div class="s-content s-content--narrow al_center container" style="padding-top:0; height:auto">
<div class="col-sm-12 col-lg-12 col-md-12">
	<div>
	<h1 style="float:left;">
	공지사항
	</h1>
	<hr>
	</div>
	<div class="col-sm-8 col-md-8 col-lg-8">
		<table class="table table-boardered col-sm-12 col-md-12 col-lg-12">
			<tr>
				<th style="width: 60px;text-align:center">글번호</th>
				<th>제목</th>
				<th style="width: 100px">글쓴이</th>
				<th style="width: 150px">등록일</th>
				<th style="width: 100px">조회수</th>
				<th style="width: 60px"><i class="ion-android-favorite-outline"></i></th>
			</tr>
			<c:forEach items="${list}" var="boardVO">
				<tr>
					<td>${boardVO.b_no}</td>
					<td><a href='/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&b_no=${boardVO.b_no}&tbl_name=${tbl_name}'>${boardVO.b_title} <strong
							style="color: red"> [${boardVO.b_replycnt}]</strong>
					</a></td>
					<td>${boardVO.u_nickname}</td>
					<td><fmt:formatDate pattern="yy.MM.dd HH:mm"
							value="${boardVO.b_regdate}" /></td>
					<td><span>${boardVO.b_viewcnt}</span></td>
					<td><span>${boardVO.total}</span></td>
				</tr>
			</c:forEach>
		</table>
	
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
				<a href='/board/registerNE?tbl_name=tbl_notice'><button type="button" class="btn btn-default" style="background-color:#C3C3C3; border:#C3C3C3;color:white" id="newBtn">글쓰기</button></a>
				</span>
				</c:if>
			</ul>
		</div>
	
		
		<!-- <div class='box-body'> -->
		<div class="text-center col-sm-12 col-lg-12 col-md-12" style="background-color:#F6F6F6;height:60px"  align="center">
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

	<!--  Tag -->
	<div class="col-sm-4 col-md-4 col-lg-4">
	<div>
				<div>
				<h2 style="float:left"><strong>최신 글</strong></h2>
				<h5 style="float:right;padding-top:30px"></h5>
				<hr>
				<table>
					<tr>
						<th style="width: 100px">게시판</th>
						<th>글 제목</th>
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
        						<c:when test = "${tbl_name eq '3'}"><c:set var="tbl_name2" value="tbl_tipboard"/></c:when>    
       							<c:when test = "${tbl_name eq '1'}"><c:set var="tbl_name2" value="tbl_tipboard"/></c:when> 
      					   		<c:when test = "${tbl_name eq '4'}"><c:set var="tbl_name2" value="tbl_tipboard"/></c:when> 
     					    </c:choose>
							<a href="/board/readPage?b_no=${boardVO.b_no}&tbl_name=${tbl_name2}">
     					    ${boardVO.b_title} </a><span
								style="color: red;">new</span></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</div>
			<div >
				<h2 style="float:left"><strong>인기 글</strong></h2>
				<h5 style="float:right;padding-top:30px"></h5>
				<hr>
				<table>
					<tr>
						<th style="width: 100px">게시판</th>
						<th>글 제목</th>
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
        						<c:when test = "${tbl_name eq '3'}"><c:set var="tbl_name2" value="tbl_tipboard"/></c:when>    
       							<c:when test = "${tbl_name eq '1'}"><c:set var="tbl_name2" value="tbl_tipboard"/></c:when> 
      					   		<c:when test = "${tbl_name eq '4'}"><c:set var="tbl_name2" value="tbl_tipboard"/></c:when> 
     					    </c:choose>
							<a href="/board/readPage?b_no=${boardVO.b_no}&tbl_name=${tbl_name2}">
								${boardVO.b_title} </a><span
									style="color: red;">HOT</span></td>
								
							</tr>
						</c:forEach>
				</table>
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
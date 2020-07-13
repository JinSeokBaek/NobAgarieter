<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/nob/css/tak.css">

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
        .inner:hover{
        box-shadow: 0px 5px 40px rgba(0,0,0,0.15);
        }
    </style>
    <script>
$(document).ready(
			function() {

				$("#searchBtn").on(
						"click",
						function(event) {
							self.location ='${pageMaker.makeQuery(1)}'
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


<div class="s-content s-content--narrow container" style="padding:0; height:auto" align="left">
<div class="col-sm-12 col-lg-12 col-md-12">
	<div>
	<h1 style="float:left;">
	<c:set var ="tbl_name" value ="${tbl_name}"/>
	<c:choose>     
         <c:when test ="${tbl_name eq 'tbl_tipboard'}">
           Tip
         </c:when>  
         <c:when test = "${tbl_name eq 'tbl_qaboard'}">
           Q&A
         </c:when>    
         <c:when test = "${tbl_name eq 'tbl_stiboard'}">
           자극 사진
         </c:when> 
         <c:when test = "${tbl_name eq 'tbl_freeboard'}">
        	잡담
         </c:when> 
      </c:choose>
	</h1>
	<hr>
	
	</div>
	<div class="col-sm-8 col-md-8 col-lg-8" style="padding:0;">
	 
	<div align="left">
	<c:if test = "${tbl_name eq 'tbl_stiboard'}">
	<a href="/board/listAll/?tbl_name=tbl_stiboard"><button type="button" class="btn btn-default r_btn">전체</button></a>
	<a href="/board/listAll/?searchType=ca&keyword=body&tbl_name=tbl_stiboard"><button type="button" class="btn btn-default r_btn">body</button></a>
	<a href="/board/listAll/?searchType=ca&keyword=before/after&tbl_name=tbl_stiboard"><button type="button" class="btn btn-default r_btn">before/after</button></a>
	<a href="/board/listAll/?searchType=ca&keyword=후기&tbl_name=tbl_stiboard"><button type="button" class="btn btn-default r_btn">후기</button></a>
	</c:if>
	<c:if test = "${tbl_name eq 'tbl_tipboard'}">
	<a href="/board/listAll/?tbl_name=tbl_tipboard"><button type="button" class="btn btn-default r_btn">전체</button></a>
	<a href="/board/listAll/?searchType=ca&keyword=식단/레시피&tbl_name=tbl_tipboard"><button type="button" class="btn btn-default r_btn">식단/레시피</button></a>
	<a href="/board/listAll/?searchType=ca&keyword=다이어트&tbl_name=tbl_tipboard"><button type="button" class="btn btn-default r_btn">다이어트</button></a>
	<a href="/board/listAll/?searchType=ca&keyword=컬럼&tbl_name=tbl_tipboard"><button type="button" class="btn btn-default r_btn">컬럼</button></a>
	</c:if>
	</div>
	<div style="padding-top:20px">
			<c:if test = "${tbl_name eq 'tbl_stiboard'}">
			<c:forEach items="${list}" var="boardVO">
				 <article class="article col-sm-4 col-lg-4 col-md-4" style="padding:0;">
										<div class="inner">
											<figure style="height:150px">
											<a href='/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&b_no=${boardVO.b_no}&tbl_name=${tbl_name}'>
											 <c:choose>
                                                <c:when test="${boardVO.thumbnailimage eq 'undefined'}">
                                        <img src="/resources/nob/images/thumbnail.jpg"  style='height: 100%; width: 100%; object-fit: cover' alt="Sample Article">
                                                </c:when>
                                                <c:otherwise>
                                       <img src="${boardVO.thumbnailimage}" style='height: 100%; width: 100%; object-fit: cover' alt="Sample Article">
                                               </c:otherwise>
                                            </c:choose>
                                            
												
													
												</a>
											</figure>
											<div class="padding">
												<div class="l_title col-xs-12" style="height:auto;padding-top:0px;" align="left">
												<h4><a href='/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&b_no=${boardVO.b_no}&tbl_name=${tbl_name}'style="color:black">${boardVO.b_title}<strong
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
							<div class="col-xs-4">
													<i class="far fa-heart" style="color:#ED4C57;"></i> <span>${boardVO.total}</span>
												</div>
											</div>
										</div>
										</div>
										</div>
									</article>		
							</c:forEach>
			</c:if>
	
			<c:if test = "${tbl_name eq 'tbl_tipboard'}">
			<c:forEach items="${list}" var="boardVO">
		
		<article class="col-sm-12 col-lg-12 col-md-12 article-list" style="padding:0;height:250px; ">
								<div class="inner">
									<figure>
										<a href="#">
										 <c:choose>
                                                <c:when test="${boardVO.thumbnailimage eq 'undefined'}">
                                                    <img src="/resources/nob/images/thumbnail.jpg" style='height: 100%; width: 100%; object-fit: cover'>
                                                </c:when>
                                                <c:otherwise>
                                         <img src="${boardVO.thumbnailimage}" alt="Sample Article">
                                                </c:otherwise>
                                            </c:choose>
							
										</a>
									</figure>
									<div class="details">
										<div class="detail" >
											<div class="category">
												<a href="#" style="font-size:15px">${boardVO.b_category}</a>
											</div>
											<div class="time" style="font-size:15px"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${boardVO.b_regdate}" /></div>
										</div>
										<input type="hidden" class="hash_bno" value="${boardVO.b_no}">
										<h1 style="padding:10px 2px"><a href='/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&b_no=${boardVO.b_no}&tbl_name=${tbl_name}'>${boardVO.b_title} <strong
							style="color: red"> [${boardVO.b_replycnt}]</strong></a></h1>
										<p class="hash_content"></p>
										<div style="padding-top:15px">
											<a href="#" class="love" ><i class="ion-android-favorite-outline" style="color:red;font-size:10px" ></i> <span>${boardVO.total}</span></a>
											
										</div>
									</div>
								</div>
							</article>
							</c:forEach>
						</c:if>
					
							
	<c:if test = "${tbl_name ne 'tbl_stiboard' && tbl_name ne 'tbl_tipboard'}">
		<table class="table table-boardered col-sm-12 col-md-12 col-lg-12">
			<tr>
				<th style="width: 60px;text-align:center">글번호</th>
				<th>제목</th>
				<th style="width: 100px">글쓴이</th>
				<th style="width: 150px">등록일</th>
				<th style="width: 60px">조회수</th>
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
	</c:if>
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
				<span style="position: absolute;right:0;">
				<a href='/board/register?tbl_name=${tbl_name}'><button type="button" class="btn btn-default" style="background-color:#C3C3C3; border:#C3C3C3;color:white" id="newBtn">글쓰기</button></a>
				</span>
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
				<%-- <option value="w"
					<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
					글쓴이</option> --%>
				<option value="tc"
					<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
					제목+내용</option>
				<%-- <option value="cw"
					<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
					내용+글쓴이</option> --%>
				<%-- <option value="tcw"
					<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
					제목+내용+글쓴이</option> --%>
				<option value="hash"
					<c:out value="${cri.searchType eq 'hash'?'selected':''}"/>>
					#해시태그</option>
				<option value="ca"
					<c:out value="${cri.searchType eq 'ca'?'selected':''}"/>>
					카테고리</option>
				</select>
			
				<input type="text" name='keyword' class="col-sm-3 col-lg-3 col-md-3" style="width:auto;height:30px;background-color:white;border:solid 1px #C3C3C3;padding-left:10px" id="keywordInput"
				value='${cri.keyword}' />
			
				<button type="button" id="searchBtn" class="btn btn-default col-sm-3 col-lg-3 col-md-3" style="width:auto;background-color:#C3C3C3; border:#C3C3C3;height:30px;"><p style="font-size:12px;color:white;">검색<p></button>
		</div>																																
	</div>
</div>

	<!--  Tag -->
	<div class="col-sm-4 col-md-4 col-lg-4">
	<!-- 인기글 -->
		<div class="bottom tags-wrap">
			<div class="col-full"align="left">
				<h3><strong>인기 글</strong></h3>
				<hr>
				<table>
				<tr>
					<th>Title</th>
					<th style="width: 80px;"><i class="ion-android-favorite-outline" style="color:red"></i></th>
				</tr>
				<c:forEach items="${like}" var="boardVO">
				<c:set var ="tbl_name" value ="${boardVO.b_name}"/>
				<c:choose>     
       							<c:when test ="${tbl_name eq 2}"><c:set var="tbl_name2" value="tbl_tipboard"/></c:when>  
        						<c:when test = "${tbl_name eq '3'}"><c:set var="tbl_name2" value="tbl_qaboard"/></c:when>    
       							<c:when test = "${tbl_name eq '1'}"><c:set var="tbl_name2" value="tbl_stiboard"/></c:when> 
      					   		<c:when test = "${tbl_name eq '4'}"><c:set var="tbl_name2" value="tbl_freeboard"/></c:when> 
     					    </c:choose>
				<tr style="height:40px">
					<td><a href='#'>${boardVO.b_title} 
					</a></td>
					<td>${boardVO.total}</td>
				</tr>
			</c:forEach>
			</table>
			</div>
		</div>
	
		<!--  tag -->
		<div class="bottom tags-wrap">
			<div class="col-full tags" align="left">
				<h3><strong>#해시태그</strong></h3>
				<hr>
				<div class="tagcloud">
					<c:forEach items="${hash}" var="boardVO">
						<a href="/board/listAll?page=1&perPageNum=20 &tbl_name=${tbl_name}&searchType=hash&keyword=${boardVO.h_name}">
						${boardVO.h_name}</a>
					</c:forEach>
				</div>
				<!-- end tagcloud -->
			</div>
			<!-- end tags -->
		</div>
		<!-- end tags-wrap -->
	</div>
	</div>
</div>
<form>
	<input type="hidden" name="tbl_name" id="tbl_name" value="${tbl_name}">
</form>
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
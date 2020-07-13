<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<!-- 2018_06_14 추가 -->
<script type="text/javascript" src="/resources/nob/js/upload.js"></script>
<!-- 2018_06_14 추가 -->
<style type="text/css">
 <c:if test="${empty login}">
       	<script>
       		alert("로그인을 해주세요.");
       		location.href="/main/login";
       	</script>
       </c:if>
/* <!-- 2018_06_15 추가 --> */
.fileDrop {
	width: 100%;
	height: 500px;
	text-align: left;
	overflow: auto;
}
.box-footer{
}
</style>

<!-- 2018_06_18 추가 -->
<style>
.likebtn {
	width: 100px;
	height: 100px;
	background-image: url("/resources/nob/images/likebox.png");
	background-position: center center;
	background-size: cover;
	text-align: center;
	margin: 10px auto;
	border: 0px;
}

/* <!-- 2018_06_18 추가 --> */
.like>input[type=text] {
	width: 100px;
	height: 20px;
	text-align: center;
	margin: 10px auto;
	border: 0px solid white;
	font-size: 25px;
}
</style>




<style>
section {
	color: black;
	font-size: 13px;
	font-family: 'nanum gothic', sans-serif;
	text-align: center;
}

.calorie {
	text-decoration: underline;
	display: inline-block;
	cursor: pointer;
}

.show {
	display: block;
}

#list {
	display: none;
}

#modalbody2 {
	display: none;
}

.error {
	border-color: red !important;
}
</style>



<section class="content al_center col-sm-12 col-md-12 col-lg-12" style="padding: 0 300px;">
	<!-- Reply Modal -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-r_id>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div>
		<!-- class="row" -->
		<!-- left column -->
		<div class="col-md-8 col-sm-8 col-lg-8">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title" style="float:left"></h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">
					<input type='hidden' name='tbl_name' value="${tbl_name}"
						id="tbl_name"> <input type='hidden' name='b_no'
						value="${boardVO.b_no}" id="b_no"> <input type='hidden'
						name='page' value="${cri.page}"> <input type='hidden'
						name='perPageNum' value="${cri.perPageNum}"> <input
						type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					<input type='hidden' id="u_no" name='u_no' value="${login.u_no}">
					<input type='hidden' id="newReplyWriter" name='u_no'
						value="${login.u_no}">

				</form>

				<div class="box-body">
					
					<table>
					<tr>
						<th style="font-size:20px"><span style="color:red">[${boardVO.b_category}]</span> <strong>${boardVO.b_title}</strong><span style="float:right"><fmt:formatDate pattern="yy.MM.dd HH:mm"
							value="${boardVO.b_regdate}"/></span></th>
					</tr>
					<tr>
						<th>글쓴이: ${boardVO.u_nickname} 조회수 : ${boardVO.b_viewcnt} 댓글: ${boardVO.b_replycnt} 추천: ${l_total2} </th>
					</tr>
					</table>
				
					<!-- 2018_06_15 수정 -->
					<div class="form-group content fileDrop" id="b_content" contenteditable="false" style="width: 100%; height: auto;">
					</div>

					<!-- 2018_06_18 추가 -->
					<div class="from-group like">
						<button class="form-control likebtn"></button>
						<input type="text" value="${l_total2}" readonly="readonly"
							id="liketext" class="liketext" name="like">
					</div>
				</div>
				<!-- 2018_06_15 수정 -->
				<div class="form-group" style="display: none">
					<textarea id="my-textarea" class="form-control" name="b_content"
						rows="3" readonly="readonly">${boardVO.b_content}</textarea>
				</div>
				<!-- /.box-body -->

				<ul class="mailbox-attachments clearfix uploadedList"></ul>


				<div class="box-footer" align="right">
					<button type="submit" class="btn btn-default r_btn" id="modifyBtn">수정</button>
					<button type="submit" class="btn btn-default r_btn" id="removeBtn">삭제</button>
					<button type="submit" class="btn btn-default r_btn" id="goListBtn">목록</button>
				</div>



			</div>
			<!-- /.box -->
			
		<div class="col-md-12 col-sm-12 col-lg-12"
		style="height: auto; margin: 0;">
		<!--  class="row" -->
		<!-- <div class="col-full"> -->

			<div class="box box-success" style="position: reletive">
				<div class="box-header">
					<h3 class="box-title" style="float:left">댓글</h3>
				</div>
				<div class="box-body" style="float:left">
					<div class="col-sm-12 col-md-12 col-lg-12" style="float:left">
					<input class="form-control" style="width:80%;float:left"type="text"placeholder="REPLY TEXT" id="newReplyText">
					<button type="button" class="btn btn-default" style="width:10%" id="replyAddBtn">등록</button>
					</div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<a href=".timeline" id="repliesDiv" data-toggle="collapse" style="float:left">댓글 보기<small id='replycntSmall'>[
							${boardVO.b_replycnt} ]</small></a>
					
				</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12 col-lg-12"
		style="height: auto;"
		style="position: reletive">
		<div>
			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				  <li class="time-label" id="repliesList"></li>
				  <li id="pagination" class="pagination pagination-sm no-margin"></li> 
			</ul>
			
		</div>
		<!-- <div class='text-center'>
			<ul id="pagination" class="pagination pagination-sm no-margin ">
			</ul>
		</div> -->
	</div>
	
	
		</div>
		<!--/.col (left) -->
		
		<div class="col-sm-4 col-md-4 col-lg-4">
	<!-- 인기글 -->
		<div class="bottom tags-wrap">
			<div class="col-full">
				<h3><strong>인기 글</strong></h3>
				<hr>
				<table>
				<tr>
					<th>Title</th>
					<th style="width: 80px;"><i class="ion-android-favorite"></i></th>
				</tr>
				  <c:forEach items="${like2}" var="boardVO">
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
			<div class="col-full tags">
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
	<!-- /.row -->



	
	<!-- /.row -->
</section>
<!-- /.content -->


<style>
	h3{
	}
	.timeline-header{
		height:auto;
		background-color:#F6F6F6;
		
	}
	.timeline-body{
		height:auto;
	}
	.btn{
		float:none;
	}
	/* .btn-xs{
		border:#999999;
		background-color:#999999;
	} */
	.btn-primary{
		border:#999999;
		background-color:#999999;
	}
	.r_btn{
		background-color:#FDFDFD;
		border:#D5D5D5;
		color:black;
	}
	
</style>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-r_id={{r_id}} style="text-align:left">
 <div class="timeline-item">
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate r_regdate}}
  </span>
  <h3 class="timeline-header">{{u_nickname}}</h3>
  <div class="timeline-body col-sm-12 col-md-12 col-lg-12">
	{{r_content}}
	</div>
    <div class="timeline-footer" align="right">
     	<span><a class="btn btn-default btn-xs" style="height:30px"
	    data-toggle="modal" data-target="#modifyModal">수정</a></span>
    </div>
  </div>			
</li>
{{/each}}
</script>
<script id="template1" type="text/x-handlebars-template">
{{#each .}}
<div>
{{l_total}}
</div>
{{/each}}
</script>

<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var printLike = function(list, target1, templateObject1) {

		var template1 = Handlebars.compile(templateObject1.html());

		var html1 = template1(list);

		console.log(html1 + "printLike");
		$("#liketext").val(html1);
		/*	$("#liketext").remove();
		 target1.val("1234"); */

	}

	var b_no = $("#b_no").val();
	var tbl_name = $("#tbl_name").val();
	var replyPage = 1;

	

	/* <!-- 2018_06_18 추가 --> */
	function getLike(pageInfo) {
		console.log(pageInfo + "pageInfo");
		$.getJSON(pageInfo, function(data) {

			console.log(data.list.l_total);
			$("#liketext").val(data.list.l_total);
		});
	}

	function getPage(pageInfo) {
		console.log(pageInfo);
		$.getJSON(pageInfo, function(data) {
			console.log(data);
			printData(data.list, $("#repliesList"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			$("#modifyModal").modal("hide");
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");

		});
	}
	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		getPage("/replies/" + tbl_name + "/" + b_no + "/1");
	});

	$(".pagination").on("click", "li a", function(event) {

		var replyPage = 1;

		event.preventDefault();

		replyPage = $(this).attr("href");

		getPage("/replies/" + tbl_name + "/" + b_no + "/" + replyPage);

	});

	$("#replyAddBtn").on(
			"click",
			function() {

				console.log("추가추가");
				var replyerObj = $("#newReplyWriter");
				var replytextObj = $("#newReplyText");
				var u_no = $("#u_no").val();
				var r_content = replytextObj.val();
				var b_no = $("#b_no").val();
				var tbl_name = $("#tbl_name").val();

				$.ajax({
					type : 'post',
					url : '/replies/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						b_no : b_no,
						u_no : u_no,
						r_content : r_content,
						tbl_name : tbl_name
					}),
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("등록 되었습니다.");
							replyPage = 1;
							getPage("/replies/" + tbl_name + "/" + b_no + "/"
									+ replyPage);
							replyerObj.val("");
							replytextObj.val("");
							//	replycntplus();
						}
					}
				});

			});

	$(".timeline").on("click", ".replyLi", function(event) {

		var reply = $(this);

		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-r_id"));

	});

	$("#replyModBtn").on(
			"click",
			function() {

				var r_id = $(".modal-title").html();
				var r_content = $("#replytext").val();

				$.ajax({
					type : 'put',
					url : '/replies/' + r_id,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					data : JSON.stringify({
						r_content : r_content
					}),
					dataType : 'text',
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("수정 되었습니다.");
							getPage("/replies/" + tbl_name + "/" + b_no + "/"
									+ replyPage);

						}
					}
				});
			});

	$("#replyDelBtn").on(
			"click",
			function() {

				var r_id = $(".modal-title").html();
				var r_content = $("#replytext").val();

				$.ajax({
					type : 'delete',
					url : '/replies/' + r_id,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : 'text',
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("삭제 되었습니다.");
							getPage("/replies/" + tbl_name + "/" + b_no + "/"
									+ replyPage);
						}
					}
				});
			});
</script>

<!-- 2018_06_15 수정 -->
<script>
	$(document).ready(function() {
		console.log($('#my-textarea').text());
		$('#b_content').html($('#my-textarea').text());
		function content() {
			$('#b_content').html($('#my-textarea').text());
		}

		var formObj = $("form[role='form']");

		console.log(formObj);

		$("#modifyBtn").on("click", function() {
			formObj.attr("action", "/board/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		//<!-- 2018_06_14 "#tremoveBtn".onclick 수정 -->
		$("#removeBtn").on("click", function() {

			var arr = [];

			$("#b_content .delbtn").each(function(index) {
				arr.push($(this).attr("data-src"));
			});

			if (arr.length > 0) {
				$.post("/deleteAllFiles", {
					files : arr
				}, function() {

				});
			}

			formObj.attr("action", "/board/removePage");
			formObj.submit();
		});

		$("#goListBtn").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/board/listAll");
			formObj.submit();
		});

	});
</script>
<script>
	$(document).ready(function() {
		$(".likebtn").on("click", function() {
			console.log("b_no=" + $("#b_no").val());
			console.log("u_no=" + $("#u_no").val());
			var l_bno = $("#b_no").val();
			var u_no = $("#u_no").val();
			var tbl_name = $("#tbl_name").val();
			console.log("클릭");
			$.ajax({
				type : 'post',
				url : '/like/',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					u_no : u_no,
					l_bno : l_bno,
					tbl_name : tbl_name
				}),
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("좋아요!");
						getLike("/like/" + tbl_name + "/" + l_bno + "");
					} else {
						alert("중복");
					}
				}
			});

		});
	})
</script>

<!-- 툴팁삽입용 js-->
<script src="/resources/nob/js/service/calorie.js"></script>
<!-- 툴팁적용용 js-->
<script src="/resources/nob/js/service/tooltip.js"></script>

<%@include file="../include/footer.jsp"%>

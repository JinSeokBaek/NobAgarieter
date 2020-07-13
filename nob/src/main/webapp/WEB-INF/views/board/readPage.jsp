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
	/* background-image: url("/resources/nob/images/likebox.png"); */
	text-align: center;
	margin: 10px auto;
	border: 0px;
	font-size:50px;
	color:red;
	cursor: pointer;
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

.likebtn2 {
	position: absolute;
	left: 0;
	font-size: 27px;
	cursor: pointer;
}



#likebox2 {
	float: left;
	margin-top: 20px;
}

.likebox2{
	float: left;
	margin-top: 20px;
	left: 0;
	position: absolute;
}

.timeline-footer{
      height: auto;
      display: inline-block;
   }
   .like2{
       width: auto;
       
   }
   /* .modimodi{
      position: absolute;
      right: 0;
      top: 8.82rem;
   } */

.likebtn2 {
   position: absolute;
   left: 0;
   cursor: pointer;
}
.far{
   font-size: 15px;
}
.fas {
   font-size: 15px;
   color: red;
}

.modimodi{
	color: gray;
}

.timeline-footer .fa-ellipsis-v{
   color: gray;
   cursor: pointer;
   font-size: 15px;
   text-align: right;
   
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

.pointerNone {
    pointer-events: none;
}
</style>



<section class="content col-sm-12 col-md-12 col-lg-12" >
<div class="container">
	<div class="col-sm-8 col-lg-8 col-md-8" style="padding:0">
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
         <c:otherwise>
            공지사항
         </c:otherwise>
      </c:choose>
	</h1>
	<span style="float:right;padding-top:30px">
	<c:if test="${login.u_nickname eq boardVO.u_nickname}">
		<button type="submit" class="btn btn-default r_btn" id="modifyBtn">수정</button>
		<button type="submit" class="btn btn-default r_btn" id="removeBtn">삭제</button>
		</c:if>
		<button type="submit" class="btn btn-default r_btn" id="goListBtn">목록</button>
	</span>	
	<hr>
	
	</div>

	
		<div class="col-md-12 col-sm-12 col-lg-12">
		<div class="col-md-8 col-sm-8 col-lg-8">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header" align="right">
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
						<th style="font-size:20px"><span style="color:red">${boardVO.b_category}</span> <strong>${boardVO.b_title}</strong><span style="float:right"><fmt:formatDate pattern="yy.MM.dd HH:mm"
							value="${boardVO.b_regdate}"/></span></th>
					</tr>
					<tr>
						<th>글쓴이: ${boardVO.u_nickname} 조회수 : ${boardVO.b_viewcnt} 댓글: ${boardVO.b_replycnt} 추천: 
						<c:forEach var = "like" items = "${like}">
						${like.l_total}
						</c:forEach>
						 </th>
					</tr>
					</table>
				
					<!-- 2018_06_15 수정 -->
					<div class="form-group content fileDrop" id="b_content" contenteditable="false" style="width: 100%; height: auto;">
					</div>

					<!-- 2018_06_18 추가 -->
					<div class="from-group like">
					<i class="likebtn far fa-thumbs-up" style="font-size:50px;"></i>
						<c:forEach var = "like" items = "${like}">
						<input type="text" value="${like.l_total}" readonly="readonly"
							id="liketext" class="liketext" name="like">
							</c:forEach>
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
				</div>
			</div>
		</div>
	
		
			<div class="col-sm-4 col-md-4 col-lg-4"style="padding-top:50px;overflow: scroll; height:800px;box-shadow: 0px 1px 10px rgba(29,34,47,0.1);">
				<div class="box box-success">
					<div class="box-header" style="height:auto;position:reletive;width:100%">
						<h3 class="box-title" style="float:left;padding-left:20px">댓글</h3>
					</div>
				<div class="box-body" style="height:auto;position:reletive;width:100%">
					<div class="col-sm-12 col-md-12 col-lg-12" style="float:left">
					<input class="form-control" style="width:67%;float:left;"type="text"placeholder="댓글쓰기" id="newReplyText">
					<button type="button" class="btn btn-default" style="width:auto;height:60px;" id="replyAddBtn">등록</button>
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12"><a data-toggle="collapse" href=".timeline" id="repliesDiv" style="float:left;padding-left:20px;color:black">댓글 보기<small id='replycntSmall'>[
							${boardVO.b_replycnt} ]</small></a></div>
				    <div class="col-sm-12 col-md-12 col-lg-12">
				    <ul class="timeline" id = "repliesUL">
						<li class="timeline" id="repliesList"></li> 
					   <li id="pagination" class="pagination pagination-sm no-margin"></li> 
					</ul>
					</div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					
				</div>		
			</div>
		</div>
	</div>
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
	</div>
</section>
<!-- /.content -->


<style>
	h3{
	}
	.timeline-header{
		height:auto;
		background-color:#FAFAFA;
		
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
<li class="replyLi" data-u_nickname ={{u_nickname}} data-r_id={{r_id}} data-l_user = {{l_user}} >
 <div class="timeline-item">
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate r_regdate}}
  </span>
  <h3 class="timeline-header"  style="text-align:left">{{u_nickname}}</h3>
  <div class="timeline-body col-sm-12 col-md-12 col-lg-12" align="left">
   {{r_content}}
   </div>
   
     <div style="font-size:10px"> 
      <div class="col-xs-2 like2">
      <span class="far fa-heart likebtn2"></span>
      </div>
      
      <div class = "col-xs-8">
      <span id = "liketext2" > {{l_total}}명이 좋아합니다. </span>
      </div>
      
      <div class = "col-xs-2">
        <span><a class=""
       ><i class="fas fa-ellipsis-v modimodi" style="color:gray;font-size:5px" data-u_nickname ={{u_nickname}}></i></a></span></div>
    </div>
</div>
 <div class="timeline-footer col-xs-12">
  </div>         
</li>
{{/each}}
</script>

<script id = "template2" type="text/x-handlebars-template">
{{#each .}}
{{l_total}}
{{/each}}
</script>
<script id="l_totalTemplate" type="text/x-handlebars-template">
{{#each .}}  {{l_total}}명이 좋아합니다. {{/each}}
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
		
		 $(".replyLi").each(function(){
			 console.log("이치실행");
				var l_user = $(this).attr('data-l_user');
				console.log("lLLLLLLL"+l_user);
				
				if(l_user > 0){
					var boardlikebtn = $(this).find($(".like2 > span"));
					console.log(boardlikebtn);
					var boardlikebtnclass = boardlikebtn.attr('class');
					console.log(boardlikebtnclass);
					
					boardlikebtn.removeClass("far fa-heart likebtn2");
					boardlikebtn.addClass("fas fa-heart likebtn2");
					console.log(boardlikebtnclass);
					}		
			});
		 
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

			console.log(data.list);
			printLike(data.list, $("#liketext"), $('#template2')); 
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
		console.log("lLLLLLLL");
		
		 
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

		getPage("/replies/" + tbl_name + "/" + b_no + "/" + u_no + "/1");
	});

	$(".pagination").on("click", "li a", function(event) {

		var replyPage = 1;

		event.preventDefault();

		replyPage = $(this).attr("href");

		getPage("/replies/" + tbl_name + "/" + b_no + "/" + u_no + "/" + replyPage);

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
							getPage("/replies/" + tbl_name + "/" + b_no + "/" + u_no + "/" + replyPage);
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
							getPage("/replies/" + tbl_name + "/" + b_no + "/" + u_no + "/" + replyPage);

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
							getPage("/replies/" + tbl_name + "/" + b_no + "/" + u_no + "/" + replyPage);
						}
					}
				});
			});
	
	$("#repliesUL").on("click", ".modimodi", function(){
		console.log("모디모디클릭");
		var u_nickname =$(this).attr("data-u_nickname");
		var myNickname = "${login.u_nickname}";
		 /* $("#modifyModal").modal("show");  */
		console.log(u_nickname);
		console.log(myNickname);
		if(u_nickname == myNickname){
			$("#modifyModal").modal("show");
			console.log("모디모디클릭");
		}	
		
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

<script>
var thistext;
var u_no = ${login.u_no};
function getLike2(pageInfo) {
	console.log(pageInfo);
	$.getJSON(pageInfo, function(data) {
		console.log("data 출력 전...");
		console.log("getJson"+data.list);
		l_totalPrintLike(data.list, thistext2, $('#l_totalTemplate')); 
	});
}

/* 
<!-- 2018_06_18 추가 -->  */


var l_totalPrintLike = function(timelineArr1, target1, templateObject1) {

	var template1 = Handlebars.compile(templateObject1.html());

	var html1 = template1(timelineArr1);
	console.log("l_totalprintLike실행");
	console.log(html1);

	target1.html(html1);
	
}

$(function() {
	$("#repliesUL").on("click", ".likebtn2", function(event) {
		var replylikebtnclass = $(this).attr('class');
		console.log(replylikebtnclass);
		var that = $(this);
		
		if(replylikebtnclass == 'far fa-heart likebtn2'){
			
			var replyLi = that.parents(".replyLi");
			
			console.log(replyLi);
			
			
			var r_id = replyLi.attr("data-r_id");
			
			var l_bno = r_id;
			var tbl_name = "${tbl_name}";
			thistext2 = replyLi.find('#liketext2');
			var u_no = ${login.u_no};
			$.ajax({
				type : 'post',
				url : '/likeReply/',
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
						getLike2("/likeReply/" + tbl_name + "/" + l_bno);

						that.removeClass("far fa-heart likebtn2");
					 	that.addClass("fas fa-heart likebtn2");  
					}
				}
			});
			
		
			
		}
		
	 	if(replylikebtnclass == 'fas fa-heart likebtn2'){
			
			var replyLi = that.parents(".replyLi");
			var u_no = ${login.u_no};
			console.log(replyLi);
			
			
			var r_id = replyLi.attr("data-r_id");
			
			var l_bno = r_id;
			var tbl_name = "${tbl_name}";
			thistext2 = replyLi.find('#liketext2');
		
			$.ajax({
				type : 'delete',
				url : '/likeReply/'+tbl_name+'/'+l_bno+'/'+u_no,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				data : JSON.stringify({
					tbl_name : tbl_name,
					l_bno : l_bno,
					u_no : u_no
					
				}),
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("취소!");
						getLike2("/likeReply/" + tbl_name + "/" + l_bno);
						
						that.removeClass("fas fa-heart likebtn2");
					 	that.addClass("far fa-heart likebtn2");  
					}
				}
			});
			
	 		
	 		
	 		
		 	
		}
		 
		
	

	});

});





</script>
<script>

	$("#repliesDiv").click();

</script>



<!-- 툴팁삽입용 js-->
<script src="/resources/nob/js/service/calorie.js"></script>
<!-- 툴팁적용용 js-->
<script src="/resources/nob/js/service/tooltip.js"></script>

<%@include file="../include/footer.jsp"%>

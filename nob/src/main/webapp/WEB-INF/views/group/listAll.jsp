<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>

<!-- 2018_06_14 추가 -->
<script type="text/javascript" src="/resources/nob/js/upload.js"></script>

<style>
.fileDrop1, .fileDrop5 {
	width: 100%;
	height: 300px;
	text-align: left;
}

.fileDrop, .fileDrop2, #newReplyText, #replytext {
	width: 100%;
	overflow-y:scroll;
	text-align: left;
}

[contentEditable=true]:empty:not (:focus ):before {
	content: attr(data-text)
}

.likebtn, .likebtn2 {
	position: absolute;
	left: 0;
	font-size: 27px;
	cursor: pointer;
}




.replybtn {
	cursor: pointer;
	width: 27px;
	height: 27px;
	float: left;
	margin-left: 30px;
}

#fake{
	visibility: hidden;
}
/* <!-- 2018_06_18 추가 --> */
#liketext, #liketext2, #liketext .fas, #liketext2 .fas {
	text-align: left;
	border: none;
	border-color: transparent;
	font-size: 13px;
	color: #134D75;
}

.hashtags {
	font-size: 20px;
}

.fas {
	color: red;
}

#likebox, #likebox2 {
	float: left;
	margin-top: 20px;
}

.timeline-footer {
	margin-top: 30px;
}

.timelineSection {
	width: 1303px;
	margin: 0 auto;
}

.searchContainer {
	width: 70%;
	height: 70%;
	margin: 40px auto;
	background: red;
}

.searchDiv {
	display: table;
	width: 100%;
	height: 100%;
}

.searchinner {
  display: table-cell;
  vertical-align: middle;
  text-align: center;
}

.timelineBoxHeader{
	display:block;
	width: 100%;
	height: 30px;
	margin-top: 60px;
}

.timelineBoxBody{
	display:block;
	width: 100%;
	height: 30px;
	margin-top: 30px;
}
.timelineBoxFooter{
	display:block;
	width: 100%;
	margin: 0 auto;
	height: 30px;
}
#timelineULbox, #timelineULbox2{
	display:block;
	width: 100%;
}
.timeline-header{
	float: left;
}
.timeline-body1{
	font-size: 18px;
}

.likebox, .likebox2{
	float: left;
	margin-top: 20px;
	left: 0;
	position: absolute;
}

.our-background {background-color:#ED4C57;}
.ourcolor {color:white;}

</style>

  <script>

</script>


<section class="content timelineSection">
	
	<div class = "col-xs-12 ">
	<div class="container">
		<div class="col-xs-8">
			<!--  <div class="box">
				<div class="box-header timelineBoxHeader">
					<h3 class="box-title" ></h3>
				</div>
				<div class="box-body timelineBoxBody">
					
				</div>
				
				<div class="box-footer timelineBoxFooter">			
				</div>
				
			</div>  -->
				
			<div id = "timelineULbox">
			<ul id="timeline" class="timeline getGBNO">
			<li align="left"><button type="button" class="btn r_btn" id="TLAddBtn2"
						data-toggle="modal" data-target="#registModal">글 쓰기</button></li>
			 <li class="" id="timelinesDiv"><span class="bg-green"></span></li>
			</ul>
			</div>
			<div align="center">
			<i class="fas fa-caret-down" id="morebtn" style="cursor:pointer;font-size:30px"></i>
			</div>
		


		</div>
		<div class="col-sm-4 col-md-4 col-lg-4">
	<!-- 인기글 -->
		<div class="bottom tags-wrap">
			<div class="col-full"align="left">
				<h3><strong>공지사항</strong></h3>
				<hr>
				<table>
				<tr>
					<th>Title</th>
					<th style="width: 80px;"><i class="ion-android-favorite-outline" style="color:red"></i></th>
				</tr>
				<c:forEach items="${notice}" var="boardVO">
				<tr style="height:40px">
					<td><a href='#'>${boardVO.b_title} 
					</a></td>
					<td>${boardVO.total}</td>
				</tr>
			</c:forEach>
			</table>
			</div>
		</div>
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	</div>


	<!-- Modal -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<h3 class="modal-title" style="display:none"></h3>
			<div class="modal-content">
				<div class="modal-header">
				<span style="font-size:20px">글 수정</span>
				
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					
				</div>
				<div class="modal-body" data-g_id>
					
					<div id="TLtext" class="form-control content fileDrop2"
										contenteditable="true" style="width: 100%; height: 500px;"></div>
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="TLModBtn">수정하기</button>
					<button type="button" class="btn btn-danger" id="TLDelBtn">삭제하기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				<textarea id="my-textarea2"  name="b_content"
							style="display: none"></textarea>
				
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div id="registReplyModal" class="modal modal-primary fade"
		role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<h3 class="modal-title" style="display:none"></h3>
			<div class="modal-content"  style="padding:0 15px">
				<div class="modal-header"align="center">
				<span style="font-size:20px">댓글</span>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					
				</div>
				<div class="modal-body" data-gr_id>
					 <input
						class="form-control" type="hidden" placeholder="USER ID"
						id="newReplyWriter"><div id="newReplyText" class="form-control content"
										contenteditable="true" style="width: 100%; height: 100px;"></div>
					<button type="button" class="btn btn-default r_btn" id="replyAddBtn" style="float:right">등록</button>
					<textarea id="my-textarea3" name="b_content"
							style="display: none"></textarea>
					
						
				</div>
				<div id = "timelineULbox2">
				<ul id="timeline2" class="timeline">
					<!-- timeline time label -->
					<li class="time-label" id="repliesDiv"><span class="bg-green">
							</span></li>
				</ul>
				</div>
				
				<div align="center">
			<i class="fas fa-caret-down" id="morebtn2" style="cursor:pointer;font-size:30px"></i>
			</div>

				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div id="modifyReplyModal" class="modal modal-primary fade"
		role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<h3 class="modal-title" style="display:none"></h3>
			<div class="modal-content">
				<div class="modal-header">
					<span style="font-size:20px">댓글 수정</span>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					
				</div>
				<div class="modal-body" data-gr_id>
					<p>
						<div id="replytext" class="form-control content"
										contenteditable="true" style="width: 100%; height: 100px;"></div>
					</p>
					<textarea id="my-textarea4" name="b_content"
							style="display: none"></textarea>
					
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">수정하기</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">삭제하기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>






</section>
<div id="registModal" class="modal modal-primary fade"
						role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
							<h3 class="modal-title" style="display:none"></h3>
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">글쓰기</h4>
								</div>
								<div class="modal-body" data-g_id>
									<label for="exampleInputEmail1">닉네임</label> <input
										class="form-control" type="text" placeholder="USER ID"
										id="newTLWriter" value="${login.u_nickname}"readonly><label
										for="exampleInputEmail1">텍스트</label>
									<div class="form-control content fileDrop"
										contenteditable="true" style="width: 100%; height: 500px;"
										id="newText" data-text="REPLY TEXT"></div>


								</div>
								<div class="modal-footer">

									<button type="button" class="btn r_btn" id="TLAddBtn">등록</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
						
						<textarea id="my-textarea" id="newText" name="b_content"
							style="display: none"></textarea>
					</div>
<!-- /.content -->








<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="timelineLi" data-gb_no={{gb_no}} data-l_user = {{l_user}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item aa">
<div style="background-color:#f6f6f6">
  <div class="time">
	<h5 class="timeline-header"style="margin:0;padding-left:20px"><strong>{{u_nickname}}</strong></h5>
    <i class="fa fa-clock-o"></i>
  </div>                                                    
</div>

<textarea class = "hashtextarea" style = "display:none; width: 100%; height: 200px;">{{gb_content}}</textarea>
<div class="form-control content fileDrop1 timeline-body2 timeline-body" contenteditable="false">
</div>
<div class="timeline-body like" >

	<span class="far fa-heart likebtn"></span>
	<img src = "/resources/nob/images/talkballoon.png" data-toggle="modal" data-target="#registReplyModal" class = "replybtn"></img>
     <a data-u_nickname={{u_nickname}} data-gr_content={{gb_content}} data-target="#" class="modimodi replybtn" style="margin-left:0px"><i class="ion-android-more-vertical"></i></a>
</div>
<div class = "likebox">
<span id = "liketext"> <i class = "fas fa-heart"></i> {{l_total}}명이 좋아합니다. </span>
</div>
   <div class="timeline-footer">
<div class="timeline-body1 timeline-body"><strong><input type "hidden" value = "fake" id = "fake"></strong></div>
    </div>
</div>			
</li>
{{/each}}
</script>



<script id="template2" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-gr_id={{gr_id}} data-l_user={{l_user}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item timeline-item1" >
<div style="background-color:#f9f9f9">
 <div class="time">
	<h5 class="timeline-header"style="margin:0;padding-left:20px"><strong>{{u_nickname}}</strong></h5>
    <i class="fa fa-clock-o"></i>
  </div>   
</div> 
<textarea class = "hashtextarea1" style = "display:none; width: 100%; height: 500px;">{{gr_content}}</textarea>
<div class="form-control content fileDrop5 timeline-body" contenteditable="false" style="height:auto">
</div>	
<div class="timeline-body like2">
	<span class="far fa-heart likebtn2"></span>
<a  data-u_nickname={{u_nickname}} data-gr_content={{gr_content}} data-target="#" class="replybtn modimodi" style="margin-left:25px"><i class="ion-android-more-vertical" ></i></a>
</div>
<div class = "likebox2">
<span id = "liketext2"> <i class = "fas fa-heart"></i> {{l_total}}명이 좋아합니다. </span>

</div>
    <div class="timeline-footer"> 
    </div>
  	<div class="timeline-body1 timeline-body" style="display:none"><input type "hidden" value = "fake" id = "fake"></div>
	
</li>
{{/each}}
</script>

<script id="template3" type="text/x-handlebars-template">
<div id = "imgdiv">
 
<div><a href="{{getLink}}" target = "_blank">
<img src="{{imgsrc}}" class = "imgsrc"></a><a href="{{fullName}}" class="delbtn">
</a></div>

</div>    
</script>

<script id="l_totalTemplate" type="text/x-handlebars-template">
{{#each .}} <i class = "fas fa-heart"></i> {{l_total}}명이 좋아합니다. {{/each}}
</script>





<script>
	var thistext;
	var thistext2;
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	

	function getPage3(pageInfo) {
		console.log(pageInfo);
		$.getJSON(pageInfo, function(data) {

			console.log(data);

			printData3(data.list, $("#timeline"), $('#template'));

		});
	}

	var printData3 = function(timelineArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(timelineArr);

		console.log(html);

		target.append(html);
		
		$(".timeline-item").each(function(){
			console.log("이치 확인");
			var hashtext = $(this).find(".hashtextarea");
			console.log(hashtext.text());
			var hashtextR = hashtext.text();
			
			var content = $(this).find(".fileDrop1");
			
			content.html(hashtextR);
		
			
			
		});
		
		 $(".timelineLi").each(function(){
				
				
				var l_user = $(this).attr('data-l_user');
				console.log(l_user);
				
				if(l_user > 0){
					var boardlikebtn = $(this).find($(".like > span"));
					console.log(boardlikebtn);
					var boardlikebtnclass = boardlikebtn.attr('class');
					console.log(boardlikebtnclass);
					
					boardlikebtn.removeClass("far fa-heart likebtn");
					boardlikebtn.addClass("fas fa-heart likebtn");
				}		
				
			});
		
		

	}

	function getPage(pageInfo) {
		console.log(pageInfo);
		$.getJSON(pageInfo, function(data) {

			console.log(data.list.g_title);
			
			$("#box-title").html();
			printData(data.list, $("#timelinesDiv"), $('#template'));
			

			 
		});
	}

	var printData = function(timelineArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(timelineArr);

		console.log(html);
		$(".timelineLi").remove();
		target.after(html);
	  	
	
	
		
	$(".timeline-item").each(function(){
		console.log("이치 확인");
		var hashtext = $(this).find(".hashtextarea");
		console.log(hashtext.text());
		var hashtextR = hashtext.text();
		
		var content = $(this).find(".fileDrop1");
		
		content.html(hashtextR);
	
		
		
	});
	
 	 $(".timelineLi").each(function(){
		
		
		var l_user = $(this).attr('data-l_user');
		console.log(l_user);
		
		if(l_user > 0){
			var boardlikebtn = $(this).find($(".like > span"));
			console.log(boardlikebtn);
			var boardlikebtnclass = boardlikebtn.attr('class');
			console.log(boardlikebtnclass);
			
			boardlikebtn.removeClass("far fa-heart likebtn");
			boardlikebtn.addClass("fas fa-heart likebtn");
		}		
		
	});
	  

	}

	/* <!-- 2018_06_18 추가 --> */
	function getLike(pageInfo) {
		console.log(pageInfo);
		$.getJSON(pageInfo, function(data) {
			console.log("data 출력 전...");
			console.log("getJson"+data.list);
			l_totalPrintLike(data.list, thistext, $('#l_totalTemplate')); 
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
	var u_no = ${login.u_no};
	var g_id = ${gid};
	var timelinePage = 1;
	
	
	$(document).ready(
			function() {

				$("#searchBtn").on(
						"click",
						function(event) {
							getPage("/groupBoard/"+g_id+"/"+u_no+"/1" 
									+ "?searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput').val()));
						});

				
			});

			var result = '${msg}';
			if (result == 'SUCCESS') {
				alert('처리가 완료되었습니다.');
				}

	$("#timelinesDiv").on("click", function() {
		var g_id = ${gid};
		var u_no = ${login.u_no};
		
		getPage("/groupBoard/" + g_id + "/" + u_no + "/" + 1);
		

	});

	$("#morebtn").on("click", function(event) {
		var u_no = ${login.u_no};
		
		event.preventDefault();

		timelinePage = timelinePage + 1;

		getPage3("/groupBoard/" + g_id + "/" + u_no + "/" + timelinePage);

	});
	
	/* $("#newTLWriter").val(u_nickname); */
	$("#TLAddBtn").on("click", function() {
		  		$("#my-textarea").html($("#newText").html());
		  		var u_no = ${login.u_no};
		  		var TLtextObj = $("#my-textarea");
				var gb_content = TLtextObj.val();
				var g_id = ${gid};
				var h_name = TLtextObj.val();
				console.log("u_no:"+u_no);
				console.log("gb_content:"+gb_content);
				console.log("h_name:"+h_name);
				
				$.ajax({
					type : 'post',
					url : '/groupBoard/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						g_id : g_id,
						u_no : u_no,
						gb_content : gb_content,
						h_name : h_name
					}),
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("등록 되었습니다.");
							timelinePage = 1;
							getPage("/groupBoard/" + g_id + "/" + u_no + "/" + timelinePage);
							TLtitleObj.val("");
							$("#newText").html("");
							
						}
					}
				});

				event.preventDefault();
				var str = "";
				$(".fileDrop #imgdiv .delbtn").each(
						function(index) {
							str += "<input type='hidden' name='files[" + index
									+ "]' value='" + $(this).attr("href")
									+ "'> ";

						});
			
				$("#registModal").append(str);
				$("#registModal").modal('hide');
		

			});

	$("#timeline").on("click", ".timelineLi", function(event) {

		var reply = $(this);
		$("#TLtitle").val(reply.find('.timeline-body1').text());
		$("#my-textarea2").html(reply.find('.hashtextarea').html());
		$("#TLtext").html($("#my-textarea2").text());
		 $(".modal-title").html(reply.attr("data-gb_no")); 

	});

	$("#TLModBtn").on("click", function() {
		$("#my-textarea2").html($("#TLtext").html());
		var u_no = ${login.u_no};
		var gb_no = $(".modal-title").html();
		var g_id = ${gid};
		
		var gb_content = $("#my-textarea2").text();
		var TLtitleObj = $("#TLtitle");
		var gb_title = TLtitleObj.val();
		var h_name = $("#my-textarea2").text();
		console.log(gb_no);
		console.log(gb_title);
		console.log(gb_content);
		console.log(h_name);
		
		$.ajax({
			type : 'put',
			url : '/groupBoard/' + g_id + '/' + timelinePage,

			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				gb_no : gb_no,
				gb_title : gb_title,
				gb_content : gb_content,
				h_name : h_name
			}),
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("수정 되었습니다.");
					getPage("/groupBoard/" + g_id + "/" + u_no + "/" + timelinePage);

				}
			}
		});
	});

	$("#TLDelBtn").on("click", function() {
		var g_id = ${gid};
		var gb_no = $(".modal-title").html();
		var u_no = ${login.u_no};
		$.ajax({
			type : 'delete',
			url : '/groupBoard/' + g_id + '/' + gb_no,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					getPage("/groupBoard/" + g_id + "/" + u_no + "/" + timelinePage);
				}
			}
		});
	});

	$(function() {
		
		$("#timeline").on("click", ".likebtn", function(event) {
			var boardlikebtnclass = $(this).attr('class');
			console.log(boardlikebtnclass);
			var that = $(this);
			
			if(boardlikebtnclass == 'far fa-heart likebtn'){
				
				var timelineLi = $(this).parents(".timelineLi");
				
				console.log(timelineLi);
				
				
				var gb_no = timelineLi.attr("data-gb_no");
				console.log(gb_no);
				var l_bno = gb_no;
				var tbl_name = "tbl_group_board";
				thistext = timelineLi.find('#liketext');
				var u_no = ${login.u_no};
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
							
							that.removeClass("far fa-heart likebtn");
						 	that.addClass("fas fa-heart likebtn");  

							
						}
						
					}
				});
				
			
				
			}
			
		 	if(boardlikebtnclass == 'fas fa-heart likebtn'){

		 		var timelineLi = that.parents(".timelineLi");
				console.log(timelineLi);
				
				var u_no = ${login.u_no};
				var gb_no = timelineLi.attr("data-gb_no");
				console.log(gb_no);
				var l_bno = gb_no; 
				var tbl_name = "tbl_group_board";
				thistext = timelineLi.find('#liketext');
				/* var u_no = 1; */
				$.ajax({
					type : 'delete',
					url : '/like/'+tbl_name+'/'+l_bno+'/'+u_no,
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
							getLike("/like/" + tbl_name + "/" + l_bno + "");
							
							that.removeClass("fas fa-heart likebtn");
						 	that.addClass("far fa-heart likebtn");  
							
						}
						
					}
				});
			}
		});

	});

	var gb_no;
	
	var u_no = ${login.u_no};
	$("#timeline").on("click", ".timelineLi", function(event) {
		
		var reply = $(this);

		gb_no = reply.attr("data-gb_no");

		$("#repliesDiv").click();
		$("#newReplyWriter").val(u_no);
	});

	var replyPage = 1;

	function getPage4(pageInfo) {
		console.log(pageInfo);
		$.getJSON(pageInfo, function(data) {

			console.log(data);

			printData4(data.list, $("#timeline2"), $('#template2'));

		});
		
		
		
	}

	var printData4 = function(timelineArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(timelineArr);

		console.log(html);

		target.append(html);
		
		$(".timeline-item1").each(function(){
			console.log("이치 확인");
			var hashtext = $(this).find(".hashtextarea1");
			console.log(hashtext.text());
			var hashtextR = hashtext.text();
			
			var content = $(this).find(".fileDrop5");
			
			content.html(hashtextR);
		
			
			
		});
		 $(".replyLi").each(function(){
				
				
				var l_user = $(this).attr('data-l_user');
				console.log(l_user);
				
				if(l_user > 0){
					var boardlikebtn = $(this).find($(".like2 > span"));
					console.log(boardlikebtn);
					var boardlikebtnclass = boardlikebtn.attr('class');
					console.log(boardlikebtnclass);
					
					boardlikebtn.removeClass("far fa-heart likebtn2");
					boardlikebtn.addClass("fas fa-heart likebtn2");
				}		
				
			});

	}

	$("#morebtn2").on("click", function(event) {

		event.preventDefault();

		replyPage = replyPage + 1;

		getPage4("/groupReplies/" + gb_no + "/" + u_no +"/" + replyPage);

	});
	var l_btnCheck = function(){
		console.log("BTBT");
		$(".timelineLi").each(function(){
			
			
			var l_user = $(this).attr('data-l_user');
			console.log(l_user);
			
			if(l_user > 0){
				var boardlikebtn = $(this).find($(".like2 > span"));
				console.log(boardlikebtn);
				var boardlikebtnclass = boardlikebtn.attr('class');
				console.log(boardlikebtnclass);
				
				boardlikebtn.removeClass("far fa-heart likebtn2");
				boardlikebtn.addClass("fas fa-heart likebtn2");
			}		
			
		});
		
	}
	var printData2 = function(replyArr2, target2, templateObject2) {

		var template2 = Handlebars.compile(templateObject2.html());

		var html2 = template2(replyArr2);

		console.log(html2);
		$(".replyLi").remove();
		target2.after(html2);
		
		$(".timeline-item1").each(function(){
			console.log("이치 확인");
			var hashtext = $(this).find(".hashtextarea1");
			console.log(hashtext.text());
			var hashtextR = hashtext.text();
			var content = $(this).find(".fileDrop5");
			content.html(hashtextR);
			
		});
		
		 $(".replyLi").each(function(){
				
				
				var l_user = $(this).attr('data-l_user');
				console.log(l_user);
				
				if(l_user > 0){
					var boardlikebtn = $(this).find($(".like2 > span"));
					console.log(boardlikebtn);
					var boardlikebtnclass = boardlikebtn.attr('class');
					console.log(boardlikebtnclass);
					
					boardlikebtn.removeClass("far fa-heart likebtn2");
					boardlikebtn.addClass("fas fa-heart likebtn2");
				}		
				
			});

	}

	function getPage2(pageInfo) {
		console.log(pageInfo);
		$.getJSON(pageInfo, function(data) {
			console.log(data);
			printData2(data.list, $("#repliesDiv"), $('#template2'));

		});
	}

	$("#repliesDiv").on("click", function() {
		var u_no = ${login.u_no};
		console.log("리플 버튼 클릭");
		/* if ($(".timeline li").size() > 1) {
			console.log("실패");
			return;
		}  */
		console.log("성공");
		getPage2("/groupReplies/" + gb_no + "/" + u_no +"/" + replyPage);

	});

	$("#replyAddBtn").on("click", function() {
		$("#my-textarea3").html($("#newReplyText").html());
		console.log($("#my-textarea3").html());
		var u_no = ${login.u_no};
		
		var replytextObj = $("#my-textarea3");
		var gr_content = replytextObj.text();
		var h_name = replytextObj.text();
		$.ajax({
			type : 'post',
			url : '/groupReplies/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				gb_no : gb_no,
				u_no : u_no,
				gr_content : gr_content,
				h_name : h_name

			}),
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage2("/groupReplies/" + gb_no + "/" + u_no +"/" + replyPage);
					replyerObj.val("");
					$("#newReplyText").html("");
					$("#my-textarea3").html("");
					$("#repliesDiv").click();
					$("#repliesDiv").click();
					$("#repliesDiv").click();
					//	replycntplus();
				}
			}
		});

	});

	$("#timeline2").on("click", ".replyLi", function(event) {

		var reply = $(this);
		console.log(reply.find('.timeline-body').html());
		var htmlthing = reply.find('.timeline-body').html();
		console.log(htmlthing);
		$("#replytext").html(htmlthing);
		$(".modal-title").html(reply.attr("data-gr_id"));

	});

	$("#replyModBtn").on("click", function() {
		$("#my-textarea4").html($("#replytext").html());
		var gr_id = $(".modal-title").html();
		var gr_content = $("#my-textarea4").text();
		var h_name = $("#my-textarea4").text();
		var u_no = ${login.u_no};
		
		
		$.ajax({
			type : 'put',
			url : '/groupReplies/' + gr_id,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				gr_content : gr_content,
				h_name : h_name
			}),
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("수정 되었습니다.");
					getPage2("/groupReplies/" + gb_no + "/" + u_no +"/" + replyPage);
					$("#repliesDiv").click();
					$("#repliesDiv").click();
					$("#repliesDiv").click();

				}
			}
		});
	});

	$("#replyDelBtn").on("click", function() {
		var u_no = ${login.u_no};
		var gr_id = $(".modal-title").html();
		var gr_content = $("#replytext").val();

		$.ajax({
			type : 'delete',
			url : '/groupReplies/' + gr_id,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					getPage2("/groupReplies/" + gb_no + "/" + u_no +"/" + replyPage);
				}
			}
		});
	});

	var printLike2 = function(timelineArr2, target2, templateObject2) {

		var template2 = Handlebars.compile(templateObject2.html());

		var html2 = template2(timelineArr2);
		console.log("printLike실행");
		console.log(html2);
		console.log(target2);
		target2.html(html2);

	}

	function getLike2(pageInfo) {
		console.log(pageInfo);
		$.getJSON(pageInfo, function(data) {
			console.log("data 출력 전...");
			console.log(data.list);
			
			printLike2(data.list, thistext2, $('#l_totalTemplate')); 

		});
	}

	$(function() {
		$("#timeline2").on("click", ".likebtn2", function(event) {
			var replylikebtnclass = $(this).attr('class');
			console.log(replylikebtnclass);
			var that = $(this);
			
			if(replylikebtnclass == 'far fa-heart likebtn2'){
				
				var replyLi = that.parents(".replyLi");
				
				console.log(replyLi);
				
				
				var gr_id = replyLi.attr("data-gr_id");
				console.log(gb_no);
				var l_bno = gr_id;
				var tbl_name = "tbl_group_reply";
				thistext2 = replyLi.find('#liketext2');
				var u_no = ${login.u_no};
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
							getLike2("/like/" + tbl_name + "/" + l_bno);

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
				
				
				var gr_id = replyLi.attr("data-gr_id");
				console.log(gb_no);
				var l_bno = gr_id;
				var tbl_name = "tbl_group_reply";
				thistext2 = replyLi.find('#liketext2');
			
				$.ajax({
					type : 'delete',
					url : '/like/'+tbl_name+'/'+l_bno+'/'+u_no,
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
							getLike2("/like/" + tbl_name + "/" + l_bno);
							
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
	var template = Handlebars.compile($("#template3").html());

	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();

		var files = event.originalEvent.dataTransfer.files;

		var file = files[0];

		var formData = new FormData();

		formData.append("file", file);

		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);

				var html = template(fileInfo);

				$(".fileDrop").append(html);
			}
		});
	});
</script>


<script type="text/javascript">
	function doPaste2() {
		if (savedSelection2) {
			restoreSelection2(document.getElementById("newText"),
					savedSelection2);
		}
	}
	var saveSelection2, restoreSelection2;

	if (window.getSelection && document.createRange) {
		saveSelection2 = function(containerEl, len) {
			var range = window.getSelection().getRangeAt(0);
			var preSelectionRange = range.cloneRange();
			preSelectionRange.selectNodeContents(containerEl);
			preSelectionRange.setEnd(range.startContainer, range.startOffset);
			var start = preSelectionRange.toString().length + len;

			return {
				start : start,
				end : start + range.toString().length
			};
		};

		restoreSelection2 = function(containerEl, savedSel) {
			var charIndex = 0, range = document.createRange();
			range.setStart(containerEl, 0);
			range.collapse(true);
			var nodeStack = [ containerEl ], node, foundStart = false, stop = false;

			while (!stop && (node = nodeStack.pop())) {
				if (node.nodeType == 3) {
					var nextCharIndex = charIndex + node.length;
					if (!foundStart && savedSel.start >= charIndex
							&& savedSel.start <= nextCharIndex) {
						range.setStart(node, savedSel.start - charIndex);
						foundStart = true;
					}
					if (foundStart && savedSel.end >= charIndex
							&& savedSel.end <= nextCharIndex) {
						range.setEnd(node, savedSel.end - charIndex);
						stop = true;
					}
					charIndex = nextCharIndex;
				} else {
					var i = node.childNodes.length;
					while (i--) {
						nodeStack.push(node.childNodes[i]);
					}
				}
			}

			var sel = window.getSelection();
			sel.removeAllRanges();
			sel.addRange(range);
		}
	} else if (document.selection) {
		saveSelection2 = function(containerEl, len) {
			var selectedTextRange = document.selection.createRange();
			var preSelectionTextRange = document.body.createTextRange();
			preSelectionTextRange.moveToElementText(containerEl);
			preSelectionTextRange.setEndPoint("EndToStart", selectedTextRange);
			var start = preSelectionTextRange.text.length + len;

			return {
				start : start,
				end : start + selectedTextRange.text.length
			}
		};

		restoreSelection2 = function(containerEl, savedSel) {
			var textRange = document.body.createTextRange();
			textRange.moveToElementText(containerEl);
			textRange.collapse(true);
			textRange.moveEnd("character", savedSel.end);
			textRange.moveStart("character", savedSel.start);
			textRange.select();
		};
	}

	var savedSelection2;
	function doSave2(len) {
		savedSelection2 = saveSelection2(document.getElementById("newText"),
				len);
		console.log(savedSelection2);
	}

	$(function() {
		$(".fileDrop").keypress(function(event) {
			if (event.keyCode == '32') {
				console.log($(".fileDrop").html());
				if (($('.fileDrop').html()).match('#')) {
					console.log("#체크");
					var txt = ($(".fileDrop").html());
					var orgtag = [];
					var tags = [];
					txt.replace(/#[^#\s,;]+/gm, function(tag) {
						orgtag.push(tag);
				      	tags.push('<span contenteditable="false"><a href = "/"  class = "hash">＃'+ tag.substr(1)+ '</a></span>&nbsp&nbsp');
						console.log("orgtag....");
						console.log(orgtag);

						$.each(orgtag, function(index, item) {
							console.log(item);	
							});
						console.log("tags....");
						console.log(tags);

						var len = tag.length + 10;
							console.log(len);
							doSave2(2);
				$.each(tags, function(index, item) {
							console.log(item);
							var a = ($(".fileDrop").html()).replace(""	+ orgtag[index]	+ "", "" + tags[index] + "")
							$(".fileDrop").html(a);
							console.log(($(".fileDrop").html()).replace(""+ orgtag[index]+ "",""+ tags[index]+ ""));
																			console.log("tagsIndex="+ tags[index]);
																			console.log("orgtag="+ orgtag[index]);
																			});
								doPaste2();

							});
									/* nth-child(index) ,tags[index]
									$("#b_content").child */

						}

					}
				});

	});
</script>


<script type="text/javascript">
	function doPaste3() {
		if (savedSelection3) {
			restoreSelection3(document.getElementById("TLtext"),
					savedSelection3);
		}
	}
	var saveSelection3, restoreSelection3;

	if (window.getSelection && document.createRange) {
		saveSelection3 = function(containerEl, len) {
			var range = window.getSelection().getRangeAt(0);
			var preSelectionRange = range.cloneRange();
			preSelectionRange.selectNodeContents(containerEl);
			preSelectionRange.setEnd(range.startContainer, range.startOffset);
			var start = preSelectionRange.toString().length + len;

			return {
				start : start,
				end : start + range.toString().length
			};
		};

		restoreSelection3 = function(containerEl, savedSel) {
			var charIndex = 0, range = document.createRange();
			range.setStart(containerEl, 0);
			range.collapse(true);
			var nodeStack = [ containerEl ], node, foundStart = false, stop = false;

			while (!stop && (node = nodeStack.pop())) {
				if (node.nodeType == 3) {
					var nextCharIndex = charIndex + node.length;
					if (!foundStart && savedSel.start >= charIndex
							&& savedSel.start <= nextCharIndex) {
						range.setStart(node, savedSel.start - charIndex);
						foundStart = true;
					}
					if (foundStart && savedSel.end >= charIndex
							&& savedSel.end <= nextCharIndex) {
						range.setEnd(node, savedSel.end - charIndex);
						stop = true;
					}
					charIndex = nextCharIndex;
				} else {
					var i = node.childNodes.length;
					while (i--) {
						nodeStack.push(node.childNodes[i]);
					}
				}
			}

			var sel = window.getSelection();
			sel.removeAllRanges();
			sel.addRange(range);
		}
	} else if (document.selection) {
		saveSelection3 = function(containerEl, len) {
			var selectedTextRange = document.selection.createRange();
			var preSelectionTextRange = document.body.createTextRange();
			preSelectionTextRange.moveToElementText(containerEl);
			preSelectionTextRange.setEndPoint("EndToStart", selectedTextRange);
			var start = preSelectionTextRange.text.length + len;

			return {
				start : start,
				end : start + selectedTextRange.text.length
			}
		};

		restoreSelection3 = function(containerEl, savedSel) {
			var textRange = document.body.createTextRange();
			textRange.moveToElementText(containerEl);
			textRange.collapse(true);
			textRange.moveEnd("character", savedSel.end);
			textRange.moveStart("character", savedSel.start);
			textRange.select();
		};
	}

	var savedSelection3;
	function doSave3(len) {
		savedSelection3 = saveSelection3(document.getElementById("TLtext"),
				len);
		console.log(savedSelection3);
	}

	$(function() {

		/*      
		     $("#TLAddBtn").click(function(){
		       
		       
		     });
		     
		

		 */

		$(".fileDrop2").keypress(function(event) {
			if (event.keyCode == '32') {
				console.log($(".fileDrop2").html());
				if (($('.fileDrop2').html()).match('#')) {
					console.log("#체크");
					var txt = ($(".fileDrop2").html());
					var orgtag = [];
					var tags = [];
					txt.replace(/#[^#\s,;]+/gm, function(tag) {
						orgtag.push(tag);
				      	tags.push('<span contenteditable="false"><a href = "/"  class = "hash">＃'+ tag.substr(1)+ '</a></span>&nbsp&nbsp');
						console.log("orgtag....");
						console.log(orgtag);

						$.each(orgtag, function(index, item) {
							console.log(item);	
							});
						console.log("tags....");
						console.log(tags);

						var len = tag.length + 10;
							console.log(len);
							doSave3(2);
				$.each(tags, function(index, item) {
							console.log(item);
							var a = ($(".fileDrop2").html()).replace(""	+ orgtag[index]	+ "", "" + tags[index] + "")
							$(".fileDrop2").html(a);
							console.log(($(".fileDrop2").html()).replace(""+ orgtag[index]+ "",""+ tags[index]+ ""));
																			console.log("tagsIndex="+ tags[index]);
																			console.log("orgtag="+ orgtag[index]);
																			});
								doPaste3();

							});
									/* nth-child(index) ,tags[index]
									$("#b_content").child */

						}

					}
				});

	});
</script>


<script type="text/javascript">
	function doPaste4() {
		if (savedSelection4) {
			restoreSelection4(document.getElementById("newReplyText"),
					savedSelection4);
		}
	}
	var saveSelection4, restoreSelection4;

	if (window.getSelection && document.createRange) {
		saveSelection4 = function(containerEl, len) {
			var range = window.getSelection().getRangeAt(0);
			var preSelectionRange = range.cloneRange();
			preSelectionRange.selectNodeContents(containerEl);
			preSelectionRange.setEnd(range.startContainer, range.startOffset);
			var start = preSelectionRange.toString().length + len;

			return {
				start : start,
				end : start + range.toString().length
			};
		};

		restoreSelection4 = function(containerEl, savedSel) {
			var charIndex = 0, range = document.createRange();
			range.setStart(containerEl, 0);
			range.collapse(true);
			var nodeStack = [ containerEl ], node, foundStart = false, stop = false;

			while (!stop && (node = nodeStack.pop())) {
				if (node.nodeType == 3) {
					var nextCharIndex = charIndex + node.length;
					if (!foundStart && savedSel.start >= charIndex
							&& savedSel.start <= nextCharIndex) {
						range.setStart(node, savedSel.start - charIndex);
						foundStart = true;
					}
					if (foundStart && savedSel.end >= charIndex
							&& savedSel.end <= nextCharIndex) {
						range.setEnd(node, savedSel.end - charIndex);
						stop = true;
					}
					charIndex = nextCharIndex;
				} else {
					var i = node.childNodes.length;
					while (i--) {
						nodeStack.push(node.childNodes[i]);
					}
				}
			}

			var sel = window.getSelection();
			sel.removeAllRanges();
			sel.addRange(range);
		}
	} else if (document.selection) {
		saveSelection4 = function(containerEl, len) {
			var selectedTextRange = document.selection.createRange();
			var preSelectionTextRange = document.body.createTextRange();
			preSelectionTextRange.moveToElementText(containerEl);
			preSelectionTextRange.setEndPoint("EndToStart", selectedTextRange);
			var start = preSelectionTextRange.text.length + len;

			return {
				start : start,
				end : start + selectedTextRange.text.length
			}
		};

		restoreSelection4 = function(containerEl, savedSel) {
			var textRange = document.body.createTextRange();
			textRange.moveToElementText(containerEl);
			textRange.collapse(true);
			textRange.moveEnd("character", savedSel.end);
			textRange.moveStart("character", savedSel.start);
			textRange.select();
		};
	}

	var savedSelection4;
	function doSave4(len) {
		savedSelection4 = saveSelection4(document.getElementById("newReplyText"),
				len);
		console.log(savedSelection4);
	}

	$(function() {

		/*      
		     $("#TLAddBtn").click(function(){
		       
		       
		     });
		     
		

		 */

		$("#newReplyText").keypress(function(event) {
			if (event.keyCode == '32') {
				console.log($("#newReplyText").html());
				if (($('#newReplyText').html()).match('#')) {
					console.log("#체크");
					var txt = ($("#newReplyText").html());
					var orgtag = [];
					var tags = [];
					txt.replace(/#[^#\s,;]+/gm, function(tag) {
						orgtag.push(tag);
				      	tags.push('<span contenteditable="false"><a href = "/"  class = "hash">＃'+ tag.substr(1)+ '</a></span>&nbsp&nbsp');
						console.log("orgtag....");
						console.log(orgtag);

						$.each(orgtag, function(index, item) {
							console.log(item);	
							});
						console.log("tags....");
						console.log(tags);

						var len = tag.length + 10;
							console.log(len);
							doSave4(2);
				$.each(tags, function(index, item) {
							console.log(item);
							var a = ($("#newReplyText").html()).replace(""	+ orgtag[index]	+ "", "" + tags[index] + "")
							$("#newReplyText").html(a);
							console.log(($("#newReplyText").html()).replace(""+ orgtag[index]+ "",""+ tags[index]+ ""));
																			console.log("tagsIndex="+ tags[index]);
																			console.log("orgtag="+ orgtag[index]);
																			});
								doPaste4();

							});
									/* nth-child(index) ,tags[index]
									$("#b_content").child */

						}

					}
				});

	});
</script>

<script type="text/javascript">

	function doPaste5() {
		if (savedSelection5) {
			restoreSelection5(document.getElementById("replytext"),
					savedSelection5);
		}
	}
	var saveSelection5, restoreSelection5;

	if (window.getSelection && document.createRange) {
		saveSelection5 = function(containerEl, len) {
			var range = window.getSelection().getRangeAt(0);
			var preSelectionRange = range.cloneRange();
			preSelectionRange.selectNodeContents(containerEl);
			preSelectionRange.setEnd(range.startContainer, range.startOffset);
			var start = preSelectionRange.toString().length + len;

			return {
				start : start,
				end : start + range.toString().length
			};
		};

		restoreSelection5 = function(containerEl, savedSel) {
			var charIndex = 0, range = document.createRange();
			range.setStart(containerEl, 0);
			range.collapse(true);
			var nodeStack = [ containerEl ], node, foundStart = false, stop = false;

			while (!stop && (node = nodeStack.pop())) {
				if (node.nodeType == 3) {
					var nextCharIndex = charIndex + node.length;
					if (!foundStart && savedSel.start >= charIndex
							&& savedSel.start <= nextCharIndex) {
						range.setStart(node, savedSel.start - charIndex);
						foundStart = true;
					}
					if (foundStart && savedSel.end >= charIndex
							&& savedSel.end <= nextCharIndex) {
						range.setEnd(node, savedSel.end - charIndex);
						stop = true;
					}
					charIndex = nextCharIndex;
				} else {
					var i = node.childNodes.length;
					while (i--) {
						nodeStack.push(node.childNodes[i]);
					}
				}
			}

			var sel = window.getSelection();
			sel.removeAllRanges();
			sel.addRange(range);
		}
	} else if (document.selection) {
		saveSelection5 = function(containerEl, len) {
			var selectedTextRange = document.selection.createRange();
			var preSelectionTextRange = document.body.createTextRange();
			preSelectionTextRange.moveToElementText(containerEl);
			preSelectionTextRange.setEndPoint("EndToStart", selectedTextRange);
			var start = preSelectionTextRange.text.length + len;

			return {
				start : start,
				end : start + selectedTextRange.text.length
			}
		};

		restoreSelection5 = function(containerEl, savedSel) {
			var textRange = document.body.createTextRange();
			textRange.moveToElementText(containerEl);
			textRange.collapse(true);
			textRange.moveEnd("character", savedSel.end);
			textRange.moveStart("character", savedSel.start);
			textRange.select();
		};
	}

	var savedSelection5;
	function doSave5(len) {
		savedSelection5 = saveSelection5(document.getElementById("replytext"),
				len);
		console.log(savedSelection5);
	}

	$(function() {

		/*      
		     $("#TLAddBtn").click(function(){
		       
		       
		     });
		     
		

		 */

		$("#replytext").keypress(function(event) {
			if (event.keyCode == '32') {
				console.log($("#replytext").html());
				if (($('#replytext').html()).match('#')) {
					console.log("#체크");
					var txt = ($("#replytext").html());
					var orgtag = [];
					var tags = [];
					txt.replace(/#[^#\s,;]+/gm, function(tag) {
						orgtag.push(tag);
				      	tags.push('<span contenteditable="false"><a href = "/"  class = "hash">＃'+ tag.substr(1)+ '</a></span>&nbsp&nbsp');
						console.log("orgtag....");
						console.log(orgtag);

						$.each(orgtag, function(index, item) {
							console.log(item);	
							});
						console.log("tags....");
						console.log(tags);

						var len = tag.length + 10;
							console.log(len);
							doSave5(2);
				$.each(tags, function(index, item) {
							console.log(item);
							var a = ($("#replytext").html()).replace(""	+ orgtag[index]	+ "", "" + tags[index] + "")
							$("#replytext").html(a);
							console.log(($("#replytext").html()).replace(""+ orgtag[index]+ "",""+ tags[index]+ ""));
																			console.log("tagsIndex="+ tags[index]);
																			console.log("orgtag="+ orgtag[index]);
																			});
								doPaste5();

							});
									/* nth-child(index) ,tags[index]
									$("#b_content").child */

						}

					}
				});

	});
</script>
<script>
	$(function() {
		$("#timelinesDiv").click();
		l_btnCheck();
		
		
		$("#timeline2").on("click", ".modimodi", function(){
			console.log("모디모디클릭2");
			var u_nickname =$(this).attr("data-u_nickname");
			var gr_content= $(this).attr("data-gr_content");
			var myNickname = "${login.u_nickname}";
			console.log(gr_content);
			 /* $("#modifyModal").modal("show");  */
			console.log(u_nickname);
			console.log(myNickname);
			if(u_nickname == myNickname){
				$("#replytext").html(gr_content);
				$("#modifyReplyModal").modal("show");
				console.log("모디모디클릭2");
			}	
			
		});
		$("#timeline").on("click", ".modimodi", function(){
			console.log("모디모디클릭");
			var u_nickname =$(this).attr("data-u_nickname");
			var gr_content= $(this).attr("data-gr_content");
			var myNickname = "${login.u_nickname}";
			 /* $("#modifyModal").modal("show");  */
			console.log(u_nickname);
			console.log(myNickname);
			console.log(gr_content);
			if(u_nickname == myNickname){
				/* $("#replytext").val(gr_content); */
				$("#modifyModal").modal("show");
				console.log("모디모디클릭");
			}	
			
		});
		
	});
</script>


<%@include file="../include/footer.jsp"%>

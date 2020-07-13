<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
 <c:if test="${empty login}">
       	<script>
       		alert("로그인을 해주세요.");
       		location.href="/main/login";
       	</script>
       </c:if>
<style>
			section {
				color: black;
				font-size: 13px;
				font-family: 'nanum gothic', sans-serif;
				text-align: center;
			}
			.calorie{
				text-decoration: underline;
				display: inline-block;
				cursor: pointer;
			}
			.show{
				display:block;
			}
			#list{
				display:none;
			}
			#modalbody2{
				display:none;
			}
			.error{
				border-color:red !important;
			}
		</style>
		<script>
		var result='${msg}';
		if(result.length>0)
			alert(result);
		</script>
		
<!-- 툴팁삽입용 js-->
<script src="/resources/nob/js/service/calorie.js"></script>
<!-- 툴팁적용용 js-->
<script src="/resources/nob/js/service/tooltip.js"></script>
<!-- 2018_06_15 추가 -->
 <style>
.fileDrop {
	width: 100%;
	height:500px;

}
.content{
	overflow: scroll;
	text-align: left;
	
}
</style>

<!-- Main content -->
    <!-- cal Modal -->
    <div id="myModal0" class="modal fade" role="dialog">
        <div class="modal-dialog">
          <!-- Modal content-->
          <div class="modal-content">              
             <div class="modal-body">
                 <form onsubmit="return false">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="검색" name="keyword" id="keyword">
						<div class="input-group-btn">
						<button class="btn btn-default" type="button" id="btn">
							<i class="fas fa-search"></i>
						</button>
						</div>
					</div>
				</form>
				<table id="list" class="table table-striped">
					<tr><th>식품명</th><th>1회 제공량(g)</th><th>칼로리(kcal)</th><th>선택</th></tr>
					<tbody id="listbody"></tbody>
				</table>
					<form id="modalbody2">
				<div class="box-body" >
                 	<div class="form-group row">
						<div class="col-xs-6">
							<label>음식명</label>
							<input class="form-control" id="calName" type="text" readonly="readonly">
						</div>
						<div class="col-xs-6">
							<label for="word">키워드</label>
							<input class="form-control" id="calWord" type="text">
						</div>
						<input type="hidden" id="caltemp">
					</div>
				</div>
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="calAdd">추가</button>
				</div>
					</form>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
             </div>
         	</div>
         </div>
     </div>	
<section  class="s-content s-content--narrow container">
		<!-- left column -->
		<div class="col-sm-8 col-md-8 col-lg-8">
			<!-- general form elements -->
			<div class="box box-primary">
		
				<div class="col-sm-12 col-md-12 col-lg-12">
				<div style="border:solid 1px #dedede;height:200px;width:100%"><img src="/resources/nob/images/minjung/c.jpg" style="width:100%;height:100%"></div> 
				</div>	<hr>
				<!-- <h3 class="box-title" style="text-align:left">글쓰기</h3> -->
				
				
				<!-- /.box-header -->

<form id='registerForm' role="form" method="post">
<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					<input type='hidden' id="login. u_no" name='u_no' value="${login.u_no}">
					
<div class="col-sm-12 col-md-12 col-lg-12" style="position:reletive;float:left">
	<table class="table table-boardered">
			<tr style="height:30px;">
				<th style="width:30px; background-color:#F5F5F5; vertical-align:middle" class="al_center">
					<label for="exampleInputEmail1" style="text-align:center">카테고리</label>
				</th>
				<th style="width:60px;">
					<select style="float:left;height:35px; border:solid 1px #C7C7C7;padding:0;" name="tbl_name2" id="select_tbl_name">
					<option value="tbl_tipboard" <c:out value="${tbl_name eq 'tbl_tipboard' ? 'selected':''}"/>>
					팁노하우</option> 
					<option value="tbl_stiboard" <c:out value="${tbl_name eq 'tbl_stiboard' ? 'selected':''}"/>>
					자극사진</option>
					<option value="tbl_freeboard" <c:out value="${tbl_name eq 'tbl_freeboard' ? 'selected':''}"/>>
					자유게시판</option>
					<option value="tbl_qaboard" <c:out value="${tbl_name eq 'tbl_qaboard' ? 'selected':''}"/>>
					QA </option>
					</select>
					<select style="float:left;height:35px;border:solid 1px #C7C7C7;padding:0;" name="b_category" id="select_category">
						<option value=" ">카테고리 선택</option> 
						<c:if test = "${tbl_name eq 'tbl_stiboard'}">
						<option value='후기'>후기</option>
						<option value='body'>body</option>
						<option value='before/after'>before/after</option>
						</c:if>
					<c:if test = "${tbl_name eq 'tbl_tipboard'}">
					<option value='컬럼'>컬럼</option>
					<option value='다이어트'>다이어트</option>
					<option value='식단/레시피'>식단/레시피</option>
					</c:if>
					</select>
					</th>
				</tr>
				<tr >
				<td style="width:30px; background-color:#F5F5F5;" class="al_center">
						<label for="exampleInputEmail1" style="text-align:center">제목</label>
				</td>
				<th>
					<input type="text" name='b_title' class="form-control" style="height:20px;border:solid 1px #C7C7C7">
				</th>
				</tr>
			</table>
			</div>
			<div class="box-body" style="padding: 0 20px">


					
						<!-- 2018_06_14 수정 -->
			<table class="table table-boardered">
			<tr style="height:40px;">
				<th style="background-color:#F5F5F5;height:40px;">
				<a href="#myModal0" class="btn btn-success" data-toggle="modal" onclick="doSave(); return false" style="background-color:#BFBFBF;float:right;border:#BFBFBF;height:40px">칼로리</a>
			</th>
			</tr>
			<tr>
			<th>
			<div class="form-control content fileDrop" contenteditable="true" style= "width: 100%; height: 500px;" id = "b_content" >
							</div>
			</th>
			</tr>
			</table>
						<input type="hidden"
								name="u_no2" class="form-control" value='${login.u_nickname}' readonly="readonly">
						<input
								type="hidden" name="b_category" class="form-control">
					</div>
					<!-- /.box-body -->

					<div class="box-footer" style="float:none;text-align:center;padding-bottom:50px" align=center>
			
						<textarea id="my-textarea" name = "b_content" style = "display:none"></textarea>
						<textarea id="hashtagArea" name="h_name" style = "display:none"></textarea>
					
						<button type="submit" id = "test" class="btn btn-default" style="float:none;background-color:#EB4B56;color:white;">확인</button>
						<button type="reset" id = "reset" class="btn btn-default" style="float:none;background-color:#F2F2F2;border:#F2F2F2;color:#898989">취소</button>
						
					</div>
				</form>
			</div>
		</div>
		
		
		<div class="col-sm-4 col-md-4 col-lg-4" style="padding-top : 50px">
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
				<c:forEach items="${like}" var="boardVO">
				<tr style="height:40px">
					<td><a href='#'>${boardVO.b_title} 
					</a></td>
					<td>${boardVO.total}</td>
				</tr>
			</c:forEach>
			</table>
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
</section>
<!-- /.content -->






<!-- 2018_06_14 추가 -->
<script type="text/javascript" src="/resources/nob/js/upload.js"></script>


<!-- 2018_06_14 수정 -->
<script id="template" type="text/x-handlebars-template">
<span id = "imgdiv">
<a href="{{fullName}}" class="delbtn"></a>
<a href="{{getLink}}" target = "_blank">
<img src="{{imgsrc}}">
</a>
</span> 
</script>    


<!-- 2018_06_14 추가 -->
<script>
$(document).ready(function(){
var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];

	var formData = new FormData();
	
	formData.append("file", file);	
	
	
	$.ajax({
		  url: '/uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  
			  var html = template(fileInfo);
			  
			  $(".fileDrop").append(html);
		  }
		});	
});


$("#registerForm").submit(function(event){
	event.preventDefault();
	
	var that = $(this);
	
	var str ="";
	$(".fileDrop .imgdiv .delbtn").each(function(index){
		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	});
	 str += "<input type='hidden' name='thumbnailimage' value='"+ $("#registerForm  #imgdiv  img:first-child").attr("src") +"'> ";
	that.append(str);

	that.get(0).submit();
});
})

</script>


<!-- HASH TEST -->


<!-- 2018_06_14 추가 -->
<script type="text/javascript">
function doPaste2(){
	if (savedSelection2) {
		restoreSelection2(document.getElementById("b_content"),
				savedSelection2);
	}
}
var saveSelection2, restoreSelection2;

if (window.getSelection && document.createRange) {
	saveSelection2 = function(containerEl,len) {
		var range = window.getSelection().getRangeAt(0);
		var preSelectionRange = range.cloneRange();
		preSelectionRange.selectNodeContents(containerEl);
		preSelectionRange.setEnd(range.startContainer, range.startOffset);
		var start = preSelectionRange.toString().length+len;

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
	saveSelection2 = function(containerEl,len) {
		var selectedTextRange = document.selection.createRange();
		var preSelectionTextRange = document.body.createTextRange();
		preSelectionTextRange.moveToElementText(containerEl);
		preSelectionTextRange.setEndPoint("EndToStart", selectedTextRange);
		var start = preSelectionTextRange.text.length+len;

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
	savedSelection2 = saveSelection2(document.getElementById("b_content"),len);
	console.log(savedSelection);
}

    $(function(){
    	
    	
    	
    	$("#test").click(function(){
			
    		/* $("#tbl_name").val($("#select_tbl_name option:selected").val()); */ 
        	$("#my-textarea").html($("#b_content").html());
        	$("#hashtagArea").html($("#b_content").html());
    	});
    	
    	
   

    	
    	$(".fileDrop").keypress(function(event) {
    		  if (event.keyCode == '32') {
    			console.log($(".fileDrop").html());
    			if(($('.fileDrop').html()).match('#')){
    				console.log("#체크");
    		    	 var txt = ($(".fileDrop").html());
    		    	 var orgtag = []; 
    		    	 var tags = [];
    		    	  txt.replace(/#[^#\s,;]+/gm, function(tag) {
    		    	      orgtag.push(tag);
    		    		  tags.push('<span contenteditable="false"><a class="hashTag" href = "/board/listAll?tbl_name=${tbl_name}&searchType=hash&keyword='+tag.substr(1)+'">＃'+tag.substr(1)+'</a></span>&nbsp&nbsp');
    		    	    console.log("orgtag....");
    		    	    console.log(orgtag);
    		    	    
    		    	    $.each(orgtag, function(index, item){
							
        		  			console.log(item);
							
        		  		});
    		    	    console.log("tags....");
    		    	    console.log(tags);
    		    	   
    		    	    var len= tag.length+10;
    		    	    console.log(len);
    		    	    doSave2(2);
    		    	    $.each(tags, function(index, item){
								
        		  			console.log(item);
        		  			var a = ($(".fileDrop").html()).replace(""+orgtag[index]+"", ""+tags[index]+"")
        		  			$(".fileDrop").html(a);
   
        		  	 		console.log(($(".fileDrop").html()).replace(""+orgtag[index]+"", ""+tags[index]+""));
							console.log("tagsIndex="+ tags[index]);
							console.log("orgtag="+orgtag[index]);
							
        		  		});
    		    	    doPaste2();
    		    	    console.log($(".hashTag").val());
    		    	    
    		    	  });  	 
    			}	
    		  }
    	});
    });
    
</script>
<script>
$(document).ready(function(){
	$("#select_tbl_name").change(function() {

	     console.log($(this).val());
	     var board_val=$(this).val();
		if(board_val == 'tbl_tipboard'){
			console.log("tip!");
			$("#select_category option").remove();
			$("#select_category ").append("<option value='미정'>카테고리 선택</option>");
			$("#select_category ").append("<option value='식단/레시피'>식단/레시피</option>");
			$("#select_category ").append("<option value='다이어트'>다이어트</option>");
			$("#select_category ").append("<option value='컬럼'>컬럼</option>");
		
											
		}
		else if(board_val == 'tbl_qaboard'){
			console.log("qa!");
			$("#select_category option").remove();
			$("#select_category ").append("<option value='미정'>카테고리 선택</option>");
		}
		else if(board_val == 'tbl_freeboard'){
			console.log("free!");
			$("#select_category option").remove();
			$("#select_category ").append("<option value='미정'>카테고리 선택</option>");
		}
		else {
			console.log("sti!");
			$("#select_category option").remove();
			$("#select_category ").append("<option value='미정'>카테고리 선택</option>");
			$("#select_category ").append("<option value='후기'>후기</option>");
			$("#select_category ").append("<option value='body'>body</option>");
			$("#select_category ").append("<option value='before/after'>befor/after</option>");
		}
		
});
	
})
</script>


<%@include file="../include/footer.jsp"%>

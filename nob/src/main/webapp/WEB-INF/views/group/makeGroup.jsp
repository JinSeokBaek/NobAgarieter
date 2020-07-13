<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<script src="/resources/nob/js/group/makegroup.js"></script>

<style>
			section {
				color: black;
				font-size: 13px;
				font-family: 'nanum gothic', sans-serif;
				text-align: center;
			}
			#wrap>form{
	width:80%;
}
.form-group>label{
	cursor: pointer;
}
.alert{
	color:red;
	weight:bold;
	display: none;
}
.show{
	display: block!important;
}
.error{
	border-color:red !important;
}
.correct{
	border-color:green !important;
}
		</style>
		<script>
		var result='${msg}';
		if(result.length>0)
			alert(result);
		</script>
       <c:if test="${empty login}">
       	<script>
       		alert("로그인을 해주세요.");
       		location.href="/main/login";
       	</script>
       </c:if>
		
<section class = "s-content s-content--narrow container al_center">
       <div align="center" id="wrap">
   
	<h1 style="float:left;">
	그룹 생성
	</h1>
	<hr>
	
		<form method="post">
		<input type="hidden" name="u_no" value="${login.u_no}">
			<div class="continer">
			<div class="form-group">
				<div align="left">
					<label>카테고리(선택)</label>
					</div>
					<div class="form-group row">
	  					<div class="col-xs-4">
							<select id="age" class="form-control">
								<option value="">연령대</option>
								<option value="10대">10대</option>
								<option value="20대">20대</option>
								<option value="30대">30대</option>
								<option value="40대">40대</option>
								<option value="50대이상">50대이상</option>
							</select>
						</div>
						
	  					<div class="col-xs-4">
							<select id="region" class="form-control">
								<option value="">지역별</option>
								<option value="서울">서울</option>
								<option value="경기도">경기도</option>
								<option value="인천">인천</option>
								<option value="강원도">강원도</option>
								<option value="충북">충북</option>
								<option value="충남">충남</option>
								<option value="전북">전북</option>
								<option value="전남">전남</option>
								<option value="경북">경북</option>
								<option value="경남">경남</option>
							</select>
						</div>
	  					<!-- <div class="col-xs-4">
							<select id="date" class="form-control">
								<option value="">기간대</option>
								<option value="10대">10대</option>
								<option value="20대">20대</option>
								<option value="30대">30대</option>
								<option value="40대">40대</option>
								<option value="50대이상">50대이상</option>
							</select>
						</div> -->
					</div>
					<input type="hidden" name="g_category" id="category">
					<input type="hidden" name="g_subcategory" id="subcategory" value="">
				</div>
				<div class="form-group">
				<div align="left">
					<label for="name">그룹명</label>
					</div>
					<input type="text" class="form-control" id="name" name="g_name" size="40" placeholder="GROUP NAME" >
					<label class="alert">경고</label>
				</div>
				
				<div class="form-group">
				<div align="left">
					<label for="nickname">해시태그</label>
					</div>
					<!-- <input type="text" class="form-control" id="hashtag" name="h_name" size="40"> -->
					<div contenteditable="true" class="hashTag form-control" id="hashTag"></div>
					
				</div>
				<div class="hashTest">
				
				</div>
			</div>
			<div class="box-footer">
				<button type="submit" class="btn r_btn">등록</button>
			</div>
		</form>
	</div>
    </section>

   

<script type="text/javascript">
    $(function(){
    	$("#test").click(function(){
			
        	$("#my-textarea").html($("#b_content").html());
        	
    	})
    	
    });
    
</script>


<!-- HASH TEST -->


<!-- 2018_06_14 추가 -->
<script type="text/javascript">
var saveSelection2, restoreSelection2,len;

function doPaste2(){
	if (savedSelection2) {
		restoreSelection2(document.getElementById("hashTag"),
				savedSelection2);
	}
}


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
	savedSelection2 = saveSelection2(document.getElementById("hashTag"),len);
	/* console.log(savedSelection); */
}

    $(function(){
    	
    	
    	
    	$("#test").click(function(){
			
			
        	$("#my-textarea").html($("#b_content").html());
        	$("#hashtagArea").html($("#b_content").html());
    	});
    	
    	
   

    	
    	$(".hashTag").keypress(function(event) {
    		  if (event.keyCode == '32') {
    			console.log($(".hashTag").html());
    			if(($('.hashTag').html()).match('#')){
    				console.log("#체크");
    		    	 var txt = ($(".hashTag").html());
    		    	 var orgtag = []; 
    		    	 var tags = [];
    		    	  txt.replace(/#[^#\s,;]+/gm, function(tag) {
    		    	      orgtag.push(tag);
    		    		  tags.push('<span contenteditable="false"><a class="hashTag" href = "/">＃'+tag.substr(1)+'</a></span>&nbsp&nbsp');
    		    	    console.log("orgtag....");
    		    	    console.log(orgtag);
    		    	    
    		    	    $.each(orgtag, function(index, item){
							
        		  			console.log(item);
							
        		  		});
    		    	    console.log("tags....");
    		    	    console.log(tags);
    		    	    doSave2(1);
    		    	    $.each(tags, function(index, item){
								
        		  			console.log(item);
        		  			var a = ($(".hashTag").html()).replace(""+orgtag[index]+"", ""+tags[index]+"")
        		  			$(".hashTag").html(a);
        		  			$("#subcategory").val($(".hashTag").html());
        		  		});
    		    	    doPaste2();    
    		    	  });  	 
    			}	
    		  }
    	});	
    });  
</script>

<%@include file="../include/footer.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!-- 툴팁삽입용 js-->
<script src="/resources/nob/js/service/calorie.js"></script>
<!-- 툴팁적용용 js-->
<script src="/resources/nob/js/service/tooltip.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 툴팁적용용 js-->
<script src="/resources/nob/js/service/tooltip.js"></script>
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
		
		
<section class = "s-content s-content--narrow container al_center">


    <a href="#myModal0" class="btn btn-success" data-toggle="modal" onclick="doSave(); return false">칼로리</a>
    
    
    <!-- Modal -->
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
							<i class="glyphicon glyphicon-search"></i>
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
	<div contenteditable="true" id="textarea">
	
		본문이라 가정하고 만든 공간(div contenteditable)
       <span class="calorie" data-no="5" data-toggle="tooltip" title="Hooray!" contenteditable='false'>아무거나</span>아무말아무말
       <span class="calorie" data-no="4" data-toggle="tooltip" title="Hooray!" contenteditable='false'>아무거나2</span>
       <label class="calorie" data-no="124" data-toggle="tooltip" title="Hooray!" contenteditable='false'>아무거나2</label>
    </div>
       
</section>


  
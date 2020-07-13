<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<style>
section {
	color: black;
	font-size: 13px;
	font-family: 'nanum gothic', sans-serif;
	text-align: center;
}

.line {
	border: 1px solid #D4D4D4;
	margin: 10px 0;
}

.caption {
	padding-top: 0px !important;
	height:50px;
}

h4 {
	margin-top: 2px !important;
}

.row {
	width: auto !important;
}
.thumbox{
   	transition: 1s;
    position: relative;
    overflow: hidden;
    background: #000;
}
.thumbox img{
     width: 100%;
     transition: 1.5s;
        }
.thumbox:hover img{
     transform: scale(1.1);
     opacity: 0.8;
}        
.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover{
	background-color: #EB4C57;
}
.nav-pills a{
	color:#888888;
}
</style>
<script>
	var result = '${msg}';
	if (result.length > 0)
		alert(result);
</script>
<section class=" s-content--narrow container al_center">
	<c:if test="${not empty login}">
		<c:if test="${login.u_nickname eq 'admin'}">
			<p>
				<a href="#myModal0" class="btn btn-success" data-toggle="modal">동영상 추가</a>
			</p>

			<!-- Modal -->
			<div id="myModal0" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">동영상 추가</h4>
						</div>
						<div class="modal-body">
							<form id="modalbody2" method="post">
								<div class="box-body">
									<div class="form-group">
										<label for="word">제목</label> <input class="form-control"
											id="vTitle" type="text" required="required" name="v_title">
									</div>
									<div class="form-group">
										<label for="word">설명</label> <input class="form-control"
											id="vDesc" type="text" name="v_desc">
									</div>

									<div class="form-group">
										<label for="word">카테고리</label> <select class="form-control"
											id="vCategory" required="required" name="v_category">
											<option value="1">전신</option>
											<option value="2">상체</option>
											<option value="3">하체</option>
											<option value="4">복부</option>
											<option value="5">요가</option>
										</select>
									</div>
									<div class="form-group">
										<label for="word">링크</label> <input class="form-control"
											id="vLink" type="text"
											placeholder="https://www.youtube.com/embed/이 부분을 넣으시오"
											required="required" name="v_link">
									</div>
								</div>
								<div class="box-footer">
									<button type="submit" class="btn btn-primary" id="vidAdd">추가</button>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:if>
	<div class="container">
	<div align="left">
			<h2>홈 트레이닝</h2>
		</div>
       	<ul class="nav nav-pills">
		  <li class="active"><a data-toggle="tab" href="#home">전신</a></li>
		  <li><a data-toggle="tab" href="#menu1">상체</a></li>
		  <li><a data-toggle="tab" href="#menu2">하체</a></li>
		  <li><a data-toggle="tab" href="#menu3">복부</a></li>
		  <li><a data-toggle="tab" href="#menu4">요가</a></li>
		</ul>
		
		<div class="line"></div>
		<div class="tab-content">
		<div id="home" class="tab-pane fade in active row">
			<c:forEach items="${list}" var="videoVO">
				<c:if test="${videoVO.v_category eq '1'}">
					<div class="col-md-4 col-xs-6">
						<div class="thumbnail" style="padding: 5px 2px;"  align="center">
						<div class="thumbox">
						<a href="https://youtu.be/${videoVO.v_link}" target="_blank">
							<img src="https://img.youtube.com/vi/${videoVO.v_link}/mqdefault.jpg" class="thumb">
						</a>
						</div>
							<!--<iframe width="90%" height="170"
								src="https://www.youtube.com/embed/${videoVO.v_link}"
								frameborder="0" allow="autoplay; encrypted-media"
								allowfullscreen></iframe>-->
							<div class="caption">
								<h4 id="title">${videoVO.v_title}</h4>
								<h5 id="desc">${videoVO.v_desc}</h5>
									<c:if test="${empty videoVO.v_desc}">
									<h5>&nbsp;</h5>
									</c:if>
								<div align="right">
									<c:if test="${not empty login}">
										<c:if test="${login.u_nickname eq 'admin'}">
											<button type="button" class="btn btn-warning del"
												data-no="${videoVO.v_id }">삭제</button>
										</c:if>
									</c:if>
								</div>
							</div>

						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="menu1" class="tab-pane fade row">
			<c:forEach items="${list}" var="videoVO">
				<c:if test="${videoVO.v_category eq '2'}">
					<div class="col-md-4 col-xs-6">
						<div class="thumbnail" style="padding: 5px 2px;"  align="center">
						<div class="thumbox">
						<a href="https://youtu.be/${videoVO.v_link}" target="_blank">
							<img src="https://img.youtube.com/vi/${videoVO.v_link}/mqdefault.jpg" class="thumb">
						</a>
						</div>
							<!--<iframe width="90%" height="170"
								src="https://www.youtube.com/embed/${videoVO.v_link}"
								frameborder="0" allow="autoplay; encrypted-media"
								allowfullscreen></iframe>-->
							<div class="caption">
								<h4 id="title">${videoVO.v_title}</h4>
								<h5 id="desc">${videoVO.v_desc}</h5>
								<div align="right">
									<c:if test="${not empty login}">
										<c:if test="${login.u_nickname eq 'admin'}">
											<button type="button" class="btn btn-warning del"
												data-no="${videoVO.v_id }">삭제</button>
										</c:if>
									</c:if>
								</div>
							</div>

						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="menu2" class="tab-pane fade row">
			<c:forEach items="${list}" var="videoVO">
				<c:if test="${videoVO.v_category eq '3'}">
					<div class="col-md-4 col-xs-6">
						<div class="thumbnail" style="padding: 5px 2px;"  align="center">
						<div class="thumbox">
						<a href="https://youtu.be/${videoVO.v_link}" target="_blank">
							<img src="https://img.youtube.com/vi/${videoVO.v_link}/mqdefault.jpg" class="thumb">
						</a>
						</div>
							<!--<iframe width="90%" height="170"
								src="https://www.youtube.com/embed/${videoVO.v_link}"
								frameborder="0" allow="autoplay; encrypted-media"
								allowfullscreen></iframe>-->
							<div class="caption">
								<h4 id="title">${videoVO.v_title}</h4>
								<h5 id="desc">${videoVO.v_desc}</h5>
								<div align="right">
									<c:if test="${not empty login}">
										<c:if test="${login.u_nickname eq 'admin'}">
											<button type="button" class="btn btn-warning del"
												data-no="${videoVO.v_id }">삭제</button>
										</c:if>
									</c:if>
								</div>
							</div>

						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="menu3" class="tab-pane fade row">
			<c:forEach items="${list}" var="videoVO">
				<c:if test="${videoVO.v_category eq '4'}">
					<div class="col-md-4 col-xs-6">
						<div class="thumbnail" style="padding: 5px 2px;"  align="center">
						<div class="thumbox">
						<a href="https://youtu.be/${videoVO.v_link}" target="_blank">
							<img src="https://img.youtube.com/vi/${videoVO.v_link}/mqdefault.jpg" class="thumb">
						</a>
						</div>
							<!--<iframe width="90%" height="170"
								src="https://www.youtube.com/embed/${videoVO.v_link}"
								frameborder="0" allow="autoplay; encrypted-media"
								allowfullscreen></iframe>-->
							<div class="caption">
								<h4 id="title">${videoVO.v_title}</h4>
								<h5 id="desc">${videoVO.v_desc}</h5>
								<div align="right">
									<c:if test="${not empty login}">
										<c:if test="${login.u_nickname eq 'admin'}">
											<button type="button" class="btn btn-warning del"
												data-no="${videoVO.v_id }">삭제</button>
										</c:if>
									</c:if>
								</div>
							</div>

						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="menu4" class="tab-pane fade row">
			<c:forEach items="${list}" var="videoVO">
				<c:if test="${videoVO.v_category eq '5'}">
					<div class="col-md-4 col-xs-6">
						<div class="thumbnail" style="padding: 5px 2px;"  align="center">
						<div class="thumbox">
						<a href="https://youtu.be/${videoVO.v_link}" target="_blank">
							<img src="https://img.youtube.com/vi/${videoVO.v_link}/mqdefault.jpg" class="thumb">
						</a>
						</div>
							<!--<iframe width="90%" height="170"
								src="https://www.youtube.com/embed/${videoVO.v_link}"
								frameborder="0" allow="autoplay; encrypted-media"
								allowfullscreen></iframe>-->
							<div class="caption">
								<h4 id="title">${videoVO.v_title}</h4>
								<h5 id="desc">${videoVO.v_desc}</h5>
								<div align="right">
									<c:if test="${not empty login}">
										<c:if test="${login.u_nickname eq 'admin'}">
											<button type="button" class="btn btn-warning del"
												data-no="${videoVO.v_id }">삭제</button>
										</c:if>
									</c:if>
								</div>
							</div>

						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		</div>
	</div>
	<!--<c:forEach items="${list}" var="videoVO">
        	<p>
        		${videoVO.v_id},${videoVO.v_title},${videoVO.v_desc},${videoVO.v_link},${videoVO.v_category}	
        	</p>
        </c:forEach>-->
</section>

<script>
	$(function() {
		$(".row").on("click", ".del", function() {
			vid = $(this).data("no");
			$.post("/service/delVideo", {
				vid : vid
			}, function() {
				alert("삭제완료");
				location.reload();
			});
		});
	});
</script>


<%@include file="../include/footer.jsp"%>
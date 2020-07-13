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

		</style>
		<script>
		var result='${msg}';
		if(result.length>0)
			alert(result);
		</script>
<section class = "s-content s-content--narrow container al_center">
	


<c:if test="${not empty login}">
	<c:if test="${login.u_nickname eq 'admin'}">
		<a href="#myModal0" class="btn btn-success" data-toggle="modal">동영상 추가</a>
	</c:if>
</c:if>

</section>

   



<%@include file="../include/footer.jsp"%>
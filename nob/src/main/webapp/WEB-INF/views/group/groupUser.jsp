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
       <c:if test="${empty login}">
       	<script>
       		alert("로그인을 해주세요.");
       		location.href="/main/login";
       	</script>
       </c:if>
       	<script>
       		$(function(){
       			var admin="${admin}";
       			if (!(admin.length>0)||admin=="U"){
       				alert("권한이 없습니다.");
       				location.href = "/group/groupMain";
       			}
       			
       			
       			$("#delBtn").click(function(){
       				var del=confirm("삭제하시겠습니까?");
       				if(del){
	       				gid=${gid};
	       				console.log(gid);
	       	 			$.post("/group/delGroup",{gid:gid},function(){
	       	 				alert("삭제완료");
	       	 				location.href="/group/groupMain";
	       				});
       				}
       			});
       			
       			$("tr").on("change",":radio",function(){
       				var uno=$(this).parent().data('no');
       				var gid=${gid};
       				var gmgrant=$(this).val();
       				console.log(uno+" "+gmgrant+" "+gid);
       				$.post("/group/setAdmin",{uno:uno,gid:gid,gmgrant:gmgrant},function(){
       	 				alert("권한 수정 완료");
       	 				location.reload();
       				});
       			});
       			$("tr").on("click",".del",function(){
       				var uno=$(this).parent().data('no');
       				var gid=${gid};
       				var nick=$(this).parent().data('name');

       				console.log(uno+" "+nick+" "+gid);
       				var del=confirm(nick+"그룹원을 탈퇴시키겠습니까?");
       				if(del){
	       				$.post("/group/delMember",{uno:uno,gid:gid},function(){
	       	 				alert("탈퇴처리완료");
	       	 				location.reload();
	       				});
       				}
       			});
       		});
       	</script>
<section class = "s-content s-content--narrow container al_center">
       	그룹관리
       <c:if test="${mainadmin eq 1}">
       	<button type="button" class="btn btn-default" id="delBtn">그룹 삭제</button>
       </c:if>
       <table class="table table-striped">
       	<tr>
       		<th width="40%">유저명</th>
       		<th width="15%">참여일</th>
       		<th width="10%">권한</th>
       		<th width="35%">관리</th>
       	</tr>
       <c:forEach items="${memberlist}" var="groupMemberVO">
       		<tr>
       			<td>${groupMemberVO.u_nickname}</td>
       			<td>${groupMemberVO.gm_joindate}</td>
       			<c:choose>
       				<c:when test="${groupMemberVO.gm_grant eq 'M'}">	
       					<td colspan="2">그룹장</td>
       				</c:when>
       				<c:when test="${groupMemberVO.gm_grant eq 'A'}">
       					<c:choose>
       						<c:when test="${groupMemberVO.u_no eq login.u_no}">
       							<td colspan="2">그룹관리자</td>
       						</c:when>
       						<c:otherwise>
       							<td>그룹관리자</td>
       						</c:otherwise>
       					</c:choose>
       				</c:when>
       				<c:when test="${groupMemberVO.gm_grant eq 'U'}">
       					<td>일반그룹원</td>
       				</c:when>
       			</c:choose>
	       		<c:if test="${groupMemberVO.gm_grant eq 'A' or groupMemberVO.gm_grant eq 'U'}">
		       		<c:if test="${groupMemberVO.u_no ne login.u_no}">
			       		<td data-no="${groupMemberVO.u_no}" data-name="${groupMemberVO.u_nickname}">
			       			<c:choose>
			       				<c:when test="${groupMemberVO.gm_grant eq 'A'}">
			       					<input type="radio" value="A" name="grant" checked="checked">그룹관리자
			       					<input type="radio" value="U" name="grant">일반그룹원
			       				</c:when>
			       				<c:when test="${groupMemberVO.gm_grant eq 'U'}">
			       					<input type="radio" value="A" name="grant">그룹관리자
			       					<input type="radio" value="U" name="grant"  checked="checked">일반그룹원
			       				</c:when>
			       			</c:choose>
			       			<button class="btn btn-default del">탈퇴</button>
			       		</td>
		       		</c:if>
	       		</c:if>
       		</tr>
       </c:forEach>
       </table>
    </section>

   



<%@include file="../include/footer.jsp"%>
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
				var isJoined=true;
				var gid=${gid};
				var uno=${login.u_no};
				$.ajax({
                    data : {
                        gid : gid,
                        uno : uno
                    },
                    url : "/group/isGroupMember",
                    async: false,
					type:"post",
                    success : function(data) {
                    	//console.log(data);
                        if(data!="0")
                        	isJoined=true;
                        else
                        	isJoined=false;
                    }
                });
				if(!isJoined){
					alert("가입하지 않은 그룹입니다.");
					location.href="/group/groupMain";
				}
			});
		</script>
		
<section class = "s-content s-content--narrow container al_center">
       	
       ${gid} ${login.u_no}
    </section>

   



<%@include file="../include/footer.jsp"%>
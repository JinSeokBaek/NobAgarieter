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
			#wrap>form{
				width:80%;
			}
			label{
				font-size:20px;
			}
			.alert{
				color:red;
				weight:bold;
				font-size:13px;
				display: none;
			}
			.show{
				display: block!important;
			}
			.error{
	border-color:red !important;
}
		</style>
		<c:if test="${not empty login}">
       	<script>
       		alert("잘못된 접근입니다.");
       		history.back();
       	</script>
       </c:if>
       	<script>
       	$(function(){
       		function showAlert(input){
                input.addClass("error");
                input.removeClass("correct");
           }
	       	function email_check( email ) {
	       	    
	            var regex=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	            return (email != '' && email != 'undefined' && regex.test(email));
	
	        }
	       	$("form").submit(function(){
	       		email=$("#email");
	       		console.log(email.val());
	            if(! email_check(email.val()) ) {
            		showAlert(email);
	         	   $("#email+.alert").addClass("show");
	         	   $("#email +.alert").html("이메일 형식이 올바르지 않습니다.");
	         	   return false;
	            }else{
	            	var emailcheck=true;
	            	$.ajax({
	                    data : {
	                        email : email.val()
	                    },
	                    url : "/main/checkEmail",
	                    async: false,
						type:"post",
	                    success : function(data) {
	                    	//console.log(data);
	                        if(data!="0")
	                        	emailcheck=true;
	                        else
	                        	emailcheck=false;
	                    }
	                });
	            	if(!emailcheck){
	            		showAlert(email);
	                    $("#email+.alert").addClass("show");
	                    $("#email +.alert").html("등록되지않은 이메일입니다.");
	                    return false;
	            	}else{
	                return true;
	            	}
	            }
	  		});
       	});
       	</script>
<section class = "s-content s-content--narrow container al_center">
       <div align="center" id="wrap">
			<form method="post">
				<div class="form-group">
					<label for="email">가입하신 이메일을 입력하세요.</label>
					<input type="text" class="form-control"id="email" name="email" size="40" placeholder="EMAIL(ID)" required>
					<label class="alert">경고</label>
				</div>
				<div class="box-footer">
				<button type="submit" class="btn btn-primary">확인</button>
			</div>
			</form>
	</div>
</section>

   



<%@include file="../include/footer.jsp"%>
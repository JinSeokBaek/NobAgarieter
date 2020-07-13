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
		//var list='${list}';
		//console.log(list);
		if(result.length>0)
			alert(result);
		</script>
		<script>
			$(function(){
				$("#keyword").keyup(function(){
					var keyword=$("#keyword").val();
					//console.log(keyword);
					$.ajax({
	                    data : {
	                        keyword : keyword
	                    },
	                    url : "/service/calorieSearch",
						type:"post",
	                    success : function(data) {
	                    	//console.log(data);

	                        var str ='';
	                    	$.each(data , function(i){

	                            str += '<TR>';
	                            str += '<TD>' + data[i].c_name + '</TD><TD>' + data[i].c_serve+ '</TD><TD>' + data[i].c_amount + '</TD>';
	                            str += '</TR>';
	                       });
	                    	$("#list").html(str); 
	                    }
	                });
				});
			});
		</script>
<section class = "s-content s-content--narrow container al_center">
       <label>음식 칼로리 표</label>
       <form>
       	<div class="input-group">
		    <div class="input-group-btn">
		      <button class="btn btn-default" type="button">
		      <i class="fas fa-search"></i>
		      </button>
    	</div>
		    <input type="text" class="form-control" placeholder="검색" name="keyword" id="keyword">
  		</div>
       </form>
	       <table class="table table-striped">
	       	<thead>
	       		<tr>
	       			<th>식품 명</th>
	       			<th>1회 제공량(g)</th>
	       			<th>칼로리(kcal)</th>
	       			<!-- <th>식품 명</th>
	       			<th>1회 제공량(g)</th>
	       			<th>칼로리(kcal)</th>-->
	       		</tr>
	    	</thead>
	    	<tbody id="list">
	    		<c:forEach items="${list}" var="calorieVO">
					<tr>
						<td>${calorieVO.c_name}</td>
						<td>${calorieVO.c_serve}</td>
						<td>${calorieVO.c_amount}</td>
					</tr>
				</c:forEach>
	       	</tbody>
	       </table>
	       <label>출처 : <a target="_blank" href="https://www.foodsafetykorea.go.kr/portal/healthyfoodlife/foodnutrient/simpleSearch.do?menu_grp=MENU_NEW03&menu_no=2805">식품안전나라</a></label>
    </section>

   



<%@include file="../include/footer.jsp"%>
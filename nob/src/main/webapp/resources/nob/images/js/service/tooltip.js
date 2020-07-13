$(function() {
	// /////////////////////////////////////////////////////////////////////////////
	// 툴팁 불러오기

	$('section').find('.calorie').each(
			function(i, e) {
				var cno = $(this).attr("data-no");
				var temp = $(this);
				$.ajax({
					data : {
						cno : cno
					},
					url : "/service/getCalorie",
					type : "post",
					success : function(data) {
						temp.attr("data-original-title", data.c_name + "("
								+ data.c_serve + "g) : " + data.c_amount
								+ "kcal");
					}
				});
			});
	$('[data-toggle="tooltip"]').tooltip();
	// ///////////////////////////////////////////////////////////////////////////////
});
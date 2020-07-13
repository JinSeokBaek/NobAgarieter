/*$(document).ready(
			function() {

				$("#searchBtn").on(
						"click",
						function(event) {
							self.location = "listAll"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val())
									+ "&tbl_name="+$("#tbl_name").val()+"";
						});

				$("#newBtn").on("click", function(evt) {
					self.location = "register";
				});
			});

var result = '${msg}';
if (result == 'SUCCESS') {
	alert('처리가 완료되었습니다.');
}*/
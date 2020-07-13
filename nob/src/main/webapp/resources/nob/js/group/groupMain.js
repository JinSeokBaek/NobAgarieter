$(function() {
	$("tbody").on("click", ".join", function() {
		var gid = $(this).data('id');
		var uno = ${login.u_no};
		console.log(gid + " " + uno);

		var isJoined = false;

		$.ajax({
			data : {
				gid : gid,
				uno : uno
			},
			url : "/group/isGroupMember",
			async : false,
			type : "post",
			success : function(data) {
				// console.log(data);
				if (data != "0")
					isJoined = false;
				else
					isJoined = true;
			}
		});
		if (isJoined) {
			$.post("/group/joinGroup", {
				gid : gid,
				uno : uno
			}, function(result) {
				location.href = "/group/group?gid=" + result;
			});
		} else
			alert("이미 가입한 그룹입니다.");

	});
	$("tbody").on(
			"click",
			".manage",
			function() {
				var gid = $(this).data('id');
				var uno = ${login.u_no};
				console.log(gid);
				$("form").append(
						$('<input type="hidden" value="' + gid
								+ '" name="gid">'));
				$("form").append(
						$('<input type="hidden" value="' + uno
								+ '" name="uno">'));
				$("form").submit();
			});

});
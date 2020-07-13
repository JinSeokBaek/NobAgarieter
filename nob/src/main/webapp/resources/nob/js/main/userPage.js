$(function() {
	
	function getbmi(bmi){
		if(bmi<18.5)
			return "저체중";
		else if(bmi<22.9)
			return "정상";
		else if(bmi<24.9)
			return "비만 전단계";
		else if(bmi<29.9)
			return "1단계 비만";
		else if(bmi<34.9)
			return "2단계 비만";
		else
			return "3단계 비만";
	}
	
	function pass_check(pass) {
		var regex = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		;
		// pw.search(/₩s/) == -1
		return (pass != '' && pass != 'undefined' && regex.test(pass));
	}
	function showAlert(input) {
		input.addClass("error");
		input.removeClass("correct");
	}
	function removeAlert(input) {
		input.removeClass("error");
		input.addClass("correct");
	}
	function check_pass() {
		pass = $("#pwd");
		if (!pass_check(pass.val())) {
			showAlert(pass);
			$("#pwd+.alert").addClass("show");
			if (pass == '' || pass == 'undefined') {
				$("#pwd+.alert").html("비밀번호를 입력하세요.");
			} else
				$("#pwd+.alert").html("비밀번호가 올바르지 않습니다");

			return false;
		} else {
			removeAlert(pass);
			$("#pwd+.alert").removeClass("show");
			return true;
		}
	}
	function check_pass2() {
		check_pass();
		pass1 = $("#pwd").val();
		pass2 = $("#pwd2").val();
		if (pass1 != pass2 || pass2 == '' || pass2 == 'undefined') {
			showAlert($("#pwd2"));
			$("#pwd2+.alert").addClass("show");
			$("#pwd2+.alert").html("비밀번호가 일치하지않습니다.");
			return false;
		} else {
			removeAlert($("#pwd2"));
			$("#pwd2+.alert").removeClass("show");

			$.ajax({
				data : {
					pw : pass1
				},
				url : "/main/getHash",
				type : "post",
				success : function(data) {
					// console.log(data);
					$("#hash").val(data);
				}
			});

			return true;
		}
	}

	function number_check(num) {

		var regex = /^[0-9]+(.[0-9]+)?$/;
		return (num != '' && num != 'undefined' && regex.test(num));

	}

	function check_height() {
		height = $("#height").val();
		if (!number_check(height)) {
			showAlert($("#height"));
			$("#height+.alert").addClass("show");
			if (height == '' || height == 'undefined')
				$("#height+.alert").html("키를 입력하세요.");
			else
				$("#height+.alert").html("숫자를 입력하세요.");
			return false;
		} else {
			removeAlert($("#height"));
			$("#height+.alert").removeClass("show");
			setBmi(Number($("#height").val()), Number($("#weight").val()));
			return true;
		}
	}
	function check_weight() {
		weight = $("#weight").val();
		if (!number_check(weight)) {
			showAlert($("#weight"));
			$("#weight+.alert").addClass("show");
			if (weight == '' || weight == 'undefined')
				$("#weight+.alert").html("몸무게를 입력하세요.");
			else
				$("#weight+.alert").html("숫자를 입력하세요.");
			return false;
		} else {
			removeAlert($("#weight"));
			$("#weight+.alert").removeClass("show");
			setBmi(Number($("#height").val()), Number($("#weight").val()));
			return true;
		}
	}
	
	function setBmi(height, weight) {
		h = height / 100;
		console.log(weight / (h * h));
		$("#bmi2").val(weight / (h * h));
		console.log($("#bmi2").val());
		$("#bmi_alert").html(getbmi(weight / (h * h)));
	}
	
	function check_nickname(){
        name=$("#nickname").val();
        if(name == '' || name == 'undefined'){
                showAlert($("#nickname"));
            	$("#nickname+.alert").addClass("show");
                $("#nickname+.alert").html("닉네임을 입력하세요.");                        
            return false;
        }else{
        	var nickcheck=false;
        	$.ajax({
                data : {
                    nickname : name
                    },
                url : "/main/checkNick",
                async: false,
				type:"post",
                success : function(data) {
                	//console.log(data);
                    if(data!="0")
                    	nickcheck=false;
                    else
                    	nickcheck=true;
                }
            });
        	if(!nickcheck){showAlert($("#nickname"));
            	$("#nickname+.alert").addClass("show");
                $("#nickname+.alert").html("중복된 닉네임입니다.");
                return false;
        	}else{
            	removeAlert($("#nickname"));
                $("#nickname+.alert").removeClass("show");
                return true;
        	}
        }
    }
	
	$("#pwd").blur(function() {
		check_pass();
	});
	$("#pwd2").blur(function() {
		check_pass2();
	});
	$("#height").blur(function() {
		check_height();
	});
	$("#weight").blur(function() {
		check_weight();
	});
	$("#nickname").blur(function(){
			check_nickname();
		});
	$("#bmiForm").submit(function() {
		check_height();
		check_weight();
		isCheck = check_height() && check_weight();
		console.log(isCheck);
		// 로딩창 하나 만들기
		return isCheck;
	});
	$("#passForm").submit(function() {
		check_pass();
		check_pass2();
		isCheck = check_pass() && check_pass2();
		console.log(isCheck);
		return isCheck;
	});
	$("#nickForm").submit(function() {
		isCheck = check_nickname();
		console.log(isCheck);
		return isCheck;
	});
});
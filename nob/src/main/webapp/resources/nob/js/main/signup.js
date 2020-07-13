$(function(){
		function email_check( email ) {
    
            var regex=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            return (email != '' && email != 'undefined' && regex.test(email));

        }
		function pass_check(pass){
            var regex=/^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;;
            //pw.search(/₩s/) == -1
            return (pass != '' && pass != 'undefined' && regex.test(pass));
        }
		
		function number_check( num ) {
		    
            var regex=/^[0-9]+(.[0-9]+)?$/;
            return (num != '' && num != 'undefined' && regex.test(num));

        }
		function showAlert(input){
             input.addClass("error");
             input.removeClass("correct");
        }
		function removeAlert(input){
            input.removeClass("error");
            input.addClass("correct");
       }
		function check_email(){
            email=$("#email");
           if(! email_check(email.val()) ) {
                showAlert(email);
                $("#email+.alert").addClass("show");
            if( email.val() == '' || email.val() == 'undefined')
            	$("#email +.alert").html("이메일을 입력하세요.");
            else
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
                        	emailcheck=false;
                        else
                        	emailcheck=true;
                    }
                });
            	//console.log(emailcheck);
            	if(!emailcheck){
            		showAlert(email);
                    $("#email+.alert").addClass("show");
                    $("#email +.alert").html("중복된 이메일입니다.");
                    return false;
            	}else{
            	removeAlert(email);
                $("#email+.alert").removeClass("show");
                return true;
            	}
            }
       }
        function check_pass(){
            pass=$("#pwd");
            if(!pass_check(pass.val())){
            	showAlert(pass);
            	$("#pwd+.alert").addClass("show");
                if( pass == '' || pass == 'undefined'){
                	$("#pwd+.alert").html("비밀번호를 입력하세요.");
                }else
                	$("#pwd+.alert").html("비밀번호가 올바르지 않습니다");
                    
                return false;
            }else{
            	removeAlert(pass);
                $("#pwd+.alert").removeClass("show");
                return true;
            }
        }
        function check_pass2(){
        	check_pass();
            pass1=$("#pwd").val();
            pass2=$("#pwd2").val();
            if( pass1 != pass2||pass2 == '' || pass2 == 'undefined'){
                    showAlert($("#pwd2"));
                	$("#pwd2+.alert").addClass("show");
                    $("#pwd2+.alert").html("비밀번호가 일치하지않습니다.");                        
                return false;
            }else{
            	removeAlert($("#pwd2"));
                $("#pwd2+.alert").removeClass("show");
                
            	$.ajax({
                    data : {
                        pw : pass1
                        },
                    url : "/main/getHash",
					type:"post",
                    success : function(data) {
                    	//console.log(data);
                    	$("#hash").val(data);
                    }
                });
                
                
                return true;
            }
        }
        function check_name(){
            name=$("#name").val();
            if(name == '' || name == 'undefined'){
                    showAlert($("#name"));
                	$("#name+.alert").addClass("show");
                    $("#name+.alert").html("이름을 입력하세요.");                        
                return false;
            }else{
            	removeAlert($("#name"));
                $("#name+.alert").removeClass("show");
                return true;
            }
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
        
        function check_gender(){
        	if(!$('input:radio[name=u_gender]').is(':checked')){
            	$("#radio_alert").addClass("show");
                $("#radio_alert").html("성별을 선택하세요.");
                return false;
        	}else{
        		 $("#radio_alert").removeClass("show");
        		 return true;
        	}
        }
        
        function check_height(){
           	height=$("#height").val();
           	if(!number_check(height)){
                showAlert($("#height"));
            	$("#height+.alert").addClass("show");
	            if(height == '' || height == 'undefined')
	                    $("#height+.alert").html("키를 입력하세요.");   
	            else
                    $("#height+.alert").html("숫자를 입력하세요.");   
	           return false;
            }else{
            	removeAlert($("#height"));
                $("#height+.alert").removeClass("show");
                setBmi(Number($("#height").val()),Number($("#weight").val()));
                return true;
            }
        }
        function check_weight(){
           	weight=$("#weight").val();
           	if(!number_check(weight)){
                showAlert($("#weight"));
            	$("#weight+.alert").addClass("show");
	            if(weight == '' || weight == 'undefined')
	                $("#weight+.alert").html("몸무게를 입력하세요.");   
	            else
                    $("#weight+.alert").html("숫자를 입력하세요.");   
                return false;
            }else{
            	removeAlert($("#weight"));
                $("#weight+.alert").removeClass("show");
                setBmi(Number($("#height").val()),Number($("#weight").val()));
                return true;
            }
        }
        function setBmi(height,weight){
        	h=height/100;
        	console.log(weight/(h*h));
        	$("#bmi").val(weight/(h*h));
        	console.log($("#bmi").val());
        }
        
	  		$("#email").blur(function(){
	  			check_email();
	  		});
	  		$("#pwd").blur(function(){
	  			check_pass();
	  		});
	  		$("#pwd2").blur(function(){
	  			check_pass2();
	  		});
	  		$("#name").blur(function(){
	  			check_name();
	  		});
	  		$("#nickname").blur(function(){
	  			check_nickname();
	  		});
	  		$("#height").blur(function(){
	  			check_height();
	  		});
	  		$("#weight").blur(function(){
	  			check_weight();
	  		});
	  		
	  		$("form").submit(function(){
	  			check_email();
	  			check_pass();
	  			check_pass2();
	  			check_name();
	  			check_nickname();
	  			check_gender();
	  			check_height();
	  			check_weight();
	  			isCheck=check_email()&&check_pass()&&check_pass2()&&check_name()&&check_nickname()&&check_gender()&&check_height()&&check_weight();
	  		    console.log(isCheck);
	  		    //로딩창 하나 만들기
	  		    return isCheck;
	  		});
	  	});
$(function(){
	function showAlert(input){
        input.addClass("error");
        input.removeClass("correct");
	}
	function removeAlert(input){
       input.removeClass("error");
       input.addClass("correct");
	}
	
	function check_name(){
        name=$("#name").val();
        if(name == '' || name == 'undefined'){
                showAlert($("#name"));
            	$("#name+.alert").addClass("show");
                $("#name+.alert").html("그룹명을 입력하세요.");                        
            return false;
        }else{
        	var isNameExist=true;
        	$.ajax({
                data : {
                    gname : name
                },
                url : "/group/checkName",
                async: false,
				type:"post",
                success : function(data) {
                	//console.log(data);
                    if(data!="0")
                    	isNameExist=true;
                    else
                    	isNameExist=false;
                }
            });
        	
        	if(isNameExist){
                showAlert($("#name"));
            	$("#name+.alert").addClass("show");
                $("#name+.alert").html("중복된 그룹명입니다.");
	            return false;
        	}else{
	        	removeAlert($("#name"));
	            $("#name+.alert").removeClass("show");
	            return true;
            }
        }
    }
	$("#name").blur(function(){
			check_name();
	});
	var str="";
	$("form").submit(function(){
			str+=$("#age").val();
			if(str.length>0&&$("#region").val().length>0)
				str+="/";
			str+=$("#region").val();
			if(str.length>0&&$("#date").val().length>0)
				str+="/";
			str+=$("#date").val();
			$("#category").val(str);
			console.log($("#category").val());
		    return check_name();
		});

});
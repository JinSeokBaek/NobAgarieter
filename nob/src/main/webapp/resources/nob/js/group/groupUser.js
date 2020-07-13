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
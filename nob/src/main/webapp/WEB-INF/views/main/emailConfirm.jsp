<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 인증</title>
</head>
<body>
<body>
	<script type="text/javascript">
		var user = '${nickname}';
		if('${check}'=='true'){
			alert(user + '님 회원가입을 축하합니다. 이제 로그인이 가능 합니다.');
		}else
			alert('인증에 실패하였습니다. 관리자에게 문의하세요.');
		window.open('', '_self', ''); // 브라우저창 닫기
		/* window.close(); // 브라우저 창 닫기 */
		self.location = '/';
		</script>
</body>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ����</title>
</head>
<body>
<body>
	<script type="text/javascript">
		var user = '${nickname}';
		if('${check}'=='true'){
			alert(user + '�� ȸ�������� �����մϴ�. ���� �α����� ���� �մϴ�.');
		}else
			alert('������ �����Ͽ����ϴ�. �����ڿ��� �����ϼ���.');
		window.open('', '_self', ''); // ������â �ݱ�
		/* window.close(); // ������ â �ݱ� */
		self.location = '/';
		</script>
</body>
</body>
</html>
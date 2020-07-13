<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<jsp:include page="../include/header.jsp"></jsp:include>

       <c:if test="${empty login}">
       	test
       </c:if>
       <c:if test="${not empty login}">
       	${login.u_no} ${login.u_email} ${login.u_nickname}
       </c:if>
</body>
</html>
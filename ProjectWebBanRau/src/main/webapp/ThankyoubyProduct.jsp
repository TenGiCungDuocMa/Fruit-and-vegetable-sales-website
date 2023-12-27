<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Cảm ơn quý khách</title>
</head>
<body style="text-align: center;">
<c:choose>
		<c:when test="${sessionScope.user == null}">
			<jsp:forward page="SignIn.jsp">
				<jsp:param value="3" name="ok" />
			</jsp:forward>
		</c:when>
		<c:when
			test="${sessionScope.user.rolename != 'client' && sessionScope.user.rolename != 'addmin'}">
			<jsp:forward page="AccessError.jsp"/>
		</c:when>

	</c:choose>
	<h1 style="margin-top: 20%;">Cảm ơn quý khách đã mua hàng! Đơn hàng của bạn sẽ sớm được giao!</h1>
	<a href="index.jsp">Tiếp tục mua hàng</a>
</body>
</html>
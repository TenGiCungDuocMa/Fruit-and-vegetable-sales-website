<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quản lí người dùng</title>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.user == null}">
			<jsp:forward page="SignIn.jsp">
				<jsp:param value="3" name="ok" />
			</jsp:forward>
		</c:when>
		<c:when test="${sessionScope.user.rolename != 'addmin'}">
			<jsp:forward page="AccessError.jsp" />
		</c:when>

	</c:choose>
	<h2 style="text-align: center;">Quản lí người dùng</h2>
	<table border="1" style="width: 100%;">
		<tr>
			<th>USERNAME</th>
			<th>PASSWORD</th>
			<th>HỌ VÀ TÊN</th>
			<th>SỐ ĐIỆN THOẠI</th>
			<th>EMAIL</th>
			<th>ĐỊA CHỈ</th>
			<th>QUYỀN HẠN</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach var="kh" items="${sessionScope.service.getAllUser() }">
			<tr>
				<td>${kh.username }</td>
				<td>${kh.password }</td>
				<td>${kh.tenkh }</td>
				<td>${kh.sdt }</td>
				<td>${kh.email }</td>
				<td>${kh.address }</td>
				<td>${kh.rolename }</td>
				<c:url var="url" value="Manauser">
					<c:param name="username" value="${kh.username }"></c:param>
				</c:url>
				<td><a href="${url }">Xóa</a></td>
			</tr>
		</c:forEach>
	</table>
	<div style="text-align: end; margin-top: 15px;">
		<a href="index.jsp">Quay lại trang chủ</a>
	</div>
</body>
</html>
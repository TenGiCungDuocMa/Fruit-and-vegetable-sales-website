<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhập mã xác nhận</title>
<style>
.container {
	text-align: center;
	background-color: white;
	width: 35%;
	padding: 10px 0px 40px 0px;
	margin-top: 40px;
	border-radius: 40px;
}

.container input {
	border-radius: 5px;
	width: 70%;
	height: 45px;
	margin-top: 5%;
}

.container .sub1:hover {
	background-color: chartreuse;
}

.sub1 {
	background-color: darkseagreen;
}
</style>
</head>
<body style="text-align: -webkit-center; background-color: aquamarine;">
	<c:choose>
		<c:when test="${requestScope.mail == null}">
			<jsp:forward page="AccessError.jsp" />
		</c:when>
	</c:choose>
	<div class="container">
		<form action="forgetpassword" method="post">
			<h2>Nhập mã xác nhập</h2>
			<c:choose>
				<c:when test="${requestScope.ok == 0 }">
					<p style="color: red;">Mã xác nhận không đúng!</p>
				</c:when>
			</c:choose>
			<div>
				<p style="color: black;">
					SITL vừa gửi một mã xác nhận có 6 chữ số đến <b>${requestScope.mail }</b>
				</p>
			</div>
			<input type="hidden" name="emailConfirm"
				value="${requestScope.mail }"> <input type="hidden"
				name="uname" value="${requestScope.uname }"> <input
				type="number" name="numcode" placeholder="   Mã xác nhận"
				required="required" min="100000" max="999999"> <br> <input
				class="sub1" type="submit" name="submit" value="Xác nhận"><br>
			<div style="margin: 5%;">
				<a href="index.jsp">Về trang chủ </a> <br>
			</div>
		</form>
	</div>
</body>
</html>
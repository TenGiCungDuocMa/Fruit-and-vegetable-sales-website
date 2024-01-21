<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
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

.container .sub1:hover, .sub2:hover {
	background-color: chartreuse;
}

.sub1 {
	background-color: darkseagreen;
}

.sub2 {
	background-color: cornsilk;
}
</style>
</head>
<body style="text-align: -webkit-center; background-color: aquamarine;">
	<div class="container">
		<form action="forgetpassword" method="post">
			<h2>Quên mật khẩu</h2>
			<c:choose>
				<c:when test="${requestScope.ok == 0 }">
					<p style="color: red;">Username không tồn tại!</p>
				</c:when>
			</c:choose>
			<input type="text" name="nameUser" placeholder="   Tên tài khoản"
				required="required"> <br> 
			<input type="email"
				name="emailConfirm" placeholder="   Email xác nhận" required="required"
				style="margin-bottom: 10px;"> <br> 
			<input class="sub1"
				type="submit" name="submit" value="Xác nhận"><br>
			<div style="margin: 5%;">
				<a href="index.jsp">Về trang chủ </a> <br>
			</div>
			Bạn chưa có tài khoản? <a href="SignUp.jsp">Đăng kí</a>
		</form>
	</div>
</body>
</html>
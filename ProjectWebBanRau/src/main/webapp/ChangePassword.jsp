<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi mật khẩu mới</title>
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
	<div class="container">
		<form action="changepass" method="post">
			<h2>Đổi mật khẩu mới</h2>
			<c:choose>
				<c:when test="${requestScope.ok == 0 }">
					<p style="color: red;">Mật khẩu không trùng khớp!</p>
				</c:when>
			</c:choose>
			<input type="text" name="uname" value="${requestScope.uname }" > <br>
			<input type="password" name="newpass" placeholder="   Mật khẩu mới"
				required="required" > <br> 
			<input type="password" name="renewpass" placeholder="   Nhập lại mật khẩu"
				required="required" > <br> 
			<input class="sub1"
				type="submit" name="submit" value="Xác nhận"><br>
			<div style="margin: 5%;">
				<a href="index.jsp">Về trang chủ </a> <br>
			</div>
		</form>
	</div>
</body>
</html>
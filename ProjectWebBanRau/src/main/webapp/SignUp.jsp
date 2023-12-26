<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng kí</title>
<style>
.container{
    text-align: center;
    background-color: white;
    width: 35%;
    padding: 10px 0px 40px 0px;
    margin-top: 40px;
    border-radius: 40px;
}
.container input,button{
	border-radius: 5px;
    width: 70%;
    height: 45px;
    margin-top:5%;
}
.container .sub:hover{
	background-color: chartreuse;
}
.sub {
	background-color: darkseagreen;
}
</style>
</head>
<body style="text-align: -webkit-center; background-color: aquamarine;">
	<form action="signUp" method="post">
		<div class="container">
			<h2>Đăng kí tài khoản</h2>
			<c:choose>
				<c:when test="${requestScope.ok == 0 }">
					<p style="color: red;">Username đã tồn tại!</p>
				</c:when>
				<c:when test="${requestScope.ok == 1 }">
					<p style="color: red;">Mật khẩu không trùng khớp!</p>
				</c:when>
			</c:choose>
			<input type="text" name="nameUser" placeholder="   Tên tài khoản" required="required"> <br>
			<input type="password" name="password" placeholder="   Mật khẩu" required="required"> <br>
			<input type="password" name="repassword" placeholder="   Nhập lại mật khẩu" required="required"> <br>
			<input type="text" name="tenkh" placeholder="   Họ và Tên" required="required"><br>
			<input type="tel" name="sdt" placeholder="   Số điện thoại" required="required"><br>
			<input type="email" name="email" placeholder="   Email" required="required" style="margin-bottom: 10px;"><br>
			<input type="text" name="address" placeholder="   Địa chỉ" required="required" style="margin-bottom: 10px;"><br>
			
			<div style="margin:5%;">
				<a href="index.jsp">Về trang chủ |</a>
				<a href="SignIn.jsp">Quay lại đăng nhập?</a><br>
			</div>
			<button class="sub" type="submit" name="submit">Đăng Kí</button><br>
		</div>
	</form>
</body>
</html>
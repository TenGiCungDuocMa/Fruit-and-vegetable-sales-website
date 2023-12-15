<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
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
.container .sub1:hover,.sub2:hover{
	background-color: chartreuse;
}
.sub1 {
	background-color: darkseagreen;
}
.sub2{
	background-color: cornsilk;
}
</style>
</head>
<body style="text-align: -webkit-center; background-color: aquamarine;">
	<div class="container">
		<form action="j_security_check" method="post">
			<h2>Đăng nhập</h2>
			<input type="text" name="j_username" placeholder="   Tên tài khoản" required="required"> <br>
			<input type="password" name="j_password" placeholder="   Mật khẩu" required="required" style="margin-bottom: 10px;"> <br>
			<input class="sub1" type="submit" name="submit" value="Đăng nhập"><br>
			<div style="margin:5%;">
				<a href="index.jsp">Về trang chủ |</a>
				<a href="#">Quên mật khẩu?</a><br>
			</div>
			Bạn chưa có tài khoản? <a href="SignUp.jsp">Đăng kí</a>
		</form>
			
	</div>
</body>
</html>
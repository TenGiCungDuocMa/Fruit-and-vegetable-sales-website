<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rau củ Nông Lâm</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel='shortcut icon' href='./img/favicon.ico' />
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Inter:wght@300;400&display=swap")
	;

body {
	line-height: 1.5;
	font-family: 'Inter', sans-serif;
}

p {
	color: #ffffff;
}

.container {
	max-width: 1170px;
	margin: auto;
}

.row {
	display: flex;
	flex-wrap: wrap;
}

ul {
	list-style: none;
}

.footer {
	background-color: #24262b;
	padding: 70px 0;
}

.footer-col {
	width: 25%;
	padding: 0 15px;
}

.footer-col h4 {
	font-size: 18px;
	color: #ffffff;
	text-transform: capitalize;
	margin-bottom: 35px;
	font-weight: 500;
	position: relative;
}

.footer-col h4::before {
	content: '';
	position: absolute;
	left: 0;
	bottom: -10px;
	background-color: #6a961f;;
	height: 2px;
	box-sizing: border-box;
	width: 50px;
}

.footer-col ul li:not(:last-child) {
	margin-bottom: 10px;
}

.footer-col ul li a {
	font-size: 16px;
	text-transform: capitalize;
	color: #ffffff;
	text-decoration: none;
	font-weight: 300;
	color: #bbbbbb;
	display: block;
	transition: all 0.3s ease;
}

.footer-col ul li a:hover {
	color: #ffffff;
	padding-left: 8px;
}
.footer-col ul {
	padding-left: 0px;
}
.footer-col .social-links a {
	display: inline-block;
	height: 40px;
	width: 40px;
	background-color: rgba(255, 255, 255, 0.2);
	margin: 0 10px 10px 0;
	text-align: center;
	line-height: 40px;
	border-radius: 50%;
	background-color: #ffffff;
	transition: all 0.5s ease;
}

.footer-col .social-links a:hover {
	color: #24262b;
	background-color: green;
}
.footer-col .social-links img{
	width:25px;
}
</style>
</head>
<body>
		<footer class="footer" >
			<div class="container" style="background-color: #24262b;">
				<div class="row">
					<div class="footer-col">
						<h4>VỀ CHÚNG TÔI</h4>
						<p>SITL Market chuyên cung cấp rau củ và thực phẩm an toàn với
							sức khoẻ</p>
						<p>Địa chỉ: KP.6, p.Linh Trung, Thành phố Thủ Đức</p>
						<p>Hotline: 099909999</p>
					</div>

					<div class="footer-col">
						<h4>DANH MỤC</h4>
						<ul>
							<li><a href="index.jsp">Trang chủ</a></li>
							<li><a href="#">Sản phẩm</a></li>
							<li><a href="#">Giới thiệu</a></li>
							<li><a href="#">Về chúng tôi</a></li>
						</ul>
					</div>
					<div class="footer-col">
						<h4>TRỢ GIÚP</h4>
						<ul>
							<li><a href="#">Chính sách bảo mật</a></li>
							<li><a href="#">Chính sách giao hàng</a></li>
							<li><a href="#">Phương thức thanh toán</a></li>
							<li><a href="#">Chính sách hoàn tiền</a></li>
						</ul>
					</div>

					<div class="footer-col">
						<h4>THEO DÕI SITL MARKET</h4>
						<div class="social-links">
							<a href="#"><img src="./img/facebook.svg"></a> 
							<a href="#"><img src="./img/twitter.svg"></a> 
							<a href="#"><img src="./img/instagram.svg"></a> 
							<a href="#"><img src="./img/linkedin.svg"></a>
						</div>
					</div>
				</div>
			</div>
		</footer>
</body>
</html>
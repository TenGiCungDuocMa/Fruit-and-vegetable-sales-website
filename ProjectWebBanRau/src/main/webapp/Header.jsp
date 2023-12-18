<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel='shortcut icon' href='./img/favicon.ico' />
<title>Rau củ Nông Lâm</title>
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Inter:wght@300;400&display=swap")
	;
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	font-family: 'Inter', sans-serif;
}

:root {
	--color_header_nav: #1f9f1f;
	--color_slider: #7DCE13;
	--color_slidebar: rgb(255, 255, 255);
	--backgound_div: #EDF8F4;
	--text_icon_color: #40AD1A;
	--text_tille: #1F1F1F;
	--color_button: #DBF3DC;
}

.header {
	height: 10vh;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20px 80px;
	background-color: #e3f6e3;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 15px -3px, rgba(0, 0, 0, 0.05)
		0px 4px 6px -2px;
	z-index: 999;
	position: sticky;
	top: 0;
	left: 0;
}

.header .logo {
	padding-top: 10px;
	width: 120px;
	height: 130px;
	object-fit: cover;
}

.navbar {
	padding-top: 1.5rem;
}

.navbar ul {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: row;
}

.navbar ul li {
	list-style: none;
	padding: 0 20px;
	position: relative;
}

.navbar ul li a {
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	color: black;
	transition: 0.4s ease;
}

.navbar ul li a:hover, .navbar ul li a.active {
	color: var(--text_icon_color);
}

.navbar ul li a.active::after, .navbar ul li a:hover:after {
	content: "";
	width: 30%;
	height: 2px;
	position: absolute;
	bottom: -4px;
	left: 20px;
	background: #40AD1A;
}
.header .icon_header {
	display:flex;
}
.header .icon_header a {
	font-size: 20px;
	margin-left: 20px;
	cursor: pointer;
}

.header .icon_header img:hover {
	background-color: #088178;
	border-radius: 20%;
}

.header .icon_header img{
	width:30px;
}
.search_box{
    background-color: #ffff;
    display: flex;
    align-items: center;
    border-radius: 10px;
}
.search_box .search_input{
    height: 40px;
    border: none;
    width: 100%;
    padding: 0 10px;
    outline: none;
    border-radius: 10px;
}
</style>
</head>
<body>
	<div class="header">
		<a href="index.jsp"><img src="./img/logo1.jpg" class="logo" alt="SITL"></a>
		<div class="navbar">
			<ul>
				<li><a href="index.jsp">Trang Chủ</a></li>
				<li><a href="">Sản phẩm</a></li>
				<li><a href="">Giới Thiệu</a></li>
				<li><a href="">Về chúng tôi</a></li>
				<li><a href="">Liên Hệ</a></li>
			</ul>
		</div>
		<div class="icon_header">
			<form action="" class="search_box">
                <input type="text" class="search_input" placeholder="Bạn tìm gì...">
               	<a href="#"><img src="./img/search.svg"></a>
            </form>
			<a href="#"><img src="./img/cart4.svg"></a>
			<a href="SignIn.jsp"><img src="./img/person-fill.svg"></a>
		</div>
	</div>
</body>
</html>
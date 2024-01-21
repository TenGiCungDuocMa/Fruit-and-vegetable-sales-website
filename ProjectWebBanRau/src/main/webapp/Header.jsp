<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

.navbar .nav {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: row;
}

.navbar .nav li {
	list-style: none;
	padding: 0 20px;
	position: relative;
}

.navbar .nav li a {
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	color: black;
	transition: 0.4s ease;
}

.navbar .nav li a:hover, .navbar .nav li a.active {
	color: var(--text_icon_color);
}

.navbar .nav li a.active::after, .navbar .nav li a:hover:after {
	content: "";
	width: 30%;
	height: 2px;
	position: absolute;
	bottom: -4px;
	left: 20px;
	background: #40AD1A;
}

.btn-secondary:hover {
	color: black ! important;
	background-color: #a3ef9b !important;
	border-color: #6c757d !important;
}

.header .icon_header {
	display: flex;
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

.header .icon_header img {
	width: 30px;
}

.search_box {
	background-color: #ffff;
	display: flex;
	border-radius: 10px;
}

.search_box .search_input {
	height: 40px;
	border: none;
	width: 100%;
	padding: 0 10px;
	outline: none;
	border-radius: 10px 0px 0px 10px;
}

.searchbutton {
	background-color: #a3ef9b;
	border: none;
	border-radius: 0px 10px 10px 0px;
	padding: 0px 10px;
}

.searchbutton:hover {
	background-color: #228b22;
}
</style>
</head>
<body>
	<div class="header">
		<a href="index.jsp"><img src="./img/logo1.jpg" class="logo"
			alt="SITL"></a>
		<div class="navbar">
			<ul class="nav">
				<li><a href="index.jsp">Trang Chủ</a></li>
				<li><div class="dropdown">
						<button
							style="font-size: 16px; font-weight: 600; color: inherit; background-color: inherit; border: none;"
							class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">Sản phẩm</button>
						<ul style="flex-direction: column;" class="dropdown-menu"
							aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item"
								href="classify?typeProduct=TRAI CAY SACH">Trái cây sạch</a></li>
							<li><a class="dropdown-item"
								href="classify?typeProduct=RAU CU QUA">Rau củ quả</a></li>
							<li><a class="dropdown-item"
								href="classify?typeProduct=CAC LOAI HOA">Các loại hoa</a></li>
							<li><a class="dropdown-item"
								href="classify?typeProduct=DO AN VAT">Ăn vặt</a></li>
							<li><a class="dropdown-item"
								href="classify?typeProduct=CHE BIEN SAN">Chế biến sẵn</a></li>
							<li><a class="dropdown-item"
								href="classify?typeProduct=DAC SAN VUNG">Đặc sản vùng</a></li>
							<li><a class="dropdown-item"
								href="classify?typeProduct=DO UONG">Đồ uống</a></li>
							<li><a class="dropdown-item"
								href="classify?typeProduct=GIA VI NGU COC">Gia vị ngũ cốc</a></li>
							<li><a class="dropdown-item"
								href="classify?typeProduct=MY PHAM">Mỹ phẩm</a></li>
							<li><a class="dropdown-item"
								href="classify?typeProduct=THIT CA">Thịt cá</a></li>
						</ul>
					</div></li>
			</ul>
		</div>
		<div class="icon_header">
			<form action="lookup" class="search_box" method="get">
				<input type="text" name="searchValue" class="search_input"
					placeholder="Bạn tìm gì..."> <input class="searchbutton"
					type="submit" name="submit" value="Tìm kiếm">
			</form>
			
			<c:if test="${sessionScope.user != null }">
				<a href="tocart"><img src="./img/cart4.svg"></a>
			</c:if>
			<c:if test="${sessionScope.user == null }">
				<a href="SignIn.jsp"><img src="./img/cart4.svg"></a>
			</c:if>
			
			<c:if test="${sessionScope.user == null }">
				<a href="SignIn.jsp"><img src="./img/person-fill.svg"></a>
			</c:if>
			
			<c:if test="${sessionScope.user != null }">
				<p style="color: black; margin: 0px 10px;">Chào,
					${sessionScope.user.tenkh }</p>
				<a href="login?logout=ok" style="font-size: 80%; color: #5f9ea0;">Đăng
					xuất</a>
				<c:if test="${sessionScope.user.rolename == 'addmin'}">
					<a href="UserManagement.jsp"
						style="font-size: 80%; color: #5f9ea0;">Quản lí người dùng</a>
				</c:if>

			</c:if>
		</div>
	</div>
</body>
</html>
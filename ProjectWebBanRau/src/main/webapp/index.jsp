<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rau củ Nông Lâm - Trang chủ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel='shortcut icon' href='./img/favicon.icon' />
<style>
#slidebar .menu a {
	text-decoration: none;
	color: black;
}

.container {
	background-color: white;
}

.container .row a button {
	border-radius: 5px;
	background-color: white;
	border-color: lawngreen;
	color: forestgreen;
}

.container .row a button:hover {
	background-color: green;
	color: white;
}

.container .row .price {
	color: forestgreen;
}

.container .row .col {
	text-align: center;
}

#slidebar .menu li:not(:last-child) {
	margin-bottom: 10px;
}

#slidebar .menu li:hover {
	/* 	background-color: green; */
	padding-left: 8px;
}

#slidebar .menu a:hover {
	color: green;
}

.deal {
	background: url(./img/deal-bg.jpg) no-repeat;
	background-position: center;
	background-size: cover;
	padding: 50px 80px;
	margin-top: 40px;
}

.deal .content_deal {
	max-width: 40rem;
}

.deal .content_deal .title_deal {
	font-size: 40px;
	font-weight: 600;
}

.deal .content_deal p {
	font-size: 15px;
	color: #465b52;
	margin: 5px 0 10px 0;
}

.deal .count_down {
	display: flex;
	gap: 10px;
	margin-bottom: 20px;
}

.deal .content_deal a {
	text-decoration: none;
	padding: 10px 20px;
	border-radius: 4px;
	background-color: #6a961f;
	/* margin-top: 20px; */
	font-size: 15px;
	font-weight: 600;
	color: #fff;
}

.deal .count_down .box_deal {
	width: 7rem;
	text-align: center;
	box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
	border: 1px solid #666;
	border-radius: 4px;
}

.deal .count_down .box_deal h3 {
	color: #041e42;
	background-color: #fff;
	font-size: 40px;
	font-weight: 600;
	/* width: 100%; */
	height: 3rem;
}

.deal .count_down .box_deal span {
	font-size: 20px;
	color: #fff;
	background-color: #1F1F1F;
	font-weight: 800;
	height: 2rem;
	padding-top: 5px;
	display: block;
}

#slideshow {
	overflow: hidden;
	height: 510px;
	width: 728px;
	margin: 0 auto;
}

.slide-wrapper {
	width: 2912px;
	-webkit-animation: slide 14s ease infinite;
}

.slide {
	float: left;
	height: 510px;
	width: 728px;
}

@-webkit-keyframes slide { 
	20%{margin-left: 0px;}
	30%{margin-left:-728px;}
	50%{margin-left:-728px;}
	60%{margin-left:-1456px;}
	80%{margin-left:-1456px;}
}
</style>
</head>
<body style="background-color: #f0f0f0;">
	<%--include code từ trang header.jsp --%>
	<jsp:include page="Header.jsp"></jsp:include>

	<%--tạo mới bean services từ phạm vi session nếu chưa có --%>
	<jsp:useBean id="service" class="model.Services" scope="session"></jsp:useBean>
	<%--tạo mới bean cart từ phạm vi session nếu chưa có --%>
	<jsp:useBean id="cart" class="model.Cart" scope="session"></jsp:useBean>
	<div class="container">
		<div class="row">
			<div class="col-3"
				style="display: flex; justify-content: space-evenly;">
				<img alt="" src="./img/list.svg" width="30px"> <b>Danh mục
					sản phẩm</b>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-3" style="height: fit-content;">
				<div id="slidebar">
					<ul class="menu">
					
						<li><a href="classify?typeProduct=TRAI CAY SACH"><img src="./img/traicay.png"> Trái
								cây sạch</a></li>
						<li><a href="classify?typeProduct=RAU CU QUA"><img src="./img/raucuqua.png"> Rau
								củ quả</a></li>

						<li><a href="classify?typeProduct=CAC LOAI HOA"><img src="./img/flower1.svg" width="30px">
								Các loại hoa</a></li>

						<li><a href="classify?typeProduct=DO AN VAT"><img src="./img/anvat.png"> Ăn vặt</a>
						</li>

						<li><a href="classify?typeProduct=CHE BIEN SAN"><img src="./img/chebiensan.png">
								Chế biến sẵn</a></li>

						<li><a href="classify?typeProduct=DAC SAN VUNG"><img src="./img/dacsanvung.png">
								Đặc sản vùng</a></li>

						<li><a href="classify?typeProduct=DO UONG"><img src="./img/douong.png"> Đồ
								uống</a></li>

						<li><a href="classify?typeProduct=GIA VI NGU COC"><img src="./img/giavingucoc.png">
								Gia vị ngũ cốc</a></li>

						<li><a href="classify?typeProduct=MY PHAM"><img src="./img/mypham.png"> Mỹ
								phẩm</a></li>

						<li><a href="classify?typeProduct=THIT CA"><img src="./img/thitca.png"> Thịt
								cá</a></li>
					</ul>
				</div>

			</div>
			<div class="col-9">
				<div id="slideshow">
					<div class="slide-wrapper">
						<div class="slide">
							<img src="./img/slide1.jpg" width="100%" height="440px">
						</div>
						<div class="slide">
							<img src="./img/slide2.jpg" width="100%" height="440px">
						</div>
						<div class="slide">
							<img src="./img/slide3.jpg" width="100%" height="440px">
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<h4>Trái cây sạch</h4>
			<hr>
		</div>
		<div class="row">
			<c:forEach var="production" varStatus="status"
				items="${sessionScope.service.loadData('TRAI CAY SACH','')}">
				<c:if test="${status.index < 5 }">
					<div class="col">
					<a href="describe?productID=${production.maSP }" style="text-decoration: none; color: black;">
						<img alt="${production.nameProduct }" src="./img/${production.nameFile }" width="150px">
						<h6>${production.nameProduct }</h6>
						<h5 class="price">${production.price}
							<u>đ</u>
						</h5>
					</a>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="row">
			<a href="classify?typeProduct=TRAI CAY SACH" style="text-align: center;"><button>
					Xem tất cả<img alt="" src="./img/caret-right-fill.svg">
				</button></a>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<h4>Rau củ quả</h4>
			<hr>
		</div>
		<div class="row">
			<c:forEach var="production" varStatus="status"
				items="${sessionScope.service.loadData('RAU CU QUA','')}">
				<c:if test="${status.index < 5 }">
					<div class="col">
					<a href="describe?productID=${production.maSP }" style="text-decoration: none; color: black;">
						<img alt="${production.nameProduct }" src="./img/${production.nameFile }" width="150px">
						<h6>${production.nameProduct }</h6>
						<h5 class="price">${production.price}
							<u>đ</u>
						</h5>
						</a>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="row">
			<a href="classify?typeProduct=RAU CU QUA" style="text-align: center;"><button>
					Xem tất cả<img alt="" src="./img/caret-right-fill.svg">
				</button></a>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<h4>Các loại hoa</h4>
			<hr>
		</div>
		<div class="row">
			<c:forEach var="production" varStatus="status"
				items="${sessionScope.service.loadData('CAC LOAI HOA','')}">
				<c:if test="${status.index < 5 }">
					<div class="col">
					<a href="describe?productID=${production.maSP }" style="text-decoration: none; color: black;">
						<img alt="${production.nameProduct }" src="./img/${production.nameFile }" width="150px"
							height="150px">
						<h6>${production.nameProduct }</h6>
						<h5 class="price">${production.price}
							<u>đ</u>
						</h5>
					</a>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="row">
			<a href="classify?typeProduct=CAC LOAI HOA" style="text-align: center;"><button>
					Xem tất cả<img alt="" src="./img/caret-right-fill.svg">
				</button></a>
		</div>
	</div>

	<div class="deal">
		<div class="content_deal">
			<h3 class="title_deal">MÃ GIẢM GIÁ MỖI NGÀY</h3>
			<p>Cà chua bi được trồng ở Lâm Đồng là loại thực phẩm dinh dưỡng,
				tốt cho sức khỏe được nhiều người chọn lựa. Cà chua bi to trái, căng
				mọng có thể dùng ăn chơi hoặc là nguyên liệu cho những món ăn ngon
				khác.</p>

			<div class="count_down">
				<div class="box_deal">
					<h3 id="day">00</h3>
					<span>NGÀY</span>
				</div>
				<div class="box_deal">
					<h3 id="hours">00</h3>
					<span>GIỜ</span>
				</div>
				<div class="box_deal">
					<h3 id="minutes">00</h3>
					<span>PHÚT</span>
				</div>
				<div class="box_deal">
					<h3 id="second">00</h3>
					<span>GIÂY</span>
				</div>
			</div>

			<a href="#">XEM VOUCHER NGAY</a>
		</div>

	</div>
	<%-- include code từ trang Footer.jsp  --%>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
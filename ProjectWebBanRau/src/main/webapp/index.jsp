<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel='shortcut icon' href='./img/favicon.ico' />
<style>
#slidebar .menu a {
	text-decoration: none;
	color: black;
}

.container {
	background-color: #ffffff;
}
.container .row a button:hover{
	background-color: green;
}
.container .row a button{
	border-radius: 5px;
    background-color: lightyellow;
}
.container .row .price{
	color:forestgreen;
}
.container .row .col{
	text-align: center;
}
#slidebar .menu li:hover{
	background-color: green;
}
#slidebar .menu a:hover{
	color:white;
}
.deal{
    background: url(./img/deal-bg.jpg) no-repeat;
    background-position: center;
    background-size: cover;
    padding: 50px 80px;
}
.deal .content_deal{
    max-width: 40rem;
}
.deal .content_deal .title_deal{
    font-size: 40px;
    font-weight: 600;
}
.deal .content_deal p{
    font-size: 15px;
    color: #465b52;
    margin: 5px 0 10px 0;
}
.deal .count_down{
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
}
.deal .content_deal a{
    text-decoration: none;
    padding: 10px 20px;
    border-radius: 4px;
    background-color: #6a961f;
    /* margin-top: 20px; */
    font-size: 15px;
    font-weight: 600;
    color: #fff;
}
.deal .count_down .box_deal{
    width: 7rem;
    text-align: center;
    box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
    border: 1px solid #666;
    border-radius: 4px;
}
.deal .count_down .box_deal h3{
    color: #041e42;
    background-color: #fff;
    font-size: 40px;
    font-weight: 600;
    /* width: 100%; */
    height: 3rem;
}
.deal .count_down .box_deal span{
    font-size: 20px;
    color: #fff;
    background-color: #1F1F1F;
    font-weight: 800;
    height: 2rem;
    padding-top: 5px;
    display: block;
}
</style>
</head>
<body style="background-color: #fffff;">
	<%--include code từ trang header.jsp --%>
	<jsp:include page="Header.jsp"></jsp:include>
	
	<%--tạo mới bean services từ phạm vi session nếu chưa có --%>
<%-- 	<jsp:useBean id="service" class="model.Services" scope="session"></jsp:useBean> --%>
	
	<form action="" method="get">
		<div class="container">
			<div class="row">
				<div class="col-3"
					style="display: flex; justify-content: space-evenly;">
					<img alt="" src="./img/list.svg" width="30px"> <b>Danh
						mục sản phẩm</b>
				</div>
				<div class="col"></div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-3" style="height: fit-content;">
					<div id="slidebar">
						<ul class="menu">
							<li><img src="./img/traicay.png"> <a href="#">Trái
									cây sạch</a></li>

							<li><img src="./img/raucuqua.png"> <a href="#">Rau
									củ quả</a></li>

							<li><img src="./img/flower1.svg" width="30px"> <a
								href="#">Các loại hoa</a></li>

							<li><img src="./img/anvat.png"> <a href="#">Ăn vặt</a>
							</li>

							<li><img src="./img/chebiensan.png"> <a href="#">Chế
									biến sẵn</a></li>

							<li><img src="./img/dacsanvung.png"> <a href="#">Đặc
									sản vùng miền</a></li>

							<li><img src="./img/douong.png"> <a href="#">Đồ
									uống</a></li>

							<li><img src="./img/giavingucoc.png"> <a href="#">Gia
									vị ngũ cốc</a></li>

							<li><img src="./img/mypham.png"> <a href="#">Mỹ
									phẩm</a></li>

							<li><img src="./img/thitca.png"> <a href="#">Thịt
									cá</a></li>
						</ul>
					</div>

				</div>
				<div class="col-9">
					<img alt="" src="./img/slide1.jpg" width="100%" height="80%">
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<h4>Trái cây sạch</h4>
			</div>
			<div class="row">
			<c:set var="sv" scope="session" value="${Services.instance }"></c:set>
			<c:forEach var="production" items="${sessionScope.sv.loadData('TRAI CAY SACH')}">
<!-- 				<div class="col"> -->
<%-- 					<img alt="" src="${production.nameFile }"> --%>
<%-- 					<h5>${production.nameProduct }</h5> --%>
<%-- 					<h4 class="price">${production.price } đ / ${production.unit }</h4> --%>
<!-- 				</div>  -->
hello
			</c:forEach>
			</div>
			<div class="row">
			<a href="#" style="text-align:center;"><button>Xem tất cả<img alt="" src="./img/caret-right-fill.svg"></button></a>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<h4>Rau củ quả</h4>
			</div>
			<div class="row">
				<div class="col">
					<img alt="" src="./img/dautay.jpg">
					<h5>Dâu tây 330g</h5>
					<h4 class="price">455,000<u>đ</u></h4>
				</div>
				<div class="col">
					<img alt="" src="./img/dautay.jpg">
					<h5>Dâu tây 330g</h5>
					<h4 class="price">455,000<u>đ</u></h4>
				</div>
				<div class="col">
					<img alt="" src="./img/dautay.jpg">
					<h5>Dâu tây 330g</h5>
					<h4 class="price">455,000<u>đ</u></h4>
				</div>
				<div class="col">
					<img alt="" src="./img/dautay.jpg">
					<h5>Dâu tây 330g</h5>
					<h4 class="price">455,000<u>đ</u></h4>
				</div>
			</div>
			<div class="row">
			<a href="#" style="text-align:center;"><button>Xem tất cả<img alt="" src="./img/caret-right-fill.svg"></button></a>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<h4>Các loại hoa</h4>
			</div>
			<div class="row">
				<div class="col">
					<img alt="" src="./img/dautay.jpg">
					<h5>Dâu tây 330g</h5>
					<h4 class="price">455,000<u>đ</u></h4>
				</div>
				<div class="col">
					<img alt="" src="./img/dautay.jpg">
					<h5>Dâu tây 330g</h5>
					<h4 class="price">455,000<u>đ</u></h4>
				</div>
				<div class="col">
					<img alt="" src="./img/dautay.jpg">
					<h5>Dâu tây 330g</h5>
					<h4 class="price">455,000<u>đ</u></h4>
				</div>
				<div class="col">
					<img alt="" src="./img/dautay.jpg">
					<h5>Dâu tây 330g</h5>
					<h4 class="price">455,000<u>đ</u></h4>
				</div>
			</div>
			<div class="row">
			<a href="#" style="text-align:center;"><button>Xem tất cả<img alt="" src="./img/caret-right-fill.svg"></button></a>
			</div>
		</div>
		
		 <div class="deal">
        <div class="content_deal">
            <h3 class="title_deal">MÃ GIẢM GIÁ MỖI NGÀY</h3>
            <p>Cà chua bi được trồng ở Lâm Đồng là loại thực phẩm dinh dưỡng, tốt cho sức khỏe được nhiều người chọn lựa. Cà chua bi to trái, căng mọng có thể dùng ăn chơi hoặc là nguyên liệu cho những món ăn ngon khác.</p>

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
	</form>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
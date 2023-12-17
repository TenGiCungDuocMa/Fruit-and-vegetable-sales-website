<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trái cây sạch</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel='shortcut icon' href='./img/favicon.ico' />
<style type="text/css">
.navi {
	color: black;
}

.navi a {
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


.container .row .col h6 a{
	text-decoration: none;
	color: #a9a9a9;
	margin-right: 25px;
}
.container .row .col h6 a:hover{
	color: #228b22;
	border-bottom: 2px solid #228b22;
}
</style>
</head>
<body style="background-color: #f0f0f0;">
	<jsp:include page="Header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<p class="navi">
				<a href="index.jsp">Trang chủ</a>/Danh mục/${requestScope.typeName }
			</p>
		</div>
		<div class="row">
			<div class="col-3">
				<div class="brandname">THƯƠNG HIỆU</div>
				<hr>
				<div class="prices">MỨC GIÁ</div>
				<hr>
				<div class="type">LOẠI</div>
			</div>
			<div class="col">
				<div class="row" style="text-align: left;">
					<h4 style="margin-bottom: 30px;">${requestScope.typeName }</h4>
					<h6>
						Sắp xếp: <a href="#">Tên A -> Z</a>		
						<a href="#">Tên Z -> A</a>		
						<a href="#">Giá giảm dần</a>		
						<a href="#">Giá tăng dần</a>		
						<a href="#">Hàng mới</a>
					</h6>
				</div>
				<hr>
				<div class="row">
					<c:forEach var="production" items="${requestScope.listPro}">
						<div class="col">
						<a href="#" style="text-decoration: none; color: black;">
							<img alt="" src="./img/${production.nameFile }" width="150px" height="150px">
							<h6>${production.nameProduct }</h6>
							<h5 class="price">${production.price}
								<u>đ</u> / ${production.unit }
							</h5>
						</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
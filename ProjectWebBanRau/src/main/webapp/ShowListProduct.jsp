<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${requestScope.typeName }</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel='shortcut icon' href='./img/favicon.ico' />
<style type="text/css">
.navi {
	color: black;
	padding-top: 20px;
	display: flex;
	
}

.navi a {
	text-decoration: none;
	color: black;
}

.container {
	background-color: white;
}

.container .row .col {
	margin-bottom: 70px;
}

.container .row .price {
	color: forestgreen;
}

.container .row .col h6 a {
	text-decoration: none;
	color: #a9a9a9;
	margin-right: 25px;
}

.container .row .col h6 a:hover {
	color: #228b22;
	border-bottom: 2px solid #228b22;
}

.filter input {
	height: 50px;
	background-color: #5bbb46;
	color: #ffffff;
	border: none;
	border-radius: 4px;
	font-weight: bold;
}
.filter input:hover{
	background-color: #228b22;
}
</style>
</head>
<body style="background-color: #f0f0f0;">
	<jsp:include page="Header.jsp"></jsp:include>
	<div class="container" style="margin-bottom: 30px; border-radius: 1%;">
		<div class="row" style="margin-bottom: 30px;background-color:#b0b0b0;">
			<div class="navi">
				<a href="index.jsp">Trang chủ</a>/Danh mục/ <p>${requestScope.typeName }</p>
			</div>
		</div>
	</div>
	<div class="container"
		style="margin-bottom: 50px; padding-top: 30px; border-radius: 1%;">
		<div class="row">
			<div class="col-3">
				<form action="classify" method="get">
					<div class="brandname">
						<h6 style="font-weight: bold;">THƯƠNG HIỆU</h6>
						<c:forEach var="brand_name" items="${requestScope.listBrand }">
							<div class="form-check">
								<input name="nameBrand" class="form-check-input" type="checkbox"
									value="${brand_name }" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault">
									${brand_name } </label>
							</div>
						</c:forEach>
					</div>
					<hr>
					<div class="prices">
						<h6 style="font-weight: bold;">MỨC GIÁ</h6>
						<div class="form-check">
							<input name="priceLevel" class="form-check-input" type="checkbox"
								value="Under100k" id="flexCheckDefault"> <label
								class="form-check-label" for="flexCheckDefault"> Giá
								dưới 100.000đ </label>
						</div>
						<div class="form-check">
							<input name="priceLevel" class="form-check-input" type="checkbox"
								value="From100kTo200k" id="flexCheckDefault"> <label
								class="form-check-label" for="flexCheckDefault">
								100.000đ - 200.000đ </label>
						</div>
						<div class="form-check">
							<input name="priceLevel" class="form-check-input" type="checkbox"
								value="From200kTo300k" id="flexCheckDefault"> <label
								class="form-check-label" for="flexCheckDefault">
								200.000đ - 300.000đ </label>
						</div>
						<div class="form-check">
							<input name="priceLevel" class="form-check-input" type="checkbox"
								value="From300kTo500k" id="flexCheckDefault"> <label
								class="form-check-label" for="flexCheckDefault">
								300.000đ - 500.000đ </label>
						</div>
						<div class="form-check">
							<input name="priceLevel" class="form-check-input" type="checkbox"
								value="over500k" id="flexCheckDefault"> <label
								class="form-check-label" for="flexCheckDefault">
								 Giá trên 500.000đ </label>
						</div>
					</div>
					<input type="hidden" name="typeProduct" value="${requestScope.typePro }">
					<div class="filter"
						style="margin-top: 20px; justify-content: center; display: flex;">
						<input style="width: 50%" type="submit" value="Áp dụng" >
					</div>
				</form>
			</div>
			<div class="col">
				<div class="row" style="text-align: left;">
					<h4 style="margin-bottom: 30px;">${requestScope.typeName }</h4>
					<h6>
						Sắp xếp: 
						<a href="classify?sortby=name&sortto=AZ&typeProduct=${requestScope.typePro }">Tên A -> Z</a> 
						<a href="classify?sortby=name&sortto=ZA&typeProduct=${requestScope.typePro }">Tên Z -> A</a> 
						<a href="classify?sortby=price&sortto=ZA&typeProduct=${requestScope.typePro }">Giá giảm dần</a> 
						<a href="classify?sortby=price&sortto=AZ&typeProduct=${requestScope.typePro }">Giá tăng dần</a> 
						<a href="classify?sortby=newPro&sortto=nosort&typeProduct=${requestScope.typePro }">Hàng mới</a>
					</h6>
				</div>
				<hr>
				<div class="row">
					<c:forEach var="production" items="${requestScope.listPro}">
						<div class="col" style="max-width: 30%;">
							<a href="describe?productID=${production.maSP }"
								style="text-decoration: none; color: black;"> <img
								alt="${production.nameProduct }"
								src="./img/${production.nameFile }" width="150px" height="150px">
								<h6>${production.nameProduct }</h6>
								<h5 class="price">${production.price}
									<u>đ</u>
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
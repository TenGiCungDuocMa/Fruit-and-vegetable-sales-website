<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel='shortcut icon' href='./img/favicon.ico' />
<style type="text/css">
.container {
	background-color: white;
}

.cart input {
	height: 50px;
	background-color: #5bbb46;
	color: #ffffff;
	border: none;
	border-radius: 4px;
	font-weight: bold;
}

.col li {
	display: flex;
	margin-bottom: 20px;
}

.label {
	font-size: 16px;
	margin-left: 10px;
}
</style>
</head>
<body style="background-color: #f0f0f0;">
	<jsp:include page="Header.jsp"></jsp:include>
	<div class="container" style="margin-bottom: 80px; border-radius: 1%;">
		<div class="row">
			<div class="col-4">
				<img alt="${requestScope.product.nameProduct }"
					src="./img/${requestScope.product.nameFile }" width="300px"
					height="300px">
			</div>
			<div class="col">
				<div class="row">
					<p style="color: black; font-size: 50px;">${requestScope.product.nameProduct }</p>
				</div>
				<div class="row">
					<div class="col-7">
						<form action="" method="get">
							<div
								style="font-size: 15px; display: flex; justify-content: space-evenly;">
								Thương hiệu:
								<p style="color: #5bbb46;">${requestScope.product.brandName}</p>
								| Tình trạng:
								<c:choose>
									<c:when test="${requestScope.product.quantity > 0}">
										<p style="color: #5bbb46; font-size: 15px;">Còn hàng</p>
									</c:when>
									<c:when test="${requestScope.product.quantity <= 0}">
										<p style="color: #5bbb46; font-size: 15px;">Hết hàng</p>
									</c:when>
								</c:choose>
							</div>
							<div class="price"
								style="font-size: 40px; color: #2e891a; background-color: #f1f1f1">
								${requestScope.product.price} <u>đ</u>
							</div>
							<div
								style="display: flex; align-items: center; margin-top: 20px;">
								<h5 style="margin-right: 30px">Tiêu đề:</h5>
								<input type="radio" id="unitTitle" checked="checked" name="unit"
									value="${requestScope.product.unit }"> <label
									for="unitTitle" style="margin-left: 10px;">${requestScope.product.unit }</label>
							</div>
							<hr>
							<c:if test="${requestScope.product.quantity > 0}">	
								<div style="display: flex;">
									<h6>Số lượng:</h6>
									<input style="width: 80px; margin-left: 20px;" type="number"
										min="1" required="required" name="Quantity">
								</div>
								<div class="cart" style="margin-top: 20px;">
									<input style="width: 60%;" type="submit" name="addCart"
										value="Thêm vào giỏ hàng"> <input style="width: 38%;"
										type="submit" name="pay" value="Thanh toán">
								</div>
							</c:if>
						</form>
					</div>

					<div class="col">
						<div
							style="border: 1px solid #5bbb46; border-radius: 5px; margin-right: 20px; padding: 10px;">
							<h4>Duy nhất tại raucunonglam.vn</h4>
							<ul style="padding-left: 0px;">
								<li>
									<div>
										<img alt="" src="./img/policy_product_image_1.webp"
											width="32px">
									</div>
									<div class="label">Free ship 10km cho đơn hàng từ 700k</div>
								</li>
								<li>
									<div>
										<img alt="" src="./img/policy_product_image_2.webp"
											width="32px">
									</div>
									<div class="label">Giao hàng trong 1h</div>
								</li>
								<li>
									<div>
										<img alt="" src="./img/policy_product_image_3.webp"
											width="32px">
									</div>
									<div class="label">Tích điểm tất cả sản phẩm</div>
								</li>
								<li>
									<div>
										<img alt="" src="./img/policy_product_image_4.webp"
											width="32px">
									</div>
									<div class="label">Thực Phẩm Hữu Cơ Tốt cho Sức Khoẻ</div>
								</li>
							</ul>
						</div>
						<div>
							<img alt="" src="./img/product_trustbadge.webp" width="100%"
								height="auto">
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="container" style="margin-bottom: 80px; border-radius: 1%;">
		<div class="row">
			<h4 style="padding-top: 22px;">Mô tả sản phẩm</h4>
		</div>
		<hr style="margin-top: 0px;">
		<div class="row">
			<p style="color: black;">${requestScope.product.description}</p>
		</div>
	</div>
	<div class="container" style="margin-bottom: 80px; border-radius: 1%;">
		<div class="row">
			<h4 style="padding-top: 22px;">Sản phẩm cùng loại</h4>
		</div>
		<hr style="margin-top: 0px;">
		<div class="row">
			<c:forEach var="production" varStatus="status"
				items="${sessionScope.service.loadData(requestScope.product.typeProduct)}">
				<c:if test="${status.index < 5 }">
					<div class="col">
						<a href="describe?productID=${production.maSP }"
							style="text-decoration: none; color: black;"> <img
							alt="${production.nameProduct }"
							src="./img/${production.nameFile }" width="150px" height="150px">
							<h6>${production.nameProduct }</h6>
							<h5 style="color: forestgreen;">${production.price}
								<u>đ</u>
							</h5>
						</a>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
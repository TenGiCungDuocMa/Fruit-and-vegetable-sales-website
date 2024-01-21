<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh toán</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel='shortcut icon' href='./img/favicon.icon' />
<style type="text/css">
.container {
	background-color: white;
}

.row .submit {
	height: 50px;
	background-color: #5bbb46;
	color: #ffffff;
	border: none;
	border-radius: 4px;
	font-weight: bold;
	padding: 10px;
}

.row .submit:hover {
	background-color: #228b22;
}
</style>
</head>
<body style="background-color: #f0f0f0;">
	<c:choose>
		<c:when test="${sessionScope.user == null}">
			<jsp:forward page="SignIn.jsp">
				<jsp:param value="3" name="ok" />
			</jsp:forward>
		</c:when>
		<c:when
			test="${sessionScope.user.rolename != 'client' && sessionScope.user.rolename != 'addmin'}">
			<jsp:forward page="AccessError.jsp"/>
		</c:when>

	</c:choose>
	<h4 style="text-align: center;">Cửa hàng thực phẩm hữu cơ Nông Lâm
		Vegetable</h4>
	<h5 style="text-align: center; margin: 2% 0%;">Xác nhận thanh toán</h5>
	<div class="container">
		<div class="row">
			<div class="col-7">
				<!-- lấy bean Services trong session -->
				<jsp:useBean id="sv" class="model.Services" scope="session"></jsp:useBean>
				<c:forEach var="iter"
					items="${requestScope.listPro }">
					<!-- đặt biến product cho mỗi productid -->
					<c:set var="product" value="${iter.getKey() }" />
					<c:set var="quantity" value="${iter.getValue() }" />
					<div class="row" style="align-items: center;">
						<div class="col">
							<img alt="" src="./img/${product.nameFile }"
								style="width: 50%; margin-left: 16px;">
						</div>
						<div class="col" style="font-size: large;">${product.nameProduct}</div>
						<div class="col">
							<c:set var="money"
								value="${product.price * quantity }" />
							<h4 style="font-weight: bold;">${money }
								<u>đ</u>
							</h4>
						</div>
						<div class="col">${quantity }</div>
					</div>
					<hr>
				</c:forEach>

			</div>
			<div class="col">
				<div class="row">
					<div class="col">
						<h5>Tạm tính</h5>
					</div>
					<div class="col">
						<h5>${requestScope.totalMoney }đ</h5>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h5>Phí vận chuyển</h5>
					</div>
					<div class="col">
						<h5>-</h5>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col">
						<h5>Tổng cộng</h5>
					</div>
					<div class="col">
						<h5>${requestScope.totalMoney }đ</h5>
					</div>
				</div>
				<div class="row" style="text-align: center; align-items: center;">
					<div class="col">
						<a href="tocart" style="color: green; text-decoration: none;">Giỏ
							hàng</a>
					</div>
					<div class="col">
						<a href="order"><button class="submit" style="margin: 10% 0%;">Đặt
								hàng</button></a>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>
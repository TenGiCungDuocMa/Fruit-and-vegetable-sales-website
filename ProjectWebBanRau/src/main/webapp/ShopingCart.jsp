<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel='shortcut icon' href='./img/favicon.icon' />
<style type="text/css">
.remove_tagA {
	color: #9ba2ad;
	text-decoration: none;
}

.remove_tagA:hover {
	color: red;
}

.container {
	background-color: white;
	border-radius: 3%;
}

.navi {
	color: black;
	padding: 20px 0px;
	display: flex;
}

.navi a {
	text-decoration: none;
	color: black;
}

.namePro {
	font-size: large;
	color: black;
	text-decoration: none;
	color: black;
}

.namePro:hover {
	color: #5bbb46;
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
	<jsp:include page="Header.jsp"></jsp:include>
	<div class="container" style="margin-bottom: 30px; border-radius: 1%;">
		<div class="row"
			style="margin-bottom: 30px; background-color: #b0b0b0;">
			<div class="navi">
				<a href="index.jsp">Trang chủ</a>/Giỏ hàng
			</div>
		</div>
	</div>
	<div class="container" style="margin-bottom: 50px; padding: 40px;">
		<div class="row">
			<h3>Giỏ hàng</h3>
		</div>
		<hr>
		<div class="row">
			<div class="col-9"
				style="border-right-style: groove; border-right-width: thin;">
				<c:choose>
					<c:when test="${requestScope.listPro.hasNext()}">
						<!-- lấy bean Services trong session -->
						<jsp:useBean id="sv" class="model.Services" scope="session"></jsp:useBean>
						<c:forEach var="iter" items="${requestScope.listPro }">
							<!-- đặt biến product cho mỗi key -->
							<c:set var="product" value="${iter.getKey() }" />
							<c:set var="quantity" value="${iter.getValue() }" />
							<div class="row" style="align-items: center;">
								<div class="col">
									<c:url var="link" value="tocart">
										<c:param name="removeProduct" value="${product.maSP }"></c:param>
									</c:url>
									<a href="${link }"
										class="remove_tagA">Xóa</a> <img alt=""
										src="./img/${product.nameFile }"
										style="width: 50%; margin-left: 16px;">
								</div>
								<div class="col">
									<a href="describe?productID=${product.maSP }"
										class="namePro">${product.nameProduct}</a>
								</div>
								<div class="col">
									<c:set var="money"
										value="${product.price * quantity }" />
									<h4 style="font-weight: bold;">${money }
										<u>đ</u>
									</h4>
								</div>
								<div class="col">
									<input name="quantity" type="number" min="1"
										value="${quantity }" required="required"
										style="width: 30%;">
								</div>
							</div>
							<hr>
						</c:forEach>
					</c:when>
					<c:when test="${!requestScope.listPro.hasNext()}">
						<h3>
							Giỏ hàng của bạn trống kìa! Đi <a href="index.jsp">mua hàng</a>
							thôi!
						</h3>
					</c:when>
				</c:choose>
			</div>
			<c:if test="${requestScope.totalMoney > 0}">
				<div class="col" style="margin-left: 10px;">
					<div class="row">
						<div class="col">Tổng tiền:</div>
						<div class="col">
							<h6 style="font-weight: bold;">${requestScope.totalMoney}
								<u>đ</u>
							</h6>
						</div>
					</div>
					<div class="row">
						<c:url var="url" value="tocart">
							<c:param name="addCart" value="Thanh toán"></c:param>
						</c:url>
						<a href="${url }"><button class="submit"
								style="margin: 10% 0%;">Tiến hành thanh toán</button></a>
					</div>
					<div class="row">
						<a href="index.jsp"
							style="color: #9ba2ad; text-decoration: none; text-align: center; margin-bottom: 10%;">Tiếp
							tục mua hàng</a>
					</div>
					<div class="row">
						<p style="color: black; font-size: 14px;">Nếu bạn có lưu lý gì
							đặc biệt cho đơn hàng thì điền vào đây nhé!</p>
						<textarea rows="5" cols="50" name="noteByClient"></textarea>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
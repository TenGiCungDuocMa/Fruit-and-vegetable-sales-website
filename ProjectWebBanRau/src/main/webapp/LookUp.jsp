<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm kiếm sản phẩm</title>
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
</style>
</head>
<body style="background-color: #f0f0f0;">
	<jsp:include page="Header.jsp"></jsp:include>
	<div class="container">
	<div class="row" style="margin-bottom: 30px;background-color:#b0b0b0;">
		<div class="navi">
				<a href="index.jsp">Trang chủ</a>/ Tìm kiếm: <p> ${requestScope.valueSearch }</p>
		</div>
	</div>
	</div>
	<div class="container">
	<div class="row">
		<h3 style="margin-top: 30px;">CÓ ${requestScope.listProduct.size() } KẾT QUẢ TÌM KIẾM PHÙ HỢP</h3>
		<hr>
		<c:forEach var="production" items="${requestScope.listProduct }">
			<div class="col" style="max-width: 30%;">
					<a href="describe?productID=${production.maSP }" style="text-decoration: none; color: black;">
						<img alt="${production.nameProduct }" src="./img/${production.nameFile }" width="150px" height="150px">
						<h6>${production.nameProduct }</h6>
						<h5 class="price" style="color: forestgreen;">${production.price}
							<u>đ</u>
						</h5>
						</a>
					</div>
		</c:forEach>
	</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
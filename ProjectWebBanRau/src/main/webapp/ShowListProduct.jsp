<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<p class="navi">
		<a href="#">Trang chủ</a>/Danh mục/
	</p>
	<div class="container">
		<div class="row">
			<div class="col-3">
				<div class="brandname">THƯƠNG HIỆU</div>
				<hr>
				<div class="prices">MỨC GIÁ</div>
				<hr>
				<div class="type">LOẠI</div>
			</div>
			<div class="col">
				<div>
					<h4>Trái cây hữu cơ</h4>
					<h6>
						Sắp xếp: <a href="#">Tên A -> Z</a> <a href="#">Tên Z -> A</a> <a
							href="#">Giá giảm dần</a> <a href="#">Giá tăng dần</a> <a
							href="#">Hàng mới</a>
					</h6>
				</div> <hr>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
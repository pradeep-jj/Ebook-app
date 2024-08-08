<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Home</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #bccbde;">
	<c:if test="${empty adminObj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>
	<h1 class="text-center text-primary">Admin homepage</h1>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4">
				<a href="add_categories.jsp">
					<div class="card paint-card">
						<div class="card-body text-center">
							<i class="fas fa-plus-circle fa-3x"></i><br>
							<h3>Add Categories</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="add_books.jsp">
					<div class="card paint-card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
							<h3>Add Books</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="order.jsp">
					<div class="card paint-card">
						<div class="card-body text-center">
							<i class="fas fa-plus-circle fa-3x"></i><br>
							<h3>User Ordered Books</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-4">
				<a href="user.jsp">
					<div class="card paint-card">
						<div class="card-body text-center">
							<i class="fa-regular fa-user fa-3x text-danger"></i><br>
							<h3>User</h3>
						</div>
					</div>
				</a>
			</div>
			
				<div class="col-md-4 mt-4">
				<a href="my_order.jsp">
					<div class="card paint-card">
						<div class="card-body text-center">
							<i class="fa-regular fa-user fa-3x text-danger"></i><br>
							<h3>My Order</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-4">
				<a href="feedback.jsp">
					<div class="card paint-card">
						<div class="card-body text-center">
							<i class="fa-regular fa-user fa-3x text-danger"></i><br>
							<h3>Feedback</h3>
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
	<div class="container text-center mt-5 p-5">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Successfull</h2>
		<h5>Your Product will be Delivered In your Address Soon</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
			href="orders.jsp" class="btn btn-danger mt-3">View Order</a>
	</div>
</body>
</html>
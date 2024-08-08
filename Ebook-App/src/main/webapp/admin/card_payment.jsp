
<%@page import="com.entity.AdminOrders"%>
<%@page import="com.DAO.SOrderDAO"%>
<%@page import="com.DAO.SBookDAO"%>
<%@page import="com.DAO.SCartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.Orders"%>
<%@page import="java.util.Date"%>
<%@page import="com.entity.Books"%>
<%@page import="com.DAO.OrdersDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAO"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Card Payment</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style type="text/css">
.error {
	color: red;
}
</style>

<link rel="stylesheet" href="../css/card.css">

</head>
<body>
	<c:if test="${empty adminObj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="wrapper">
		<h4 class="text-uppercase text-center">Payment Details</h4>
		<form class="form mt-4" id="cardform" novalidate
			action="card_payment.jsp">

			<div class="form-group">
				<label for="card" class="text-uppercase">card number</label>
				<div class="card-number">
					<input type="text" class="card-no" name="cno"
						placeholder="1234 4567 5869 1234"> <span class="">
						<img
						src="https://www.freepnglogos.com/uploads/mastercard-png/mastercard-marcus-samuelsson-group-2.png"
						alt="" width="30" height="30">
					</span>
				</div>
			</div>
			<div class="d-flex w-100">
				<div class="d-flex w-50 pr-sm-4">
					<div class="form-group">
						<label for="expiry" class="text-uppercase">exp date</label> <input
							name="dt" type="text" class="form-control" placeholder="03/2020">
					</div>
				</div>
				<div class="d-flex w-50 pl-sm-5 pl-3">
					<div class="form-group">
						<label for="cvv">CVV</label> <a href="#"
							title="CVV is a credit or debit card number, the last three digit number printed on the signature panel">what's
							this</a> <input name="cvv" type="password" class="form-control pr-5">
					</div>
				</div>
			</div>

			<div class="form-group">
				<label for="name" class="text-uppercase">name on the card</label> <input
					name="cname" type="text" class="form-control">
			</div>
			<%
			String amount = request.getParameter("amt");
			%>
			<div class="form-group">
				<label for="name" class="text-uppercase">Total Amount</label> <input
					name="" type="text" class="form-control" value="<%=amount%>"
					readonly>
			</div>

			<div class="my-3">
				<input type="submit" value="Pay Now"
					class="text-uppercase btn btn-primary btn-block p-3">
			</div>
			<div id="form-footer">
				<p>By placing your order, you agree to our</p>
				<p>
					<a href="#">privacy notice</a> & <a href="#">terms of use</a>.
				</p>
			</div>

			<%
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String phno = request.getParameter("phno");
			%>
			<input type="hidden" name="amount" value="<%=amount%>"> <input
				type="hidden" name="name" value="<%=name%>"> <input
				type="hidden" name="email" value="<%=email%>"> <input
				type="hidden" name="address" value="<%=address%>"> <input
				type="hidden" name="phno" value="<%=phno%>">
		</form>
	</div>



	<%
	String amt1 = request.getParameter("amount");
	String name1 = request.getParameter("name");
	String email1 = request.getParameter("email");
	String address1 = request.getParameter("address");
	String phno1 = request.getParameter("phno");
	if (amt1 != null) {
		SCartDAO dao = new SCartDAO(DBConnect.getConn());
		SBookDAO dao2 = new SBookDAO(DBConnect.getConn());

		List<Cart> cartList = dao.getAllCarts();

		AdminOrders order = null;

		List<AdminOrders> orderList = new ArrayList<AdminOrders>();
		Random random = new Random();

		for (Cart c : cartList) {

			order = new AdminOrders();
			order.setDate(new Date().toLocaleString());
			order.setOrderId("ORD-" + random.nextInt(1000));
			order.setBookId(c.getBookId());
			order.setName(name1);
			order.setEmail(email1);
			order.setPhno(phno1);

			order.setAddress(address1);
			order.setQuantity(c.getQuantity());

			Books b = dao2.getBookById(c.getBookId());

			order.setTotalAmount((b.getPrice() * c.getQuantity()) + "");
			order.setPaymentType("Online Payment");
			order.setStatus("Order Recieved");

			orderList.add(order);
		}

		SOrderDAO dao3 = new SOrderDAO(DBConnect.getConn());

		boolean f = dao3.addOrders(orderList);

		if (f) {
			response.sendRedirect("order_sucess.jsp");
		} else {
			response.sendRedirect("home.jsp");
		}
	}
	%>














	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="../js/card.js"></script>
</body>
</html>
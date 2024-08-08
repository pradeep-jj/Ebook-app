<%@page import="com.DAO.SBookDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Books"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.user"%>
<%@page import="com.DAO.CartDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Cart Page</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.clink {
	text-decoration: none;
}

.error {
	color: red;
}
</style>
</head>
<body>
	<c:if test="${empty adminObj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<%@include file="navbar.jsp"%>
	<h4 class="text-center text-success">Ebook Cart Page</h4>
	<div class="container-fluid p-5">

		<div class="row">

			<div class="col-md-8 offset-md-2">
				<table class="table table-bordered ">
					<thead class="text-center bg-dark text-white">
						<tr>
							<th scope="col">Image</th>
							<th scope="col">Name</th>
							<th scope="col">Price</th>
							<th scope="col">Quantity</th>
							<th scope="col">Total Price</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody class="text-center">

						<%
						Double totalBillingPrice = 0.0;

						SCartDAO dao2 = new SCartDAO(DBConnect.getConn());
						SBookDAO dao3 = new SBookDAO(DBConnect.getConn());
						List<Cart> list2 = dao2.getAllCarts();
						for (Cart c : list2) {
							Books b = dao3.getBookById(c.getBookId());
						%><tr>
							<th scope="row"><img src="../book/<%=b.getImgBookName()%>"
								width="50px" height="50px"></th>
							<td><%=b.getBookName()%></td>

							<td><%=b.getPrice()%></td>
							<td><%=c.getQuantity()%></td>
							<td>
								<%
								Double totalprice = c.getQuantity() * b.getPrice();
								totalBillingPrice = totalBillingPrice + totalprice;
								%> <%=totalprice%></td>
							<td class="text-center"><a
								href="../scartin?bid=<%=b.getId()%>&&ac=plus"
								class="text-success"><i class="fas fa-2x  fa-plus-circle"></i></a>

								<a href="../scartin?bid=<%=b.getId()%>&&ac=neg"
								class="text-danger"><i class="fas fa-2x fa-minus-circle"></i></a></td>
						</tr>

						<%
						}
						%>



					</tbody>
				</table>




			</div>

			<div class="col-md-8 offset-md-2">

				<div class="col-md-12 mt-2">
					<div class="card paint-card">
						<div class="card-body">
							<p class="fs-6 text-Secondary text-center">Payment</p>
							<p class="fw-bold" style="color: black;">
								Amount: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<i
									class="fa fa-inr"></i>
								<%=totalBillingPrice%><br> Shipping Charge:&nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<i
									class="fa fa-inr"></i> 60 <br> Tax :&nbsp; &nbsp;
								&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
								&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
								&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
								&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<i class="fa fa-inr"></i> 30
							</p>
							<hr>
							<p class="fw-bold">
								Total Amount:&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
								&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
								&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<i
									class="fa fa-inr"></i>
								<%=totalBillingPrice + 60.0 + 30.0%><br>

								<!-- Payment Type:&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
								&nbsp;&nbsp; &nbsp;&nbsp; Cash On Delivary -->


							</p>




							<form action="../aorders" method="post" id="cartForm" novalidate>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="inputEmail4">Name</label> <input type="text"
											name="name" class="form-control" >
									</div>
									<div class="form-group col-md-4">
										<label for="inputEmail4">Email</label> <input type="email"
											name="email" class="form-control" >
									</div>
									<div class="form-group col-md-4">
										<label for="inputEmail4">Phone Number</label> <input
											name="phno" type="number" class="form-control"
											>
									</div>
								</div>




								<div class="form-group ">
									<label for="inputPassword4">Adress</label>
									<textarea rows="2" name="address" class="form-control"></textarea>
								</div>





								<div class="form-group col-md-12">
									<label class="form-label">Payment Mode</label> <select
										name="type" class="form-control form-control-sm">
										<option value="">--select--</option>
										<option value="Debit">Debit Card / Credit Card</option>
										<option value="COD">Cash On Delivary</option>
									</select>
								</div>
								<input type="hidden" name="amt"
									value="<%=totalBillingPrice + 60.0 + 30.0%>">



								<%
								if (list2.isEmpty()) {
								%>
								<button class="btn btn-success col-md-12 text-white" disabled>Place
									Order</button>
								<%
								} else {
								%>
								<button class="btn btn-success col-md-12 text-white">Place
									Order</button>
								<%
								}
								%>

							</form>
						</div>

					</div>
				</div>
			</div>


		</div>
	</div>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="../js/cart.js"></script>
</body>
</html>
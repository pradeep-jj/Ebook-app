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
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.clink {
	text-decoration: none;
}
</style>
</head>
<body>
	<c:if test="${empty userObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<h4 class="text-center text-success">Ebook Cart Page</h4>
	<div class="container-fluid p-5">

		<div class="row">

			<div class="col-md-8">
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
						user us = (user) session.getAttribute("userObj");
						CartDAO dao2 = new CartDAO(DBConnect.getConn());
						BookDAO dao3 = new BookDAO(DBConnect.getConn());
						List<Cart> list2 = dao2.getAllCarts(us.getId());
						for (Cart c : list2) {
							Books b = dao3.getBookById(c.getBookId());
						%><tr>
							<th scope="row"><img src="book/<%=b.getImgBookName()%>"
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
								href="cartin?bid=<%=b.getId()%>&&uid=<%=us.getId()%>&&ac=plus"
								class="text-success"><i class="fas fa-2x  fa-plus-circle"></i></a>

								<a href="cartin?bid=<%=b.getId()%>&&uid=<%=us.getId()%>&&ac=neg"
								class="text-danger"><i class="fas fa-2x fa-minus-circle"></i></a></td>
						</tr>

						<%
						}
						%>



					</tbody>
				</table>

			</div>

			<div class="col-md-4">
				<div class="col-md-12">
					<div class="card paint-card">
						<div class="card-body">
							<p class="fs-6 text-Secondary text-center">Delivery Address</p>

							<p style="color: black;">
								name: ${userObj.name } <br>address: ${userObj.adress} <br>city: ${userObj.city }
								,<br>state: ${userObj.state }<br>pincode: ${userObj.pincode } <br>Mobile
								No: ${userObj.phno }

							</p>
							<a class="fs-5 text-decoration-none" href="edit_profile.jsp">Change
								Address</a>


						</div>
					</div>
				</div>
				<div class="col-md-12 mt-2">
					<div class="card paint-card">
						<div class="card-body">
							<p class="fs-6 text-Secondary text-center">Payment</p>
							<p class="fw-bold" style="color: black;">
								Amount: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<i
									class="fa fa-inr"></i>
								<%=totalBillingPrice %><br> Shipping Charge:&nbsp; &nbsp;
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
								<%=totalBillingPrice+60.0+30.0 %><br>

								<!-- Payment Type:&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
								&nbsp;&nbsp; &nbsp;&nbsp; Cash On Delivary -->


							</p>




							<form class="row g-3" action="orders" method="post">
								<div class="form-group col-md-12">
									<label class="form-label">Payment Mode</label> <select
										name="type" class="form-control form-control-sm">
										<option>--select--</option>
										<option value="Debit">Debit Card / Credit Card</option>
										<option value="COD">Cash On Delivary</option>
									</select>
								</div>
								<input type="hidden" name="amt"
									value="<%=totalBillingPrice+60.0+30.0%>"> 
									
									<input
									type="hidden" value="${userObj.id}" name="uid">



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
</body>
</html>
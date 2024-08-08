<%@page import="com.entity.Books"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.entity.Orders"%>
<%@page import="com.DAO.OrdersDAO"%>
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
<title>Artist | Order</title>
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
	 <c:if test="${empty userObj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if> 
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid p-5">
		<div class="row">
			<div class="col-md-12 paint-card">
				<h4 class="fs-3 text-center">Your Orders</h4>
				<table class="shadow-sm table table-bordered table-striped">
					<thead class="table-dark">
						<tr>
							<th class="text-center">Order ID</th>
							<th> Date</th>
							<th>Delivery Address</th>
							<th>Product Details</th>
							<th>Quantity</th>
							<th class="text-center">Total Price</th>
							<th>Payment Type</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>

						<%-- <%
						User user = (User) session.getAttribute("userObj");
						OrdersDAO dao = new OrdersDAO(DBConnect.getConnection());
						ArtistDAO dao2 = new ArtistDAO(DBConnect.getConnection());
						List<Orders> list = dao.getOrdersByUser(user.getId());

						for (Orders o : list) {
							Paintings p = dao2.getPaintById(o.getPaintId());
						%> 
						<tr>
							<th scope="row"><%=o.getOrderId()%></th>
							<td><%=user.getFullName()%><br><%=user.getAddress()%><br><%=user.getCity()%>
								,<%=user.getState()%>,<%=user.getPin()%><br>Mob No: <%=user.getMobNo()%>

							</td>
							<td><%=p.getName()%></td>
							<td><%=o.getQuantity()%></td>

							<td>
								<%
								int tprice = Integer.parseInt(p.getPrice()) * o.getQuantity();
								%> <%=tprice%>
							</td>
							<td><%=o.getPaymentType()%></td>
						</tr>
						<%
						}
						%>--%>

						<%
						user u = (user) session.getAttribute("userObj");
						OrdersDAO dao2 = new OrdersDAO(DBConnect.getConn());
						BookDAO dao3=new BookDAO(DBConnect.getConn());
						List<Orders> list2 = dao2.getAllOrderByUser(u.getId());
						for (Orders o : list2) {
							Books b=dao3.getBookById(o.getBookId());
						%>
						<tr>
							<th scope="row"><%=o.getOrderId() %></th>
							<td><%=o.getDate() %></td>
							<td>name: <%=u.getName() %><br>address: <%=u.getAdress() %><br>City: <%=u.getCity() %> ,<br>state: <%=u.getState() %>,<br>pincode: <%=u.getPincode() %><br>Mob
								No: <%=u.getPhno() %>

							</td>
							<td><%=b.getBookName() %></td>
							<td><%=o.getQuantity() %></td>

							<td><%=o.getTotalAmount() %></td>
							<td><%=o.getPaymentType() %></td>
							<td class="text-success "><%=o.getStatus() %></td>
						</tr>
						<%
						}
						%>



					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>
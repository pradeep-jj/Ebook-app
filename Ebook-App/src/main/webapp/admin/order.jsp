<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.DAO.UserDAO"%>
<%@page import="com.entity.Books"%>
<%@page import="com.entity.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrdersDAO"%>
<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<c:if test="${empty adminObj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-5">
		<div class="row">
			<div class="col-md-12 paint-card">
				<h4 class="fs-3 text-center">Customer Orders</h4>
				<c:if test="${not empty succMsg }">
					<h4 class="text-center text-success">${succMsg }</h4>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<c:if test="${not empty errorMsg }">
					<h4 class="text-center text-success">${errorMsg }</h4>
					<c:remove var="errorMsg" scope="session" />
				</c:if>
				<table class="shadow-sm table table-bordered table-striped">
					<thead class="table-dark">
						<tr>
							<th class="text-center">Order ID</th>
							<th>Date</th>
							<th>Delivery Address</th>
							<th>Product Details</th>
							<th>Quantity</th>
							<th class="text-center">Total Price</th>
							<th>Payment Type</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>

						<%
						OrdersDAO dao2 = new OrdersDAO(DBConnect.getConn());
						BookDAO dao3 = new BookDAO(DBConnect.getConn());
						UserDAOImpl dao4 = new UserDAOImpl(DBConnect.getConn());
						List<Orders> list2 = dao2.getAllOrderByAdmin();
						for (Orders o : list2) {
							Books b = dao3.getBookById(o.getBookId());
							if (b != null) {
								user u = dao4.getUserById(o.getUserId());
								if (u != null) {
						%>
						<tr>
							<th scope="row"><%=o.getOrderId()%></th>
							<td><%=o.getDate()%></td>
							<td>name: <%=u.getName()%><br>address: <%=u.getAdress()%><br>City:
								<%=u.getCity()%> ,<br>state: <%=u.getState()%>,<br>pincode:
								<%=u.getPincode()%><br>Mob No: <%=u.getPhno()%>

							</td>
							<td><%=b.getBookName()%></td>
							<td><%=o.getQuantity()%></td>

							<td><%=o.getTotalAmount()%></td>
							<td><%=o.getPaymentType()%></td>
							<td class="text-success "><%=o.getStatus()%></td>
							<td><a href="user_status.jsp?orderid=<%=o.getOrderId()%>&&oid=<%=o.getId()%>"
								class="btn btn-sm btn-success">Status</a> 
								
								<a
								href="../deleteOrder?oid=<%=o.getId()%>"
								class="btn btn-danger btn-sm ">Delete</a></td>
						</tr>
						<%
						}
						}
						}
						%>



					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>
<%@page import="com.DAO.OrdersDAO"%>
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

	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<h5 class="text-center text-primary">Status Update</h5>
					<div class="card-body ">
						<%
						String order = request.getParameter("orderid");
						if (order != null) {
							int id = Integer.parseInt(request.getParameter("oid"));
						%>
						<form action="user_status.jsp">
							<div class="form-group">
								<label>Order Number</label> <input type="text" name=""
									value="<%=order%>" readonly class="form-control">
							</div>
							<input type="hidden" value="<%=id%>" name="id">

							<div class="form-group">
								<label>Status</label> <select class="form-control" name="status">
									<option value="Order Received">Order Received</option>
									<option value="Product Packed">Product Packed</option>
									<option value="Order On The Way">Order On The Way</option>
									<option value="Out For Delivery">Out For Delivery</option>
								</select>
							</div>
							<button class="btn btn-primary">Update</button>
						</form>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%
	String status = request.getParameter("status");
	if (status != null) {
		int oid = Integer.parseInt(request.getParameter("id"));
		OrdersDAO dao = new OrdersDAO(DBConnect.getConn());
		boolean f = dao.updateStatus(oid, status);
		if (f) {
			session.setAttribute("succMsg", "Status update Sucessfully");
			response.sendRedirect("order.jsp");
		} else {
			session.setAttribute("errorMsg", "Something wrong on server");
			response.sendRedirect("order.jsp");
		}
	}
	%>


</body>
</html>
<%@page import="com.entity.Books"%>
<%@page import="com.DAO.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">

			<%
			user us = (user) session.getAttribute("userObj");
			int id = Integer.parseInt(request.getParameter("id"));
			BookDAO dao2 = new BookDAO(DBConnect.getConn());
			Books b = dao2.getBookById(id);
			%>
			<div class="col-md-12 paint-card p-5">
				<div class="row">
					<div class="col-md-6 text-end">
						<img alt="" src="book/<%=b.getImgBookName()%>" width="330px"
							height="400px">
					</div>


					<div class="col-md-6">


						<h5>
							Book Name :
							<%=b.getBookName()%></h5>
						<h5 class="mt-3">
							Author :
							<%=b.getAuthor()%>
						</h5>

						<h5 class="mt-3">
							Category :
							<%=b.getCategory()%>
						</h5>

						<h5 class="mt-3">
							Price :&nbsp; &nbsp; &nbsp; &nbsp;
							<%=b.getPrice()%>
						</h5>

						
						
						
						<c:if test="${empty userObj }">
							<a href="login.jsp" class="btn btn-danger col-md-12">Add To
								Cart</a>
						</c:if>

						<c:if test="${not empty userObj }">

								<%
								CartDAO dao3 = new CartDAO(DBConnect.getConn());
								boolean f = dao3.checkBook(b.getId(), us.getId());
								if (f) {
								%>
								<a href="#"
									class="btn btn-danger col-md-12 disabled">Added to cart</a>
								<%
								} else {
								%>
								<a href="cartServlet?bid=<%=b.getId()%>&&uid=<%=us.getId()%>"
									class="btn btn-danger col-md-12">Add To Cart</a>
								<%
								}
								%>

							</c:if>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
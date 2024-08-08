<%@page import="com.DAO.CartDAO"%>
<%@page import="com.entity.user"%>
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
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body >
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid text-center p-3">
		<h3 class="p-3">All Books</h3>
		<c:if test="${not empty failedMsg}">
			<div class="alert alert-danger" role="alert">${failedMsg}</div>

			<c:remove var="failedMsg" scope="session" />
		</c:if>

		<c:if test="${not empty SuccMsg}">
			<div class="alert alert-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<div class="row">

			<%
			user us = (user) session.getAttribute("userObj");

			BookDAO dao2 = new BookDAO(DBConnect.getConn());
			List<Books> list2 = dao2.getAllBooksByUser();
			for (Books b : list2) {
			%>
			<div class="col-md-3 mt-3">
				<div class="card paint-card">
					<div class="card-body">
						<img alt="Java Programming Book img"
							src="book/<%=b.getImgBookName()%>" width="200px" height="200px">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<div class="row">
							<c:if test="${empty userObj }">
								<a href="login.jsp" class="btn btn-danger btn-sm">Add To
									Cart</a>
							</c:if>

							<c:if test="${not empty userObj }">

								<%
								CartDAO dao3 = new CartDAO(DBConnect.getConn());
								boolean f = dao3.checkBook(b.getId(), us.getId());
								if (f) {
								%>
								<a href="#" class="btn btn-danger btn-sm disabled">Added to
									cart</a>
								<%
								} else {
								%>
								<a href="cartServlet?bid=<%=b.getId()%>&&uid=<%=us.getId()%>"
									class="btn btn-danger btn-sm">Add To Cart</a>
								<%
								}
								%>

							</c:if>

							<a href="view_book.jsp?id=<%=b.getId()%>"
								class="btn btn-success btn-sm ml-2">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

	</div>
</body>
</html>
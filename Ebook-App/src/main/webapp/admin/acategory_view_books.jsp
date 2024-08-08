<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.SCartDAO"%>
<%@page import="com.entity.Books"%>
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

	<%@include file="navbar.jsp"%>
	<div class="container-fluid text-center p-3">
		<h3 class="p-3">All Books</h3>
		<%
		String categoryName = request.getParameter("cat");
		SCategoryDAO dao2 = new SCategoryDAO(DBConnect.getConn());
		List<Books> list2 = dao2.getAllBooksByCategory(categoryName);

		if (list2.isEmpty()) {
		%>
		<div class="text-center">
			<h3 class=" mt-3 text-danger">Book Not Available</h3>
		</div>
		<%
		}
		%>

		<c:if test="${not empty SuccMsg}">
			<div class="alert alert-primary" role="alert">${SuccMsg}</div>
			<c:remove var="SuccMsg" scope="session" />
		</c:if>


		<c:if test="${not empty FailedMsg}">
			<div class="alert alert-primary" role="alert">${FailedMsg}</div>
			<c:remove var="FailedMsg" scope="session" />
		</c:if>
		<div class="row">

			<%
			for (Books b : list2) {
			%>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<img alt="Java Programming Book img"
							src="../book/<%=b.getImgBookName()%>" width="200px" height="200px">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<div class="row">
							<c:if test="${empty adminObj }">
								<a href="login.jsp" class="btn btn-danger btn-sm">Add To
									Cart</a>
							</c:if>

							<c:if test="${not empty adminObj }">

								<%
								SCartDAO dao3 = new SCartDAO(DBConnect.getConn());
								boolean f = dao3.checkBook(b.getId());
								if (f) {
								%>
								<a href="#" class="btn btn-danger btn-sm disabled">Added to
									cart</a>
								<%
								} else {
								%>
								<a href="../scartServlet?bid=<%=b.getId()%>"
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
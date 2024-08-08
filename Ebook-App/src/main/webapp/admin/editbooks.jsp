<%@page import="com.entity.Books"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.entity.Categories"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CategoryDAO"%>
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
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty adminObj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<h3 class="text-center">Edit Books</h3>
						<c:if test="${not empty succMsg }">
							<h4 class="text-center text-success">${succMsg }</h4>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<h4 class="text-center text-success">${errorMsg }</h4>
							<c:remove var="errorMsg" scope="session" />
						</c:if>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAO dao = new BookDAO(DBConnect.getConn());
						Books b = dao.getBookById(id);
						%>

						<form action="../updateBook" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									value="<%=b.getBookName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>

							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option value="<%=b.getCategory()%>"><%=b.getCategory()%></option>
									<%
									CategoryDAO dao4 = new CategoryDAO(DBConnect.getConn());
									List<Categories> list = dao4.getAllCategories();
									for (Categories c : list) {
									%>
									<option value="<%=c.getCategoryName()%>"><%=c.getCategoryName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option value=<%=b.getBookStatus()%>><%=b.getBookStatus()%></option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<input value="<%=b.getId()%>" type="hidden" name="id">


							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>

			</div>




		</div>
	</div>
</body>
</html>
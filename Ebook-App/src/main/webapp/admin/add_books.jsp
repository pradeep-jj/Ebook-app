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
<c:if test="${empty  adminObj}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<h3 class="text-center">Add Books</h3>
						<c:if test="${not empty succMsg }">
							<h4 class="text-center text-success">${succMsg }</h4>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<h4 class="text-center text-success">${errorMsg }</h4>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<form action="../addBooks" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1">
							</div>

							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>--select--</option>
									<%
									CategoryDAO dao = new CategoryDAO(DBConnect.getConn());
									List<Categories> list = dao.getAllCategories();
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
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="img" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>


							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>

			</div>


			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<h3 class="text-center">View Books</h3>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Image</th>
									<th scope="col">Name</th>
									<th scope="col">Author</th>
									<th scope="col">Categories</th>
									<th scope="col">Price</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								BookDAO dao2 = new BookDAO(DBConnect.getConn());
								List<Books> list2 = dao2.getAllBooks();
								for (Books b : list2) {
								%>
								<tr>
									<td><img src="../book/<%=b.getImgBookName()%>" width="50px" height="50px"></td>
									<th scope="row"><%=b.getBookName()%></th>
									<td><%=b.getAuthor()%></td>
									<td><%=b.getCategory()%></td>
									<td><%=b.getPrice()%></td>
									<td><%=b.getBookStatus()%></td>
									<td><a href="editbooks.jsp?id=<%=b.getId() %>" class="btn btn-outline-primary">Edit</a> <a
										href="../deleteBook?id=<%=b.getId() %>" class="btn btn-outline-danger">Delete</a></td>
								</tr>
								<%
								}
								%>


							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
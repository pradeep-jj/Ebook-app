<%@page import="com.DAO.SCategoryDAO"%>
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

</head>
<body>
	<c:if test="${empty supObj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-5">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<h3 class="text-center">Add Categories</h3>
						<c:if test="${not empty succMsg }">
							<h4 class="text-center text-success">${succMsg }</h4>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<h4 class="text-center text-success">${errorMsg }</h4>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<form action="../saddCategory" method="post"
							enctype="multipart/form-data"mt-5">
							<div class="form-group">
								<label>Enter Category Name</label> <input type="text"
									class="form-control" name="cat">
							</div>

							<div class="form-group">
								<label>Upload photo</label> <input type="file"
									class="form-control" name="img">
							</div>

							<button class="btn btn-primary col-md-12">Add Category</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-8">
				<div class="card paint-card">
					<h3 class="text-center">View Categories</h3>
					<table class="table mt-5">
						<thead>
							<tr>
								<th scope="col">Id</th>
								<th scope="col">Photo</th>
								<th scope="col">Category Name</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							SCategoryDAO dao = new SCategoryDAO(DBConnect.getConn());
							List<Categories> list = dao.getAllCategories();

							for (Categories c : list) {
							%>
							<tr>
								<th scope="row"><%=c.getId()%></th>
								<td><img src="../img_cat/<%=c.getImgName()%>" width="50px"
									height="50px"></td>
								<td><%=c.getCategoryName()%></td>
								<td><a href="../sdeleteCategory?id=<%=c.getId()%>"
									class="btn btn-outline-danger">Delete</a></td>
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
</body>
</html>
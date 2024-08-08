<%@page import="com.entity.Books"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>E-book:Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("book/comm.jpg");
	height: 75vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>


<body style="background-color: #eddde8;">

	<!-- Design strip -->
	<div class="contact-fluid"
		style="height: 10px; background-color: #303f9f;"></div>


	<!-- Navigation bar -->
	<%@include file="all_component/navbar.jsp"%>

	<!-- Index-page image and text on it -->
	<!-- <div class="container-fluid back-img">
		<h4 class="text-center text-white">Now purchase books online also
			...</h4>
	</div> -->

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="carousel-caption">
					<h1 class=" text-white">
						Welcome to <br> Online Book Store
					</h1>
				</div>
				<img class="d-block w-100" src="img/img1.jpg" alt="First slide"
					style="width: 100%; height: 600px;">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="img/img2.jpg" alt="Second slide"
					style="width: 100%; height: 600px;">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="img/img3.jpg" alt="Third slide"
					style="width: 100%; height: 600px;">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>








	<!-- Recent Books -->
	<div class="container-fluid text-center p-3">
		<h3>Recent Books</h3>
		<div class="row">

			<%
			BookDAO dao2 = new BookDAO(DBConnect.getConn());
			List<Books> list2 = dao2.getFourBooks();
			for (Books b : list2) {
			%>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<img alt="Java Programming Book img"
							src="book/<%=b.getImgBookName()%>" width="200px" height="200px">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2">Add to cart</a> <a
								href="" class="btn btn-success btn-sm ml-2">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%>
							</a>

						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="p-3">
			<a href="" class="btn btn-danger btn-sm ml-2">View All</a>
		</div>
	</div>
	<!-- End of Recent book -->


	<!-- New Books -->


	<!-- Navigation bar -->
	<%@include file="all_component/footer.jsp"%>

</body>
</html>
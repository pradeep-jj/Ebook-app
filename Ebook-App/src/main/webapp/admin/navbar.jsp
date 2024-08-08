
<%@page import="com.entity.Categories"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.SCategoryDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.SCartDAO"%>
<div class="container-fluid p-3">

	<div class="row">
		<div class="col-md-3 text-danger">
			<h3 id="abc">
				<i class="fas fa-book"></i> Book Store
			</h3>
		</div>
		<div class="col-md-6">
			<form action="search.jsp" class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Enter name of book" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<div class="col-md-3">
			<a href="#" class="btn btn-dark"><i
				class="fas fa-user-plus mr-2"></i> Admin</a> <a href="../adminlogout"
				class="btn btn-dark"><i class="fas fa-user-plus mr-2"></i>
				Logout</a>
		</div>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary ">

	<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
	<!-- 
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
 -->

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item active"> <a class="nav-link" href="book.jsp">all Books
					<span class="sr-only">(current)</span>
			</a></li>

			<c:if test="${not empty adminObj }">

				<%
				SCartDAO dao4 = new SCartDAO(DBConnect.getConn());
				int c = dao4.countCart();
				%>
				<li class="nav-item dropdown active"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Select categories... </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<%
						SCategoryDAO dao = new SCategoryDAO(DBConnect.getConn());
						List<Categories> list = dao.getAllCategories();
						for (Categories ca : list) {
						%>
						<a class="dropdown-item"
							href="acategory_view_books.jsp?cat=<%=ca.getCategoryName()%>"><%=ca.getCategoryName()%></a>
						<%
						}
						%>


						<div class="dropdown-divider"></div>

					</div></li>

				<li class="nav-item active"><a class="nav-link disabled"
					href="cart.jsp">[ <%=c%> ] Cart
				</a></li>
			</c:if>


		</ul>
	</div>
	<a href="contactuss.jsp" class="btn btn-light ml-2" type="submit"><i
		class="far fa-id-badge"></i>Contact us</a>
		<a href="changepassword.jsp" class="btn btn-light ml-2" type="submit">Change Password</a>
	<!-- <form class="form-inline my-2 my-lg-0 ">
		<button class="btn btn-light" type="submit"><i class="fas fa-users-cog" ></i>Settings</button>
		<button class="btn btn-light ml-2" type="submit"><i class="far fa-id-badge" ></i>Contact us</button>
	</form> -->

</nav>




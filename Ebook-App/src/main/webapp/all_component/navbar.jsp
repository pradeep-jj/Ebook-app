
<%@page import="com.DAO.CartDAO"%>
<%@page import="com.entity.user"%>
<%@page import="com.entity.Categories"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CategoryDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
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

			<c:if test="${empty userObj }">
				<a href="login.jsp" class="btn btn-success"><i
					class="fas fa-sign-in-alt mr-2	"></i>Login</a>

				<a href="register.jsp" class="btn btn-primary"><i
					class="fas fa-user-plus mr-2"></i> Register</a>
			</c:if>


			<c:if test="${not empty userObj }">
				<a href="login.jsp" class="btn btn-success"><i
					class="fas fa-user-circle mr-2	"></i>${userObj.name }</a>

				<a href="userlogout" class="btn btn-primary"><i
					class="fa-solid fa-right-from-bracket"></i></i> logout</a>
			</c:if>

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
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<!-- 
      <li class="nav-item active">
        <a class="nav-link" href="#"><i class="fas fa-book-reader mr-1"></i>Recent Book <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#"><i class="fas fa-book-reader mr-1"></i>New Book</a>
      </li> -->
			<li class="nav-item active"><a class="nav-link disabled"
				href="all_books.jsp"><i class="fas fa-book-reader mr-1"></i>All
					Books</a></li>


			<li class="nav-item dropdown active"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Select categories... </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<%
					CategoryDAO dao = new CategoryDAO(DBConnect.getConn());
					List<Categories> list = dao.getAllCategories();
					for (Categories c : list) {
					%>
					<a class="dropdown-item"
						href="category_view_books.jsp?cat=<%=c.getCategoryName()%>"><%=c.getCategoryName()%></a>
					<%
					}
					%>


					<div class="dropdown-divider"></div>

				</div></li>

			<c:if test="${not empty userObj }">

				<%
				user u = (user) session.getAttribute("userObj");
				CartDAO dao4 = new CartDAO(DBConnect.getConn());
				int c = dao4.countCart(u.getId());
				%>

				<li class="nav-item active"><a class="nav-link disabled"
					href="cart.jsp">[ <%=c%> ] Cart
				</a></li>
			</c:if>

		</ul>
	</div>

	<form class="form-inline my-2 my-lg-0 ">
		<c:if test="${empty  userObj }">
			<a href="admin_login.jsp" class="btn btn-dark mr-2" type="submit">Admin
				Login </a>

			<a href="sup_login.jsp" class="btn btn-dark mr-2" type="submit">Supplier
				Login </a>
		</c:if>
		<a href="setting.jsp" class="btn btn-light" type="submit"><i
			class="fas fa-users-cog"></i>Settings </a> <a href="contact.jsp"
			class="btn btn-light ml-2" type="submit"><i
			class="far fa-id-badge"></i>Contact us</a>
	</form>

</nav>




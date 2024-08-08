<%@page import="com.DAO.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-book:Login</title>

<%@include file="all_component/allCss.jsp"%>
<script language="javascript" type="text/javascript">
	function showPassword() {
		var x = document.getElementById("exampleInputPassword1");

		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
</script>

<style type="text/css">
.back-img {
	background: url("img/registerlogin.jpg");
	height: 78vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body style="background-color: #eddde8;">

	<!-- Design strip -->
	<div class="contact-fluid"
		style="height: 10px; background-color: #303f9f;"></div>


	<!-- Navigation bar -->
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid p-3 back-img">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Admin Login</h4>

						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<form action="admin_login.jsp" method="post">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
								<input type="checkbox" onclick="showPassword()"><b>
									Show Password</b>

							</div>

							<div class="text-center">

								<button type="submit" class="btn btn-primary">Submit</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>

	<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	if (email != null && password != null) {

		LoginDAO dao2 = new LoginDAO(DBConnect.getConn());
		boolean f = dao2.adminLogin(email, password);
		if (f) {
			session.setAttribute("adminObj", new user());
			response.sendRedirect("admin/home.jsp");
		} else {
			session.setAttribute("failedMsg", "invalid email & password");
			response.sendRedirect("admin_login.jsp");
		}

	}
	%>



</body>
</html>
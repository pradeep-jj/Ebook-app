<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-book:register</title>

<%@include file="all_component/allCss.jsp"%>
<style type="text/css">

.error {
	color: red;
}
</style>
</head>
<body style="background-color: #eddde8;">

	<!-- Design strip -->
	<div class="contact-fluid"
		style="height: 10px; background-color: #303f9f;"></div>


	<!-- Navigation bar -->
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>

						<c:if test="${not empty SuccMsg}">
							<p class="text-center text-success">${SuccMsg}</p>
							<c:remove var="SuccMsg" scope="session" />
						</c:if>


						<c:if test="${not empty FailedMsg}">
							<p class="text-center text-danger">${FailedMsg}</p>
							<c:remove var="FailedMsg" scope="session" />
						</c:if>

						<form action="register" method="post" id="userRegister" novalidate>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="exampleInputEmail1" class="form-label">
										Name</label> <input type="text" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										required="required" name="fname">
								</div>
								<div class="form-group col-md-6">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input type="email" class="form-control" name="email">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="exampleInputEmail1" class="form-label">Phone
										No</label> <input type="number" class="form-control" name="phno">
								</div>

								<div class="form-group col-md-6">
									<label for="exampleInputPassword1" class="form-label">Address</label>
									<input type="text" class="form-control" required="required"
										name="address">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label>City</label> <input type="text" name="city"
										class="form-control">
								</div>
								<div class="form-group col-md-4">
									<label>State</label> <input type="text" name="state"
										class="form-control">
								</div>

								<div class="form-group col-md-4">
									<label>Pincode</label> <input type="text" name="pincode"
										class="form-control">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="text" class="form-control" id="pwd"
										required="required" name="password">
								</div>
								<div class="form-group col-md-6">
									<label for="exampleInputPassword1" class="form-label">Confirm
										password</label> <input type="password" class="form-control"
										id="exampleInputPassword1" name="confirmpassword">
								</div>
							</div>


							<div class="mb-3 form-check">
								<input type="checkbox" required="required" class="form-check-input"
									id="exampleCheck1" name="check"> <label
									class="form-check-label" for="exampleCheck1">I agree
					</label>
					
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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="js/user_script.js"></script>
</body>
</html>
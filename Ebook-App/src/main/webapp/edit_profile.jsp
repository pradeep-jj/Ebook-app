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

.error {
	color: red;
}
</style>
</head>
<body>
	<c:if test="${empty userObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid p-4">
		<div class="row">

			<%-- <div class="col-md-4 offset-md-1">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Change Password</p>
						<c:if test="${not empty cherrorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty chsuccMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form id="chnagepsw" action="chngps" method="post">
							<div class="mb-3">
								<label class="form-label">New Password</label> <input required
									name="newpassword" type="text" class="form-control">
							</div>
							<!-- <div class="mb-3">
								<label class="form-label">confirm new password</label> <input required
									type="text" name="confirmpassword" class="form-control">
							</div> -->

							<div class="mb-3">
								<label class="form-label">old Password</label> <input required
									type="text" name="oldpassword" class="form-control">
							</div>
							<input name="id" value="${userObj.id}" type="hidden">

							<button type="submit" class="btn bg-primary text-white col-md-12">Change
								Password</button>
						</form>

					</div>
				</div>
			</div> --%>



			<div class="col-md-6 ">
				<div class="card paint-card">
					<div class="card-body">
						<h3 class="text-center text-success">Edit Profile</h3>
						<c:if test="${not empty FailedMsg}">
							<p class="fs-4 text-center text-danger">${FailedMsg}</p>
							<c:remove var="FailedMsg" scope="session" />
						</c:if>
						<c:if test="${not empty SuccMsg}">
							<p class=" fs-4 text-center text-success">${SuccMsg}</p>
							<c:remove var="SuccMsg" scope="session" />
						</c:if>
						<form action="updateProfile" method="post" id="userRegister"
							novalidate>


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										name="fname" class="form-control" id="inputEmail4"
										value="${userObj.name}" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email" readonly="readonly"
										name="email" class="form-control" id="inputPassword4"
										value="${userObj.email }" required>
								</div>
							</div>


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone No</label> <input
										name="phno" type="number" class="form-control"
										 value="${userObj.phno }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										name="address" class="form-control" value="${userObj.adress }"
										required>
								</div>
							</div>


							<div class="form-group">
								<label for="inputPassword4">City</label> <input type="text"
									name="city" class="form-control" value="${userObj.city }"
									required>
							</div>



							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" value="${userObj.state }"
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin code</label> <input type="text"
										name="pincode" class="form-control"
										value="${userObj.pincode }" required>
								</div>
							</div>
							<input type="hidden" value="${userObj.id }" name="id">
							<button class="btn btn-primary">Update</button>

						</form>
					</div>

				</div>

			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="js/user_script.js"></script>

</body>
</html>
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
</style>
</head>
<body>
	<c:if test="${empty userObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card paint-card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Profile</h3>
						<form action="order" method="post">
							<input type="hidden" value="${userObj.id}" name="id">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										name="username" class="form-control" id="inputEmail4"
										value="${userObj.name}" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" class="form-control" id="inputPassword4"
										value="${userObj.email }" required>
								</div>
							</div>


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										name="phno" type="number" class="form-control"
										id="inputEmail4" value="${userObj.phno }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Adress</label> <input type="text"
										name="address" class="form-control" value="${userObj.adress }"
										required>
								</div>
							</div>


							<div class="form-group">
								<label for="inputPassword4">City</label> <input type="text"
									name="city" class="form-control" value="${userObj.city }" required>
							</div>



							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" value="${userObj.state }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin code</label> <input type="text"
										name="pincode" class="form-control" value="${userObj.pincode }"
										required>
								</div>
							</div>

						</form>
					</div>

				</div>

			</div>
		</div>
	</div>


</body>
</html>
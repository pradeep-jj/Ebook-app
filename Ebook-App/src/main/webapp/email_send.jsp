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

.clink {
	text-decoration: none;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<h3 class="fs-4 text-center">Email Verification</h3>



						<c:if test="${empty succMsg }">
							<form action="sendOtp" method="post">
								<div class="mb-3">
									<label class="form-label">Email address</label> <input
										required="required" name="email" type="email"
										class="form-control">
								</div>
								<button type="submit"
									class="btn bg-success text-white col-md-12">Send Otp</button>
							</form>
						</c:if>


						<c:if test="${not empty succMsg}">



							<form action="otp_validation.jsp" method="post">

								<input type="hidden" value="${otpEmail }" name="email">
								<div class="mb-3">
									<label class="form-label">Otp</label> <input name="otp"
										required="required" type="text" class="form-control">

								</div>
								<button type="submit"
									class="btn bg-success text-white col-md-12">Submit</button>
							</form>
							<div class="alert alert-success mt-2" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>



						<c:if test="${not empty errorMsg}">
							<div class="alert alert-danger mt-2" role="alert">${errorMsg}</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>


					</div>
				</div>
			</div>
		</div>
	</div>

	<%

	%>




</body>
</html>
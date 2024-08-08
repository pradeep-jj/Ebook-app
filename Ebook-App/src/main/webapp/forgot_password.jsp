<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
						<h3 class=" text-primary text-center">Forgot Password</h3>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />

							<%
							response.setHeader("Refresh", "3;url=email_send.jsp");
							%>.
							
						</c:if>

						<%
						String email = request.getParameter("email");
						%>

						<form action="updatePassword" method="post">
							<input type="hidden" value="<%=email%>" name="email">

							<div class="mb-3">
								<label class="form-label">New password</label> <input
									name="password" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Confirm password</label> <input
									name="cpassword" type="password" class="form-control">
							</div>

							<button type="submit" class="btn bg-primary text-white col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@page import="com.DAO.LoginDAO"%>
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
<script language="javascript" type="text/javascript">
	function showPassword() {
		var x = document.getElementById("exampleInputPassword1");

		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
	
	function showPassword2() {
		var x = document.getElementById("exampleInputPassword12");

		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
</script>
</head>
<body>
	<c:if test="${empty adminObj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3 back-img">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Change Page</h4>

						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<form action="changepassword.jsp" method="post">

							

							<div class="mb-3">
								<label  class="form-label">New
									Password</label> <input type="password" class="form-control"
									id="exampleInputPassword12" required="required" name="newpass"> <input
									type="checkbox" onclick="showPassword2()"><b> Show
									Password</b>
								</button>
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Old
									Password</label> <input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="oldpass">
								<input type="checkbox" onclick="showPassword()"><b>
									Show Password</b>
								</button>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Change
									Password</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	String oldpassword = request.getParameter("oldpass");
	String newPass = request.getParameter("newpass");

	if (oldpassword != null && newPass != null) {

		LoginDAO dao2 = new LoginDAO(DBConnect.getConn());
		boolean f = dao2.updateAdminpassword("admin@gmail.com", oldpassword, newPass);
		if (f) {
			session.setAttribute("succMsg", "Change successfully");
			response.sendRedirect("changepassword.jsp");
		} else {
			session.setAttribute("failedMsg", "invalid old password");
			response.sendRedirect("changepassword.jsp");
		}

	}
	%>


</body>
</html>
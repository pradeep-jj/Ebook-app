<%@page import="com.DAO.FeedbackDAO"%>
<%@page import="com.entity.Feedback"%>
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

	<div class="container-fluid p-4">
		<div class="row">

			<div class="col-md-4 offset-md-1">
				<div class="card paint-card">
					<div class="card-body">
						<h4 class=" text-center">Feedback Form</h4>
						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty SuccMsg}">
							<h5 class="text-center text-success">${SuccMsg}</h5>
							<c:remove var="SuccMsg" scope="session" />
						</c:if>
						<form id="addfeedback" action="addfeedback" method="post">
							<div class="mb-3">
								<label class="form-label">Name</label> <input required readonly
									name="name" type="text" class="form-control"
									value="${userObj.name}">
							</div>


							<div class="mb-3">
								<label class="form-label">Email</label> <input readonly="readonly"
								 required type="email" name="email" class="form-control" 
									value="${userObj.email }">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile Number</label> <input required
									type="number" name="phno" class="form-control" readonly
									value="${userObj.phno }">
							</div>

							<div class="form-group">
								<label>Message</label>
								<textarea rows="4" class="form-control" name="message"></textarea>

							</div>


							<input name="userid" value="${userObj.id}" type="hidden">

							<button type="submit" class="btn bg-primary text-white col-md-12">
								Submit</button>
						</form>

					</div>
				</div>
			</div>



			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<h3 class="text-center text-success">Feedback</h3>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Name</th>
									<th scope="col">Email</th>
									<th scope="col">Phone Number</th>
									<th scope="col">Message</th>
								</tr>
							</thead>
							<tbody>
								<%
								user u = (user) session.getAttribute("userObj");
								FeedbackDAO dao2 = new FeedbackDAO(DBConnect.getConn());
								List<Feedback> list2 = dao2.getAllFeedBackByUser(u.getId());

								for (Feedback e : list2) {
								%>
								<tr>
									<th scope="row"><%=e.getName()%></th>
									<td><%=e.getEmail()%></td>
									<td><%=e.getPhone()%></td>
									<td><%=e.getMesage()%></td>
								</tr>
								<%
								}
								%>


							</tbody>
						</table>
					</div>

				</div>

			</div>
		</div>
	</div>


</body>
</html>
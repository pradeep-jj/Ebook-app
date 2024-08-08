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
<%@include file="allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty adminObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-4">
		<div class="row">





			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<h3 class="text-center text-success">All Feedback</h3>
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
								FeedbackDAO dao2 = new FeedbackDAO(DBConnect.getConn());
								List<Feedback> list2 = dao2.getAllFeedBack();

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
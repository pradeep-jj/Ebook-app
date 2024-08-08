<%@page import="com.entity.user"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.UserDAOImpl"%>
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
</head>
<body style="background-color: #e2e4e6;">
	<c:if test="${empty adminObj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container">
		<h3 class="text-center text-success">All User</h3>
		<div class="row">
			<table class="table bg-light">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Phone Number</th>
						<th scope="col">Address</th>
					</tr>
				</thead>
				<tbody>
					<%
					UserDAOImpl dao2 = new UserDAOImpl(DBConnect.getConn());
					List<user> list = dao2.getAllUser();
					for (user u : list) {
					%>
					<tr>
						<th scope="row"><%=u.getName()%></th>
						<td><%=u.getEmail()%></td>
						<td><%=u.getPhno()%></td>
						<td><%=u.getAdress()%>,<b>city:</b> <%=u.getCity()%>,<b>State:</b> <%=u.getState()%>,<b>Mobile no: </b> <%=u.getPhno()%></td>
					</tr>
					<%
					}
					%>


				</tbody>
			</table>
		</div>
	</div>


</body>
</html>
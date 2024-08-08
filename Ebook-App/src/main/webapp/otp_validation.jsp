<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OtpDAO"%>
<%@page import="com.entity.OTPAuthentication"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String email = request.getParameter("email");
	String otp = request.getParameter("otp");
	OtpDAO dao = new OtpDAO(DBConnect.getConn());
	OTPAuthentication oldOtp = dao.getOtp(email);

	if (oldOtp.getOtp().equals(otp)) {
		response.sendRedirect("forgot_password.jsp?email=" + email);
	} else {
		session.setAttribute("succMsg", "invalid otp");
		response.sendRedirect("email_send.jsp");
	}
	%>
</body>
</html>
package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.OtpDAO;
import com.DB.DBConnect;

@WebServlet("/updatePassword")
public class ForgotPassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		OtpDAO dao = new OtpDAO(DBConnect.getConn());
		HttpSession session = req.getSession();
		boolean f = dao.updatePassword(email, password);

		if (f) {

			dao.deleteEmailAndOtp(email);

			session.setAttribute("succMsg", "Password Update successfully");
			resp.sendRedirect("forgot_password.jsp?email=" + email);
		} else {
			session.setAttribute("errorMsg", "something went wrong or incorrect data");
			resp.sendRedirect("forgot_password.jsp?email=" + email);
		}
	}

}

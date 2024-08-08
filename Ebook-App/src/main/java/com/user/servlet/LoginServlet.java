package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.user;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// super.doPost(req, resp);

		try {
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			HttpSession session = req.getSession();

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			// resp.sendRedirect("home.jsp");
			user us = dao.login(email, password);
			if (us != null) {
				session.setAttribute("userObj", us);
				resp.sendRedirect("index.jsp");
				// login.jsp<!-- _-->
			} else {
				session.setAttribute("failedMsg", "Email and password do not match!");
				resp.sendRedirect("login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

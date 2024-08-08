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
import javax.servlet.HttpConstraintElement;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 75L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String adress=req.getParameter("address");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			HttpSession session = req.getSession();
			if (check == null) {

				session.setAttribute("FailedMsg", "Please Check box");
				resp.sendRedirect("register.jsp");
			} else {

			}

			user us = new user(name, email, phno, adress, city, state, pincode, password);
			

			if (check != null) {

				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

				boolean checkemail = dao.checkEmail(email);

				if (checkemail) {
					boolean f = dao.userRegister(us);
					if (f) {

						session.setAttribute("SuccMsg", "Registration succesfull!");
						resp.sendRedirect("register.jsp");

					} else {

						session.setAttribute("FailedMsg", "Something Went wrong or incorrect data!");
						resp.sendRedirect("register.jsp");
					}

				} else {

					session.setAttribute("FailedMsg", "Emaid id already exist");
					resp.sendRedirect("register.jsp");
				}

			} else {
				session.setAttribute("FailedMsg", "Please Check Box");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

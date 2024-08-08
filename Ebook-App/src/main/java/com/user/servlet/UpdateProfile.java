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

@WebServlet("/updateProfile")
public class UpdateProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String adress = req.getParameter("address");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			int id=Integer.parseInt(req.getParameter("id"));
			
			HttpSession session = req.getSession();
			

			user us = new user(id,name, email, phno, adress, city, state, pincode, "");


				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				
					boolean f = dao.userUpdateProfile(us);
					if (f) {
						user updateUser=dao.getUserById(id);
						session.setAttribute("userObj", updateUser);
						session.setAttribute("SuccMsg", "Prodile Update succesfull");
						resp.sendRedirect("edit_profile.jsp");

					} else {

						session.setAttribute("FailedMsg", "Something Went wrong or incorrect data!");
						resp.sendRedirect("edit_profile.jsp");
					}

				

			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.FeedbackDAO;
import com.DB.DBConnect;
import com.entity.Feedback;

@WebServlet("/addfeedback")
public class AddFeedback extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String message = req.getParameter("message");
			int userId = Integer.parseInt(req.getParameter("userid"));

			Feedback f = new Feedback(name, email, phno, message, userId);
			FeedbackDAO dao = new FeedbackDAO(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.addFeedback(f)) {
				session.setAttribute("SuccMsg", "Feedback Register succesfull");
				resp.sendRedirect("feedback.jsp");

			} else {
				session.setAttribute("failedMsg", "Something went wrong or incorrect data!");
				resp.sendRedirect("feedback.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

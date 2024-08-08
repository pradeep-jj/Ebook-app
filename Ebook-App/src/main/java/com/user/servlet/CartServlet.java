package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAO;
import com.DB.DBConnect;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			CartDAO dao = new CartDAO(DBConnect.getConn());
			boolean f = dao.addCart(bid, uid);
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("SuccMsg", "Book Added To Cart");
				resp.sendRedirect("all_books.jsp");

			} else {

				session.setAttribute("FailedMsg", "Something Went wrong or incorrect data!");
				resp.sendRedirect("all_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

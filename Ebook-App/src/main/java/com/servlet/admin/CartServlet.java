package com.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAO;
import com.DAO.SCartDAO;
import com.DB.DBConnect;

@WebServlet("/scartServlet")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			

			SCartDAO dao = new SCartDAO(DBConnect.getConn());
			boolean f = dao.addCart(bid);
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("SuccMsg", "Book Added To Cart");
				resp.sendRedirect("admin/book.jsp");

			} else {

				session.setAttribute("FailedMsg", "Something Went wrong!");
				resp.sendRedirect("admin/book.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

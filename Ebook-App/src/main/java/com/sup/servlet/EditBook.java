package com.sup.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAO;
import com.DAO.SBookDAO;
import com.DB.DBConnect;
import com.entity.Books;

@WebServlet("/supdateBook")
public class EditBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bookName = req.getParameter("bname");
		String author = req.getParameter("author");
		Double price = Double.parseDouble(req.getParameter("price"));
		String category = req.getParameter("categories");
		String status = req.getParameter("status");
		int id = Integer.parseInt(req.getParameter("id"));

		Books b = new Books(id, bookName, author, price, category, status, "");

		SBookDAO dao = new SBookDAO(DBConnect.getConn());
		HttpSession session = req.getSession();
		boolean f = dao.updateBook(b);

		if (f) {

			session.setAttribute("succMsg", "Books Update Sucessfully");
			resp.sendRedirect("suplier/add_books.jsp");
		} else {
			session.setAttribute("errorMsg", "something went wrong or incorrect data");
			resp.sendRedirect("suplier/add_books.jsp");
		}
	}

}

package com.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAO;
import com.DAO.CategoryDAO;
import com.DB.DBConnect;

@WebServlet("/deleteBook")
public class DeleteBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		BookDAO dao=new BookDAO(DBConnect.getConn());
		boolean f = dao.deleteBook(id);
		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("succMsg", "Book Delete Sucessfully");
			resp.sendRedirect("admin/add_books.jsp");
		} else {
			session.setAttribute("errorMsg", "Somethong wrong on server");
			resp.sendRedirect("admin/add_books.jsp");
		}

	}

}

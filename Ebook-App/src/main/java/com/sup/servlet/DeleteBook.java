package com.sup.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAO;
import com.DAO.CategoryDAO;
import com.DAO.SBookDAO;
import com.DB.DBConnect;

@WebServlet("/sdeleteBook")
public class DeleteBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		SBookDAO dao=new SBookDAO(DBConnect.getConn());
		boolean f = dao.deleteBook(id);
		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("succMsg", "Book Delete Sucessfully");
			resp.sendRedirect("suplier/add_books.jsp");
		} else {
			session.setAttribute("errorMsg", "Somethong went wrong or incorrect data");
			resp.sendRedirect("suplier/add_books.jsp");
		}

	}

}

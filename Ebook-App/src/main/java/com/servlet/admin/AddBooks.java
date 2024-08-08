package com.servlet.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAO;
import com.DB.DBConnect;
import com.entity.Books;

@WebServlet("/addBooks")
@MultipartConfig
public class AddBooks extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String bookName = req.getParameter("bname");
		String author = req.getParameter("author");
		Double price = Double.parseDouble(req.getParameter("price"));
		String category = req.getParameter("categories");
		String status = req.getParameter("status");
		Part p = req.getPart("img");
		String img = p.getSubmittedFileName();

		Books b = new Books(bookName, author, price, category, status, img);

		BookDAO dao = new BookDAO(DBConnect.getConn());
		HttpSession session = req.getSession();
		boolean f = dao.addBooks(b);

		if (f) {
			String path = getServletContext().getRealPath("") + "book";
			//System.out.println(path);
			File file = new File(path);
			p.write(path + File.separator + img);
			session.setAttribute("succMsg", "Books Added Sucessfully");
			resp.sendRedirect("admin/add_books.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/add_books.jsp");
		}

	}

}

package com.sup.servlet;

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

import com.DAO.CategoryDAO;
import com.DAO.SCategoryDAO;
import com.DB.DBConnect;
import com.entity.Categories;

@WebServlet("/saddCategory")
@MultipartConfig
public class AddCategory extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String catName = req.getParameter("cat");
		Part p = req.getPart("img");
		String imgName = p.getSubmittedFileName();

		// System.out.println(catName+" "+imgName);
		Categories categories = new Categories(catName, imgName);
		SCategoryDAO dao = new SCategoryDAO(DBConnect.getConn());

		 boolean f=dao.addCategory(categories);
		HttpSession session = req.getSession();

		if (f) {
			String path = getServletContext().getRealPath("") + "img_cat";
			File file = new File(path);
			p.write(path + File.separator + imgName);
			session.setAttribute("succMsg", "Category Add Sucessfully");
			resp.sendRedirect("suplier/add_categories.jsp");

		} else {
			session.setAttribute("errorMsg", "Something went wrong or incorrect data");
			resp.sendRedirect("suplier/add_categories.jsp");
		}

	}
}

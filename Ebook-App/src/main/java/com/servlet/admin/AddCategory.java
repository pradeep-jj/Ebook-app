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

import com.DAO.CategoryDAO;
import com.DB.DBConnect;
import com.entity.Categories;

@WebServlet("/addCategory")
@MultipartConfig
public class AddCategory extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String catName = req.getParameter("cat");
		Part p = req.getPart("img");
		String imgName = p.getSubmittedFileName();

		// System.out.println(catName+" "+imgName);
		Categories categories = new Categories(catName, imgName);
		CategoryDAO dao = new CategoryDAO(DBConnect.getConn());

		 boolean f=dao.addCategory(categories);
		HttpSession session = req.getSession();

		if (f) {
			String path = getServletContext().getRealPath("") + "img_cat";
			File file = new File(path);
			p.write(path + File.separator + imgName);
			session.setAttribute("succMsg", "Category Add Sucessfully");
			resp.sendRedirect("admin/add_categories.jsp");

		} else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("admin/add_categories.jsp");
		}

	}

}

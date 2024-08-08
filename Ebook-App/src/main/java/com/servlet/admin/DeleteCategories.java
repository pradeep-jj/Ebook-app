package com.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CategoryDAO;
import com.DB.DBConnect;

@WebServlet("/deleteCategory")
public class DeleteCategories extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		CategoryDAO dao=new CategoryDAO(DBConnect.getConn());
		boolean f=dao.deleteCategories(id);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("succMsg", "Category Delete Sucessfully");
			resp.sendRedirect("admin/add_categories.jsp");
		}else {
			session.setAttribute("errorMsg", "Somethong wrong on server");
			resp.sendRedirect("admin/add_categories.jsp");
		}
		
		
	}

	
}

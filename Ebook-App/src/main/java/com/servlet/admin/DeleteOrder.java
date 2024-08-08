package com.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.OrdersDAO;
import com.DB.DBConnect;

@WebServlet("/deleteOrder")
public class DeleteOrder extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
 
		int id = Integer.parseInt(req.getParameter("oid"));
		OrdersDAO dao = new OrdersDAO(DBConnect.getConn());
		HttpSession session = req.getSession();
		boolean f = dao.deleteOrder(id);

		if (f) {
			session.setAttribute("succMsg", "Order Delete Sucessfully");
			resp.sendRedirect("admin/order.jsp");
		} else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("admin/order.jsp");
		}

	}

}

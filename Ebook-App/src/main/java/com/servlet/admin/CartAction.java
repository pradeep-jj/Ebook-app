package com.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.CartDAO;
import com.DAO.SCartDAO;
import com.DB.DBConnect;
import com.entity.Cart;

@WebServlet("/scartin")
public class CartAction extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int bid = Integer.parseInt(req.getParameter("bid"));
			String ac = req.getParameter("ac");

			SCartDAO dao = new SCartDAO(DBConnect.getConn());

			Cart c = dao.getQuantity(bid);

			if (c.getQuantity() >= 1 && "plus".equals(ac)) {
				dao.updateQuantity(bid, c.getQuantity() + 1);
				resp.sendRedirect("admin/cart.jsp");

			} else if (c.getQuantity() >= 1 && "neg".equals(ac)) {
				int quan = c.getQuantity() - 1;
				if (quan == 0) {
					dao.deleteQuantity( bid);
					resp.sendRedirect("admin/cart.jsp");
				} else {
					dao.updateQuantity(bid, c.getQuantity() - 1);
					resp.sendRedirect("admin/cart.jsp");
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

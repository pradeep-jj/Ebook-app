package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.CartDAO;
import com.DB.DBConnect;
import com.entity.Cart;

@WebServlet("/cartin")
public class CartAction extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			String ac = req.getParameter("ac");

			CartDAO dao = new CartDAO(DBConnect.getConn());

			Cart c = dao.getQuantity(bid, uid);

			if (c.getQuantity() >= 1 && "plus".equals(ac)) {
				dao.updateQuantity(bid, uid, c.getQuantity() + 1);
				resp.sendRedirect("cart.jsp");

			} else if (c.getQuantity() >= 1 && "neg".equals(ac)) {
				int quan = c.getQuantity() - 1;
				if (quan == 0) {
					dao.deleteQuantity(uid, bid);
					resp.sendRedirect("cart.jsp");
				} else {
					dao.updateQuantity(bid, uid, c.getQuantity() - 1);
					resp.sendRedirect("cart.jsp");
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

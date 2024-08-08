package com.servlet.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.BookDAO;
import com.DAO.CartDAO;
import com.DAO.OrdersDAO;
import com.DAO.SBookDAO;
import com.DAO.SCartDAO;
import com.DAO.SOrderDAO;
import com.DB.DBConnect;
import com.entity.AdminOrders;
import com.entity.Books;
import com.entity.Cart;
import com.entity.Orders;

@WebServlet("/aorders")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String type = req.getParameter("type");
			String amt = req.getParameter("amt");

			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String adress = req.getParameter("address");

			if ("Debit".equals(type)) {
				resp.sendRedirect("admin/card_payment.jsp?amt=" + amt + "&&name=" + name + "&&email=" + email + "&&address="
						+ adress + "&&phno=" + phno);
			} else {
				SCartDAO dao = new SCartDAO(DBConnect.getConn());
				SBookDAO dao2 = new SBookDAO(DBConnect.getConn());

				List<Cart> cartList = dao.getAllCarts();

				AdminOrders order = null;

				List<AdminOrders> orderList = new ArrayList<AdminOrders>();
				Random random = new Random();

				// cartList.forEach(e->System.out.println(e));

				for (Cart c : cartList) {

					order = new AdminOrders();
					order.setDate(new Date().toLocaleString());
					order.setOrderId("ORD-" + random.nextInt(1000));
					order.setBookId(c.getBookId());
					order.setName(name);
					order.setEmail(email);
					order.setPhno(phno);

					order.setAddress(adress);
					order.setQuantity(c.getQuantity());

					Books b = dao2.getBookById(c.getBookId());

					order.setTotalAmount((b.getPrice() * c.getQuantity()) + "");
					order.setPaymentType("COD");
					order.setStatus("Pending");

					orderList.add(order);
				}

				SOrderDAO dao3 = new SOrderDAO(DBConnect.getConn());

				boolean f = dao3.addOrders(orderList);

				if (f) {
					resp.sendRedirect("admin/order_sucess.jsp");
				} else {
					resp.sendRedirect("admin/home.jsp");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

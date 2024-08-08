package com.user.servlet;

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
import com.DB.DBConnect;
import com.entity.Books;
import com.entity.Cart;
import com.entity.Orders;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			String type=req.getParameter("type");
			String amt=req.getParameter("amt");
			int userId=Integer.parseInt(req.getParameter("uid"));
			
			if("Debit".equals(type)) {
				resp.sendRedirect("card_payment.jsp?amt="+amt+"&&uid="+userId);
			}else{
				CartDAO dao=new CartDAO(DBConnect.getConn());
				BookDAO dao2=new BookDAO(DBConnect.getConn());
				
				List<Cart> cartList=dao.getAllCarts(userId);
				
				Orders order = null;

				List<Orders> orderList = new ArrayList<Orders>();
				Random random = new Random();
				
				for(Cart c:cartList) {
					order=new Orders();
					order.setDate(new Date().toLocaleString());
					order.setOrderId("ORD-"+random.nextInt(1000));
					order.setBookId(c.getBookId());
					order.setUserId(c.getUserId());
					order.setQuantity(c.getQuantity());
				   
					Books b=dao2.getBookById(c.getBookId());
					
				    order.setTotalAmount( (b.getPrice()*c.getQuantity())+"" );
				    order.setPaymentType("COD");
				    order.setStatus("Pending");
					
					orderList.add(order);	
				}
				
				OrdersDAO dao3=new OrdersDAO(DBConnect.getConn());
				boolean f=dao3.addOrders(orderList);
				
				if(f) {
					resp.sendRedirect("order_sucess.jsp");
				}else {
					resp.sendRedirect("index.jsp");
				}
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	

}

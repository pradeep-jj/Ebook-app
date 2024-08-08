package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Orders;

public class OrdersDAO {
	private Connection conn;

	public OrdersDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addOrders(List<Orders> list) {
		boolean f = false;

		try {

			String sql = "insert into book_order(date,orderId,bookId,userId,quantity,totalAmount,paymentType,status) values(?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Orders o : list) {
				ps.setString(1, o.getDate());
				ps.setString(2, o.getOrderId());
				ps.setInt(3, o.getBookId());
				ps.setInt(4, o.getUserId());
				ps.setInt(5, o.getQuantity());
				ps.setString(6, o.getTotalAmount());
				ps.setString(7, o.getPaymentType());
				ps.setString(8, o.getStatus());

				ps.addBatch();
			}

			ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Orders> getAllOrderByUser(int userId) {
		List<Orders> list = new ArrayList<Orders>();
		Orders order = null;

		try {
			String sql = "select * from book_order where userId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				order = new Orders();
				order.setId(rs.getInt(1));
				order.setDate(rs.getString(2));
				order.setOrderId(rs.getString(3));
				order.setBookId(rs.getInt(4));
				order.setUserId(rs.getInt(5));
				order.setQuantity(rs.getInt(6));
				order.setTotalAmount(rs.getString(7));
				order.setPaymentType(rs.getString(8));
				order.setStatus(rs.getString(9));
				list.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Orders> getAllOrderByAdmin() {
		List<Orders> list = new ArrayList<Orders>();
		Orders order = null;

		try {
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				order = new Orders();
				order.setId(rs.getInt(1));
				order.setDate(rs.getString(2));
				order.setOrderId(rs.getString(3));
				order.setBookId(rs.getInt(4));
				order.setUserId(rs.getInt(5));
				order.setQuantity(rs.getInt(6));
				order.setTotalAmount(rs.getString(7));
				order.setPaymentType(rs.getString(8));
				order.setStatus(rs.getString(9));
				list.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteOrder(int id) {
		boolean f = false;
		try {
			String sql = "delete from book_order where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean updateStatus(int id, String status) {
		boolean f = false;
		try {
			String sql = "update book_order set status=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, status);
			ps.setInt(2, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}

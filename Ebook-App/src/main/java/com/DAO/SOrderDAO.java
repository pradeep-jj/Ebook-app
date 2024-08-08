package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.AdminOrders;
import com.entity.Orders;

public class SOrderDAO {

	private Connection conn;

	public SOrderDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addOrders(List<AdminOrders> list) {
		boolean f = false;

		try {

			String sql = "insert into adminorder(date,orderId,bookId,address,name,phno,email,quantity,totalAmount,paymentType,status) values(?,?,?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (AdminOrders o : list) {
				ps.setString(1, o.getDate());
				ps.setString(2, o.getOrderId());
				ps.setInt(3, o.getBookId());

				ps.setString(4, o.getAddress());
				ps.setString(5, o.getName());
				ps.setString(6, o.getPhno());
				ps.setString(7, o.getEmail());

				ps.setInt(8, o.getQuantity());
				ps.setString(9, o.getTotalAmount());
				ps.setString(10, o.getPaymentType());
				ps.setString(11, o.getStatus());

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

	
	public List<AdminOrders> getAllOrderByAdmin() {
		List<AdminOrders> list = new ArrayList<AdminOrders>();
		AdminOrders order = null;

		try {
			String sql = "select * from adminorder";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				order = new AdminOrders();
				order.setId(rs.getInt(1));
				order.setDate(rs.getString(2));
				order.setOrderId(rs.getString(3));
				order.setBookId(rs.getInt(4));
				order.setAddress(rs.getString(5));
				order.setName(rs.getString(6));
				order.setPhno(rs.getString(7));
				order.setEmail(rs.getString(8));
				order.setQuantity(rs.getInt(9));
				order.setTotalAmount(rs.getString(10));
				order.setPaymentType(rs.getString(11));
				order.setStatus(rs.getString(12));
				list.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean updateStatus(int id, String status) {
		boolean f = false;
		try {
			String sql = "update adminorder set status=? where id=?";
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
	
	public boolean deleteOrder(int id) {
		boolean f = false;
		try {
			String sql = "delete from adminorder where id=?";
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

}

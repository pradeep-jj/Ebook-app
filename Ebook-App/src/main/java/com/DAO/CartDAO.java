package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Books;
import com.entity.Cart;
import com.user.servlet.CartServlet;

public class CartDAO {
	private Connection conn;

	public CartDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCart(int bid, int uid) {
		boolean f = false;
		try {
			String sql = "insert into cart(book_id,user_id,quantity) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, 1);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean checkBook(int bid, int uid) {

		boolean f = false;
		try {
			String sql = "select * from cart where book_id=? and user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);

			ResultSet rs = ps.executeQuery();

			/*
			 * while(rs.next()) { f=true; }
			 */
			f = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Cart> getAllCarts(int uid) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		try {

			String sql = "select * from cart where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Cart();
				c.setId(rs.getInt(1));
				c.setBookId(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setQuantity(rs.getInt(4));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int countCart(int uid) {
		int i = 0;
		try {

			String sql = "select * from cart where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public Cart getQuantity( int bid,int uid) {
		Cart c = null;
		try {

			String sql = "select * from cart where user_id=? and book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setInt(2, bid);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Cart();
				c.setId(rs.getInt(1));
				c.setBookId(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setQuantity(rs.getInt(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	public boolean updateQuantity( int bid,int uid, int quan) {
		boolean f = false;
		try {
			String sql = "update cart set quantity=? where user_id=? and book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, quan);
			ps.setInt(2, uid);
			ps.setInt(3, bid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteQuantity(int uid, int bid) {
		boolean f = false;
		try {
			String sql = "delete from cart  where user_id=? and book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, uid);
			ps.setInt(2, bid);

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

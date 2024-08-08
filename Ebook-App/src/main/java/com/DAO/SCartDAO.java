package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class SCartDAO {
	private Connection conn;

	public SCartDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCart(int bid) {
		boolean f = false;
		try {
			String sql = "insert into scart(book_id,quantity) values(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, 1);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean checkBook(int bid) {

		boolean f = false;
		try {
			String sql = "select * from scart where book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);

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

	public List<Cart> getAllCarts() {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		try {

			String sql = "select * from scart ";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Cart();
				c.setId(rs.getInt(1));
				c.setBookId(rs.getInt(2));
				c.setQuantity(rs.getInt(3));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int countCart() {
		int i = 0;
		try {

			String sql = "select * from scart";
			PreparedStatement ps = conn.prepareStatement(sql);
			

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public Cart getQuantity( int bid) {
		Cart c = null;
		try {

			String sql = "select * from scart where  book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, bid);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Cart();
				c.setId(rs.getInt(1));
				c.setBookId(rs.getInt(2));
				c.setQuantity(rs.getInt(3));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	public boolean updateQuantity( int bid, int quan) {
		boolean f = false;
		try {
			String sql = "update scart set quantity=? where book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, quan);
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

	public boolean deleteQuantity( int bid) {
		boolean f = false;
		try {
			String sql = "delete from scart  where book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);

		
			ps.setInt(1, bid);

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

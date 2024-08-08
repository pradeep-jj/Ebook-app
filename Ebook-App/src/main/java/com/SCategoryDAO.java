package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Books;
import com.entity.Categories;

public class SCategoryDAO {
	private Connection conn;

	public SCategoryDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCategory(Categories ca) {
		boolean f = false;
		try {
			String sql = "insert into scategory(category_name,img) values(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ca.getCategoryName());
			ps.setString(2, ca.getImgName());

			// insert, delete, edit - executeUpdate()
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Categories> getAllCategories() {
		List<Categories> list = new ArrayList<Categories>();
		Categories cat = null;
		try {
			String sql = "select * from scategory";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cat = new Categories();
				cat.setId(rs.getInt(1));
				cat.setCategoryName(rs.getString(2));
				cat.setImgName(rs.getString(3));
				list.add(cat);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Boolean deleteCategories(int id) {
		boolean f = false;
		try {
			String sql = "delete from scategory where id=?";
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
	public List<Books> getAllBooksByCategory(String categoryName) {
		List<Books> list = new ArrayList<Books>();
		Books b = null;
		try {
			String sql = "select * from sbook where category=? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, categoryName);
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Books();
				b.setId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(Double.parseDouble(rs.getString(4)));
				b.setCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setImgBookName(rs.getString(7));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
}

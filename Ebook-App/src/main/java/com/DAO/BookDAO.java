package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Books;
import com.entity.Categories;

public class BookDAO {
	private Connection conn;

	public BookDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(Books b) {
		boolean f = false;
		try {
			String sql = "insert into book(name,author,price,category,status,img) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice() + "");
			ps.setString(4, b.getCategory());
			ps.setString(5, b.getBookStatus());
			ps.setString(6, b.getImgBookName());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Books> getAllBooks() {
		List<Books> list = new ArrayList<Books>();
		Books b = null;
		try {
			String sql = "select * from book";
			PreparedStatement ps = conn.prepareStatement(sql);

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

	public List<Books> getAllBooksByUser() {
		List<Books> list = new ArrayList<Books>();
		Books b = null;
		try {
			String sql = "select * from book where status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

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

	public Books getBookById(int id) {
		Books b = null;
		try {
			String sql = "select * from book where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

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
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public boolean updateBook(Books b) {
		boolean f = false;
		try {
			String sql = "update book set name=?,author=?,price=?,category=?,status=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice() + "");
			ps.setString(4, b.getCategory());
			ps.setString(5, b.getBookStatus());
			ps.setInt(6, b.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteBook(int id) {
		boolean f = false;

		try {

			String sql = "delete  from book where id=?";
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

	public List<Books> getFourBooks() {
		List<Books> list = new ArrayList<Books>();
		Books b = null;
		int i = 1;
		try {
			String sql = "select * from book where status=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next() && i <= 4) {
				b = new Books();
				b.setId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(Double.parseDouble(rs.getString(4)));
				b.setCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setImgBookName(rs.getString(7));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Books> getAllBookBySearch(String ch) {
		List<Books> list = new ArrayList<Books>();
		Books b = null;

		try {
			String sql = "select * from book where name like ? or author like ? or category like ? and status=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
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

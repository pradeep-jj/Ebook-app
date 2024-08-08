package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Feedback;

public class FeedbackDAO {
	private Connection conn;

	public FeedbackDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addFeedback(Feedback feed) {
		boolean f = false;

		try {
			String sql = "insert into feedback(name,email,phno,message,userid) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, feed.getName());
			ps.setString(2, feed.getEmail());
			ps.setString(3, feed.getPhone());
			ps.setString(4, feed.getMesage());
			ps.setInt(5, feed.getUserId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Feedback> getAllFeedBack() {
		List<Feedback> list = new ArrayList<Feedback>();
		Feedback f = null;
		try {

			String sql = "select * from feedback";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = new Feedback(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getInt(6));
				list.add(f);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Feedback> getAllFeedBackByUser(int userid) {
		List<Feedback> list = new ArrayList<Feedback>();
		Feedback f = null;
		try {

			String sql = "select * from feedback where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = new Feedback(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getInt(6));
				list.add(f);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}

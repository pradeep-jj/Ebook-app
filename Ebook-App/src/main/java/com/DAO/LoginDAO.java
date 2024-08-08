package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

	private Connection conn;

	public LoginDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean adminLogin(String em, String psw) {
		boolean f = false;

		try {

			String sql = "select * from admin where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean supLogin(String em, String psw) {
		boolean f = false;

		try {

			String sql = "select * from suplier where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean updateAdminpassword(String em, String oldpsw, String newPsw) {
		boolean f = false;

		try {

			String sql = "update admin set password=? where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPsw);
			ps.setString(2, em);
			ps.setString(3, oldpsw);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public boolean updateSuppassword(String em, String oldpsw, String newPsw) {
		boolean f = false;

		try {

			String sql = "update suplier set password=? where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPsw);
			ps.setString(2, em);
			ps.setString(3, oldpsw);

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

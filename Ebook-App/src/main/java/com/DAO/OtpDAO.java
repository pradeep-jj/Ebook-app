package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.OTPAuthentication;



public class OtpDAO {
	private Connection conn;

	public OtpDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addOtp(String email, String otp) {
		boolean f = false;
		try {
			String sql = "insert into forgot_otp(email,otp) value(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, otp);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public OTPAuthentication getOtp(String email) {
		OTPAuthentication otp = null;
		try {
			String sql = "select * from forgot_otp where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				otp = new OTPAuthentication(rs.getInt(1), rs.getString(2), rs.getString(3));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return otp;
	}

	public boolean deleteEmailAndOtp(String email) {
		boolean f = false;
		try {
			String sql = "delete from forgot_otp where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean checkEmail(String email) {
		boolean f = false;
		try {
			String sql = "select * from forgot_otp where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean updatePassword(String email, String password) {
		boolean f = false;
		try {
			String sql = "update user set password=? where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, email);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean updatePasswordForArtist(String email, String password) {
		boolean f = false;
		try {
			String sql = "update artist set password=? where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, email);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}

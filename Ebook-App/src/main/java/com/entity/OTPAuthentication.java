package com.entity;

public class OTPAuthentication {
	private int id;

	private String email;

	private String otp;

	public OTPAuthentication(int id, String email, String otp) {
		super();
		this.id = id;
		this.email = email;
		this.otp = otp;
	}

	public OTPAuthentication(String email, String otp) {
		super();
		this.email = email;
		this.otp = otp;
	}

	public OTPAuthentication() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

}

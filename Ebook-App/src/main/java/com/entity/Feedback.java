package com.entity;

public class Feedback {
	private int id;
	private String name;
	private String email;
	private String phone;
	private String mesage;
	private int userId;

	public Feedback(String name, String email, String phone, String mesage, int userId) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.mesage = mesage;
		this.userId = userId;
	}

	public Feedback(int id, String name, String email, String phone, String mesage, int userId) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.mesage = mesage;
		this.userId = userId;
	}

	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMesage() {
		return mesage;
	}

	public void setMesage(String mesage) {
		this.mesage = mesage;
	}

}

package com.entity;

public class user {
	private int id;
	private String name;
	private String email;
	
	private String phno;
	private String adress;
	private String city;
	private String state;
	private String pincode;
	
	
	
	private String password;
	
	
	
	public user(String name, String email, String phno, String adress, String city, String state, String pincode,
			String password) {
		super();
		this.name = name;
		this.email = email;
		this.phno = phno;
		this.adress = adress;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.password = password;
	}
	
	
	
	
	public user(int id, String name, String email, String phno, String adress, String city, String state,
			String pincode, String password) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phno = phno;
		this.adress = adress;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.password = password;
	}




	public String getAdress() {
		return adress;
	}


	public void setAdress(String adress) {
		this.adress = adress;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getPincode() {
		return pincode;
	}


	public void setPincode(String pincode) {
		this.pincode = pincode;
	}


	public user() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}

	
	
}

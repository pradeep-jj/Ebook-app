package com.entity;

public class AdminOrders {
	private int id;
	private String date;
	private String orderId;
	private int bookId;
	private String address;
	private String name;
	private String phno;
	private String email;
	private int quantity;
	private String totalAmount;
	private String paymentType;
	private String status;

	public AdminOrders() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminOrders(int id, String date, String orderId, int bookId, String address, int quantity,
			String totalAmount, String paymentType, String status) {
		super();
		this.id = id;
		this.date = date;
		this.orderId = orderId;
		this.bookId = bookId;
		this.address = address;
		this.quantity = quantity;
		this.totalAmount = totalAmount;
		this.paymentType = paymentType;
		this.status = status;
	}

	public AdminOrders(String date, String orderId, int bookId, String address, int quantity, String totalAmount,
			String paymentType, String status) {
		super();
		this.date = date;
		this.orderId = orderId;
		this.bookId = bookId;
		this.address = address;
		this.quantity = quantity;
		this.totalAmount = totalAmount;
		this.paymentType = paymentType;
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}

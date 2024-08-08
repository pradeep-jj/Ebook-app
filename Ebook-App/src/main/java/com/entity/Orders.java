package com.entity;

import java.util.Date;

public class Orders {
	private int id;
	private String date;
	private String orderId;
	private int bookId;
	private int userId;
	private int quantity;
	private String totalAmount;
	private String paymentType;
	private String status;

	public Orders(String date,String orderId, int bookId, int userId, int quantity, String totalAmount, String paymentType,
			String status) {
		super();
		this.date=date;
		this.orderId = orderId;
		this.bookId = bookId;
		this.userId = userId;
		this.quantity = quantity;
		this.totalAmount = totalAmount;
		this.paymentType = paymentType;
		this.status = status;
	}

	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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

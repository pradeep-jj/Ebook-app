package com.entity;

public class Cart {
	private int id;
	private int bookId;
	private int userId;
	private int quantity;
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(int id, int bookId, int userId, int quantity) {
		super();
		this.id = id;
		this.bookId = bookId;
		this.userId = userId;
		this.quantity = quantity;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	@Override
	public String toString() {
		return "Cart [id=" + id + ", bookId=" + bookId + ", userId=" + userId + ", quantity=" + quantity + "]";
	}
	

}

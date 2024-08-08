package com.entity;

public class Books {
	private int id;
	private String bookName;
	private String author;
	private Double price;
	private String category;
	private String bookStatus;
	private String imgBookName;
	public Books() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Books(String bookName, String author, Double price, String category, String bookStatus, String imgBookName) {
		super();
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.category = category;
		this.bookStatus = bookStatus;
		this.imgBookName = imgBookName;
	}
	
	public Books(int id, String bookName, String author, Double price, String category, String bookStatus,
			String imgBookName) {
		super();
		this.id = id;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.category = category;
		this.bookStatus = bookStatus;
		this.imgBookName = imgBookName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBookStatus() {
		return bookStatus;
	}
	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}
	public String getImgBookName() {
		return imgBookName;
	}
	public void setImgBookName(String imgBookName) {
		this.imgBookName = imgBookName;
	}
	@Override
	public String toString() {
		return "Books [id=" + id + ", bookName=" + bookName + ", author=" + author + ", price=" + price + ", category="
				+ category + ", bookStatus=" + bookStatus + ", imgBookName=" + imgBookName + "]";
	}
	
	
	

}

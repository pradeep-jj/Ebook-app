package com.entity;

public class Categories {
	
	private int id;
	private String categoryName;
	private String imgName;
	
	public Categories() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Categories(String categoryName, String imgName) {
		super();
		this.categoryName = categoryName;
		this.imgName = imgName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

}

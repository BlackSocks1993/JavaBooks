package com.mvcProject.product;

import java.sql.Date;

public class ProductDTO {

	private int product_no;
	private String product_name;
	private String product_author;
	private String product_publisher;
	private Date product_date;
	private String product_detail;
	private int product_price;
	private int product_stock;
	private int product_category_no;
	private String product_img;
	
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public int getProduct_category_no() {
		return product_category_no;
	}
	public void setProduct_category_no(int product_category_no) {
		this.product_category_no = product_category_no;
	}
	public String getProduct_author() {
		return product_author;
	}
	public void setProduct_author(String product_author) {
		this.product_author = product_author;
	}
	public String getProduct_publisher() {
		return product_publisher;
	}
	public void setProduct_publisher(String product_publisher) {
		this.product_publisher = product_publisher;
	}
	public Date getProduct_date() {
		return product_date;
	}
	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
	
	
	
}

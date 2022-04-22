package com.mvcProject.cartList.model;

import java.sql.Date;

public class CartDTO {

	// 상품 DB
	private int product_no;
	private String product_name;
	private String product_author;
	private String product_publisher;
	private Date product_date;
	private String product_detail;
	private String product_img;
	private int product_price;
	
	// 장바구니 DB
	private int member_no;
	private int cart_amount;

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	
	

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

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
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
}


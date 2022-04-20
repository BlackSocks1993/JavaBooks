package com.mvcProject.orderPage;

public class OrderProductDTO {

	private int order_product_no;
	private int order_product_quantity;
	private int order_no;
	private int product_no;
	private int totalPrice;
	
	
	public int getOrder_product_no() {
		return order_product_no;
	}
	public void setOrder_product_no(int order_product_no) {
		this.order_product_no = order_product_no;
	}
	public int getOrder_product_quantity() {
		return order_product_quantity;
	}
	public void setOrder_product_quantity(int order_product_quantity) {
		this.order_product_quantity = order_product_quantity;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	

}

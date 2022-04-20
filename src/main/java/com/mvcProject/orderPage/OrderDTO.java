package com.mvcProject.orderPage;

import java.sql.Date;
import java.util.List;

import com.mvcProject.*;

public class OrderDTO {
	
	
	private int order_no;
	private Date order_date;
	private String order_addr;
	private String order_memo;
	private int member_no;
	private String order_name;
	private String order_phone;
	private List<OrderProductDTO> orders;
	private int orderFinalPrice;
	
	
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_addr() {
		return order_addr;
	}
	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}
	public String getOrder_memo() {
		return order_memo;
	}
	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public List<OrderProductDTO> getOrders() {
		return orders;
	}
	public void setOrders(List<OrderProductDTO> orders) {
		this.orders = orders;
	}
	public int getOrderFinalPrice() {
		return orderFinalPrice;
	}
	public void setOrderFinalPrice(int orderFinalPrice) {
		this.orderFinalPrice = orderFinalPrice;
	}
	
	
}

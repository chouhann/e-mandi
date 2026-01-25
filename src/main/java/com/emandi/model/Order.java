package com.emandi.model;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id;
	private int userId;
	private String name;
	private String number;
	private String email;
	private String method;
	private String address;
	private String totalProducts;
	private double totalPrice;
	private Date placedOn;
	private String paymentStatus;

	public Order() {
	}

	public Order(int id, int userId, String name, String number, String email, String method, String address,
			String totalProducts, double totalPrice, Date placedOn, String paymentStatus) {
		this.id = id;
		this.userId = userId;
		this.name = name;
		this.number = number;
		this.email = email;
		this.method = method;
		this.address = address;
		this.totalProducts = totalProducts;
		this.totalPrice = totalPrice;
		this.placedOn = placedOn;
		this.paymentStatus = paymentStatus;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTotalProducts() {
		return totalProducts;
	}

	public void setTotalProducts(String totalProducts) {
		this.totalProducts = totalProducts;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getPlacedOn() {
		return placedOn;
	}

	public void setPlacedOn(Date placedOn) {
		this.placedOn = placedOn;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	@Override
	public String toString() {
		return "Order{" + "id=" + id + ", userId=" + userId + ", name='" + name + '\'' + ", totalPrice=" + totalPrice
				+ ", paymentStatus='" + paymentStatus + '\'' + '}';
	}
}
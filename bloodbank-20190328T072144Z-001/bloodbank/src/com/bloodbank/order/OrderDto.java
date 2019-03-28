package com.bloodbank.order;

import java.io.Serializable;

public class OrderDto implements Serializable{
	private String  order_date_time, delivery_date_time, delivered_date_time, payment_mode, blood_group;
	private int order_id, bloodbank_id, price, quantity ,patient_id;
	private char order_status;
	
	public OrderDto() {
		
	}

	public int getBloodbank_id() {
		return bloodbank_id;
	}

	public void setBloodbank_id(int bloodbank_id) {
		this.bloodbank_id = bloodbank_id;
	}

	public int getPatient_id() {
		return patient_id;
	}

	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}

	public String getOrder_date_time() {
		return order_date_time;
	}

	public void setOrder_date_time(String order_date_time) {
		this.order_date_time = order_date_time;
	}

	public String getDelivery_date_time() {
		return delivery_date_time;
	}

	public void setDelivery_date_time(String delivery_date_time) {
		this.delivery_date_time = delivery_date_time;
	}

	public String getDelivered_date_time() {
		return delivered_date_time;
	}

	public void setDelivered_date_time(String delivered_date_time) {
		this.delivered_date_time = delivered_date_time;
	}

	public String getPayment_mode() {
		return payment_mode;
	}

	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}

	public String getBlood_group() {
		return blood_group;
	}

	public void setBlood_group(String blood_group) {
		this.blood_group = blood_group;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public char getOrder_status() {
		return order_status;
	}

	public void setOrder_status(char order_status) {
		this.order_status = order_status;
	}

	
	
	
}

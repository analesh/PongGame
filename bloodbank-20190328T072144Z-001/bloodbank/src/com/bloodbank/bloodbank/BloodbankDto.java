package com.bloodbank.bloodbank;

import java.io.Serializable;

public class BloodbankDto implements Serializable{
	private String login_id, bloodbank_name, mno, email, country, state, city, address, lat, lng, created_date_time,password;
	private int bloodbank_id,reg_no;
	
	public BloodbankDto() {
		
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getBloodbank_name() {
		return bloodbank_name;
	}

	public void setBloodbank_name(String bloodbank_name) {
		this.bloodbank_name = bloodbank_name;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getCreated_date_time() {
		return created_date_time;
	}

	public void setCreated_date_time(String created_date_time) {
		this.created_date_time = created_date_time;
	}

	public int getBloodbank_id() {
		return bloodbank_id;
	}

	public void setBloodbank_id(int bloodbank_id) {
		this.bloodbank_id = bloodbank_id;
	}

	public int getReg_no() {
		return reg_no;
	}

	public void setReg_no(int reg_no) {
		this.reg_no = reg_no;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}

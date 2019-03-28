package com.bloodbank.blood;

import java.io.Serializable;

public class BloodDto implements Serializable{
private int bg_id,  quantity, cost, bloodbank_id;
private String blood_group, bloodbank_name;
	public BloodDto(){
		
	}
	public int getBg_id() {
		return bg_id;
	}
	public void setBg_id(int bg_id) {
		this.bg_id = bg_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getBloodbank_id() {
		return bloodbank_id;
	}
	public void setBloodbank_id(int bloodbank_id) {
		this.bloodbank_id = bloodbank_id;
	}
	public String getBlood_group() {
		return blood_group;
	}
	public void setBlood_group(String blood_group) {
		this.blood_group = blood_group;
	}
	public String getBloodbank_name() {
		return bloodbank_name;
	}
	public void setBloodbank_name(String bloodbank_name) {
		this.bloodbank_name = bloodbank_name;
	}
	
}

package com.bloodbank.patient;

import java.io.Serializable;

public class PatientDto implements Serializable{
private String name, dob, mno, hospital, blood_group, address,bloodbank_id;
	public String getBloodbank_id() {
	return bloodbank_id;
}

public void setBloodbank_id(String bloodbank_id) {
	this.bloodbank_id = bloodbank_id;
}

	private int patient_id;
	private char gender;
	
	public PatientDto() {
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getHospital() {
		return hospital;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}

	public String getBlood_group() {
		return blood_group;
	}

	public void setBlood_group(String blood_group) {
		this.blood_group = blood_group;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPatient_id() {
		return patient_id;
	}

	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}
	
	
	
	
}

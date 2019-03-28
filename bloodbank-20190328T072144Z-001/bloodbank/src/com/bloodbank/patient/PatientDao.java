package com.bloodbank.patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bloodbank.blood.BloodDto;
import com.bloodbank.database.BloodbankData;
import com.bloodbank.order.OrderDto;

public class PatientDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addPatient(PatientDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "insert into patient(name, gender, dob, mno, hospital, address,blood_group,bloodbank_id) values(?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getName());
			ps.setString(2, "" + dto.getGender());
			ps.setString(3, dto.getDob());
			ps.setString(4, dto.getMno());
			ps.setString(5, dto.getHospital());
			ps.setString(6, dto.getAddress());
			ps.setString(7, dto.getBlood_group());
			ps.setString(8, dto.getBloodbank_id());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("____exception at add patient____" + e);
		} finally {
			conn = null;
			ps = null;
			return flag;
		}

	}

	public boolean updatePatient(PatientDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "update patient set name=?, gender=?, dob=?, mno=?, hospital=?, blood_group=?, address=? where patient_id=?";

			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getName());
			ps.setString(2, "" + dto.getGender());
			ps.setString(3, dto.getDob());
			ps.setString(4, dto.getMno());
			ps.setString(5, dto.getHospital());
			ps.setString(6, dto.getBlood_group());
			ps.setString(7, dto.getAddress());

			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("____exception at update patient____" + e);
		} finally {
			conn = null;
			ps = null;
			return false;
		}

	}

	public boolean deletePatient(PatientDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "delete from Patient where patient_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, dto.getPatient_id());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("-------exception at delete patient------" + e);
		} finally {
			conn = null;
			ps = null;
			return false;
		}
	}

	public PatientDto getPatient(int patient_id) {
		PatientDto dto = null;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();

			}
			String query = "select* from patient where patient_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, patient_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new PatientDto();
				dto.setAddress(rs.getString("address"));
				dto.setBlood_group(rs.getString("blood_group"));
				dto.setDob(rs.getString("dob"));
				dto.setName(rs.getString("name"));
				dto.setHospital(rs.getString("hospital"));
				dto.setMno(rs.getString("mno"));
			}

		} catch (Exception e) {
			System.out.println("exception in ...." + e);
		} finally {
			conn = null;
			rs = null;
			ps = null;
			return dto;
		}
	}

	public int getPatientId(String mno, String name) {
		int patient_id = 0;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();

			}
			String query = "select patient_id from patient where mno=? and name=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, mno);
			ps.setString(2, name);
			rs = ps.executeQuery();
			if (rs.next()) {
				patient_id = rs.getInt("patient_id");
			}

		} catch (Exception e) {
			System.out.println("exception in ...." + e);
		} finally {
			conn = null;
			ps  = null;
			rs = null;
			return patient_id;
		}
	}
}

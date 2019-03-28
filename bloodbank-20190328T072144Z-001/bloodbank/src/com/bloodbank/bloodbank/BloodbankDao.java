package com.bloodbank.bloodbank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.bloodbank.database.BloodbankData;


public class BloodbankDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	public boolean addBloodbank(BloodbankDto dto) {
		boolean flag = false;
		try {
			if(conn==null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "insert into bloodbank(login_id, bloodbank_name, reg_no, mno, email, country, state, city, address, lat, lng,password) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1,dto.getLogin_id());
			ps.setString(2, dto.getBloodbank_name());
			ps.setInt(3, dto.getReg_no());
			ps.setString(4,dto.getMno() );
			ps.setString(5, dto.getEmail());
			ps.setString(6, dto.getCountry());
			ps.setString(7,dto.getState());
			ps.setString(8, dto.getCity());
			ps.setString(9, dto.getAddress());
			ps.setString(10, dto.getLat());
			ps.setString(11,dto.getLng());
			
			ps.setString(12, dto.getPassword());
			if(ps.executeUpdate()>0) {
				flag=true;
			}
		}
		
		catch (Exception e) {
			
			System.out.println("_____Exception at add bloodbank_________" + e);
		}finally {
			ps = null;
			conn = null;
			return flag;
		}
	}
	public boolean updateBloodbank(BloodbankDto dto) {
		boolean flag = false;
		try {
			if(conn==null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "update bloodbank set login_id=?, bloodbank_name=?, reg_no=?, mno=?, email=?, country=?, state=?, city=?, address=?, lat=?, lng=?, created_date_time=?,password=? where bloodbank_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1,dto.getLogin_id());
			ps.setString(2, dto.getBloodbank_name());
			ps.setInt(3, dto.getReg_no());
			ps.setString(4,dto.getMno() );
			ps.setString(5, dto.getEmail());
			ps.setString(6, dto.getCountry());
			ps.setString(7,dto.getState());
			ps.setString(7, dto.getCity());
			ps.setString(8, dto.getAddress());
			ps.setString(9, dto.getLat());
			ps.setString(10,dto.getLng());
			ps.setString(11, dto.getCreated_date_time());
			ps.setString(12, dto.getPassword());
			
			if(ps.executeUpdate()>0) {
				flag =true;
			}
			
		}
		
		catch (Exception e) {
			System.out.println("_____Exception at update blood_________" + e);
		}finally {
			ps = null;
			conn = null;
			return flag;
		}
	}
	
	public boolean deleteBloodbank(BloodbankDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "delete from bloodbank where bloodbank_id=?";

			ps.setInt(1, dto.getBloodbank_id());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("_____Exception at delete bloodbank_________" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}
	public BloodbankDto getBloodbank(int bloodbank_id) {
		BloodbankDto dto = null; 
		try {
			if(conn==null) {
				conn= BloodbankData.getBloodbankData();
			}
			String query = "select * from bloodbank where bloodbank_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, bloodbank_id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new BloodbankDto();
				dto.setBloodbank_id(rs.getInt("bloodbank_id"));
				dto.setAddress(rs.getString("address"));
				dto.setBloodbank_name(rs.getString("bloodbank_name"));
				dto.setCity(rs.getString("city"));
				dto.setCountry(rs.getString("country"));
				dto.setCreated_date_time(rs.getString("created_date_time"));
				dto.setEmail(rs.getString("email"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setLogin_id(rs.getString("login_id"));
				dto.setMno(rs.getString("mno"));
				dto.setReg_no(rs.getInt("reg_no"));
				dto.setState(rs.getString("state"));
			}
			
			
			
		} catch (Exception e) {
			System.out.println("_____Exception at get bloodbank_________" + e);
		}
		finally {
			rs = null;
			ps = null;
			conn = null;
			return dto;
		}
	}
	
	public ArrayList<BloodbankDto> getAllBloodbank() {
		ArrayList<BloodbankDto> list = new ArrayList<>();
		BloodbankDto dto = null;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();

			}
			String query = "select* from bloodbank";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto = new BloodbankDto();
				dto.setAddress(rs.getString("address"));
				dto.setBloodbank_id(rs.getInt("bloodbank_id"));
				dto.setBloodbank_name(rs.getString("bloodbank_name"));
				dto.setCity(rs.getString("city"));
				dto.setCountry(rs.getString("country"));
				dto.setCreated_date_time(rs.getString("created_date_time"));
				dto.setEmail(rs.getString("email"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setLogin_id(rs.getString("login"));
				dto.setMno(rs.getString("mno"));
				dto.setPassword(rs.getString("password"));
				dto.setReg_no(rs.getInt("reg_no"));
				dto.setState(rs.getString("state"));
			}

		} catch (Exception e) {
			System.out.println("_____Exception at get all product_________" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return list;
		}
	}
	 public int loginBloodbank(String login_id, String password) {
	        int bloodbank_id = 0;
	        if (conn == null) {
	            conn = BloodbankData.getBloodbankData();
	        }
	        String sql = "select bloodbank_id from bloodbank where login_id=? and password=?";
	        try {
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, login_id);
	            ps.setString(2, password);
	            rs = ps.executeQuery();
	            if (rs.next()) {
	               bloodbank_id = rs.getInt("bloodbank_id");
	            }
	        } catch (Exception e) {
	            System.out.println("--------Exception at login Bloodbannk:---------------" + e);
	        } finally {
	            ps = null;
	            rs = null;
	            conn = null;
	            return bloodbank_id;
	        }
	    }
	 
	 
	 
	 
	 
	
/*	public static void main(String[] args) {
		
		
		System.out.println(new BloodbankDao().loginBloodbank("ozas", "1234"));
	}

*/	
}

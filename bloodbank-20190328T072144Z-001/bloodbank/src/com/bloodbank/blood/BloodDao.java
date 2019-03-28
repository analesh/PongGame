package com.bloodbank.blood;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bloodbank.database.BloodbankData;

public class BloodDao {

	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	
	public boolean addBlood(int bloodbank_id) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "insert into blood( blood_group,bloodbank_id)values(?,?),(?,?),(?,?),(?,?),(?,?)";                                                             
			ps = conn.prepareStatement(query);
			ps.setString(1, "A+");
			ps.setInt(2,bloodbank_id);
			ps.setString(3, "B+");
			ps.setInt(4,bloodbank_id);
			ps.setString(5, "AB+");
			ps.setInt(6,bloodbank_id);
			ps.setString(7, "O+");
			ps.setInt(8,bloodbank_id);
			ps.setString(9, "O-");
			ps.setInt(10,bloodbank_id);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("_____Exception at add Blood________" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean updateBlood(BloodDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "update blood set   quantity=?, cost=? where bg_id=?";
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, dto.getQuantity());
			ps.setInt(2, dto.getCost());
			ps.setInt(3, dto.getBg_id());
			

			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("_____Exception at update_product_________" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteBlood(BloodDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "delete from blood where bg_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, dto.getBg_id());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("_____Exception at delete product_________" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public BloodDto getBlood(int bg_id) {
		BloodDto dto = null;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();

			}
			String query = "select* from blood where bg_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, bg_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new BloodDto();
				dto.setBg_id(rs.getInt("bg_id"));
				dto.setBlood_group(rs.getString("blood_group"));
				dto.setBloodbank_id(rs.getInt("bloodbank_id"));
				dto.setBloodbank_name(rs.getString("bloodbank_name"));
				dto.setCost(rs.getInt("cost"));
				dto.setQuantity(rs.getInt("quantity"));
			}

		} catch (Exception e) {
			System.out.println("_____Exception at get blood_________" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return dto;
		}
	}

	public ArrayList<BloodDto> getAllBlood(int bloodbank_id) {
		ArrayList<BloodDto> al = new ArrayList<>();
		BloodDto dto = null;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();

			}
			String query = "select* from blood where bloodbank_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1,bloodbank_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new BloodDto();
				dto.setBg_id(rs.getInt("bg_id"));
				dto.setBlood_group(rs.getString("blood_group"));
				dto.setCost(rs.getInt("cost"));
				dto.setQuantity(rs.getInt("quantity"));
				al.add(dto);
			}

		} catch (Exception e) {
			System.out.println("_________Exception at addproduct_________" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return al;
		}
	}
	
	public ArrayList<BloodDto> getAllBlood(String blood_group) {
		ArrayList<BloodDto> al = new ArrayList<>();
		BloodDto dto = null;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();

			}
			String query = "SELECT blood.blood_group, bloodbank_name,cost,quantity,bg_id,blood.bloodbank_id FROM blood,bloodbank where blood_group=? and blood.bloodbank_id=bloodbank.bloodbank_id";
			ps = conn.prepareStatement(query);
			ps.setString(1,blood_group);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new BloodDto();
				dto.setBlood_group(rs.getString("blood_group"));
				dto.setBg_id(rs.getInt("bg_id"));
				dto.setBloodbank_name(rs.getString("bloodbank_name"));
				dto.setCost(rs.getInt("cost"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setBloodbank_id(rs.getInt("bloodbank_id"));
				al.add(dto);
			}

		} catch (Exception e) {
			System.out.println("_____Exception at get all blood by blood group________" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return al;
		}
	}

   public int getIdby_user(String login_id) {
	 int bloodbank_id = 0;
	 try {
		if(conn==null) {
			conn = BloodbankData.getBloodbankData();
		}
		String query = "select bloodbank_id from bloodbank where login_id=?";
		ps = conn.prepareStatement(query);
		ps.setString(1, login_id);
		rs = ps.executeQuery();
		if(rs.next()) {
			bloodbank_id = rs.getInt("bloodbank_id");
		}
		
		
		
	} catch (Exception e) {
		System.out.println("exception at get id by user"  + e);
	}finally {
		conn= null;
		ps=null;
		rs = null;
		return bloodbank_id;
	}
 }
  public BloodDto getCostandblood_group(int bloodbank_id,String blood_group) {
		
		BloodDto dto = null;
		try {
			if(conn==null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "select cost,bg_id from blood where bloodbank_id=? and blood_group=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, bloodbank_id);
			ps.setString(2, blood_group);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setCost(rs.getInt("cost"));
				dto.setBlood_group(rs.getString("blood_group"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			conn =null;
			ps=null;
			rs = null;
			return dto;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*  public static void main(String[] args) { BloodDao dao = new BloodDao();
	  BloodDto dto = new BloodDto(); 
	 
	  
	  System.out.println(dao.getAllBlood());
	 
	  }
	 */

}

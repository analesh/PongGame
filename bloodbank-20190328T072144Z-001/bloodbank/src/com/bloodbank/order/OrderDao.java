package com.bloodbank.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bloodbank.database.BloodbankData;

public class OrderDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addOrder(OrderDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "insert into orders( bloodbank_id,price, quantity, order_status, payment_mode, blood_group, patient_id)values(?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setInt(1, dto.getBloodbank_id());
			ps.setInt(2, dto.getPrice());
			ps.setInt(3, dto.getQuantity());
			ps.setString(4, "ND");
     		ps.setString(5, "COD");
			ps.setString(6, dto.getBlood_group());
			ps.setInt(7, dto.getPatient_id());
            
             if(ps.executeUpdate()>0) {
            	 flag =true;
             }
		} catch (Exception e) {
			System.out.println("____exception at add order____" + e);
		} finally {
			conn = null;
			ps = null;
			return flag;
		}

	}

	public boolean deleteOrder(OrderDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "delete from orders where order_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, dto.getOrder_id());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("-------exception at delete order------" + e);
		} finally {
			conn = null;
			ps = null;
			return false;
		}
	}

	public OrderDto getOrder(int order_id) {
		OrderDto dto = null;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();
			}
			String query = "select * from orders where order_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, order_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new OrderDto();
				dto.setBloodbank_id(rs.getInt("bloodbank_id"));
				dto.setBlood_group(rs.getString("blood_group"));
				dto.setDelivery_date_time(rs.getString("delivery_date_time"));
				dto.setDelivered_date_time(rs.getString("delivered_date_time"));
				dto.setOrder_date_time(rs.getString("order_date_time"));
				dto.setOrder_id(rs.getInt("order_id"));
				dto.setOrder_status(rs.getString("order_status").charAt(0)); // result set in character
				
				dto.setPayment_mode(rs.getString("payment_mode"));
				dto.setPrice(rs.getInt("price"));
				dto.setQuantity(rs.getInt("quantity"));

			}

		} catch (Exception e) {
			System.out.println("-------exception at get order------" + e);
		} finally {
			conn = null;
			ps = null;
			rs = null;
			return dto;
		}

	}

	public ArrayList<OrderDto> getAllOrder() {
		ArrayList<OrderDto> list = new ArrayList<>();
		OrderDto dto = null;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();

			}
			String query = "select * from orders";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new OrderDto();
				dto.setBloodbank_id(rs.getInt("bloodbank_id"));
				dto.setBlood_group(rs.getString("blood_group"));
				dto.setDelivery_date_time(rs.getString("delivery_date_time"));
				dto.setDelivered_date_time(rs.getString("delivered_date_time"));
				dto.setOrder_date_time(rs.getString("order_date_time"));
				dto.setOrder_id(rs.getInt("order_id"));
				dto.setOrder_status(rs.getString("order_status").charAt(0)); // result set in character
				dto.setPayment_mode(rs.getString("payment_mode"));
				dto.setPrice(rs.getInt("price"));
				dto.setQuantity(rs.getInt("quantity"));
			}

		} catch (Exception e) {
			System.out.println("------exception at getAll order--------");
		} finally {
			conn = null;
			rs = null;
			ps = null;
			return list;
		}
	}
	public int getOrderId(int bloodbank_id, int patient_id) {
		int order_id = 0;
		try {
			if (conn == null) {
				conn = BloodbankData.getBloodbankData();

			}
			String query = "select order_id from order where bloodbank_id=? and patient_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, bloodbank_id);
			ps.setInt(2, patient_id);;
			rs = ps.executeQuery();
			if (rs.next()) {
				order_id = rs.getInt("order_id");
			}

		} catch (Exception e) {
			System.out.println("exception in ...." + e);
		} finally {
			conn = null;
			ps  = null;
			rs = null;
			return order_id;
		}
	}
}

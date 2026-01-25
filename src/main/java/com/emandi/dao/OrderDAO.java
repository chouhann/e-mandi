package com.emandi.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.emandi.model.Order;
import com.emandi.util.DBUtil;

public class OrderDAO {

	// Place new order
	public boolean placeOrder(Order order) throws SQLException {
		String sql = "INSERT INTO orders(user_id, name, number, email, method, address, "
				+ "total_products, total_price, placed_on, payment_status) " + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, order.getUserId());
			pstmt.setString(2, order.getName());
			pstmt.setString(3, order.getNumber());
			pstmt.setString(4, order.getEmail());
			pstmt.setString(5, order.getMethod());
			pstmt.setString(6, order.getAddress());
			pstmt.setString(7, order.getTotalProducts());
			pstmt.setDouble(8, order.getTotalPrice());
			pstmt.setDate(9, new java.sql.Date(order.getPlacedOn().getTime()));
			pstmt.setString(10, order.getPaymentStatus());

			return pstmt.executeUpdate() > 0;
		}
	}

	// Check if order already exists (duplicate check)
	public boolean orderExists(String name, String number, String email, String method, String address,
			String totalProducts, double totalPrice) throws SQLException {
		String sql = "SELECT * FROM orders WHERE name = ? AND number = ? AND email = ? "
				+ "AND method = ? AND address = ? AND total_products = ? AND total_price = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, name);
			pstmt.setString(2, number);
			pstmt.setString(3, email);
			pstmt.setString(4, method);
			pstmt.setString(5, address);
			pstmt.setString(6, totalProducts);
			pstmt.setDouble(7, totalPrice);

			try (ResultSet rs = pstmt.executeQuery()) {
				return rs.next();
			}
		}
	}

	// Get all orders
	public List<Order> getAllOrders() throws SQLException {
		List<Order> orders = new ArrayList<>();
		String sql = "SELECT * FROM orders ORDER BY placed_on DESC";

		try (Connection conn = DBUtil.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			while (rs.next()) {
				orders.add(extractOrderFromResultSet(rs));
			}
		}
		return orders;
	}

	// Get orders by user ID
	public List<Order> getOrdersByUserId(int userId) throws SQLException {
		List<Order> orders = new ArrayList<>();
		String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY placed_on DESC";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, userId);

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					orders.add(extractOrderFromResultSet(rs));
				}
			}
		}
		return orders;
	}

	// Get order by ID
	public Order getOrderById(int id) throws SQLException {
		String sql = "SELECT * FROM orders WHERE id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, id);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return extractOrderFromResultSet(rs);
				}
			}
		}
		return null;
	}

	// Update order payment status
	public boolean updatePaymentStatus(int orderId, String paymentStatus) throws SQLException {
		String sql = "UPDATE orders SET payment_status = ? WHERE id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, paymentStatus);
			pstmt.setInt(2, orderId);

			return pstmt.executeUpdate() > 0;
		}
	}

	// Delete order
	public boolean deleteOrder(int id) throws SQLException {
		String sql = "DELETE FROM orders WHERE id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, id);
			return pstmt.executeUpdate() > 0;
		}
	}

	// Count total orders
	public int countTotalOrders() throws SQLException {
		String sql = "SELECT COUNT(*) FROM orders";

		try (Connection conn = DBUtil.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			if (rs.next()) {
				return rs.getInt(1);
			}
		}
		return 0;
	}

	// Get total pending amount
	public double getTotalPendingAmount() throws SQLException {
		String sql = "SELECT SUM(total_price) FROM orders WHERE payment_status = 'pending'";

		try (Connection conn = DBUtil.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			if (rs.next()) {
				return rs.getDouble(1);
			}
		}
		return 0.0;
	}

	// Get total completed amount
	public double getTotalCompletedAmount() throws SQLException {
		String sql = "SELECT SUM(total_price) FROM orders WHERE payment_status = 'completed'";

		try (Connection conn = DBUtil.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			if (rs.next()) {
				return rs.getDouble(1);
			}
		}
		return 0.0;
	}

	// Helper method to extract Order from ResultSet
	private Order extractOrderFromResultSet(ResultSet rs) throws SQLException {
		Order order = new Order();
		order.setId(rs.getInt("id"));
		order.setUserId(rs.getInt("user_id"));
		order.setName(rs.getString("name"));
		order.setNumber(rs.getString("number"));
		order.setEmail(rs.getString("email"));
		order.setMethod(rs.getString("method"));
		order.setAddress(rs.getString("address"));
		order.setTotalProducts(rs.getString("total_products"));
		order.setTotalPrice(rs.getDouble("total_price"));
		order.setPlacedOn(rs.getDate("placed_on"));
		order.setPaymentStatus(rs.getString("payment_status"));
		return order;
	}
}

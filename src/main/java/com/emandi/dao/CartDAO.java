package com.emandi.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.emandi.model.Cart;
import com.emandi.util.DBUtil;

public class CartDAO {

	// Add item to cart
	public boolean addToCart(Cart cart) throws SQLException {
		String sql = "INSERT INTO cart(user_id, name, price, image, type, mobile_no, description, address) "
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, cart.getUserId());
			pstmt.setString(2, cart.getName());
			pstmt.setDouble(3, cart.getPrice());
			pstmt.setString(4, cart.getImage());
			pstmt.setString(5, cart.getType());
			pstmt.setString(6, cart.getMobileNo());
			pstmt.setString(7, cart.getDescription());
			pstmt.setString(8, cart.getAddress());

			return pstmt.executeUpdate() > 0;
		}
	}

	// Check if item already in cart
	public boolean isItemInCart(int userId, String productName) throws SQLException {
		String sql = "SELECT * FROM cart WHERE user_id = ? AND name = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, userId);
			pstmt.setString(2, productName);

			try (ResultSet rs = pstmt.executeQuery()) {
				return rs.next();
			}
		}
	}

	// Get all cart items for a user
	public List<Cart> getCartItemsByUserId(int userId) throws SQLException {
		List<Cart> cartItems = new ArrayList<>();
		String sql = "SELECT * FROM cart WHERE user_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, userId);

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					cartItems.add(extractCartFromResultSet(rs));
				}
			}
		}
		return cartItems;
	}

	// Delete item from cart
	public boolean deleteCartItem(int cartId) throws SQLException {
		String sql = "DELETE FROM cart WHERE id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, cartId);
			return pstmt.executeUpdate() > 0;
		}
	}

	// Delete all cart items for a user
	public boolean deleteAllCartItems(int userId) throws SQLException {
		String sql = "DELETE FROM cart WHERE user_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, userId);
			return pstmt.executeUpdate() > 0;
		}
	}

	// Count cart items for a user
	public int countCartItems(int userId) throws SQLException {
		String sql = "SELECT COUNT(*) FROM cart WHERE user_id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, userId);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
		}
		return 0;
	}

	// Helper method to extract Cart from ResultSet
	private Cart extractCartFromResultSet(ResultSet rs) throws SQLException {
		Cart cart = new Cart();
		cart.setId(rs.getInt("id"));
		cart.setUserId(rs.getInt("user_id"));
		cart.setName(rs.getString("name"));
		cart.setPrice(rs.getDouble("price"));
		cart.setImage(rs.getString("image"));
		cart.setType(rs.getString("type"));
		cart.setMobileNo(rs.getString("mobile_no"));
		cart.setDescription(rs.getString("description"));
		cart.setAddress(rs.getString("address"));
		return cart;
	}
}
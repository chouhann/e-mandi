package com.emandi.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.emandi.model.User;
import com.emandi.util.DBUtil;

public class UserDAO {

	// Register new user
	public boolean registerUser(User user) throws SQLException {
		String sql = "INSERT INTO users(name, email, password, user_type) VALUES(?, ?, ?, ?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getUserType());

			return pstmt.executeUpdate() > 0;
		}
	}

	// Login user
	public User loginUser(String email, String password) throws SQLException {
		String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, email);
			pstmt.setString(2, password);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return extractUserFromResultSet(rs);
				}
			}
		}
		return null;
	}

	// Check if user exists
	public boolean userExists(String email) throws SQLException {
		String sql = "SELECT * FROM users WHERE email = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, email);

			try (ResultSet rs = pstmt.executeQuery()) {
				return rs.next();
			}
		}
	}

	// Get all users
	public List<User> getAllUsers() throws SQLException {
		List<User> users = new ArrayList<>();
		String sql = "SELECT * FROM users";

		try (Connection conn = DBUtil.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			while (rs.next()) {
				users.add(extractUserFromResultSet(rs));
			}
		}
		return users;
	}

	// Get user by ID
	public User getUserById(int id) throws SQLException {
		String sql = "SELECT * FROM users WHERE id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, id);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return extractUserFromResultSet(rs);
				}
			}
		}
		return null;
	}

	// Delete user
	public boolean deleteUser(int id) throws SQLException {
		String sql = "DELETE FROM users WHERE id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, id);
			return pstmt.executeUpdate() > 0;
		}
	}

	// Count users by type
	public int countUsersByType(String userType) throws SQLException {
		String sql = "SELECT COUNT(*) FROM users WHERE user_type = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, userType);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
		}
		return 0;
	}

	// Count total users
	public int countTotalUsers() throws SQLException {
		String sql = "SELECT COUNT(*) FROM users";

		try (Connection conn = DBUtil.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			if (rs.next()) {
				return rs.getInt(1);
			}
		}
		return 0;
	}

	// Helper method to extract User from ResultSet
	private User extractUserFromResultSet(ResultSet rs) throws SQLException {
		User user = new User();
		user.setId(rs.getInt("id"));
		user.setName(rs.getString("name"));
		user.setEmail(rs.getString("email"));
		user.setPassword(rs.getString("password"));
		user.setUserType(rs.getString("user_type"));
		return user;
	}
}
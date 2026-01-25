package com.emandi.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.emandi.model.Message;
import com.emandi.util.DBUtil;

public class MessageDAO {

	// Add new message
	public boolean addMessage(Message message) throws SQLException {
		String sql = "INSERT INTO message(user_id, name, email, number, message) " + "VALUES(?, ?, ?, ?, ?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, message.getUserId());
			pstmt.setString(2, message.getName());
			pstmt.setString(3, message.getEmail());
			pstmt.setString(4, message.getNumber());
			pstmt.setString(5, message.getMessage());

			return pstmt.executeUpdate() > 0;
		}
	}

	// Check if message already exists
	public boolean messageExists(String name, String email, String number, String msg) throws SQLException {
		String sql = "SELECT * FROM message WHERE name = ? AND email = ? AND number = ? AND message = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, number);
			pstmt.setString(4, msg);

			try (ResultSet rs = pstmt.executeQuery()) {
				return rs.next();
			}
		}
	}

	// Get all messages
	public List<Message> getAllMessages() throws SQLException {
		List<Message> messages = new ArrayList<>();
		String sql = "SELECT * FROM message";

		try (Connection conn = DBUtil.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			while (rs.next()) {
				messages.add(extractMessageFromResultSet(rs));
			}
		}
		return messages;
	}

	// Delete message
	public boolean deleteMessage(int id) throws SQLException {
		String sql = "DELETE FROM message WHERE id = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, id);
			return pstmt.executeUpdate() > 0;
		}
	}

	// Count total messages
	public int countTotalMessages() throws SQLException {
		String sql = "SELECT COUNT(*) FROM message";

		try (Connection conn = DBUtil.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			if (rs.next()) {
				return rs.getInt(1);
			}
		}
		return 0;
	}

	// Helper method to extract Message from ResultSet
	private Message extractMessageFromResultSet(ResultSet rs) throws SQLException {
		Message message = new Message();
		message.setId(rs.getInt("id"));
		message.setUserId(rs.getInt("user_id"));
		message.setName(rs.getString("name"));
		message.setEmail(rs.getString("email"));
		message.setNumber(rs.getString("number"));
		message.setMessage(rs.getString("message"));
		return message;
	}
}
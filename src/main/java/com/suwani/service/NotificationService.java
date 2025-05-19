package com.suwani.service;

import com.suwani.model.Notification;
import com.suwani.util.DBconnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NotificationService {

    // Method to insert a new notification into the database
    public boolean createNotification(Notification notification) {
        String sql = "INSERT INTO notifications (user_email, message) VALUES (?, ?)";

        try (Connection conn = DBconnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, notification.getUserEmail());
            pstmt.setString(2, notification.getMessage());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Consider logging this in production
            return false;
        }
    }

    // Method to retrieve all notifications by user email
    public List<Notification> getNotificationsByUserEmail(String userEmail) throws ClassNotFoundException {
        List<Notification> notifications = new ArrayList<>();
        String sql = "SELECT id, user_email, message, created_at FROM notifications WHERE user_email = ? ORDER BY created_at DESC";

        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, userEmail);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Notification n = new Notification();
                n.setId(rs.getInt("id"));
                n.setUserEmail(rs.getString("user_email"));
                n.setMessage(rs.getString("message"));
                n.setCreatedAt(rs.getDate("created_at").toLocalDate()); // Works correctly with LocalDate
                notifications.add(n);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logger
        }

        return notifications;
    }
    
    // Add this method to NotificationService.java
    public int getUnreadNotificationCount(String userEmail) throws ClassNotFoundException {
        String sql = "SELECT COUNT(*) FROM notifications WHERE user_email = ? AND is_read = false";

        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, userEmail);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
    
    public boolean deleteNotificationById(int id) throws ClassNotFoundException {
        String sql = "DELETE FROM notifications WHERE id = ?";

        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Method to retrieve all notifications (for admin)
    public List<Notification> getAllNotifications() throws ClassNotFoundException {
        List<Notification> notifications = new ArrayList<>();
        String sql = "SELECT id, user_email, message, created_at FROM notifications ORDER BY created_at DESC";

        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Notification n = new Notification();
                n.setId(rs.getInt("id"));
                n.setUserEmail(rs.getString("user_email"));
                n.setMessage(rs.getString("message"));
                n.setCreatedAt(rs.getDate("created_at").toLocalDate());
                notifications.add(n);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Use proper logging in production
        }

        return notifications;
    }


}

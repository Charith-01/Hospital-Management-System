package com.suwani.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.suwani.model.Clinic;
import com.suwani.util.DBconnect;


public class ClinicService {

    public boolean addClinic(Clinic clinic) {
        String sql = "INSERT INTO clinic (name, address, date, description, image) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            // Set parameters
            pstmt.setString(1, clinic.getName());
            pstmt.setString(2, clinic.getAddress());
            pstmt.setString(3, clinic.getDate());
            pstmt.setString(4, clinic.getDescription());
            pstmt.setString(5, clinic.getImage());
        
            // Execute update
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Additional method to get clinic by ID
    public Clinic getClinicById(int id) {
        String sql = "SELECT * FROM clinic WHERE id = ?";
        Clinic clinic = null;
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                clinic = new Clinic();
                clinic.setId(rs.getInt("id"));
                clinic.setName(rs.getString("name"));
                clinic.setAddress(rs.getString("address"));
                clinic.setDate(rs.getString("date"));
                clinic.setDescription(rs.getString("description"));
                clinic.setImage(rs.getString("image"));
                
            }
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return clinic;
    }
    // Existing addClinic method...
        
        public List<Clinic> getAllClinics() throws SQLException, ClassNotFoundException {
            List<Clinic> clinics = new ArrayList<>();
            String sql = "SELECT * FROM clinic ORDER BY id";
            
            try (Connection conn = DBconnect.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql);
                 ResultSet rs = pstmt.executeQuery()) {
                
                while (rs.next()) {
                    Clinic clinic = new Clinic();
                    clinic.setId(rs.getInt("id"));
                    clinic.setName(rs.getString("name"));
                    clinic.setAddress(rs.getString("address"));
                    clinic.setDate((rs.getString("date")));
                    clinic.setDescription(rs.getString("description"));
                    clinic.setImage(rs.getString("image"));
                    clinics.add(clinic);
                }
            }
            return clinics;
        }
        public static List<Clinic> getActiveClinics() throws SQLException, ClassNotFoundException {
            List<Clinic> clinics = new ArrayList<>();
           
            String sql = "SELECT * FROM clinic ORDER BY name"; 
            
            try (Connection conn = DBconnect.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql);
                 ResultSet rs = pstmt.executeQuery()) {
                
                while (rs.next()) {
                    Clinic clinic = new Clinic();
                    clinic.setId(rs.getInt("id"));
                    clinic.setName(rs.getString("name"));
                    clinic.setAddress(rs.getString("address"));
                    clinic.setDate(rs.getString("date")); // Changed to getString
                    clinic.setDescription(rs.getString("description"));
                    clinic.setImage(rs.getString("image"));
              
                    clinics.add(clinic);
                }
            }
            return clinics;
        }
        public Clinic getClinicById1(int id) throws SQLException, ClassNotFoundException {
            String sql = "SELECT * FROM clinic WHERE id = ?";
            try (Connection conn = DBconnect.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, id);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        Clinic clinic = new Clinic();
                        clinic.setId(rs.getInt("id"));
                        clinic.setName(rs.getString("name"));
                        clinic.setAddress(rs.getString("address"));
                        clinic.setDate(rs.getString("date"));
                        clinic.setDescription(rs.getString("description"));
                        clinic.setImage(rs.getString("image"));
                        return clinic;
                    }
                }
            }
            return null;
        }

        public boolean updateClinic(Clinic clinic) throws SQLException, ClassNotFoundException {
            String sql = "UPDATE clinic SET name=?, address=?, date=?, description=?, image=? WHERE id=?";
            try (Connection conn = DBconnect.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, clinic.getName());
                pstmt.setString(2, clinic.getAddress());
                pstmt.setString(3, clinic.getDate());
                pstmt.setString(4, clinic.getDescription());
                pstmt.setString(5, clinic.getImage());
                pstmt.setInt(6, clinic.getId());
               
                
                int affectedRows = pstmt.executeUpdate();
                return affectedRows > 0;
            }
        }
        public boolean deleteClinic(int id) throws SQLException, ClassNotFoundException {
            String sql = "DELETE FROM clinic WHERE id=?";
            
            try (Connection conn = DBconnect.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                
                pstmt.setInt(1, id);
                int affectedRows = pstmt.executeUpdate();
                return affectedRows > 0;
            }
        }
   
    
}
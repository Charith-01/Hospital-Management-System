package com.suwani.service;

import com.suwani.model.Appoinment;
import com.suwani.util.DBconnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppoinmentService {
    
    public boolean bookAppointment(Appoinment appointment) {
        String sql = "INSERT INTO appointments (patient_name, email, phone_number, appointment_date, doctor_name, additional_notes) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, appointment.getPatientName());
            stmt.setString(2, appointment.getEmail());
            stmt.setString(3, appointment.getPhoneNumber());
            stmt.setDate(4, new java.sql.Date(appointment.getAppointmentDate().getTime()));
            stmt.setString(5, appointment.getDoctorName());
            
            // Handle null additional notes
            if (appointment.getAdditionalNotes() != null) {
                stmt.setString(6, appointment.getAdditionalNotes());
            } else {
                stmt.setNull(6, Types.VARCHAR);
            }
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found");
            e.printStackTrace();
            return false;
        } catch (SQLException e) {
            System.err.println("Database connection error");
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Appoinment> getAllAppointments() {
        List<Appoinment> appointments = new ArrayList<>();
        String sql = "SELECT * FROM appointments ORDER BY appointment_date DESC";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Appoinment appointment = new Appoinment();
                appointment.setId(rs.getInt("id"));
                appointment.setPatientName(rs.getString("patient_name"));
                appointment.setEmail(rs.getString("email"));
                appointment.setPhoneNumber(rs.getString("phone_number"));
                appointment.setAppointmentDate(rs.getDate("appointment_date"));
                appointment.setDoctorName(rs.getString("doctor_name"));
                
                // Handle null additional notes
                String notes = rs.getString("additional_notes");
                appointment.setAdditionalNotes(rs.wasNull() ? null : notes);
                
                appointments.add(appointment);
            }
            
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Database query error");
            e.printStackTrace();
        }
        
        return appointments;
    }
}



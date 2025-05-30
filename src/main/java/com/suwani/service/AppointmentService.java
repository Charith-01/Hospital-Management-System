package com.suwani.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.suwani.model.Appointment;
import com.suwani.util.DBconnect;

public class AppointmentService {

    public void addAppointment(Appointment app) {
        try {
            String query = "INSERT INTO appointment(name,e_mail, phone, date, doctor, note) VALUES('" +
                    app.getPatientName() + "','" +
                    app.getEmail() + "','" +
                    app.getPhoneNumber() + "','" +
                    app.getAppointmentDate() + "','" +
                    app.getDoctorName() + "','" +
                    app.getAdditionalNotes() + "')";

            Statement stmt = DBconnect.getConnection().createStatement();
            stmt.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Appointment> getAppointmentsByEmail(Appointment app) {
        List<Appointment> appointments = new ArrayList<>();
        try {
            String query = "SELECT * FROM appointment WHERE e_mail='" + app.getEmail() + "'";
            Statement stmt = DBconnect.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setPatientName(rs.getString("name"));
                appointment.setEmail(rs.getString("e_mail"));
                appointment.setPhoneNumber(rs.getString("phone"));
                appointment.setAppointmentDate(rs.getString("date"));
                appointment.setDoctorName(rs.getString("doctor"));
                appointment.setAdditionalNotes(rs.getString("note"));
                
                appointments.add(appointment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return appointments;
    }

    public ArrayList<Appointment> getAllAppointments() {
        try {
            ArrayList<Appointment> listApp = new ArrayList<Appointment>();
            String query = "SELECT * FROM appointment";
            Statement stmt = DBconnect.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setId(rs.getInt("id"));
                appointment.setPatientName(rs.getString("name"));
                appointment.setEmail(rs.getString("e_mail"));
                appointment.setPhoneNumber(rs.getString("phone"));
                appointment.setAppointmentDate(rs.getString("date"));
                appointment.setDoctorName(rs.getString("doctor"));
                appointment.setAdditionalNotes(rs.getString("note"));
                listApp.add(appointment);
            }
            return listApp;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Appointment getAppointmentByEmail(String email) {
        try {
            String query = "SELECT * FROM appointment WHERE e_mail='" + email + "' LIMIT 1";
            Statement stmt = DBconnect.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(query);

            if (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setId(rs.getInt("id"));
                appointment.setPatientName(rs.getString("name"));
                appointment.setEmail(rs.getString("e_mail"));
                appointment.setPhoneNumber(rs.getString("phone"));
                appointment.setAppointmentDate(rs.getString("date"));
                appointment.setDoctorName(rs.getString("doctor"));
                appointment.setAdditionalNotes(rs.getString("note"));
                return appointment;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateAppointment(Appointment app) {
        String query = "UPDATE appointment SET name = ?, phone = ?, date = ?, doctor = ?, note = ? WHERE id = ?";
        try (PreparedStatement pstmt = DBconnect.getConnection().prepareStatement(query)) {
            pstmt.setString(1, app.getPatientName());
            pstmt.setString(2, app.getPhoneNumber());
            pstmt.setDate(3, java.sql.Date.valueOf(app.getAppointmentDate()));  // assuming appointmentDate is a String "yyyy-MM-dd"
            pstmt.setString(4, app.getDoctorName());
            pstmt.setString(5, app.getAdditionalNotes());
            pstmt.setInt(6, app.getId());  // assuming getId() returns appointment's unique ID

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    public boolean deleteAppointmentById(int id) {
        try {
            String query = "DELETE FROM appointment WHERE id = " + id;
            Statement stmt = DBconnect.getConnection().createStatement();
            int rowsAffected = stmt.executeUpdate(query);
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void checkDatabaseConnection() {
        try (Connection conn = DBconnect.getConnection()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println(" Database connection successful.");
            } else {
                System.out.println(" Failed to connect to the database.");
            }
        } catch (Exception e) {
            System.out.println(" Exception while connecting to the database: " + e.getMessage());
        }
    }

    // ✅ New Method for Clean Access Using Just Email
    public List<Appointment> getAppointmentsByEmail(String email) {
        List<Appointment> appointments = new ArrayList<>();
        try {
            String query = "SELECT * FROM appointment WHERE e_mail = '" + email + "'";
            Statement stmt = DBconnect.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setId(rs.getInt("id"));
                appointment.setPatientName(rs.getString("name"));
                appointment.setEmail(rs.getString("e_mail"));
                appointment.setPhoneNumber(rs.getString("phone"));
                appointment.setAppointmentDate(rs.getString("date"));
                appointment.setDoctorName(rs.getString("doctor"));
                appointment.setAdditionalNotes(rs.getString("note"));
                appointments.add(appointment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return appointments;
    }

}

package com.suwani.service;

import java.sql.*;
import java.util.ArrayList;
import com.suwani.model.Clinic;
import com.suwani.util.DBconnect;

public class ClinicService {

    // Add Clinic
    public void regClinic(Clinic clinic) {
        String query = "INSERT INTO clinics (clinic_name, doctor_name, location, contact_number, opening_hours, clinic_image) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, clinic.getClinicName());
            stmt.setString(2, clinic.getDoctorName());
            stmt.setString(3, clinic.getLocation());
            stmt.setString(4, clinic.getContactNumber());
            stmt.setString(5, clinic.getOperningHours());
            stmt.setBytes(6, clinic.getClinicImage());

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get All Clinics
    public ArrayList<Clinic> getAllClinics() {
        ArrayList<Clinic> listClinic = new ArrayList<>();
        String query = "SELECT * FROM clinics";

        try (Connection conn = DBconnect.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Clinic clinic = new Clinic();
                clinic.setClinicid(rs.getInt("clinic_id"));
                clinic.setClinicName(rs.getString("clinic_name"));
                clinic.setDoctorName(rs.getString("doctor_name"));
                clinic.setLocation(rs.getString("location"));
                clinic.setContactNumber(rs.getString("contact_number"));
                clinic.setOperningHours(rs.getString("opening_hours"));
                clinic.setClinicImage(rs.getBytes("clinic_image"));

                listClinic.add(clinic);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listClinic;
    }
}

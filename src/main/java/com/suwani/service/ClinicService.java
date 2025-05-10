package com.suwani.service;

import java.sql.PreparedStatement;

import com.suwani.model.Clinic;
import com.suwani.util.DBconnect;

public class ClinicService {

	//Add Clinic
	public void regClinic(Clinic clinic) {
		
		try {
			
	        String query = "INSERT INTO clinics (clinic_name, doctor_name, location, contact_number, opening_hours, clinic_image) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";
	        
	        PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query);
	        
	        stmt.setString(1, clinic.getClinicName());
	        stmt.setString(2, clinic.getDoctorName());
	        stmt.setString(3, clinic.getLocation());
	        stmt.setString(4, clinic.getContactNumber());
	        stmt.setString(5, clinic.getOperningHours());
	        stmt.setString(6, clinic.getClinicImage());
	        
	        stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
}

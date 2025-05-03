package com.suwani.service;

import java.sql.PreparedStatement;

import com.suwani.model.Doctor;
import com.suwani.util.DBconnect;

public class DoctorService {

	public void regDoctor(Doctor doc) {
		
		try {
			
	        String query = "INSERT INTO users (full_name, gender, email, phone, address, specialization, experience_years, license_number, department) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        
	        PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query);
	        
	        stmt.setString(1, doc.getFullname());
	        stmt.setString(2, doc.getGender());
	        stmt.setString(3, doc.getEmail());
	        stmt.setString(4, doc.getPhone());
	        stmt.setString(5, doc.getAddress());
	        stmt.setString(6, doc.getSpecialization());
	        stmt.setString(7, doc.getYearsofExperience());
	        stmt.setString(8, doc.getMedicalLicenseNumber());
	        stmt.setString(9, doc.getDepartment());
	        
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

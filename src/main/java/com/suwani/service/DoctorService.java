package com.suwani.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.suwani.model.Doctor;
import com.suwani.model.User;
import com.suwani.util.DBconnect;

public class DoctorService {

	
	//Add Doctors
	public void regDoctor(Doctor doc) {
		
		try {
			
	        String query = "INSERT INTO doctors (full_name, gender, email, phone, address, specialization, experience_years, license_number, department) "
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
	        
	        stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
    //Email validation
	public boolean isEmailExists(String email) {
	    try {
	        String query = "SELECT * FROM doctors WHERE email = ?";
	        PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query);
	        stmt.setString(1, email);
	        ResultSet rs = stmt.executeQuery();
	        return rs.next(); // true if email exists
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	
	
	//Get All Doctors
	public ArrayList<Doctor> getAllDoctors(){
		
		try {
			
			ArrayList<Doctor> listDoc = new ArrayList<Doctor>();
			
			String query = "SELECT * FROM doctors";
			
			Statement stmt = DBconnect.getConnection().createStatement();
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				
				Doctor doc = new Doctor();
				
				doc.setDoctorid(rs.getInt("doctor_id"));
				doc.setFullname(rs.getString("full_name"));
				doc.setEmail(rs.getString("email"));
				doc.setPhone(rs.getString("phone"));
				doc.setAddress(rs.getString("address"));
				doc.setGender(rs.getString("gender"));
				doc.setSpecialization(rs.getString("specialization"));
				doc.setDepartment(rs.getString("department"));
				
				listDoc.add(doc);
			}
			
			return listDoc;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
			return null;
		}
	}
	
	
	//Update Doctor
	public boolean updateDoctor(Doctor doc) {
		
		try {
			
            String query = "UPDATE doctors SET full_name=?, gender=?, email=?, phone=?, address=?, specialization=?,department=? WHERE doctor_id=?";
            PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query);
            
            stmt.setString(1, doc.getFullname());
            stmt.setString(2, doc.getGender());
            stmt.setString(3, doc.getEmail());
            stmt.setString(4, doc.getPhone());
            stmt.setString(5, doc.getAddress());
            stmt.setString(6, doc.getSpecialization());
            stmt.setString(7, doc.getDepartment());
            stmt.setInt(8, doc.getDoctorid());
            
            return stmt.executeUpdate() > 0;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
			return false;
		}
	}
	
	public boolean adminDeleteDoctor(Doctor doc) {
		
	    String query = "DELETE FROM doctors WHERE doctor_id = ?";
	    
	    try (PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query)) {
	        stmt.setInt(1, doc.getDoctorid());
	        return stmt.executeUpdate() > 0; // returns true if at least one row was deleted
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

}

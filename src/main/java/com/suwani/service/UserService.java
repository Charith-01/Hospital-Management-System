package com.suwani.service;

import java.sql.Statement;
import java.sql.Date; // Import java.sql.Date for date handling
import java.sql.ResultSet;

import com.suwani.model.User;
import com.suwani.util.DBconnect;

public class UserService {

    public void RegUser(User u) {

        try {
            // Convert LocalDate to java.sql.Date
            Date dob = null;
            if (u.getDob() != null) {
                dob = Date.valueOf(u.getDob()); // Convert LocalDate to java.sql.Date
            }

            String query = "INSERT INTO users (fullname, email, phone, address, gender, dob, bloodgroup, medicalcon, password) "
                         + "VALUES ('" + u.getFullname() + "', '" + u.getEmail() + "', '" + u.getPhone() + "', '" 
                         + u.getAddress() + "', '" + u.getGender() + "', '" + dob + "', '" + u.getBloodgroup() + "', '" 
                         + u.getMedicalcon() + "', '" + u.getPassword() + "')";

            Statement stmt = DBconnect.getConnection().createStatement();
            stmt.executeUpdate(query);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean Validate(User u1) {
    	
    	try {
    		
    		String query = "SELECT * FROM users WHERE email = '"+u1.getEmail()+"' AND password = '"+u1.getPassword()+"'";
    		
    		Statement stmt = DBconnect.getConnection().createStatement();
    		
    		ResultSet rs = stmt.executeQuery(query);
    		
    		if(rs.next()) {
    			
    			u1.setRole(rs.getString("role")); // Set role
    			return true;
    		}
    		
    	}catch(Exception e) {
    		
    		e.printStackTrace();
    	}
    	
    	return false;
    }
    
    
    public User getOne(User u2) {
    	
    	try {
    		
    		String query = "SELECT * FROM users WHERE email = '"+u2.getEmail()+"' AND password = '"+u2.getPassword()+"'";
    		
    		Statement stmt = DBconnect.getConnection().createStatement();
    		
    		ResultSet rs = stmt.executeQuery(query);
    		
    		if(rs.next()) {
    			
    			u2.setFullname(rs.getString("fullname"));
    			u2.setEmail(rs.getString("email"));
    			u2.setPhone(rs.getString("phone"));
    			u2.setAddress(rs.getString("address"));
    			u2.setGender(rs.getString("gender"));
    			u2.setDob(rs.getDate("dob").toLocalDate());
    			u2.setBloodgroup(rs.getString("bloodgroup"));
    			u2.setMedicalcon(rs.getString("medicalcon"));
    			
    			return u2;
    		}
    		
    	}catch(Exception e) {
    		
    		e.printStackTrace();
    	}
    	
    	return null;
    }
}


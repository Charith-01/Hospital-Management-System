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
    			
    			return true;
    		}
    		
    	}catch(Exception e) {
    		
    		e.printStackTrace();
    	}
    	
    	return false;
    }
}


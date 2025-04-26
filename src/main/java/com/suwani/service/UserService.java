package com.suwani.service;

import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.Date; // Import java.sql.Date for date handling
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.suwani.model.User;
import com.suwani.util.DBconnect;

public class UserService {

	
	//User registration 
	public void RegUser(User u) {
	    try {
	        Date dob = null;
	        if (u.getDob() != null) {
	            dob = Date.valueOf(u.getDob()); // Convert LocalDate to java.sql.Date
	        }

	        String query = "INSERT INTO users (fullname, email, phone, address, gender, dob, bloodgroup, medicalcon, password) "
	                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        
	        PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query);
	        stmt.setString(1, u.getFullname());
	        stmt.setString(2, u.getEmail());
	        stmt.setString(3, u.getPhone());
	        stmt.setString(4, u.getAddress());
	        stmt.setString(5, u.getGender());
	        stmt.setDate(6, dob);
	        stmt.setString(7, u.getBloodgroup());
	        stmt.setString(8, u.getMedicalcon());
	        stmt.setString(9, u.getPassword());

	        stmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

    
    //Email validation
	public boolean isEmailExists(String email) {
	    try {
	        String query = "SELECT * FROM users WHERE email = ?";
	        PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query);
	        stmt.setString(1, email);
	        ResultSet rs = stmt.executeQuery();
	        return rs.next(); // true if email exists
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
    
    //User Login
	public boolean Validate(User u1) {
	    try {
	        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
	        PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query);
	        stmt.setString(1, u1.getEmail());
	        stmt.setString(2, u1.getPassword());
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            u1.setRole(rs.getString("role")); // Set role
	            return true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
    
    //Get One user Details in DB
	public User getOne(User u2) {
	    try {
	        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
	        PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query);
	        stmt.setString(1, u2.getEmail());
	        stmt.setString(2, u2.getPassword());
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            u2.setUserid(rs.getInt("id"));
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
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}

    //Get all users details in DB to admin dashboard
    public ArrayList<User> getAllUser(){
        ArrayList<User> listuser = new ArrayList<>();
        try {
            String query = "SELECT * FROM users";
            Statement stmt = DBconnect.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while(rs.next()) {
                User u2 = new User();

                u2.setUserid(rs.getInt("id"));
                u2.setFullname(rs.getString("fullname"));
                u2.setEmail(rs.getString("email"));
                u2.setPhone(rs.getString("phone"));
                u2.setGender(rs.getString("gender"));
                u2.setDob(rs.getDate("dob").toLocalDate());
                u2.setRole(rs.getString("role"));

                listuser.add(u2);
            }

            return listuser;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    //Update user profile
    public boolean updateUser(User u) {
        try {
            String query = "UPDATE users SET fullname=?, email=?, phone=?, address=?, gender=?, dob=?, bloodgroup=?, medicalcon=? WHERE id=?";
            PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query);

            stmt.setString(1, u.getFullname());
            stmt.setString(2, u.getEmail());
            stmt.setString(3, u.getPhone());
            stmt.setString(4, u.getAddress());
            stmt.setString(5, u.getGender());
            stmt.setDate(6, java.sql.Date.valueOf(u.getDob()));
            stmt.setString(7, u.getBloodgroup());
            stmt.setString(8, u.getMedicalcon());
            stmt.setInt(9, u.getUserid());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public User getUserById(int id) {
        try {
            String query = "SELECT * FROM users WHERE id = ?";
            PreparedStatement stmt = DBconnect.getConnection().prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setUserid(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setGender(rs.getString("gender"));
                user.setDob(rs.getDate("dob").toLocalDate());
                user.setBloodgroup(rs.getString("bloodgroup"));
                user.setMedicalcon(rs.getString("medicalcon"));
                user.setRole(rs.getString("role"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}


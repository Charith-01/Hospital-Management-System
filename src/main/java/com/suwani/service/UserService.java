package com.suwani.service;

import java.sql.Statement;

import com.suwani.model.User;
import com.suwani.util.DBconnect;

public class UserService {

	public void RegUser(User u) {
		
		try {
			
			String query = "INSERT INTO user VALUES ('"+u.getFullname()+"','"+u.getEmail()+"','"+u.getPhone()+"','"+u.getAddress()+"','"+u.getGender()+"','"+u.getBloodgroup()+"','"+u.getMedicalcon()+"','"+u.getPassword()+"')";
			
			Statement stmt = DBconnect.getConnection().createStatement();
			
			stmt.executeUpdate(query);
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
	}
}

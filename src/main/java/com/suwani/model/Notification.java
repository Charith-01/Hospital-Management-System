package com.suwani.model;

import java.time.LocalDate;

public class Notification {
	
    private int id;
    private String userEmail;
    private String message;
    private LocalDate createdAt;
    
	public int getId() {
		return id;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public String getMessage() {
		return message;
	}
	public LocalDate getCreatedAt() {
		return createdAt;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setCreatedAt(LocalDate createdAt) {
		this.createdAt = createdAt;
	}

}

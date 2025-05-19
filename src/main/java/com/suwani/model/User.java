package com.suwani.model;

//Imports the LocalDate class, which is used to represent a date (without time).
import java.time.LocalDate;

public class User {

	int userid;
	String fullname;
	String email;
	String phone;
	String address;
	String gender;
	LocalDate dob;
	String bloodgroup;
	String medicalcon;
	String password;
	String conpassword;
	String role;
	
	public LocalDate getDob() {
		return dob;
	}
	public void setDob(LocalDate dob) {
		this.dob = dob;
	}
	
	public int getUserid() {
		return userid;
	}
	public String getFullname() {
		return fullname;
	}
	public String getEmail() {
		return email;
	}
	public String getPhone() {
		return phone;
	}
	public String getAddress() {
		return address;
	}
	public String getGender() {
		return gender;
	}
	public String getBloodgroup() {
		return bloodgroup;
	}
	public String getMedicalcon() {
		return medicalcon;
	}
	public String getPassword() {
		return password;
	}
	public String getConpassword() {
		return conpassword;
	}
	public String getRole() {
		return role;
	}
	
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}
	public void setMedicalcon(String medicalcon) {
		this.medicalcon = medicalcon;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setConpassword(String conpassword) {
		this.conpassword = conpassword;
	}
	public void setRole(String role) {
		this.role=role;
	}
}

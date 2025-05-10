package com.suwani.model;

import java.security.Timestamp;

public class Clinic {
	
	int clinicid;
	String clinicName;
	String doctorName;
	String location;
	String contactNumber;
	String operningHours;
	String clinicImage;
	Timestamp createdAt;
	
	
	public int getClinicid() {
		return clinicid;
	}
	public String getClinicName() {
		return clinicName;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public String getLocation() {
		return location;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public String getOperningHours() {
		return operningHours;
	}
	public String getClinicImage() {
		return clinicImage;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	
	
	public void setClinicid(int clinicid) {
		this.clinicid = clinicid;
	}
	public void setClinicName(String clinicName) {
		this.clinicName = clinicName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public void setOperningHours(String operningHours) {
		this.operningHours = operningHours;
	}
	public void setClinicImage(String clinicImage) {
		this.clinicImage = clinicImage;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	
}

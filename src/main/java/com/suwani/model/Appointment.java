package com.suwani.model;


	public class Appointment {
	    private int id;
	    private String name;
	    private String email;
	    private String phone;
	    private String date;
	    private String doctor;
	    private String note;
	    
	    // Constructors
	    public Appointment() {}
	    
	    public Appointment(String patientName, String email, String phoneNumber, String appointmentDate, 
	                      String doctorName, String additionalNotes) {
	        this.name = patientName;
	        this.email = email;
	        this.phone = phoneNumber;
	        this.date = appointmentDate;
	        this.doctor = doctorName;
	        this.note = additionalNotes;
	    }
	    
	    // Getters and Setters
	    public int getId() {
	        return id;
	    }
	    public void setId(int id) {
	        this.id = id;
	    }
	    public String getPatientName() {
	        return name;
	    }
	    public void setPatientName(String patientName) {
	        this.name = patientName;
	    }
	    public String getEmail() {
	        return email;
	    }
	    public void setEmail(String email) {
	        this.email = email;
	    }
	    public String getPhoneNumber() {
	        return phone;
	    }
	    public void setPhoneNumber(String phoneNumber) {
	        this.phone = phoneNumber;
	    }
	    public String getAppointmentDate() {
	        return date;
	    }
	    public void setAppointmentDate(String date) {
	        this.date = date;
	    }
	    public String getDoctorName() {
	        return doctor;
	    }
	    public void setDoctorName(String doctorName) {
	        this.doctor = doctorName;
	    }
	    public String getAdditionalNotes() {
	        return note;
	    }
	    public void setAdditionalNotes(String additionalNotes) {
	        this.note = additionalNotes;
	    }

		
	}





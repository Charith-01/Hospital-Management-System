package com.suwani.model;

import java.sql.Date;

public class Appoinment {
    private int id;
    private String patientName;
    private String email;
    private String phoneNumber;
    private Date appointmentDate;
    private String doctorName;
    private String additionalNotes;
    
    // Constructors
    public Appoinment() {}
    
    public Appoinment(String patientName, String email, String phoneNumber, Date appointmentDate, 
                      String doctorName, String additionalNotes) {
        this.patientName = patientName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.appointmentDate = appointmentDate;
        this.doctorName = doctorName;
        this.additionalNotes = additionalNotes;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getPatientName() {
        return patientName;
    }
    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public Date getAppointmentDate() {
        return appointmentDate;
    }
    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }
    public String getDoctorName() {
        return doctorName;
    }
    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }
    public String getAdditionalNotes() {
        return additionalNotes;
    }
    public void setAdditionalNotes(String additionalNotes) {
        this.additionalNotes = additionalNotes;
    }
}
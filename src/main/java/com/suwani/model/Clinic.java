// Clinic.java
package com.suwani.model;

public class Clinic {
    private int id;
    private String name;
    private String address;
    private String date;
    private String description;
    private String image;

    // Constructors
    public Clinic() {
    }

    public Clinic(String name, String address, String date, String description, String image) {
        this.name = name;
        this.address = address;
        this.date = date;
        this.description = description;
        this.image = image;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
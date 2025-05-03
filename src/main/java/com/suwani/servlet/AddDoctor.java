package com.suwani.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.Doctor;


@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Doctor doc = new Doctor();
		
		doc.setFullname(request.getParameter("full_name"));
		doc.setGender(request.getParameter("gender"));
		doc.setEmail(request.getParameter("email"));
		doc.setPhone(request.getParameter("phone"));
		doc.setAddress(request.getParameter("address"));
		doc.setSpecialization(request.getParameter("specialization"));
		doc.setYearsofExperience(request.getParameter("experience_years"));
		doc.setMedicalLicenseNumber(request.getParameter("license_number"));
		doc.setDepartment(request.getParameter("department"));
		
		doGet(request, response);
	}

}

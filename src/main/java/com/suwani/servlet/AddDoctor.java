package com.suwani.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.Doctor;
import com.suwani.service.DoctorService;


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
		
		DoctorService service = new DoctorService();
		
		// Check if email already exists
		if(service.isEmailExists(doc.getEmail())) {
            request.setAttribute("errorMessage", "Email already exists. Please use a different one.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("doctorRegistration.jsp");
            dispatcher.forward(request, response);
            return;
		}
		
		service.regDoctor(doc);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("doctorTable.jsp");
		
		dispatcher.forward(request, response);
	}

}

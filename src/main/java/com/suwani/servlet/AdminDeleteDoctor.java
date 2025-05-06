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


@WebServlet("/AdminDeleteDoctor")
public class AdminDeleteDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Doctor doctor = new Doctor();
		
		doctor.setDoctorid(Integer.parseInt(request.getParameter("doctor_id")));
		
		DoctorService service = new DoctorService();
		
		service.adminDeleteDoctor(doctor);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminDoctors");
		
		dispatcher.forward(request, response);
	}

}

package com.suwani.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.Doctor;
import com.suwani.service.DoctorService;

@WebServlet("/adminDoctors")
public class adminDoctors extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DoctorService service  = new DoctorService();
		
		ArrayList<Doctor> doctor = service.getAllDoctors();
		
		request.setAttribute("doctor", doctor);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("doctorTable.jsp");
		
		dispatcher.forward(request, response);
	}

}

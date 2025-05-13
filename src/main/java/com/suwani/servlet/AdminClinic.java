package com.suwani.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.Clinic;
import com.suwani.service.ClinicService;

@WebServlet("/AdminClinic")
public class AdminClinic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ClinicService service = new ClinicService();
		
		ArrayList<Clinic> clinic = service.getAllClinics();
		
		request.setAttribute("clinic", clinic);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("clinicTable.jsp");
		
		dispatcher.forward(request, response);
	}

}
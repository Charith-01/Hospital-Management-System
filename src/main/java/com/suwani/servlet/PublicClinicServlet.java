package com.suwani.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.Clinic;
import com.suwani.service.ClinicService;

@WebServlet("/PublicClinicServlet")
public class PublicClinicServlet extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            List<Clinic> clinics = ClinicService.getActiveClinics();
            request.setAttribute("clinics", clinics);
            // Change to match your webapp directory structure
            request.getRequestDispatcher("publicClinicView.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading clinics");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
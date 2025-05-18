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

@WebServlet("/RetrieveClinicServlet")
public class RetrieveClinicServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;
	private ClinicService clinicService = new ClinicService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            List<Clinic> clinics = clinicService.getAllClinics();
            request.setAttribute("clinics", clinics);
            request.getRequestDispatcher("/clinicList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving clinics");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
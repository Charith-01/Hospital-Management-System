package com.suwani.servlet;

import java.io.IOException;
import java.time.format.DateTimeParseException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import com.suwani.model.Appointment;
import com.suwani.service.AppointmentService;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

 // In AppointmentServlet.java


    	protected void doPost(HttpServletRequest request, HttpServletResponse response)
    	        throws ServletException, IOException {

    	    try {
    	        // Create and populate Appointment object
    	        Appointment app = new Appointment();
    	        app.setPatientName(request.getParameter("name"));
    	        app.setEmail(request.getParameter("email"));
    	        app.setPhoneNumber(request.getParameter("phone"));
    	        app.setAppointmentDate(request.getParameter("date"));
    	        
    	        app.setDoctorName(request.getParameter("doctor"));
    	        app.setAdditionalNotes(request.getParameter("note"));

    	        // Save appointment
    	        AppointmentService service = new AppointmentService();
    	        service.addAppointment(app);
    	        
    	        // Fetch appointments for the user
    	        List<Appointment> appointments = service.getAppointmentsByEmail(app);
    	        request.setAttribute("appointments", appointments); 

    	        // Forward to view page
    	        RequestDispatcher dispatcher = request.getRequestDispatcher("viewAppointments.jsp");
    	        dispatcher.forward(request, response);

    	    } catch (IllegalArgumentException e) {
    	        // Handle validation errors (e.g., invalid date or empty fields)
    	        request.setAttribute("errorMessage", e.getMessage());
    	        request.getRequestDispatcher("Appointment.jsp").forward(request, response);
    	    } catch (Exception e) {
    	        // Handle other unexpected errors
    	        e.printStackTrace();
    	        request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
    	        request.getRequestDispatcher("Appointment.jsp").forward(request, response);
    	    }
    	}}
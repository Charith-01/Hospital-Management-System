package com.suwani.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.suwani.model.Appointment;
import com.suwani.model.User;
import com.suwani.service.AppointmentService;

@WebServlet("/UserAppointments")
public class UserAppointments extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user object from session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            // No logged-in user, redirect to login page
            response.sendRedirect("login.jsp");
            return;
        }
        
        User loggedUser = (User) session.getAttribute("user");
        String userEmail = loggedUser.getEmail();
        
        // Use AppointmentService to get user's appointments
        AppointmentService appService = new AppointmentService();
        List<Appointment> appointments = appService.getAppointmentsByEmail(userEmail);
        
        // Set appointments in request scope
        request.setAttribute("appointments", appointments);
        
        // Forward to JSP page to display appointments
        RequestDispatcher dispatcher = request.getRequestDispatcher("Appoinment.jsp");
        dispatcher.forward(request, response);

    }

    // If you want to allow POST requests as well, just call doGet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

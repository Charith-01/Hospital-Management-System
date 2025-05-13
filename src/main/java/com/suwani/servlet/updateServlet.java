package com.suwani.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.Appointment;
import com.suwani.service.AppointmentService;

@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AppointmentService service = new AppointmentService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            List<Appointment> appointments = service.getAllAppointments();
            request.setAttribute("appointments", appointments);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewAppointments.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving appointments: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewAppointments.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
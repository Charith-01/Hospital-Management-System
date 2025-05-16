package com.suwani.servlet;

import com.suwani.service.AppointmentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteAppointmentServlet")
public class DeleteAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get appointment ID from the request
        String appointmentIdStr = request.getParameter("appointmentId");

        if (appointmentIdStr != null && !appointmentIdStr.isEmpty()) {
            try {
                int appointmentId = Integer.parseInt(appointmentIdStr);
                
                // Call the service to delete the appointment
                AppointmentService service = new AppointmentService();
                boolean deleted = service.deleteAppointmentById(appointmentId);

                // Set success or failure message if needed
                HttpSession session = request.getSession();
                if (deleted) {
                    session.setAttribute("message", "Appointment cancelled successfully.");
                } else {
                    session.setAttribute("error", "Failed to cancel the appointment.");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Redirect back to the appointments page
        response.sendRedirect("UserAppointments");
    }
}

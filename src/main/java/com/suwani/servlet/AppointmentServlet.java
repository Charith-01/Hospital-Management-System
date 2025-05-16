package com.suwani.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.suwani.model.Appointment;
import com.suwani.model.User;
import com.suwani.service.AppointmentService;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User loggedUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (loggedUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Create and populate Appointment object
            Appointment app = new Appointment();
            app.setPatientName(request.getParameter("name"));
            app.setEmail(loggedUser.getEmail()); // Use session email for security
            app.setPhoneNumber(request.getParameter("phone"));
            app.setAppointmentDate(request.getParameter("date"));
            app.setDoctorName(request.getParameter("doctor"));
            app.setAdditionalNotes(request.getParameter("note"));

            // Save appointment
            AppointmentService service = new AppointmentService();
            service.addAppointment(app);

            // Set success message and redirect to UserAppointments
            session.setAttribute("successMessage", "Appointment booked successfully.");
            response.sendRedirect("UserAppointments");

        } catch (IllegalArgumentException e) {
            // Handle validation errors
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("addAppointment.jsp").forward(request, response);

        } catch (Exception e) {
            // Handle unexpected errors
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("addAppointment.jsp").forward(request, response);
        }
    }
}

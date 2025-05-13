package com.suwani.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.Appointment;
import com.suwani.service.AppointmentService;

@WebServlet("/UpdateAppointmentServlet")
public class UpdateAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AppointmentService service = new AppointmentService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            Appointment appointment = service.getAppointmentByEmail(email);
            
            if (appointment != null) {
                request.setAttribute("appointment", appointment);
                RequestDispatcher dispatcher = request.getRequestDispatcher("updateAppointment.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Appointment not found");
                response.sendRedirect("AppointmentServlet");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving appointment: " + e.getMessage());
            response.sendRedirect("AppointmentServlet");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Appointment app = new Appointment();
            app.setPatientName(request.getParameter("name"));
            app.setEmail(request.getParameter("email"));
            app.setPhoneNumber(request.getParameter("phone"));
            app.setAppointmentDate(request.getParameter("date"));
            app.setDoctorName(request.getParameter("doctor"));
            app.setAdditionalNotes(request.getParameter("note"));

            boolean updated = service.updateAppointment(app);
            
            if (updated) {
                response.sendRedirect("updateServlet");
            } else {
                request.setAttribute("errorMessage", "Failed to update appointment");
                request.getRequestDispatcher("updateAppointment.jsp").forward(request, response);
            }

        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("updateAppointment.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("updateAppointment.jsp").forward(request, response);
        }
    }
}
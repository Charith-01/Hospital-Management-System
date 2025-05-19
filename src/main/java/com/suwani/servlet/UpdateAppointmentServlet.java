package com.suwani.servlet;

import com.suwani.model.Appointment;
import com.suwani.service.AppointmentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateAppointmentServlet")
public class UpdateAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String date = request.getParameter("date");
            String doctor = request.getParameter("doctor");
            String note = request.getParameter("note");

            Appointment appointment = new Appointment();
            appointment.setId(id);
            appointment.setPatientName(name);
            appointment.setEmail(email); // Optional: may not be updatable
            appointment.setPhoneNumber(phone);
            appointment.setAppointmentDate(date);
            appointment.setDoctorName(doctor);
            appointment.setAdditionalNotes(note);

            AppointmentService service = new AppointmentService();
            boolean result = service.updateAppointment(appointment);

            if (result) {
                request.setAttribute("message", "Appointment updated successfully.");
            } else {
                request.setAttribute("message", "Failed to update appointment.");
            }

            request.getRequestDispatcher("UserAppointments").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error occurred while updating.");
            request.getRequestDispatcher("updateAppointment.jsp").forward(request, response);
        }
    }
}
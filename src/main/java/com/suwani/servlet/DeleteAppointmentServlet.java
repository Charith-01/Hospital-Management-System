package com.suwani.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.suwani.service.AppointmentService;

@WebServlet("/DeleteAppointmentServlet")
public class DeleteAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AppointmentService service = new AppointmentService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String doctorName = request.getParameter("doctorName");
        String patientName = request.getParameter("patientName");
        String redirectToAppointment = request.getParameter("redirectToAppointment");
        
        boolean deleted = service.deleteAppointment(email, doctorName, patientName);
        
        HttpSession session = request.getSession();
        if (deleted) {
            session.setAttribute("successMessage", "Appointment deleted successfully!");
            
            // Check if we should redirect to Appointment.jsp
            if (redirectToAppointment != null && redirectToAppointment.equals("true")) {
                response.sendRedirect("Appointment.jsp");
                return;
            }
        } else {
            session.setAttribute("errorMessage", "Failed to delete appointment. Please try again.");
        }
        
        // Default redirect to viewAppointments.jsp
        response.sendRedirect("viewAppointments.jsp");
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }
}
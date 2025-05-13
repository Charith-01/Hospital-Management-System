package com.suwani.servlet;

import com.suwani.model.Appoinment;
import com.suwani.service.AppoinmentService;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/book-appointment")
public class AppoinmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AppoinmentService appointmentService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.appointmentService = new AppoinmentService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("AppointmentServlet: Form submission received");
        
        try {
            // Get form data
            String patientName = sanitizeInput(request.getParameter("patientName"));
            String email = sanitizeInput(request.getParameter("email"));
            String phoneNumber = sanitizeInput(request.getParameter("phoneNumber"));
            Date appointmentDate = parseDate(request.getParameter("appointmentDate"));
            String doctorName = sanitizeInput(request.getParameter("doctorName"));
            String additionalNotes = sanitizeInput(request.getParameter("additionalNotes"));
            
            System.out.println("Received data - Patient: " + patientName + ", Email: " + email);

            // Validate required fields
            if (patientName == null || patientName.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                phoneNumber == null || phoneNumber.trim().isEmpty() ||
                appointmentDate == null ||
                doctorName == null || doctorName.trim().isEmpty()) {
                
                System.out.println("Validation failed - missing required fields");
                request.setAttribute("errorMessage", "Please fill all required fields.");
                request.getRequestDispatcher("appointment.jsp").forward(request, response);
                return;
            }
            
            // Validate email format
            if (!isValidEmail(email)) {
                request.setAttribute("errorMessage", "Please enter a valid email address.");
                request.getRequestDispatcher("appointment.jsp").forward(request, response);
                return;
            }

            // Create appointment object
            Appoinment appointment = new Appoinment(
                patientName.trim(), 
                email.trim(), 
                phoneNumber.trim(),
                appointmentDate, 
                doctorName.trim(), 
                additionalNotes != null ? additionalNotes.trim() : null
            );
            
            // Save to database
            boolean isSuccess = appointmentService.bookAppointment(appointment);
            System.out.println("Database operation result: " + isSuccess);
            
            // Set response
            if (isSuccess) {
                System.out.println("Redirecting to success page");
                // Store in session for success page if needed
                request.getSession().setAttribute("lastAppointment", appointment);
                response.sendRedirect(request.getContextPath() + "/appointment-success.jsp");
            } else {
                System.out.println("Database operation failed");
                request.setAttribute("errorMessage", "Failed to book appointment. Please try again.");
                request.getRequestDispatcher("appointment.jsp").forward(request, response);
            }
            
        } catch (IllegalArgumentException e) {
            System.out.println("Invalid date format: " + e.getMessage());
            request.setAttribute("errorMessage", "Invalid date format. Please use YYYY-MM-DD.");
            request.getRequestDispatcher("appointment.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Unexpected error: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
            request.getRequestDispatcher("appointment.jsp").forward(request, response);
        }
    }

    private Date parseDate(String dateString) throws IllegalArgumentException {
        if (dateString == null || dateString.trim().isEmpty()) {
            return null;
        }
        return Date.valueOf(dateString);
    }

    private String sanitizeInput(String input) {
        return input != null ? input.trim() : null;
    }

    private boolean isValidEmail(String email) {
       
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        return email != null && email.matches(emailRegex);
    }
}
package com.suwani.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.service.ClinicService;



@WebServlet("/DeleteClinicServlet")
public class DeleteClinicServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClinicService clinicService = new ClinicService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean isDeleted = clinicService.deleteClinic(id);
            
            if (isDeleted) {
                request.getSession().setAttribute("successMessage", "Clinic deleted successfully");
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to delete clinic");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("errorMessage", "Invalid clinic ID");
        } catch (Exception e) {
            request.getSession().setAttribute("errorMessage", "Error deleting clinic: " + e.getMessage());
        }
        
        response.sendRedirect(request.getContextPath() + "/RetrieveClinicServlet");
    }
}
package com.suwani.servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.suwani.model.Clinic;
import com.suwani.service.ClinicService;

@WebServlet("/AddClinic")
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class AddClinic extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Clinic clinic = new Clinic();

        clinic.setClinicName(request.getParameter("clinicName"));
        clinic.setDoctorName(request.getParameter("doctorName"));
        clinic.setLocation(request.getParameter("location"));
        clinic.setContactNumber(request.getParameter("contact"));
        clinic.setOperningHours(request.getParameter("hours"));

        Part filePart = request.getPart("clinicImage"); // Retrieves <input type="file" name="clinicImage">
        if (filePart != null && filePart.getSize() > 0) {
            InputStream inputStream = filePart.getInputStream();
            clinic.setClinicImage(inputStream);
        }

        ClinicService service = new ClinicService();
        service.regClinic(clinic);

        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminClinic");
        dispatcher.forward(request, response);
    }
}

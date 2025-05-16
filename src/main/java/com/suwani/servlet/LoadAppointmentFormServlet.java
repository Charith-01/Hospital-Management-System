package com.suwani.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.Doctor;
import com.suwani.service.DoctorService;

@WebServlet("/LoadAppointmentFormServlet")
public class LoadAppointmentFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Use doGet for loading the form
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DoctorService doctorService = new DoctorService();
        ArrayList<Doctor> doctorList = doctorService.getAllDoctors();

        request.setAttribute("doctorList", doctorList);

        // Forward to the JSP (make sure the file name is correct)
        RequestDispatcher dispatcher = request.getRequestDispatcher("addAppointment.jsp");
        dispatcher.forward(request, response);
    }

    // Delegate doPost to doGet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

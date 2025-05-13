package com.suwani.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.Appointment;
import com.suwani.service.AppointmentService;


@WebServlet("/AppointmentReadServlet")
public class AppointmentReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AppointmentReadServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			AppointmentService service= new AppointmentService();
		       try {
		            // Get all appointments from service
		            ArrayList<Appointment> appointment = service.getAllAppointments();
		            
		            // Set appointments in request attribute
		            request.setAttribute("appointments", appointment);
		            
		            // Forward to viewAppointments.jsp
		            RequestDispatcher dispatcher = request.getRequestDispatcher("AppointmentRead.jsp");
		            dispatcher.forward(request, response);
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		            request.setAttribute("errorMessage", "Error retrieving appointments: " + e.getMessage());
		            request.getRequestDispatcher("error.jsp").forward(request, response);
		        }
		    }

	}



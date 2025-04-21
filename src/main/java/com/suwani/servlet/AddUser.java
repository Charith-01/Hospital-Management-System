package com.suwani.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.User;
import com.suwani.service.UserService;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = new User();
		
		user.setFullname(request.getParameter("fullname"));
		user.setEmail(request.getParameter("email"));
		user.setPhone(request.getParameter("phone"));
		user.setAddress(request.getParameter("address"));
		user.setGender(request.getParameter("gender"));
		user.setBloodgroup(request.getParameter("bloodgroup"));
		user.setMedicalcon(request.getParameter("conditions"));
		user.setPassword(request.getParameter("password"));
		user.setConpassword(request.getParameter("confirmPassword"));
		
		UserService us = new UserService();
		us.RegUser(user);
		
		RequestDispatcher distpatcher = request.getRequestDispatcher("index.jsp");
		
		distpatcher.forward(request, response);
	}

}

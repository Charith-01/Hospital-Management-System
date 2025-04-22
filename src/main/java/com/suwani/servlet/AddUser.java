package com.suwani.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.User;
import com.suwani.service.UserService;

@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Create a new User object and set the properties
		User user = new User();
		user.setFullname(request.getParameter("fullname"));
		user.setEmail(request.getParameter("email"));
		user.setPhone(request.getParameter("phone"));
		user.setAddress(request.getParameter("address"));
		user.setGender(request.getParameter("gender"));

        // Get the dob parameter from the request and convert it to LocalDate
        String dobStr = request.getParameter("dob");
        if (dobStr != null && !dobStr.isEmpty()) {
            user.setDob(LocalDate.parse(dobStr));  // Set the dob in LocalDate format
        }
		
		user.setBloodgroup(request.getParameter("bloodgroup"));
		
		// Handling multiple medical conditions (checkboxes) + Other
		String[] conditions = request.getParameterValues("conditions");
		String otherCondition = request.getParameter("otherCondition");

		if (conditions != null) {
		    String joinedConditions = String.join(",", conditions);
		    if (otherCondition != null && !otherCondition.trim().isEmpty()) {
		        joinedConditions += "," + otherCondition.trim();
		    }
		    user.setMedicalcon(joinedConditions);
		} else {
		    user.setMedicalcon(otherCondition != null ? otherCondition.trim() : "");
		}


		user.setPassword(request.getParameter("password"));
		user.setConpassword(request.getParameter("confirmPassword"));

		// Validate password match
		if (!user.getPassword().equals(user.getConpassword())) {
			request.setAttribute("errorMessage", "Passwords do not match!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
			return;
		}

		// Register user
		UserService userService = new UserService();
		userService.RegUser(user);

		request.setAttribute("successMessage", "User registered successfully!");
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
}

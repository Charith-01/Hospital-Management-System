package com.suwani.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    // Password pattern to ensure strength
    private static final String PASSWORD_PATTERN = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";

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
            RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Validate password strength with regular expression
        Pattern pattern = Pattern.compile(PASSWORD_PATTERN);
        Matcher matcher = pattern.matcher(user.getPassword());

        if (!matcher.matches()) {
            request.setAttribute("errorMessage", "Password must be at least 8 characters long, contain one uppercase letter, one lowercase letter, one number, and one special character.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Check if email already exists
        UserService userService = new UserService();
        if (userService.isEmailExists(user.getEmail())) {
            request.setAttribute("errorMessage", "Email already exists. Please use a different one.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Register user
        userService.RegUser(user);

        request.setAttribute("successMessage", "User registered successfully!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }
}

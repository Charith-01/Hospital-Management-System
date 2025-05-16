package com.suwani.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.suwani.model.User;
import com.suwani.service.UserService;

@WebServlet("/LoginUser")
public class LoginUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = new User();
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));

        UserService us = new UserService();
        boolean status = us.Validate(user);

        if (status) {
            // Get full user details from DB
            User userDetails = us.getOne(user);

            // Store full user object in session
            HttpSession session = request.getSession();
            session.setAttribute("user", userDetails);

            // Store user email separately for appointment access
            session.setAttribute("userEmail", userDetails.getEmail());


            if ("admin".equalsIgnoreCase(userDetails.getRole())) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("user", userDetails);
                RequestDispatcher dispatcher = request.getRequestDispatcher("userprofile.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid email or password!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}

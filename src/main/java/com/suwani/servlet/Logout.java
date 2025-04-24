package com.suwani.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET request to log out
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the current session, or null if no session exists
        HttpSession session = request.getSession(false);

        // If session exists, invalidate it
        if (session != null) {
            session.invalidate(); // Ends the session and removes all attributes
        }

        // Redirect the user to the home page (index.jsp) after logout
        response.sendRedirect("index.jsp"); // Or you can use login.jsp if you want
    }

    // Optionally, handle POST requests the same way
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Redirect POST requests to GET handler
    }
}

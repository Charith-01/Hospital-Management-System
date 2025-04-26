package com.suwani.servlet;

import com.suwani.model.User;
import com.suwani.service.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/AdminUpdateUsers")
public class AdminUpdateUsers extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle update
        int id = Integer.parseInt(request.getParameter("id"));
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String bloodgroup = request.getParameter("bloodgroup");
        String medicalcon = request.getParameter("medicalcon");

        User user = new User();
        user.setUserid(id);
        user.setFullname(fullname);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setGender(gender);
        user.setDob(LocalDate.parse(dob));
        user.setBloodgroup(bloodgroup);
        user.setMedicalcon(medicalcon);

        boolean updated = userService.updateUser(user);
        if (updated) {
            response.sendRedirect("userView.jsp");
        } else {
            request.setAttribute("error", "Update failed.");
            request.getRequestDispatcher("adminedituser.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Show edit form
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.getUserById(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("adminedituser.jsp").forward(request, response);
    }
}

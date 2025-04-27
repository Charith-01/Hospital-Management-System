package com.suwani.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.suwani.model.User;
import com.suwani.service.UserService;

@WebServlet("/AdminUpdateUsers")
public class AdminUpdateUsers extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = new User();

        user.setUserid(Integer.parseInt(request.getParameter("id")));
        user.setFullname(request.getParameter("fullname"));
        user.setEmail(request.getParameter("email"));
        user.setPhone(request.getParameter("phone"));
        user.setAddress(request.getParameter("address"));
        user.setGender(request.getParameter("gender"));
        user.setDob(LocalDate.parse(request.getParameter("dob")));


        UserService service = new UserService();
        boolean result = service.adminupdateUser(user);

        if (result) {
            request.getSession().setAttribute("user", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("AdminUsers");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("adminedituser.jsp?error=1");
        }
    }
}

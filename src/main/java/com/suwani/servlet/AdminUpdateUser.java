package com.suwani.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.User;
import com.suwani.service.UserService;

/**
 * Servlet implementation class AdminUpdateUser
 */
@WebServlet("/AdminUpdateUser")
public class AdminUpdateUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();
        
        try {
            user.setUserid(Integer.parseInt(request.getParameter("userid")));
            user.setFullname(request.getParameter("fullname"));
            user.setEmail(request.getParameter("email"));
            user.setPhone(request.getParameter("phone"));
            user.setGender(request.getParameter("gender"));
            
            // Handling DOB parsing more robustly
            String dobStr = request.getParameter("dob");
            if (dobStr != null && !dobStr.isEmpty()) {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                user.setDob(LocalDate.parse(dobStr, formatter));
            }
            
            user.setRole(request.getParameter("role"));
            
            UserService service = new UserService();
            boolean result = service.AdminupdateUser(user);
            
            if (result) {
                // Fetch the updated user from the database and update the session
                user = service.getOne(user); // Assuming the `getOne` method retrieves the user from DB
                request.getSession().setAttribute("user", user);
                response.sendRedirect("userView.jsp");
            } else {
                response.sendRedirect("adminedituser.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminedituser.jsp?error=1");
        }
    }
}

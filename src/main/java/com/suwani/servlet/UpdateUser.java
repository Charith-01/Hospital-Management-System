package com.suwani.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.suwani.model.User;
import com.suwani.service.UserService;

@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = new User();

        user.setUserid(Integer.parseInt(request.getParameter("id")));
        user.setFullname(request.getParameter("fullname"));
        user.setEmail(request.getParameter("email"));
        user.setPhone(request.getParameter("phone"));
        user.setAddress(request.getParameter("address"));
        user.setGender(request.getParameter("gender"));
        user.setDob(LocalDate.parse(request.getParameter("dob")));
        user.setBloodgroup(request.getParameter("bloodgroup"));

        String[] conditions = request.getParameterValues("medicalcon");
        StringBuilder medicalConBuilder = new StringBuilder();
        if (conditions != null) {
            for (String c : conditions) {
                medicalConBuilder.append(c).append(",");
            }
        }
        String medicalCon = medicalConBuilder.length() > 0 ? medicalConBuilder.substring(0, medicalConBuilder.length() - 1) : "";

        user.setMedicalcon(medicalCon);

        UserService service = new UserService();
        boolean result = service.updateUser(user);

        if (result) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("userprofile.jsp");
        } else {
            response.sendRedirect("editprofile.jsp?error=1");
        }
    }
}

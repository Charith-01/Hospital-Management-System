package com.suwani.servlet;

import com.suwani.model.Notification;
import com.suwani.service.NotificationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/SendNotificationServlet")
public class SendNotificationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userEmail = request.getParameter("userEmail");
        String message = request.getParameter("message");

        Notification notification = new Notification();
        notification.setUserEmail(userEmail);
        notification.setMessage(message);

        NotificationService ns = new NotificationService();
        boolean result = ns.createNotification(notification);

        if (result) {
            request.setAttribute("successMsg", "Notification sent successfully");
            request.getRequestDispatcher("AppointmentReadServlet").forward(request, response);
        } else {
            response.sendRedirect("addNotification.jsp?error=Failed+to+send+notification");
        }
    }
}

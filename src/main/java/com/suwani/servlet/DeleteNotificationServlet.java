package com.suwani.servlet;

import com.suwani.service.NotificationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteNotification")
public class DeleteNotificationServlet extends HttpServlet {

    private final NotificationService notificationService = new NotificationService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                boolean deleted = notificationService.deleteNotificationById(id);

                if (deleted) {
                    response.sendRedirect("UserNotificationsServlet?success=1");
                } else {
                    response.sendRedirect("UserNotificationsServlet?error=1");
                }
            } catch (NumberFormatException | ClassNotFoundException e) {
                e.printStackTrace();
                response.sendRedirect("notifications.jsp?error=1");
            }
        } else {
            response.sendRedirect("notifications.jsp?error=1");
        }
    }
}

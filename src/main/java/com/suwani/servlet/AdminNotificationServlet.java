package com.suwani.servlet;

import com.suwani.model.Notification;
import com.suwani.service.NotificationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminNotifications")
public class AdminNotificationServlet extends HttpServlet {

    private NotificationService notificationService;

    @Override
    public void init() {
        notificationService = new NotificationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Fetch all notifications for admin
            List<Notification> notifications = notificationService.getAllNotifications();

            // Set notifications as request attribute
            request.setAttribute("notifications", notifications);

            // Forward to adminNotifications.jsp (create this JSP to display)
            request.getRequestDispatcher("/notificationTable.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            throw new ServletException("Error loading notifications", e);
        }
    }
}

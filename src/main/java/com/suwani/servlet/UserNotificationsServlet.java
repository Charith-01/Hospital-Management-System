package com.suwani.servlet;

import com.suwani.model.User;
import com.suwani.service.NotificationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/UserNotificationsServlet")
public class UserNotificationsServlet extends HttpServlet {
    private NotificationService notificationService;

    @Override
    public void init() {
        notificationService = new NotificationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Get unread notification count and save in session
            int unreadCount = notificationService.getUnreadNotificationCount(user.getEmail());
            session.setAttribute("unreadCount", unreadCount);

            // Also load all notifications (optional)
            request.setAttribute("notifications", notificationService.getNotificationsByUserEmail(user.getEmail()));

            request.getRequestDispatcher("notifications.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading notifications");
        }
    }
}

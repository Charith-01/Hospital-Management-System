<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.suwani.model.Notification" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>User Notifications</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        /* Fade-in animation */
        .fade-in {
            animation: fadeIn 0.8s ease forwards;
            opacity: 0;
        }
        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col items-center py-10">

    <div class="w-full max-w-xl bg-white rounded-lg shadow-lg p-6">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-semibold text-gray-800">Your Notifications</h2>

            <%
                List<Notification> notifications = (List<Notification>) request.getAttribute("notifications");
                int count = (notifications != null) ? notifications.size() : 0;
            %>

            <!-- Notification icon with count badge -->
            <div class="relative inline-block">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-blue-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                          d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                </svg>
                <% if (count > 0) { %>
                    <span class="absolute -top-1 -right-1 bg-red-600 text-white rounded-full text-xs w-5 h-5 flex items-center justify-center font-bold animate-pulse">
                        <%= count %>
                    </span>
                <% } %>
            </div>
        </div>

        <div id="notification-list" class="space-y-4">
            <%
                if (notifications != null && !notifications.isEmpty()) {
                    int delay = 0;
                    for (Notification n : notifications) {
            %>
                        <div class="notification fade-in bg-blue-50 border border-blue-200 rounded p-4 shadow-sm" style="animation-delay: <%= delay %>ms;">
                            <p class="text-gray-800 font-medium"><strong>Message:</strong> <%= n.getMessage() %></p>
                            <p class="text-gray-500 text-sm mt-1"><strong>Date:</strong> <%= n.getCreatedAt() %></p>
                        </div>
            <%
                        delay += 150; // stagger fade-in by 150ms each
                    }
                } else {
            %>
                <p class="text-gray-500 italic">No notifications found.</p>
            <%
                }
            %>
        </div>
    </div>

    <script>
        // Optional: Remove fade-in classes after animation to prevent re-animations if needed
        window.addEventListener('load', () => {
            const items = document.querySelectorAll('.fade-in');
            items.forEach(el => {
                el.addEventListener('animationend', () => {
                    el.classList.remove('fade-in');
                });
            });
        });
    </script>

</body>
</html>

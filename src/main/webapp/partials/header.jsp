<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.suwani.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    boolean isLoggedIn = user != null;
    Integer unreadCount = (Integer) session.getAttribute("unreadCount");
    if (unreadCount == null) {
        unreadCount = 0;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Suwani Hospital</title>
    <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
</head>
<body class="bg-gray-100">

<header class="bg-white shadow-md">
    <div class="container mx-auto px-6 py-4 flex justify-between items-center">
        <a href="index.jsp" class="text-2xl font-bold text-blue-600 flex items-center">
            <img src="assets/logo.png" alt="Suwani Hospital Logo" class="h-16 mr-3">
        </a>

        <nav class="hidden md:flex space-x-6">
            <a href="index.jsp" class="text-gray-700 hover:text-blue-600 transition"><i class="fas fa-home mr-1"></i> Home</a>
            
            <a href="<%= isLoggedIn ? (request.getContextPath() + "/PublicClinicServlet") : "#" %>" 
               class="text-gray-700 hover:text-blue-600 transition"
               onclick="<%= isLoggedIn ? "" : "alert('Please login to view clinics.'); window.location='" + request.getContextPath() + "/login.jsp'; return false;" %>">
                <i class="fas fa-hospital me-1"></i> Clinics
            </a>

            <a href="<%= isLoggedIn ? "UserAppointments" : "#" %>" 
               class="text-gray-700 hover:text-blue-600 transition"
               onclick="<%= isLoggedIn ? "" : "alert('Please login to view appointments.'); window.location='login.jsp'; return false;" %>">
                <i class="fas fa-calendar-alt mr-2"></i> Appointments
            </a>
                  
            <a href="#" class="text-gray-700 hover:text-blue-600 transition"><i class="fas fa-info-circle mr-1"></i> About Us</a>
            <a href="#" class="text-gray-700 hover:text-blue-600 transition"><i class="fas fa-phone-alt mr-1"></i> Contact Us</a>
        </nav>

        <div class="hidden md:flex space-x-4">
            <% if (isLoggedIn) { %>

                <!-- 🔔 Notification Icon with Count -->
                <a href="UserNotificationsServlet" class="relative text-gray-700 hover:text-blue-600 transition mt-1 mr-2">
                    <i class="fas fa-bell text-2xl"></i>
                    <% if (unreadCount > 0) { %>
                        <span class="absolute -top-1 -right-1 inline-flex items-center justify-center px-1.5 py-0.5 text-xs font-bold leading-none text-white transform bg-red-600 rounded-full">
                            <%= unreadCount %>
                        </span>
                    <% } %>
                </a>

                <a href="userprofile.jsp" class="flex items-center text-lg font-bold text-black hover:text-blue-600 transition mr-8">
                    <i class="fas fa-user-circle mr-2"></i> <%= user.getFullname() %>
                </a>
                <a href="Logout" class="px-4 py-2 text-white bg-red-600 rounded-lg shadow hover:bg-red-700 transition">
                    <i class="fas fa-sign-out-alt mr-1"></i> Logout
                </a>
            <% } else { %>
                <a href="login.jsp" class="px-4 py-2 text-white bg-blue-600 rounded-lg shadow hover:bg-blue-700 transition">
                    <i class="fas fa-sign-in-alt mr-1"></i> Login
                </a>
                <a href="registration.jsp" class="px-4 py-2 text-blue-600 border border-blue-600 rounded-lg shadow hover:bg-blue-600 hover:text-white transition">
                    <i class="fas fa-user-plus mr-1"></i> Register
                </a>
            <% } %>
        </div>

        <button id="menu-toggle" class="md:hidden text-gray-700 focus:outline-none">
            <i class="fas fa-bars text-2xl"></i>
        </button>
    </div>

    <!-- Mobile menu -->
    <div id="mobile-menu" class="hidden md:hidden bg-white py-4 px-6 shadow-md">
        <a href="index.jsp" class="block py-2 text-gray-700 hover:text-blue-600"><i class="fas fa-home mr-1"></i> Home</a>
        
        <a href="<%= isLoggedIn ? "clinics.jsp" : "#" %>" 
           class="block py-2 text-gray-700 hover:text-blue-600"
           onclick="<%= isLoggedIn ? "" : "alert('Please login to view clinics.'); window.location='login.jsp'; return false;" %>">
            <i class="fas fa-user-md mr-1"></i> Clinics
        </a>

        <a href="<%= isLoggedIn ? "appoinment.jsp" : "#" %>" 
           class="block py-2 text-gray-700 hover:text-blue-600"
           onclick="<%= isLoggedIn ? "" : "alert('Please login to view appointments.'); window.location='login.jsp'; return false;" %>">
            <i class="fas fa-calendar-alt mr-1"></i> Appointments
        </a>
        
        <a href="#" class="block py-2 text-gray-700 hover:text-blue-600"><i class="fas fa-info-circle mr-1"></i> About Us</a>
        <a href="#" class="block py-2 text-gray-700 hover:text-blue-600"><i class="fas fa-phone-alt mr-1"></i> Contact Us</a>
        
        <% if (isLoggedIn) { %>

            <!-- 🔔 Mobile Notification with Count -->
            <a href="UserNotificationsServlet" class="block py-2 text-gray-700 hover:text-blue-600 relative">
                <i class="fas fa-bell mr-1"></i> Notifications
                <% if (unreadCount > 0) { %>
                    <span class="absolute top-1 right-6 inline-flex items-center justify-center px-1.5 py-0.5 text-xs font-bold text-white bg-red-600 rounded-full">
                        <%= unreadCount %>
                    </span>
                <% } %>
            </a>

            <a href="userprofile.jsp" class="block py-2 text-black font-bold hover:text-blue-600">
                <i class="fas fa-user-circle mr-2"></i> <%= user.getFullname() %>
            </a>
            <a href="Logout" class="block py-2 text-white bg-red-600 rounded-lg text-center mt-2 hover:bg-red-700 transition">
                <i class="fas fa-sign-out-alt mr-1"></i> Logout
            </a>
        <% } else { %>
            <a href="login.jsp" class="block py-2 text-blue-600 border border-blue-600 rounded-lg text-center mt-2 hover:bg-blue-600 hover:text-white transition">
                <i class="fas fa-sign-in-alt mr-1"></i> Login
            </a>
            <a href="registration.jsp" class="block py-2 text-white bg-blue-600 rounded-lg text-center mt-2 hover:bg-blue-700 transition">
                <i class="fas fa-user-plus mr-1"></i> Register
            </a>
        <% } %>
    </div>
</header>

<script>
    // Mobile menu toggle
    document.getElementById("menu-toggle").addEventListener("click", function () {
        document.getElementById("mobile-menu").classList.toggle("hidden");
    });
</script>

</body>
</html>

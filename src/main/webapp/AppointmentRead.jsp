<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./partials/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/c61dc916f0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>My Appointments</title>
    <style>
        .appointment-card {
            transition: all 0.3s ease;
        }
        .appointment-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="bg-gray-50">

    <!-- Main Content Section -->
    <section class="py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-7xl mx-auto">
            <!-- Header -->
            <div class="text-center mb-12">
                <h1 class="text-4xl font-bold text-blue-800 mb-4">Appointment Records</h1>
                <p class="text-lg text-blue-600 max-w-2xl mx-auto">
                    View and manage your scheduled appointments
                </p>
            </div>

            <!-- Appointments Table -->
            <div class="bg-white rounded-2xl shadow-lg overflow-hidden appointment-card">
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-blue-500 text-white">
                            <tr>
                                <th class="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wider">Name</th>
                                <th class="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wider">Email</th>
                                <th class="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wider">Phone</th>
                                <th class="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wider">Date</th>
                                <th class="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wider">Doctor</th>
                                <th class="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wider">Notes</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:forEach var="appointment" items="${appointments}">
                                <tr class="hover:bg-blue-50 transition-colors">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${appointment.patientName}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${appointment.email}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${appointment.phoneNumber}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${appointment.appointmentDate}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${appointment.doctorName}</td>
                                    <td class="px-6 py-4 text-sm text-gray-500 max-w-xs">${appointment.additionalNotes}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Back Button -->
            <div class="mt-8 text-center">
                <a href="appointment.jsp" class="inline-flex items-center px-6 py-3 bg-blue-600 text-white font-semibold rounded-lg shadow-lg hover:bg-blue-700 transition duration-300">
                    <i class="fas fa-arrow-left mr-2"></i> Back 
                </a>
            </div>
        </div>
    </section>

    <%@ include file="./partials/footer.jsp" %>
</body>
</html>
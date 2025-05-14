<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./partials/adminheader.jsp" %>

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
<body class="bg-gray-100 font-sans">

    <!-- Main Content Section -->
    <div class="flex-1 p-8">
        <!-- Header -->
		<div class="mb-8 text-center">
		    <h1 class="text-3xl font-bold text-blue-800">Appointment Records</h1>
		</div>

        <!-- Appointments Table -->
        <div class="bg-white rounded-lg shadow-md overflow-hidden">
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gradient-to-r from-blue-500 to-blue-700 text-white">
                        <tr>
                        	<th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider">ID</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider">Name</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider">Email</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider">Phone</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider">Date</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider">Doctor</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider">Notes</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <c:forEach var="appointment" items="${appointments}">
                            <tr class="hover:bg-blue-50 transition-colors">
                            	<td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${appointment.id}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${appointment.patientName}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${appointment.email}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${appointment.phoneNumber}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${appointment.appointmentDate}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${appointment.doctorName}</td>
                                <td class="px-6 py-4 text-sm text-gray-600 max-w-xs truncate">${appointment.additionalNotes}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
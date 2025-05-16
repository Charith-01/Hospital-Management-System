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
        /* Custom scrollbar for table */
        .table-container::-webkit-scrollbar {
            height: 8px;
        }
        .table-container::-webkit-scrollbar-track {
            background: #f1f1f1;
        }
        .table-container::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 4px;
        }
        .table-container::-webkit-scrollbar-thumb:hover {
            background: #555;
        }
    </style>
</head>
<body class="bg-gray-50">

    <!-- Main Content Section -->
    <main class="flex-1 overflow-y-auto p-8">
        <div class="max-w-7xl mx-auto">
            <!-- Header -->
			<div class="mb-8 flex flex-col items-center">
			    <div class="text-center max-w-2xl">
			        <h1 class="text-3xl font-bold text-gray-800">Appointment Records</h1>
			    </div>
			</div>

            <!-- Appointments Table -->
            <div class="bg-white rounded-lg shadow overflow-hidden">
                <div class="table-container overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-blue-600">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider w-16">ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider min-w-[120px]">Name</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider min-w-[180px]">Email</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider min-w-[120px]">Phone</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider min-w-[120px]">Date</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider min-w-[150px]">Doctor</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider min-w-[200px]">Notes</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:forEach var="appointment" items="${appointments}">
                                <tr class="hover:bg-blue-50 transition-colors">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${appointment.id}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-800">${appointment.patientName}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600 truncate max-w-[180px]">${appointment.email}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${appointment.phoneNumber}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${appointment.appointmentDate}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${appointment.doctorName}</td>
                                    <td class="px-6 py-4 text-sm text-gray-600 max-w-[200px] truncate">${appointment.additionalNotes}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
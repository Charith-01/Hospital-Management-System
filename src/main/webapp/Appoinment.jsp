<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./partials/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://kit.fontawesome.com/c61dc916f0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <title>My Appointments</title>
    <style>
        .appointment-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body class="bg-gray-50">
    <div class="container mx-auto px-4 py-8">
		<div class="flex justify-between items-center mb-8">
		    <div>
		        <h1 class="text-3xl font-bold text-gray-800">My Appointments</h1>
		        <p class="text-gray-600 mt-2">View and manage your upcoming appointments</p>
		    </div>
			<a href="LoadAppointmentFormServlet" class="bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-4 rounded-lg transition duration-200 ease-in-out shadow-md flex items-center">
			    <i class="fas fa-calendar-plus mr-2"></i> New Appointment
			</a>
		</div>

        <!-- Appointment Status Tabs -->
        <div class="flex border-b border-gray-200 mb-6">
            <button class="px-4 py-2 font-medium text-blue-600 border-b-2 border-blue-600">Upcoming appointments</button>
          
        </div>

        <!-- Appointments List -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

            <!-- Show appointments if exist -->
            <c:if test="${fn:length(appointments) > 0}">
                <c:forEach var="appointment" items="${appointments}">
                    <div class="bg-white rounded-xl shadow-md overflow-hidden transition-all duration-300 appointment-card">
                        <div class="p-6">
                            <div class="flex justify-between items-start">
                                <div>
                                    <span class="inline-block px-3 py-1 text-sm font-semibold text-blue-800 bg-blue-100 rounded-full mb-2">
                                        New
                                    </span>
                                    <h3 class="text-xl font-bold text-gray-800">${appointment.doctorName}</h3>
                                    <p class="text-gray-600">Doctor</p>
                                </div>
                            </div>

                            <div class="mt-4">
                                <div class="flex items-center text-gray-600 mb-2">
                                    <i class="far fa-calendar-alt mr-2"></i>
                                    <span>${appointment.appointmentDate}</span>
                                </div>
                                <div class="flex items-center text-gray-600 mb-2">
                                    <i class="fas fa-phone mr-2"></i>
                                    <span>${appointment.phoneNumber}</span>
                                </div>
                                <div class="flex items-center text-gray-600">
                                    <i class="fas fa-sticky-note mr-2"></i>
                                    <span>Note: ${appointment.additionalNotes}</span>
                                </div>
                            </div>

                            <div class="mt-6 flex justify-between">
                                <form action="updateAppointment.jsp" method="get">
                                    <input type="hidden" name="id" value="${appointment.id}" />
                                    <input type="hidden" name="name" value="${appointment.patientName}" />
                                    <input type="hidden" name="email" value="${appointment.email}" />
                                    <input type="hidden" name="phone" value="${appointment.phoneNumber}" />
                                    <input type="hidden" name="date" value="${appointment.appointmentDate}" />
                                    <input type="hidden" name="doctor" value="${appointment.doctorName}" />
                                    <input type="hidden" name="note" value="${appointment.additionalNotes}" />
                                    <button type="submit" class="text-blue-600 hover:text-blue-800 font-medium flex items-center">
                                        <i class="fas fa-edit mr-1"></i> Reschedule
                                    </button>
                                </form>

                                <form action="DeleteAppointmentServlet" method="post" onsubmit="return confirm('Are you sure you want to cancel this appointment?');">
                                    <input type="hidden" name="appointmentId" value="${appointment.id}" />
                                    <button type="submit" class="text-red-600 hover:text-red-800 font-medium flex items-center">
                                        <i class="fas fa-times mr-1"></i> Cancel
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <!-- Show message if no appointments -->
            <c:if test="${fn:length(appointments) == 0}">
                <div class="col-span-full text-center py-12">
                    <i class="far fa-calendar-times text-5xl text-gray-300 mb-4"></i>
                    <h3 class="text-xl font-medium text-gray-700">No upcoming appointments scheduled</h3>
                    <p class="text-gray-500 mt-2">You don't have any upcoming appointments.</p>
                    <a href="addAppointment.jsp" class="inline-block mt-4 bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-6 rounded-lg transition duration-200 ease-in-out shadow-md">
                        Book an Appointment
                    </a>
                </div>
            </c:if>

        </div>
    </div>

    <%@ include file="./partials/footer.jsp" %>
</body>
</html>
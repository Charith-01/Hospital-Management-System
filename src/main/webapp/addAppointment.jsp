<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./partials/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    com.suwani.model.User currentUser = (com.suwani.model.User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/c61dc916f0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <title>Book Appointment</title>
</head>
<body>

<!-- Appointment Booking Section -->
<section class="bg-blue-600 py-20 text-white">
    <div class="container mx-auto px-6 md:px-12 lg:px-16 text-center">
        <h2 class="text-5xl font-bold mb-6">Book an Appointment</h2>
        <p class="text-lg text-blue-200 max-w-2xl mx-auto">
            Schedule a consultation with our experienced doctors easily.
        </p>

        <div class="bg-white text-gray-900 rounded-2xl shadow-lg p-8 mt-10 max-w-3xl mx-auto">
            <form action="AppointmentServlet" method="POST" class="grid grid-cols-1 md:grid-cols-2 gap-6" id="appointmentForm">

                <!-- Full Name -->
                <div>
                    <label class="block font-semibold">Full Name</label>
                    <input type="text" name="name" value="<%= currentUser.getFullname() %>" readonly 
                        class="w-full mt-2 p-3 border rounded-lg bg-gray-100 cursor-not-allowed" />
                </div>

                <!-- Email -->
                <div>
                    <label class="block font-semibold">Email</label>
                    <input type="email" name="email" value="<%= currentUser.getEmail() %>" readonly 
                        class="w-full mt-2 p-3 border rounded-lg bg-gray-100 cursor-not-allowed" />
                </div>

                <!-- Phone -->
                <div>
                    <label class="block font-semibold">Phone Number</label>
                    <input type="tel" name="phone" value="<%= currentUser.getPhone() %>" readonly 
                        class="w-full mt-2 p-3 border rounded-lg bg-gray-100 cursor-not-allowed" />
                </div>

                <!-- Appointment Date -->
                <div>
                    <label class="block font-semibold">Appointment Date</label>
                    <input type="date" name="date" required
                        class="w-full mt-2 p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
                </div>

                <!-- Select Doctor -->
                <div class="md:col-span-2">
                    <label class="block font-semibold">Select Doctor</label>
                    <select class="w-full mt-2 p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" name="doctor" required>
                        <option value="">Select a doctor</option>
                        <c:forEach var="doc" items="${doctorList}">
                            <option value="${doc.fullname} - ${doc.specialization}">
                                ${doc.fullname} - ${doc.specialization}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Notes -->
                <div class="md:col-span-2">
                    <label class="block font-semibold">Additional Notes</label>
                    <textarea rows="4" name="note" placeholder="Write your message..." 
                        class="w-full mt-2 p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
                </div>

                <!-- Submit -->
                <div class="md:col-span-2 text-center">
                    <button type="submit" class="bg-blue-600 text-white font-semibold px-6 py-3 rounded-lg shadow-lg hover:bg-blue-700 transition duration-300">
                        Book Appointment
                    </button>
                </div>

            </form>
        </div>
    </div>
</section>

<%@ include file="./partials/footer.jsp" %>
</body>
</html>
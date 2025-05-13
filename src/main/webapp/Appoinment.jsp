<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./partials/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <title>Appoinment</title>
</head>
<body>

    <!-- Appointment Booking Section -->
<section class="bg-blue-600 py-20 text-white">
    <div class="container mx-auto px-6 md:px-12 lg:px-16 text-center">
        <h2 class="text-5xl font-bold mb-6">Book an Appointment</h2>
        <p class="text-lg text-blue-200 max-w-2xl mx-auto">
            Schedule a consultation with our experienced doctors easily.
        </p>

        <!-- Booking Form -->
        <div class="bg-white text-gray-900 rounded-2xl shadow-lg p-8 mt-10 max-w-3xl mx-auto">
            <form action="#" method="POST" class="grid grid-cols-1 md:grid-cols-2 gap-6">
                
                <!-- Full Name -->
                <div>
                    <label class="block font-semibold">Full Name</label>
                    <input type="text" placeholder="Enter your name" class="w-full mt-2 p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>

                <!-- Email -->
                <div>
                    <label class="block font-semibold">Email</label>
                    <input type="email" placeholder="Enter your email" class="w-full mt-2 p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>

                <!-- Phone Number -->
                <div>
                    <label class="block font-semibold">Phone Number</label>
                    <input type="tel" placeholder="Enter your phone number" class="w-full mt-2 p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>

                <!-- Appointment Date -->
                <div>
                    <label class="block font-semibold">Appointment Date</label>
                    <input type="date" class="w-full mt-2 p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>

                <!-- Select Doctor -->
                <div class="md:col-span-2">
                    <label class="block font-semibold">Select Doctor</label>
                    <select class="w-full mt-2 p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                        <option>Select a doctor</option>
                        <option>Dr. John Smith - Cardiologist</option>
                        <option>Dr. Sarah Johnson - Neurologist</option>
                        <option>Dr. Michael Brown - Orthopedic Surgeon</option>
                        <option>Dr. Emily White - Pediatrician</option>
                    </select>
                </div>

                <!-- Message -->
                <div class="md:col-span-2">
                    <label class="block font-semibold">Additional Notes</label>
                    <textarea rows="4" placeholder="Write your message..." class="w-full mt-2 p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
                </div>

                <!-- Submit Button -->
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
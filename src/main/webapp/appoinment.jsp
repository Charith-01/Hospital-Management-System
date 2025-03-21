<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

     <!-- Navigation Bar -->
     <header class="bg-white shadow-md">
        <div class="container mx-auto px-6 py-4 flex justify-between items-center">
            
            <!-- Logo -->
            <a href="#" class="text-2xl font-bold text-blue-600 flex items-center">
                <i class="fas fa-hospital mr-2"></i> Suwani Hospital
            </a>

            <!-- Navigation Links -->
            <nav class="hidden md:flex space-x-6">
                <a href="index.jsp" class="text-gray-700 hover:text-blue-600 transition">
                    <i class="fas fa-home mr-1"></i> Home
                </a>
                <a href="#" class="text-gray-700 hover:text-blue-600 transition">
                    <i class="fas fa-user-md mr-1"></i> Clinics
                </a>
                <a href="appoinment.jsp" class="text-gray-700 hover:text-blue-600 transition">
                    <i class="fas fa-calendar-alt mr-2"></i> Appoinments
                </a>
                <a href="#" class="text-gray-700 hover:text-blue-600 transition">
                    <i class="fas fa-info-circle mr-1"></i> About Us
                </a>
                <a href="#" class="text-gray-700 hover:text-blue-600 transition">
                    <i class="fas fa-phone-alt mr-1"></i> Contact Us
                </a>
            </nav>

            <!-- Login / Register Button -->
            <div class="hidden md:flex space-x-4">
                <a href="#" class="px-4 py-2 text-white bg-blue-600 rounded-lg shadow hover:bg-blue-700 transition">
                    <i class="fas fa-sign-in-alt mr-1"></i> Login
                </a>
                <a href="#" class="px-4 py-2 text-blue-600 border border-blue-600 rounded-lg shadow hover:bg-blue-600 hover:text-white transition">
                    <i class="fas fa-user-plus mr-1"></i> Register
                </a>
            </div>

            <!-- Mobile Menu Button -->
            <button id="menu-toggle" class="md:hidden text-gray-700 focus:outline-none">
                <i class="fas fa-bars text-2xl"></i>
            </button>
        </div>

        <!-- Mobile Menu -->
        <div id="mobile-menu" class="hidden md:hidden bg-white py-4 px-6 shadow-md">
            <a href="index.jsp" class="block py-2 text-gray-700 hover:text-blue-600"><i class="fas fa-home mr-1"></i> Home</a>
            <a href="appoinment.jsp" class="block py-2 text-gray-700 hover:text-blue-600"><i class="fas fa-user-md mr-1"></i> Clinics</a>
            <a href="#" class="block py-2 text-gray-700 hover:text-blue-600"><i class="fas fa-calendar-alt mr-2"></i> Appoinment</a>
            <a href="#" class="block py-2 text-gray-700 hover:text-blue-600"><i class="fas fa-info-circle mr-1"></i> About Us</a>
            <a href="#" class="block py-2 text-gray-700 hover:text-blue-600"><i class="fas fa-phone-alt mr-1"></i> Contact Us</a>
            <a href="#" class="block py-2 text-blue-600 border border-blue-600 rounded-lg text-center mt-2 hover:bg-blue-600 hover:text-white transition"><i class="fas fa-sign-in-alt mr-1"></i> Login</a>
            <a href="#" class="block py-2 text-white bg-blue-600 rounded-lg text-center mt-2 hover:bg-blue-700 transition"><i class="fas fa-user-plus mr-1"></i> Register</a>
        </div>
    </header>

    <script>
        // Mobile Menu Toggle
        document.getElementById("menu-toggle").addEventListener("click", function() {
            document.getElementById("mobile-menu").classList.toggle("hidden");
        });
    </script>

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
    
</body>
</html>
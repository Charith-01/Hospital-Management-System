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
    <title>Appointment Success</title>
</head>
<body>

    <!-- Success Message Section -->
    <section class="bg-blue-50 py-20">
        <div class="container mx-auto px-6 text-center">
            <div class="bg-white rounded-lg shadow-lg p-8 max-w-2xl mx-auto">
                <div class="text-green-500 text-6xl mb-6">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h2 class="text-3xl font-bold text-gray-800 mb-4">Appointment Booked Successfully!</h2>
                <p class="text-gray-600 mb-6">Thank you for booking an appointment with us. We have sent a confirmation to your email address.</p>
                <a href="index.jsp" class="bg-blue-600 text-white font-semibold px-6 py-3 rounded-lg hover:bg-blue-700 transition duration-300">
                    Return to Home
                </a>
            </div>
        </div>
    </section>

<%@ include file="./partials/footer.jsp" %>
    
</body>
</html>